
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Clock Placer Checks: Poor placement for routing between an IO pin and BUFG. 
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	%s (IBUF.O) is locked to %s
	%s (BUFG.I) is provisionally placed by clockplacer on %s
%s*DRC2X
 "B
cmos_pclk_i_IBUF_inst	cmos_pclk_i_IBUF_inst2default:default2default:default2@
 "*
	IOB_X1Y83
	IOB_X1Y832default:default2default:default2b
 "L
cmos_pclk_i_IBUF_BUFG_inst	cmos_pclk_i_IBUF_BUFG_inst2default:default2default:default2H
 "2
BUFGCTRL_X0Y3
BUFGCTRL_X0Y32default:default2default:default2;
 #DRC|Implementation|Placement|Clocks2default:default8ZPLCK-12h px? 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: 8ce1f839
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:24 . Memory (MB): peak = 2088.516 ; gain = 40.4182default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: 8ce1f839
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:24 . Memory (MB): peak = 2120.828 ; gain = 72.7302default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: 8ce1f839
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:24 . Memory (MB): peak = 2128.750 ; gain = 80.6522default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: 8ce1f839
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:40 ; elapsed = 00:00:25 . Memory (MB): peak = 2128.750 ; gain = 80.6522default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 19c4ac427
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:47 ; elapsed = 00:00:29 . Memory (MB): peak = 2152.191 ; gain = 104.0942default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=0.582  | TNS=0.000  | WHS=-0.463 | THS=-235.589|
2default:defaultZ35-416h px? 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 2.5.1 Update Timing | Checksum: 178374757
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:32 . Memory (MB): peak = 2160.938 ; gain = 112.8402default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.582  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
P
;Phase 2.5 Update Timing for Bus Skew | Checksum: 2218fa82a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:32 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
I
4Phase 2 Router Initialization | Checksum: 1eec2cbd2
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:32 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 15cc9d6ad
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:53 ; elapsed = 00:00:33 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.401  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 27e4d4f2f
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:02 ; elapsed = 00:00:39 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.410  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.2 Global Iteration 1 | Checksum: 1ac2b2d81
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 1ac2b2d81
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 150d77ecb
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:06 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.525  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 103aa18d0
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:06 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 103aa18d0
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:06 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 103aa18d0
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:06 ; elapsed = 00:00:42 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 1f5115fe3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:07 ; elapsed = 00:00:43 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.525  | TNS=0.000  | WHS=0.027  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 11dfdb9e1
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:07 ; elapsed = 00:00:43 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 11dfdb9e1
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:07 ; elapsed = 00:00:43 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 181c18b4e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:07 ; elapsed = 00:00:43 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 181c18b4e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:07 ; elapsed = 00:00:43 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 20b327d9a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:08 ; elapsed = 00:00:44 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=0.525  | TNS=0.000  | WHS=0.027  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 20b327d9a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:08 ; elapsed = 00:00:45 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:08 ; elapsed = 00:00:45 . Memory (MB): peak = 2174.113 ; gain = 126.0162default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1022default:default2
242default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:122default:default2
00:00:472default:default2
2174.1132default:default2
126.0162default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:052default:default2
00:00:022default:default2
2181.0002default:default2
6.8872default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
pC:/Users/zbl/Desktop/ov5640/ov5640/mi/CH23_AXI_VDMA_OV5640/Miz_sys/Miz_sys.runs/impl_1/system_wrapper_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
Executing : report_drc -file system_wrapper_drc_routed.rpt -pb system_wrapper_drc_routed.pb -rpx system_wrapper_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
rreport_drc -file system_wrapper_drc_routed.rpt -pb system_wrapper_drc_routed.pb -rpx system_wrapper_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
tC:/Users/zbl/Desktop/ov5640/ov5640/mi/CH23_AXI_VDMA_OV5640/Miz_sys/Miz_sys.runs/impl_1/system_wrapper_drc_routed.rpttC:/Users/zbl/Desktop/ov5640/ov5640/mi/CH23_AXI_VDMA_OV5640/Miz_sys/Miz_sys.runs/impl_1/system_wrapper_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file system_wrapper_methodology_drc_routed.rpt -pb system_wrapper_methodology_drc_routed.pb -rpx system_wrapper_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file system_wrapper_methodology_drc_routed.rpt -pb system_wrapper_methodology_drc_routed.pb -rpx system_wrapper_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
?C:/Users/zbl/Desktop/ov5640/ov5640/mi/CH23_AXI_VDMA_OV5640/Miz_sys/Miz_sys.runs/impl_1/system_wrapper_methodology_drc_routed.rpt?C:/Users/zbl/Desktop/ov5640/ov5640/mi/CH23_AXI_VDMA_OV5640/Miz_sys/Miz_sys.runs/impl_1/system_wrapper_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:102default:default2
00:00:062default:default2
2229.8522default:default2
45.1562default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_power -file system_wrapper_power_routed.rpt -pb system_wrapper_power_summary_routed.pb -rpx system_wrapper_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_power -file system_wrapper_power_routed.rpt -pb system_wrapper_power_summary_routed.pb -rpx system_wrapper_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
?Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1142default:default2
252default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:082default:default2
00:00:052default:default2
2231.0432default:default2
1.1912default:defaultZ17-268h px? 
?
%s4*runtcl2}
iExecuting : report_route_status -file system_wrapper_route_status.rpt -pb system_wrapper_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file system_wrapper_timing_summary_routed.rpt -pb system_wrapper_timing_summary_routed.pb -rpx system_wrapper_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px? 
?
%s4*runtcl2k
WExecuting : report_incremental_reuse -file system_wrapper_incremental_reuse_routed.rpt
2default:defaulth px? 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px? 
?
%s4*runtcl2k
WExecuting : report_clock_utilization -file system_wrapper_clock_utilization_routed.rpt
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_bus_skew -warn_on_violation -file system_wrapper_bus_skew_routed.rpt -pb system_wrapper_bus_skew_routed.pb -rpx system_wrapper_bus_skew_routed.rpx
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record