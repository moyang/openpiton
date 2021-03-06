# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_4.cmd
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================
CONFIG id=28 iosyncadr=0x7CF00BEEF00
TIMEOUT 10000000
IOSYNC

#====================================================
# algorithm 1 - false sharing
#====================================================

WRITEMSK 0x1170000040 0x00FF000000000000 +
	0xdeadbee0 0xdeadbee1 0xa4a4a4a4 0xa4a4a4a4 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 

#====================================================
# algorithm 1 - checker false sharing
#====================================================
READIO 0x61170000048 8 0xa4a4a4a4 0xa4a4a4a4

#====================================================
# algorithm 2 - checker
#====================================================
LABEL000:
READIO 0x61170000138 8 0x00000000 0x00000000 setcc
BE LABEL000

READBLK 0x01170000100  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#====================================================
# algorithm 3 - checker
#====================================================
LABEL001:
READIO 0x61170000238 8 0x00000000 0x00000000 setcc
BE LABEL001

READBLK 0x01170000200  +
        0x00000000 0x00000c21 0x00000000 0x00000c22 +
        0x00000000 0x00000c23 0x00000000 0x00000c24 +
        0x00000000 0x00000c25 0x00000000 0x00000c26 +
        0x00000000 0x00000c27 0x00000000 0x00000c28 

#====================================================
# algorithm 4 - checker
#====================================================
LABEL002:
READIO 0x61170000340 8 0x00000000 0x00000000 setcc
BE LABEL002

READBLK 0x01170000300  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#====================================================
# algorithm 5 - checker
#====================================================
LABEL003:
READIO 0x61170000440 8 0x00000000 0x00000000 setcc
BE LABEL003

READBLK 0x01170000400  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#====================================================
# algorithm 6 - checker
#====================================================
LABEL004:
READIO 0x61170000540 8 0x00000000 0x00000000 setcc
BE LABEL004

READBLK 0x01170000500  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#====================================================
# algorithm 7 - checker
#====================================================
LABEL005:
READIO 0x61170000608 8 0x00000000 0x00000000 setcc
BE LABEL005

READIO 0x61170000600 8  0x00000000 0x000000c1

#====================================================
# algorithm 8 - checker
#====================================================
IOSYNC
READIO 0x61170000700 8  0x00000000 0x000000c1

#====================================================
# algorithm 9 - checker
#====================================================
IOSYNC
READBLK 0x01170000800  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#====================================================
# algorithm 10 - checker
#====================================================
IOSYNC
READBLK 0x01170000900  +
        0x00000000 0x000000c1 0x00000000 0x000000c2 +
        0x00000000 0x000000c3 0x00000000 0x000000c4 +
        0x00000000 0x000000c5 0x00000000 0x000000c6 +
        0x00000000 0x000000c7 0x00000000 0x000000c8 

#---------------------------------------------------

#====================================================
# algorithm 11
#====================================================

WRITEBLK 0x1170000A00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 

#====================================================
# algorithm 11 - checker
#====================================================
LABEL006:
READIO 0x61170000A38 8 0x00000000 0x00000000 setcc
BE LABEL006

READBLK 0x01170000A00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 

#====================================================
# algorithm 12
#====================================================
WRITEBLK 0x1170000B00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 

WRITEIO 0x61170000B40 8 0xF0F0F0F0 0xF0F0F0F0

#====================================================
# algorithm 12 - checker
#====================================================
LABEL007:
READIO 0x61170000B40 8 0x00000000 0x00000000 setcc
BE LABEL007

READBLK 0x1170000B00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 


#====================================================
# algorithm 13
#====================================================
WRITEBLK 0x1170000C00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 

WRITEMSK 0x1170000C40 0xFF00000000000000 +
	0xf0f0f0f0 0xf0f0f0f0 0xdddddddd 0xdddddddd +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xa6a6a6a6 0xa6a6a6a6 0xdddddddd 0xdeadbee0 

#====================================================
# algorithm 13 - checker
#====================================================
LABEL008:
READIO 0x61170000C40 8 0x00000000 0x00000000 setcc
BE LABEL008

READBLK 0x1170000C00 +
        0x00000000 0x00000001 0x00000000 0x00000002 +
        0x00000000 0x00000003 0x00000000 0x00000004 +
        0x00000000 0x00000005 0x00000000 0x00000006 +
        0x00000000 0x00000007 0x00000000 0x00000008 

#====================================================
DONE
