clear all; clc; close all;
load Dsout_dmodel.mat
load Voltage_dmodel.mat
load Stack_dmodel.mat
load VLL_dmodel.mat

s = [4	9.9  21];

Lstk = predictor([s],Stack_dmodel);
PhaseVoltage = predictor([s],Voltage_dmodel);
Ds_out = predictor([s],Dsout_dmodel);

% s_range = [6	6	25; 14	15	45];
% 
% nstep = 101;
% 
% Teeth_ref = [linspace(s_range(1,1),s_range(2,1),nstep)];
% Turns_ref = [linspace(s_range(1,3),s_range(2,3),nstep)]';
% 
% for c = 1:nstep
%     for r = 1:nstep
%         Yoke(r,c) = s_opt(2);
%         Teeth(r,c) = Teeth_ref(1,c);
%         Turns(r,c) = Turns_ref(r,1);
%         StackLength(r,c) = predictor([Teeth(r,c),Yoke(r,c),Turns(r,c)],Stack_dmodel);
%         Phase_Voltage_Fundamental(r,c) = predictor([Teeth(r,c),Yoke(r,c),Turns(r,c)],Voltage_dmodel)-3.440508106;
%         Stator_outer_diameter(r,c) = predictor([Teeth(r,c),Yoke(r,c),Turns(r,c)],Dsout_dmodel)+0.0800232;
%         Line_line_voltage(r,c) = predictor([Teeth(r,c),Yoke(r,c),Turns(r,c)],VLL_dmodel)-0.844427;
%     end
% end
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
