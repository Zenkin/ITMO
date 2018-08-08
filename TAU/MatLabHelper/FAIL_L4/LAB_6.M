function [ret,x0,str]=lab_6(t,x,u,flag);
%LAB_6	is the M-file description of the SIMULINK system named LAB_6.
%	The block-diagram can be displayed by typing: LAB_6.
%
%	SYS=LAB_6(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes LAB_6 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling LAB_6 with a FLAG of zero:
%	[SIZES]=LAB_6([],[],[],0),  returns a vector, SIZES, which
%	contains the sizes of the state vector and other parameters.
%		SIZES(1) number of states
%		SIZES(2) number of discrete states
%		SIZES(3) number of outputs
%		SIZES(4) number of inputs.
%	For the definition of other parameters in SIZES, see SFUNC.
%	See also, TRIM, LINMOD, LINSIM, EULER, RK23, RK45, ADAMS, GEAR.

% Note: This M-file is only used for saving graphical information;
%       after the model is loaded into memory an internal model
%       representation is used.

% the system will take on the name of this mfile:
sys = mfilename;
new_system(sys)
simver(1.2)
if(0 == (nargin + nargout))
     set_param(sys,'Location',[42,98,542,398])
     open_system(sys)
end;
set_param(sys,'algorithm',		'RK-45')
set_param(sys,'Start time',	'0.0')
set_param(sys,'Stop time',		'10')
set_param(sys,'Min step size',	'0.0001')
set_param(sys,'Max step size',	'0.01')
set_param(sys,'Relative error','1e-3')
set_param(sys,'Return vars',	'')


%     Subsystem  'UnNamed'.

new_system([sys,'/','UnNamed'])
set_param([sys,'/','UnNamed'],'Location',[75,83,385,268])

add_block('built-in/Integrator',[sys,'/','UnNamed/Integrator1'])
set_param([sys,'/','UnNamed/Integrator1'],...
		'position',[180,50,200,70])

add_block('built-in/Gain',[sys,'/','UnNamed/Gain2'])
set_param([sys,'/','UnNamed/Gain2'],...
		'orientation',2,...
		'Gain','5',...
		'position',[160,105,180,125])

add_block('built-in/Sum',[sys,'/','UnNamed/Sum'])
set_param([sys,'/','UnNamed/Sum'],...
		'inputs','+-',...
		'position',[130,50,150,70])

add_block('built-in/Gain',[sys,'/','UnNamed/Gain1'])
set_param([sys,'/','UnNamed/Gain1'],...
		'Gain','10',...
		'position',[85,45,105,65])

add_block('built-in/Inport',[sys,'/','UnNamed/in_1'])
set_param([sys,'/','UnNamed/in_1'],...
		'position',[25,45,45,65])

add_block('built-in/Outport',[sys,'/','UnNamed/out_1'])
set_param([sys,'/','UnNamed/out_1'],...
		'position',[240,50,260,70])
add_line([sys,'/','UnNamed'],[50,55;75,55])
add_line([sys,'/','UnNamed'],[110,55;120,55])
add_line([sys,'/','UnNamed'],[155,115;120,115;120,65])
add_line([sys,'/','UnNamed'],[205,60;205,115;190,115])
add_line([sys,'/','UnNamed'],[205,60;230,60])
add_line([sys,'/','UnNamed'],[155,60;170,60])
set_param([sys,'/','UnNamed'],...
		'Mask Display','1',...
		'Mask Type','1',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed'.

set_param([sys,'/','UnNamed'],...
		'position',[30,15,60,65])


%     Subsystem  'UnNamed1'.

new_system([sys,'/','UnNamed1'])
set_param([sys,'/','UnNamed1'],'Location',[70,93,380,313])

add_block('built-in/Gain',[sys,'/','UnNamed1/Gain4'])
set_param([sys,'/','UnNamed1/Gain4'],...
		'Gain','4',...
		'position',[85,55,105,75])

add_block('built-in/Gain',[sys,'/','UnNamed1/Gain3'])
set_param([sys,'/','UnNamed1/Gain3'],...
		'orientation',2,...
		'Gain','6',...
		'position',[160,115,180,135])

add_block('built-in/Sum',[sys,'/','UnNamed1/Sum1'])
set_param([sys,'/','UnNamed1/Sum1'],...
		'inputs','+--',...
		'position',[130,57,150,93])

add_block('built-in/Integrator',[sys,'/','UnNamed1/Integrator2'])
set_param([sys,'/','UnNamed1/Integrator2'],...
		'position',[180,65,200,85])

add_block('built-in/Integrator',[sys,'/','UnNamed1/Integrator3'])
set_param([sys,'/','UnNamed1/Integrator3'],...
		'position',[235,65,255,85])

add_block('built-in/Gain',[sys,'/','UnNamed1/Gain5'])
set_param([sys,'/','UnNamed1/Gain5'],...
		'orientation',2,...
		'Gain','2',...
		'position',[160,155,180,175])

add_block('built-in/Inport',[sys,'/','UnNamed1/in_1'])
set_param([sys,'/','UnNamed1/in_1'],...
		'position',[25,55,45,75])

add_block('built-in/Outport',[sys,'/','UnNamed1/out_1'])
set_param([sys,'/','UnNamed1/out_1'],...
		'position',[285,65,305,85])
add_line([sys,'/','UnNamed1'],[155,165;100,165;100,75;120,75])
add_line([sys,'/','UnNamed1'],[260,75;260,165;190,165])
add_line([sys,'/','UnNamed1'],[260,75;275,75])
add_line([sys,'/','UnNamed1'],[205,75;225,75])
add_line([sys,'/','UnNamed1'],[155,125;115,125;115,85;120,85])
add_line([sys,'/','UnNamed1'],[50,65;75,65])
add_line([sys,'/','UnNamed1'],[110,65;120,65])
add_line([sys,'/','UnNamed1'],[205,75;205,125;190,125])
add_line([sys,'/','UnNamed1'],[155,75;170,75])
set_param([sys,'/','UnNamed1'],...
		'Mask Display','2',...
		'Mask Type','2',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed1'.

set_param([sys,'/','UnNamed1'],...
		'position',[90,15,120,65])


%     Subsystem  'UnNamed3'.

new_system([sys,'/','UnNamed3'])
set_param([sys,'/','UnNamed3'],'Location',[10,198,280,413])

add_block('built-in/Gain',[sys,'/','UnNamed3/Gain4'])
set_param([sys,'/','UnNamed3/Gain4'],...
		'Gain','3',...
		'position',[55,60,75,80])

add_block('built-in/Gain',[sys,'/','UnNamed3/Gain3'])
set_param([sys,'/','UnNamed3/Gain3'],...
		'orientation',2,...
		'Gain','0',...
		'position',[130,120,150,140])

add_block('built-in/Sum',[sys,'/','UnNamed3/Sum1'])
set_param([sys,'/','UnNamed3/Sum1'],...
		'inputs','+--',...
		'position',[100,62,120,98])

add_block('built-in/Integrator',[sys,'/','UnNamed3/Integrator2'])
set_param([sys,'/','UnNamed3/Integrator2'],...
		'position',[150,70,170,90])

add_block('built-in/Integrator',[sys,'/','UnNamed3/Integrator3'])
set_param([sys,'/','UnNamed3/Integrator3'],...
		'position',[205,70,225,90])

add_block('built-in/Gain',[sys,'/','UnNamed3/Gain5'])
set_param([sys,'/','UnNamed3/Gain5'],...
		'orientation',2,...
		'Gain','9',...
		'position',[130,160,150,180])

add_block('built-in/Inport',[sys,'/','UnNamed3/in_1'])
set_param([sys,'/','UnNamed3/in_1'],...
		'position',[5,60,25,80])

add_block('built-in/Outport',[sys,'/','UnNamed3/out_1'])
set_param([sys,'/','UnNamed3/out_1'],...
		'position',[250,70,270,90])
add_line([sys,'/','UnNamed3'],[125,80;140,80])
add_line([sys,'/','UnNamed3'],[175,80;175,130;160,130])
add_line([sys,'/','UnNamed3'],[80,70;90,70])
add_line([sys,'/','UnNamed3'],[125,130;85,130;85,90;90,90])
add_line([sys,'/','UnNamed3'],[175,80;195,80])
add_line([sys,'/','UnNamed3'],[230,80;240,80])
add_line([sys,'/','UnNamed3'],[230,80;230,170;160,170])
add_line([sys,'/','UnNamed3'],[125,170;70,170;70,80;90,80])
add_line([sys,'/','UnNamed3'],[30,70;45,70])
set_param([sys,'/','UnNamed3'],...
		'Mask Display','4',...
		'Mask Type','4',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed3'.

set_param([sys,'/','UnNamed3'],...
		'position',[205,15,235,65])


%     Subsystem  'UnNamed2'.

new_system([sys,'/','UnNamed2'])
set_param([sys,'/','UnNamed2'],'Location',[215,108,495,333])

add_block('built-in/Gain',[sys,'/','UnNamed2/Gain15'])
set_param([sys,'/','UnNamed2/Gain15'],...
		'Gain','3',...
		'position',[60,60,80,80])

add_block('built-in/Gain',[sys,'/','UnNamed2/Gain14'])
set_param([sys,'/','UnNamed2/Gain14'],...
		'orientation',2,...
		'position',[135,120,155,140])

add_block('built-in/Sum',[sys,'/','UnNamed2/Sum6'])
set_param([sys,'/','UnNamed2/Sum6'],...
		'inputs','+--',...
		'position',[105,62,125,98])

add_block('built-in/Integrator',[sys,'/','UnNamed2/Integrator9'])
set_param([sys,'/','UnNamed2/Integrator9'],...
		'position',[155,70,175,90])

add_block('built-in/Integrator',[sys,'/','UnNamed2/Integrator8'])
set_param([sys,'/','UnNamed2/Integrator8'],...
		'position',[210,70,230,90])

add_block('built-in/Gain',[sys,'/','UnNamed2/Gain13'])
set_param([sys,'/','UnNamed2/Gain13'],...
		'orientation',2,...
		'Gain','10',...
		'position',[135,160,155,180])

add_block('built-in/Inport',[sys,'/','UnNamed2/in_1'])
set_param([sys,'/','UnNamed2/in_1'],...
		'position',[15,60,35,80])

add_block('built-in/Outport',[sys,'/','UnNamed2/out_1'])
set_param([sys,'/','UnNamed2/out_1'],...
		'position',[255,70,275,90])
add_line([sys,'/','UnNamed2'],[130,80;145,80])
add_line([sys,'/','UnNamed2'],[180,80;180,130;165,130])
add_line([sys,'/','UnNamed2'],[85,70;95,70])
add_line([sys,'/','UnNamed2'],[130,130;90,130;90,90;95,90])
add_line([sys,'/','UnNamed2'],[180,80;200,80])
add_line([sys,'/','UnNamed2'],[235,80;245,80])
add_line([sys,'/','UnNamed2'],[235,80;235,170;165,170])
add_line([sys,'/','UnNamed2'],[130,170;75,170;75,80;95,80])
add_line([sys,'/','UnNamed2'],[40,70;50,70])
set_param([sys,'/','UnNamed2'],...
		'Mask Display','3',...
		'Mask Type','3',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed2'.

set_param([sys,'/','UnNamed2'],...
		'position',[150,15,180,65])


%     Subsystem  'UnNamed5'.

new_system([sys,'/','UnNamed5'])
set_param([sys,'/','UnNamed5'],'Location',[4,228,339,428])

add_block('built-in/Sum',[sys,'/','UnNamed5/Sum5'])
set_param([sys,'/','UnNamed5/Sum5'],...
		'inputs','+-',...
		'position',[235,90,255,110])

add_block('built-in/Gain',[sys,'/','UnNamed5/Gain12'])
set_param([sys,'/','UnNamed5/Gain12'],...
		'Gain','50',...
		'position',[80,50,100,70])

add_block('built-in/Gain',[sys,'/','UnNamed5/Gain10'])
set_param([sys,'/','UnNamed5/Gain10'],...
		'Gain','100',...
		'position',[80,90,100,110])

add_block('built-in/Sum',[sys,'/','UnNamed5/Sum4'])
set_param([sys,'/','UnNamed5/Sum4'],...
		'inputs','+-',...
		'position',[125,95,145,115])

add_block('built-in/Gain',[sys,'/','UnNamed5/Gain11'])
set_param([sys,'/','UnNamed5/Gain11'],...
		'orientation',2,...
		'Gain','2',...
		'position',[155,150,175,170])

add_block('built-in/Integrator',[sys,'/','UnNamed5/Integrator7'])
set_param([sys,'/','UnNamed5/Integrator7'],...
		'position',[175,95,195,115])

add_block('built-in/Inport',[sys,'/','UnNamed5/in_1'])
set_param([sys,'/','UnNamed5/in_1'],...
		'position',[20,90,40,110])

add_block('built-in/Outport',[sys,'/','UnNamed5/out_1'])
set_param([sys,'/','UnNamed5/out_1'],...
		'position',[285,90,305,110])
add_line([sys,'/','UnNamed5'],[105,60;210,60;210,95;225,95])
add_line([sys,'/','UnNamed5'],[45,100;70,100])
add_line([sys,'/','UnNamed5'],[60,100;60,60;70,60])
add_line([sys,'/','UnNamed5'],[105,100;115,100])
add_line([sys,'/','UnNamed5'],[150,160;115,160;115,110])
add_line([sys,'/','UnNamed5'],[200,105;200,160;185,160])
add_line([sys,'/','UnNamed5'],[200,105;225,105])
add_line([sys,'/','UnNamed5'],[150,105;165,105])
add_line([sys,'/','UnNamed5'],[260,100;275,100])
set_param([sys,'/','UnNamed5'],...
		'Mask Display','5',...
		'Mask Type','5',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed5'.

set_param([sys,'/','UnNamed5'],...
		'position',[260,15,290,65])


%     Subsystem  'UnNamed7'.

new_system([sys,'/','UnNamed7'])
set_param([sys,'/','UnNamed7'],'Location',[20,173,365,313])

add_block('built-in/Sum',[sys,'/','UnNamed7/Sum2'])
set_param([sys,'/','UnNamed7/Sum2'],...
		'position',[245,72,265,108])

add_block('built-in/Integrator',[sys,'/','UnNamed7/Integrator4'])
set_param([sys,'/','UnNamed7/Integrator4'],...
		'position',[180,90,200,110])

add_block('built-in/Gain',[sys,'/','UnNamed7/Gain6'])
set_param([sys,'/','UnNamed7/Gain6'],...
		'Gain','2',...
		'position',[115,90,135,110])

add_block('built-in/Gain',[sys,'/','UnNamed7/Gain7'])
set_param([sys,'/','UnNamed7/Gain7'],...
		'Gain','4',...
		'position',[115,50,135,70])

add_block('built-in/Outport',[sys,'/','UnNamed7/out_1'])
set_param([sys,'/','UnNamed7/out_1'],...
		'position',[295,80,315,100])

add_block('built-in/Inport',[sys,'/','UnNamed7/in_1'])
set_param([sys,'/','UnNamed7/in_1'],...
		'position',[35,90,55,110])
add_line([sys,'/','UnNamed7'],[140,60;215,60;215,80;235,80])
add_line([sys,'/','UnNamed7'],[60,100;105,100])
add_line([sys,'/','UnNamed7'],[85,100;85,60;105,60])
add_line([sys,'/','UnNamed7'],[140,100;170,100])
add_line([sys,'/','UnNamed7'],[205,100;235,100])
add_line([sys,'/','UnNamed7'],[270,90;285,90])
set_param([sys,'/','UnNamed7'],...
		'Mask Display','6',...
		'Mask Type','6',...
		'Mask Dialogue','|',...
		'Mask Translate','',...
		'Mask Help','',...
		'Mask Entries','\/')


%     Finished composite block 'UnNamed7'.

set_param([sys,'/','UnNamed7'],...
		'position',[315,15,345,65])

% Return any arguments.
if (nargin | nargout)
	% Must use feval here to access system in memory
	if (nargin > 3)
		if (flag == 0)
			eval(['[ret,x0,str]=',sys,'(t,x,u,flag);'])
		else
			eval(['ret =', sys,'(t,x,u,flag);'])
		end
	else
		[ret,x0,str] = feval(sys);
	end
end
