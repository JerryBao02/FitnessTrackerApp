package com.FitnessApp.FitnessTracker.service.interfac;


import com.FitnessApp.FitnessTracker.dto.LoginRequest;
import com.FitnessApp.FitnessTracker.dto.Response;
import com.FitnessApp.FitnessTracker.entity.User;

public interface IUserService {
    Response register(User user);

    Response login(LoginRequest loginRequest);

    Response getAllUsers();

//    Response getUserBookingHistory(String userId);

    Response deleteUser(String userId);

    Response getUserById(String userId);

    Response getMyInfo(String email);

}