% MAX2821 RX Signal Chain Simulation
% Based on MAX2821 datasheet specifications

function [output_signal] = MAX2821_RX(input_signal, sampling_rate)
    % Input parameters:
    % input_signal: Input RF signal (2.4-2.5 GHz band)
    % sampling_rate: Sampling rate of the input signal
    
    % Specifications from MAX2821 datasheet
    RF_GAIN = 20;           % RF gain in dB (typical)
    NF = 4.5;              % Noise Figure in dB
    IP3 = -8;              % Input IP3 in dBm
    LO_FREQ = 2.45e9;      % Local oscillator frequency (center of band)
    IF_BANDWIDTH = 20e6;   % IF bandwidth
    
    % Add thermal noise based on noise figure
    kT = -174;             % Thermal noise in dBm/Hz
    noise_power = kT + NF + 10*log10(IF_BANDWIDTH);
    noise = sqrt(10^(noise_power/10)/2) * (randn(size(input_signal)) + 1j*randn(size(input_signal)));
    
    % RF Amplifier stage
    rf_signal = input_signal * 10^(RF_GAIN/20);
    rf_signal = rf_signal + noise;
    
    % Mixer stage - downconvert to IF
    t = (0:length(input_signal)-1)/sampling_rate;
    lo_signal = exp(-1j*2*pi*LO_FREQ*t);
    if_signal = rf_signal .* lo_signal;
    
    % IF Filter (implement as lowpass)
    [b, a] = butter(6, IF_BANDWIDTH/(sampling_rate/2));
    if_filtered = filter(b, a, if_signal);
    
    % Variable Gain Amplifier (VGA)
    % Assuming AGC sets appropriate gain
    vga_gain = 20;  % dB, adjustable from 0 to 60dB
    output_signal = if_filtered * 10^(vga_gain/20);
    
    % Add nonlinearity effects
    % Simplified third-order nonlinearity
    output_signal = output_signal - 0.1 * abs(output_signal).^2 .* output_signal;
end


