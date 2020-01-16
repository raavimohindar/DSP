function w = HammingFen(varargin)
%HAMMING   Hamming window.
%   HAMMING(N) returns the N-point symmetric Hamming window in a column vector.
% 
%   HAMMING(N,SFLAG) generates the N-point Hamming window using SFLAG window
%   sampling. SFLAG may be either 'symmetric' or 'periodic'. By default, a 
%   symmetric window is returned. 
%
%   See also BARTLETT, BLACKMAN, BOXCAR, CHEBWIN, HANN, KAISER and TRIANG.

%   Copyright 1988-2000 The MathWorks, Inc.
%       $Revision: 1.7 $  $Date: 2000/06/09 22:04:45 $

% Check number of inputs
error(nargchk(1,2,nargin));

[w,msg] = ErzKosFen('hamming',varargin{:});
error(msg);

% [EOF] hamming.m




function [w,msg] = ErzKosFen(varargin)
%GENCOSWIN   Returns one of the generalized cosine windows.
%   GENCOSWIN returns the generalized cosine window specified by the 
%   first string argument. Its inputs can be
%     Window name    - a string, any of 'hamming', 'hann', 'blackman'.
%     N              - length of the window desired.
%     Sampling flag  - optional string, one of 'symmetric', 'periodic'. 

%   Copyright 1988-2000 The MathWorks, Inc.
%   $Revision: 1.4 $  $Date: 2000/06/09 20:50:48 $ 

% Parse the inputs
window = varargin{1};
n = varargin{2};
msg = '';

% Check for trivial orders
[n,w,trivialwin] = Ubrpru_Ordnung(n);
if trivialwin, return, end;

% Select the sampling option
if nargin == 2, % no sampling flag specified, use default. 
   sflag = 'symmetric';
else
   sflag = lower(varargin{3});
end

% Allow partial strings for sampling options
allsflags = {'symmetric','periodic'};
sflagindex = strmatch(sflag, allsflags);
if length(sflagindex)~=1         % catch 0 or 2 matches
   msg = 'Sampling flag must be either ''symmetric'' or ''periodic''.';
   return;
else    
   sflag = allsflags{sflagindex};
end

% Evaluate the window
switch sflag
case 'periodic'
   w = sym_window(n+1,window);
   w(end) = [];
case 'symmetric'
   w = sym_window(n,window);
end

%---------------------------------------------------------------------
function w = sym_window(n,window)
%SYM_WINDOW   Symmetric generalized cosine window.
%   SYM_WINDOW Returns an exactly symmetric N point generalized cosine 
%   window by evaluating the first half and then flipping the same samples
%   over the other half.

if ~rem(n,2)
   % Even length window
   half = n/2;
   w = calc_window(half,n,window);
   w = [w; w(end:-1:1)];
else
   % Odd length window
   half = (n+1)/2;
   w = calc_window(half,n,window);
   w = [w; w(end-1:-1:1)];
end

%---------------------------------------------------------------------
function w = calc_window(m,n,window)
%CALC_WINDOW   Calculate the generalized cosine window samples.
%   CALC_WINDOW Calculates and returns the first M points of an N point
%   generalized cosine window determined by the 'window' string.

% For the hamming and blackman windows we force rounding in order to achieve
% better numerical properties.  For example, the end points of the hamming 
% window should be exactly 0.08.

switch window
case 'hann'
   % Hann window
   w = 0.5 * (1 - cos(2*pi*(0:m-1)'/(n-1))); 
case 'hamming'
   % Hamming window
   w = (54 - 46*cos(2*pi*(0:m-1)'/(n-1)))/100;
case 'blackman'
   % Blackman window
   w = (42 - 50*cos(2*pi*(0:m-1)/(n-1)) + 8*cos(4*pi*(0:m-1)/(n-1)))'/100;
end

% [EOF] gencoswin.m



function [n_out, w, trivalwin] = Ubrpru_Ordnung(n_in)
%CHECK_ORDER Checks the order passed to the window functions.
% [N,W,TRIVALWIN] = CHECK_ORDER(N_ESTIMATE) will round N_ESTIMATE to the
% nearest integer if it is not alreay an integer. In special cases (N is [],
% 0, or 1), TRIVALWIN will be set to flag that W has been modified.

%   Copyright 1988-2000 The MathWorks, Inc.
%   $Revision: 1.4 $  $Date: 2000/06/09 20:50:37 $

w = [];
trivalwin = 0;

% Special case of negative orders:
if n_in < 0,
   error('Order cannot be less than zero.');
end

% Check if order is already an integer or empty
% If not, round to nearest integer.
if isempty(n_in) | n_in == floor(n_in),
   n_out = n_in;
else
   n_out = round(n_in);
   warning('Rounding order to nearest integer.');
end

% Special cases:
if isempty(n_out) | n_out == 0,
   w = zeros(0,1);               % Empty matrix: 0-by-1
   trivalwin = 1; 
elseif n_out == 1,
   w = 1;
   trivalwin = 1;   
end




