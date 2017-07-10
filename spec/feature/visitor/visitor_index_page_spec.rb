feature = <<~HEREDOC
  When visitor finds site in google,
  he wants to visit root page,
  so that he can read content
HEREDOC

RSpec.feature feature do
  let!(:posts) { create_list(:post, 10) }
  before do
    posts.each { |post| create(:rating, user_id: post.user.id, post_id: post.id) }
  end

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users who wrote the most messages'
  HEREDOC

  scenario scenario do
    create(:post, user_id: User.all.last.id)
    top_users_posts = User.all.order('posts_count DESC').limit(5)

    visit root_url
    first_user_page = find('.top_users_posts').find_all('.item').first.text

    expect(first_user_page).to eq(top_users_posts.first.email)
  end

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users who wrote the messages that received the most votes and the messages themselves'
  HEREDOC

  scenario scenario do
    create(:rating, user_id: User.all.last.id, post_id: Post.all.first.id)
    top_message_rating = Post.all.order('message_rating DESC').limit(5)

    visit root_url
    first_user_rating_post = find('.top_users_rating_post').find_all('.item').first

    expect(first_user_rating_post.find('.email').text).to eq(top_message_rating.first.user.email)
    expect(first_user_rating_post.find('.message').text).to eq(top_message_rating.first.message)
  end

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users with the highest average rating of their messages'
  HEREDOC

  scenario scenario do
    User.all.drop(1).each { |user| create(:rating, user_id: user.id, post_id: Post.all.first.id) }
    top_average_rating = User.all.sort_by(&:middle_rating).reverse.take(5)

    visit root_url
    first_user_avarage_rating = find('.top_users_average_rating').find_all('.item').first

    expect(User.find(1).middle_rating).to eq(10)
    expect(first_user_avarage_rating.text).to eq(top_average_rating.first.email)
  end
end
