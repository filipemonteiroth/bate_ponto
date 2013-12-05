require 'test_helper'

class WorkPointsControllerTest < ActionController::TestCase
  setup do
    @work_point = work_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_point" do
    assert_difference('WorkPoint.count') do
      post :create, work_point: { almoco: @work_point.almoco, entrada: @work_point.entrada, saida: @work_point.saida, volta_almoco: @work_point.volta_almoco }
    end

    assert_redirected_to work_point_path(assigns(:work_point))
  end

  test "should show work_point" do
    get :show, id: @work_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_point
    assert_response :success
  end

  test "should update work_point" do
    patch :update, id: @work_point, work_point: { almoco: @work_point.almoco, entrada: @work_point.entrada, saida: @work_point.saida, volta_almoco: @work_point.volta_almoco }
    assert_redirected_to work_point_path(assigns(:work_point))
  end

  test "should destroy work_point" do
    assert_difference('WorkPoint.count', -1) do
      delete :destroy, id: @work_point
    end

    assert_redirected_to work_points_path
  end
end
