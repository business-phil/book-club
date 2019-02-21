# frozen_string_literal: true

require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test 'should get index' do
    get members_url
    assert_response :success
  end

  test 'should get new' do
    get new_member_url
    assert_response :success
  end

  test 'should create member' do
    # update email to avoid unique constraint violation
    @member.email = 'unique-email@grrr.com'
    assert_difference('Member.count') do
      post members_url, params: test_member_params
    end

    assert_redirected_to member_url(Member.last)
  end

  test 'should show member' do
    get member_url(@member)
    assert_response :success
  end

  test 'should get edit' do
    get edit_member_url(@member)
    assert_response :success
  end

  test 'should update member' do
    patch member_url(@member), params: test_member_params
    assert_redirected_to member_url(@member)
  end

  test 'should destroy member' do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end

  def test_member_params
    { member: { email: @member.email, name: @member.name, password: 'secret', password_confirmation: 'secret' } }
  end
end
