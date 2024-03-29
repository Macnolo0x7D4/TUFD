# frozen_string_literal: true

require 'test_helper'

class ArticleMailerTest < ActionMailer::TestCase
  test 'user_mention' do
    mail = ArticleMailer.user_mention
    assert_equal 'User mention', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
