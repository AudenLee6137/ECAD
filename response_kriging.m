clear all; clc; close all;

load Effavg_dmodel.mat 
load Trqbase_dmodel.mat 
load Trqmax_dmodel.mat 
load Rippbase_dmodel.mat 
load Rippmax_dmodel.mat
load VLLmax_dmodel.mat 
load Stack_dmodel.mat

s_opt = [15.81 15.56 0.97 1.28 3.32 8.5 7.06];
s_range = [12 12 0.5 0.5 3 3 3.5;16 16 3 2 8.5 8.5 10];

nstep = 101;

ang_pole_N_ref = [linspace(s_range(1,1),s_range(2,1),nstep)]';
ang_pole_S_ref = [linspace(s_range(1,2),s_range(2,2),nstep)];
t_bridge_ref = [linspace(s_range(1,3),s_range(2,3),nstep)]';
t_rib_ref = [linspace(s_range(1,4),s_range(2,4),nstep)];
t_rotorcore_N_ref = [linspace(s_range(1,5),s_range(2,5),nstep)]';
t_rotorcore_S_ref = [linspace(s_range(1,6),s_range(2,6),nstep)];
t_yoke_ref = [linspace(s_range(1,7),s_range(2,7),nstep)]';



for c = 1:nstep
    for r = 1:nstep
        ang_pole_N(r,c) = s_opt(1);
        ang_pole_S(r,c) = s_opt(2);
        t_bridge(r,c) = s_opt(3);
        t_rib(r,c) = s_opt(4);
        t_rotorcore_N(r,c) = t_rotorcore_N_ref(r,1);
        t_rotorcore_S(r,c) = t_rotorcore_S_ref(1,c);
        t_yoke(r,c) = s_opt(7);
  
        
        Efficiency_average(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Effavg_dmodel);
        TorqueBase(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Trqbase_dmodel);
        TorqueMax(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Trqmax_dmodel);
        TorqueRipplebase(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Rippbase_dmodel);
        TorqueRipplemax(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Rippmax_dmodel);
        LtoLVoltage(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],VLLmax_dmodel);
        Stacklength(r,c) = predictor([ang_pole_N(r,c),ang_pole_S(r,c),t_bridge(r,c),t_rib(r,c),t_rotorcore_N(r,c),t_rotorcore_S(r,c),t_yoke(r,c)],Stack_dmodel);
        
%         Torque(r,c) = 2.17/(predictor([Teeth(r,c),Yoke(r,c),Turns(r,c)],Stack_dmodel));
    end
end
% 
% Dr = 27;
% Dsh = 7;
% 
% s_min = [4, 0.5, 0.04];
% s_max = [7, 2.5, 1.0];
% 
% t_PM_ref = linspace(s_min(1),s_max(1),31);
% t_Can_ref = linspace(s_min(2),s_max(2),21);
% 
% for c = 1:21;
%     for r = 1:31;
%         t_PM(r,c) = t_PM_ref(r);
%         t_Can(r,c) = t_Can_ref(c);
%         t_Shaft(r,c) = Dr/2 - t_Can(r,c) - t_PM(r,c) - Dsh/2;
%         Bg_s1s2(r,c) = predictor([t_PM(r,c),t_Can(r,c),0,t_Shaft(r,c),Dsh],Bg_dmodel);
%     end
% end
% 
% % t_Shaft = (rotorsize(2)/2-s(1)-s(2)-rotorsize(1)/2);
% % s(3) = 0;
% % 
% % y = predictor([s t_Shaft rotorsize(2) ], Bg_dmodel);
