require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance = attendances(:one)
  end

  test "should get index" do
    get attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_attendance_url
    assert_response :success
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post attendances_url, params: { attendance: { holiday: @attendance.holiday, in_time: @attendance.in_time, out_time: @attendance.out_time, salary_date: @attendance.salary_date, teacher_id: @attendance.teacher_id } }
    end

    assert_redirected_to attendance_url(Attendance.last)
  end

  test "should show attendance" do
    get attendance_url(@attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_attendance_url(@attendance)
    assert_response :success
  end

  test "should update attendance" do
    patch attendance_url(@attendance), params: { attendance: { holiday: @attendance.holiday, in_time: @attendance.in_time, out_time: @attendance.out_time, salary_date: @attendance.salary_date, teacher_id: @attendance.teacher_id } }
    assert_redirected_to attendance_url(@attendance)
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete attendance_url(@attendance)
    end

    assert_redirected_to attendances_url
  end
end
