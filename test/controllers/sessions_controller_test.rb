# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test 'should get new' do
    get new_session_url
    assert_response :success
  end

  test 'should create session with valid credentials' do
    post sessions_url, params: { email: @member.email, password: 'secret' }

    assert_redirected_to clubs_path
  end

  test 'should not create session with invalid credentials' do
    post sessions_url, params: { email: @member.email, password: 'incorrect password' }

    assert_nil session[:user_id]
    assert_redirected_to new_session_path
  end

  test 'should destroy session' do
    delete session_url(@member)

    assert_redirected_to new_session_path
  end
end
