feature = <<~HEREDOC
  When visitor finds site in google,
  he wants to visit root page,
  so that he can read content
HEREDOC

RSpec.feature feature do
  let!(:post) { create_list(:post, 10) }
  before { visit root_url }

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users who wrote the most messages'
  HEREDOC

  scenario scenario do
    top_posts = User.all.order('posts_count DESC').limit(5)

    expect(page).to have_content(top_posts.first.email)
  end

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users who wrote the messages that received 
    the most votes and the messages themselves'
  HEREDOC

  scenario scenario do
    top_message_rating = Post.all.order('message_rating DESC').limit(5)

    expect(page).to have_content(top_message_rating.first.user.email)
    expect(page).to have_content(top_message_rating.first.message)
  end

  scenario = <<~HEREDOC
    Given link to the domain
    When visitor visits root page
    Then he sees 'TOP-5 Users with the highest average 
    rating of their messages'
  HEREDOC

  scenario scenario do
    top_middle_rating = User.all.sort_by(&:middle_rating).reverse.take(5)

    expect(page).to have_content(top_middle_rating.first.email)
  end
end
