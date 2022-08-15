clc;clear;close all;
T=200;                                          % Length of time
T_modulation=40;
Fs=1000;                                        %Sampling rate
Data_len=T*Fs;                                  %Sequence length
Dt=1/Fs;                                        %Time interval
Bandwidth=[8 12];                               %Filtered bandwidth
[Filter_b,Filter_a]=butter(2,Bandwidth/(Fs/2),'bandpass');    %Bandpass filter
Freq_low=6;
Freq_high=15;
Freq=Freq_low:0.01:Freq_high;                  %The range of frequrncy when doing pwelch
Freq_num=length(Freq);
Delay=1:150;                                    %Phase delay
Delay_num=length(Delay);                        %Number of phase delays
Delay_Error=0;
Run_num=10;                                     %The number of simulation time
Result=zeros(Run_num,Delay_num,Freq_num);       %Power spectral density
Model_name={'NMM','FixedPoint','LimitCycle','Lorenz'};


for model_idx=1:4
    switch model_idx
        
        %% Neural mass model
        case 1
            fun=@fun_NMM;
            Model_dim=6;
            I_noise=0;                          %Phase estimation error
            Stimu_dim=5;                        %Stimulation dimension
            Output_dim=[0,1,-1,0,0,0];          %
            I_stimu=3000;                       %Stimulation intensity
            Portrait_delay=[50,120];            %Phase delay portrait is drawn in those phases
            Init_range=[0.1,0.13;
                23.6,24;
                14.5,18;
                -1.4,1.3;
                -14,10.5;
                -108,110];
            %The trajectory range in resting state
            
            %% Fixed-point attractor
        case 2
            fun=@fun_point;
            Model_dim=2;
            Stimu_dim=1;
            I_noise=100;
            Output_dim=[1,0];
            I_stimu=3000;
            Portrait_delay=[55,100];
            Init_range=[-2,2;
                -2,2];
            
            %% Limit cycle attractor
        case 3
            fun=@fun_limit_cycle;
            Model_dim=2;
            Stimu_dim=1;
            I_noise=0;
            Output_dim=[1,0];
            I_stimu=3000;
            Portrait_delay=[80,130];
            Init_range=[-1.5,1.5;
                -1.5,1.5];
            
            %% Lorenz attractor
        case 4
            fun=@fun_Lorenz;
            Model_dim=3;
            Stimu_dim=3;
            I_noise=0;
            Output_dim=[0,0,1];
            I_stimu=100000;
            Portrait_delay=25:15:100;
            Init_range=[-130,134;
                -169,176;
                30,300];
    end
    Portrait_delay_num=length(Portrait_delay);
    Portrait_output=zeros(Run_num,Portrait_delay_num,Data_len);
    Portrait_raw=zeros(Run_num,Portrait_delay_num,Model_dim,Data_len);
    Portrait_marker=zeros(Run_num,Portrait_delay_num,5*Fs);
    
    for run_idx=1:Run_num
        Temp_output=zeros(Delay_num,Data_len);
        Temp_raw=zeros(Delay_num,Model_dim,Data_len);
        Temp_marker=zeros(Delay_num,5*Fs);
        clc;disp([model_idx,run_idx])
        parfor delay_idx=1:Delay_num
            disp(delay_idx);
            Raw_signal=zeros(Model_dim,Data_len);
            Raw_signal(:,1)=Init_range(:,1)+(Init_range(:,2)-Init_range(:,1)).*rand(Model_dim,1);
            Output=zeros(1,Data_len);
            Output(1,1)=Output_dim*Raw_signal(:,1);
            Filtered_signal=zeros(1,Data_len);
            Input=randn(Model_dim,Data_len*3)*I_noise;
            marker=[];
            for k=2:Data_len
                %Solve the ODE by Rungkutta
                Raw_signal(:,k)=RungeKutta4(fun,Dt,Raw_signal(:,k-1),Input(:,2*(k-1):2*k));
                Output(1,k)=Output_dim*Raw_signal(:,k);
                
                %Filtering
                if k>size(Filter_b,2)
                    Filtered_signal(k)=Output(1,k:-1:k-size(Filter_b,2)+1)*Filter_b'...
                        -Filtered_signal(1,k-1:-1:k-size(Filter_a,2)+1)*Filter_a(2:end)';
                end
                
                %Identify stimulus points by apply a delay
                if(k>T_modulation*Fs && Filtered_signal(k-delay_idx)>0 && ...
                        Filtered_signal(k-delay_idx-1)<0)
                    t_idx=2*k+round(randn(1,1)*delay_idx*Delay_Error);
                    Input(Stimu_dim,t_idx)=Input(Stimu_dim,t_idx)+I_stimu;
                    marker=[marker,k];
                end
            end
            marker(end+1:5*Fs)=0;
            Temp_output(delay_idx,:)=Output;
            Temp_raw(delay_idx,:,:)=Raw_signal;
            Temp_marker(delay_idx,:)=marker;
            [Result(run_idx,delay_idx,:),~] = pwelch(Output(1,Data_len/2+1:end),5*Fs,[],Freq,Fs);
        end
        Portrait_output(run_idx,:,:)=Temp_output(Portrait_delay,:);
        Portrait_raw(run_idx,:,:,:)=Temp_raw(Portrait_delay,:,:);
        Portrait_marker(run_idx,:,:)=Temp_marker(Portrait_delay,:);
    end
    save(['Data_Fig2&3\Power Specturm ',Model_name{model_idx},'.mat'],'Result')
    save(['Data_Fig2&3\Portrait ',Model_name{model_idx},'.mat'],'Portrait_output','Portrait_raw','Portrait_marker')
end