require 'test_helper'

class ApexClassesControllerTest < ActionController::TestCase
  setup do
    #@apex_class = apex_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apex_classes)
  end

  test "apex_classes variable is an array of SObjects" do
    get :index
    assert assigns(:apex_classes).class == Restforce::Collection
    assigns(:apex_classes).each do |apex_class|
      assert apex_class.class == Restforce::SObject
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apex_class
    assert_response :success
  end

  # test "should create apex_class" do
  #   assert_difference('ApexClass.count') do
  #     post :create, apex_class: {  }
  #   end

  #   assert_redirected_to apex_class_path(assigns(:apex_class))
  # end


  # test "should update apex_class" do
  #   patch :update, id: @apex_class, apex_class: {  }
  #   assert_redirected_to apex_class_path(assigns(:apex_class))
  # end

  # test "should destroy apex_class" do
  #   assert_difference('ApexClass.count', -1) do
  #     delete :destroy, id: @apex_class
  #   end

  #   assert_redirected_to apex_classes_path
  # end
end
