# frozen_string_literal: true

require "rails_helper"
require "pry"

RSpec.describe "Task requests", :type => :request do


=begin
  it "Creates a new task and redirects to the show page" do
    group = create(:group)
    date = Time.now
    due_date = date.strftime("%Y-%m-%d")
    headers = { "ACCEPT" => "application/json", }
    post "/tasks", :params => { :task => { priority: 1, due_date: due_date, description: "new task", group_id: group.id } }, headers: headers
    expect(response).to redirect_to(assigns(:task))
  end

  it "creates a new task" do
    headers = {
      "ACCEPT" => "application/json",
      "Content-Type" => "application/json",
    }
    post "/tasks", :params => { :task => {:description => "New task"} }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end
=end
end
