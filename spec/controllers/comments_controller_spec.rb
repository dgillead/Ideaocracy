require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.describe CommentsController, type: :controller do
  render_views

  DatabaseCleaner.clean
end