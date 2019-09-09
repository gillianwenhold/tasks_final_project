# frozen_string_literal: true

require "rails_helper"
require "pry"

RSpec.describe "Group requests", :type => :request do
  before :each do
    Task.destroy_all
    Group.destroy_all
    User.destroy_all
    @group = create(:group)
    @user = create(:user, group: @group, admin: true)
    allow_any_instance_of(ApplicationController).to receive(:require_login).and_return(@user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "Shows all groups" do
    get "/groups"
    expect(response.status).to eq(200)
  end

  it "Creates a group" do
    headers = { "ACCEPT" => "application/json" }
    post "/groups", params: { :group => { name: "New Group", description: "group description" } }, headers: headers
    expect(response).to redirect_to(assigns(:group))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(Group.all[1].description).to eq("group description")
  end
end
