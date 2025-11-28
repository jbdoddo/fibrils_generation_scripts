#Create the first monomer
#
fab KSLSLSLSLSLSLK
orient
#
# Create the second monomer, flip it 180deg along the x-axis, flip 180deg along y-axis then move down 9A along y-axis
#
cmd.create(None,"obj01",zoom=0)
rotate z, 180, obj02
translate [0,9,0], obj02
#
#	Create Monomers 3 & 4, tranlate 5A down Z axis
#
cmd.create(None,"obj01",zoom=0)
cmd.create(None,"obj02",zoom=0)
translate [0,0,5], obj03
translate [0,0,5], obj04
#
#
#	Create and place monomers 5-8
#
cmd.create(None,"obj01",zoom=0)
cmd.create(None,"obj02",zoom=0)
cmd.create(None,"obj03",zoom=0)
cmd.create(None,"obj04",zoom=0)
translate [0,0,10], obj05
translate [0,0,10], obj06
translate [0,0,10], obj07
translate [0,0,10], obj08
#
#	Create and place monomers 9-12
#
cmd.create(None,"obj05",zoom=0)
cmd.create(None,"obj06",zoom=0)
cmd.create(None,"obj07",zoom=0)
cmd.create(None,"obj08",zoom=0)
translate [0,0,10], obj09
translate [0,0,10], obj10
translate [0,0,10], obj11
translate [0,0,10], obj12
#
#	Create and place monomers 13-16
#
cmd.create(None,"obj09",zoom=0)
cmd.create(None,"obj10",zoom=0)
cmd.create(None,"obj11",zoom=0)
cmd.create(None,"obj12",zoom=0)
translate [0,0,10], obj13
translate [0,0,10], obj14
translate [0,0,10], obj15
translate [0,0,10], obj16
#
#	Create and place monomers 17-20
#
cmd.create(None,"obj13",zoom=0)
cmd.create(None,"obj14",zoom=0)
cmd.create(None,"obj15",zoom=0)
cmd.create(None,"obj16",zoom=0)
translate [0,0,10], obj17
translate [0,0,10], obj18
translate [0,0,10], obj19
translate [0,0,10], obj20
#
#	Create and place monomers 21-24
#
cmd.create(None,"obj17",zoom=0)
cmd.create(None,"obj18",zoom=0)
cmd.create(None,"obj19",zoom=0)
cmd.create(None,"obj20",zoom=0)
translate [0,0,10], obj21
translate [0,0,10], obj22
translate [0,0,10], obj23
translate [0,0,10], obj24
#
#	Create and place monomers 25-28
#
cmd.create(None,"obj21",zoom=0)
cmd.create(None,"obj22",zoom=0)
cmd.create(None,"obj23",zoom=0)
cmd.create(None,"obj24",zoom=0)
translate [0,0,10], obj25
translate [0,0,10], obj26
translate [0,0,10], obj27
translate [0,0,10], obj28
#
#	Create and place monomers 29-32
#
cmd.create(None,"obj25",zoom=0)
cmd.create(None,"obj26",zoom=0)
cmd.create(None,"obj27",zoom=0)
cmd.create(None,"obj28",zoom=0)
translate [0,0,10], obj29
translate [0,0,10], obj30
translate [0,0,10], obj31
translate [0,0,10], obj32
#
#	Create and place monomers 33-36
#
cmd.create(None,"obj29",zoom=0)
cmd.create(None,"obj30",zoom=0)
cmd.create(None,"obj31",zoom=0)
cmd.create(None,"obj32",zoom=0)
translate [0,0,10], obj33
translate [0,0,10], obj34
translate [0,0,10], obj35
translate [0,0,10], obj36
#
#	Create and place monomers 37-40
#
cmd.create(None,"obj33",zoom=0)
cmd.create(None,"obj34",zoom=0)
cmd.create(None,"obj35",zoom=0)
cmd.create(None,"obj36",zoom=0)
translate [0,0,10], obj37
translate [0,0,10], obj38
translate [0,0,10], obj39
translate [0,0,10], obj40
#
#	Create and place monomers 41-44
#
cmd.create(None,"obj37",zoom=0)
cmd.create(None,"obj38",zoom=0)
cmd.create(None,"obj39",zoom=0)
cmd.create(None,"obj40",zoom=0)
translate [0,0,10], obj41
translate [0,0,10], obj42
translate [0,0,10], obj43
translate [0,0,10], obj44
#
#	Create and place monomers 45-48
#
cmd.create(None,"obj41",zoom=0)
cmd.create(None,"obj42",zoom=0)
cmd.create(None,"obj43",zoom=0)
cmd.create(None,"obj44",zoom=0)
translate [0,0,10], obj45
translate [0,0,10], obj46
translate [0,0,10], obj47
translate [0,0,10], obj48
#
#	Create and place monomers 49-52
#
cmd.create(None,"obj45",zoom=0)
cmd.create(None,"obj46",zoom=0)
cmd.create(None,"obj47",zoom=0)
cmd.create(None,"obj48",zoom=0)
translate [0,0,10], obj49
translate [0,0,10], obj50
translate [0,0,10], obj51
translate [0,0,10], obj52
#
#	Create and place monomers 53-56
#
cmd.create(None,"obj49",zoom=0)
cmd.create(None,"obj50",zoom=0)
cmd.create(None,"obj51",zoom=0)
cmd.create(None,"obj52",zoom=0)
translate [0,0,10], obj53
translate [0,0,10], obj54
translate [0,0,10], obj55
translate [0,0,10], obj56
#
#	Create and place monomers 57-60
#
cmd.create(None,"obj53",zoom=0)
cmd.create(None,"obj54",zoom=0)
cmd.create(None,"obj55",zoom=0)
cmd.create(None,"obj56",zoom=0)
translate [0,0,10], obj57
translate [0,0,10], obj58
translate [0,0,10], obj59
translate [0,0,10], obj60

#
#	Assign a chain and segi value for each monomer
#
alter obj01, chain='A'
alter obj02, chain='B'
alter obj03, chain='C'
alter obj04, chain='D'
alter obj05, chain='E'
alter obj06, chain='F'
alter obj07, chain='G'
alter obj08, chain='H'
alter obj09, chain='I'
alter obj10, chain='J'
alter obj11, chain='K'
alter obj12, chain='L'
alter obj13, chain='M'
alter obj14, chain='N'
alter obj15, chain='O'
alter obj16, chain='P'
alter obj17, chain='Q'
alter obj18, chain='R'
alter obj19, chain='S'
alter obj20, chain='T'
#
alter obj21, chain='A'
alter obj22, chain='B'
alter obj23, chain='C'
alter obj24, chain='D'
alter obj25, chain='E'
alter obj26, chain='F'
alter obj27, chain='G'
alter obj28, chain='H'
alter obj29, chain='I'
alter obj30, chain='J'
alter obj31, chain='K'
alter obj32, chain='L'
alter obj33, chain='M'
alter obj34, chain='N'
alter obj35, chain='O'
alter obj36, chain='P'
alter obj37, chain='Q'
alter obj38, chain='R'
alter obj39, chain='S'
alter obj40, chain='T'
#
alter obj41, chain='A'
alter obj42, chain='B'
alter obj43, chain='C'
alter obj44, chain='D'
alter obj45, chain='E'
alter obj46, chain='F'
alter obj47, chain='G'
alter obj48, chain='H'
alter obj49, chain='I'
alter obj50, chain='J'
alter obj51, chain='K'
alter obj52, chain='L'
alter obj53, chain='M'
alter obj54, chain='N'
alter obj55, chain='O'
alter obj56, chain='P'
alter obj57, chain='Q'
alter obj58, chain='R'
alter obj59, chain='S'
alter obj60, chain='T'
#
alter obj01, segi='A'
alter obj02, segi='A'
alter obj03, segi='A'
alter obj04, segi='A'
alter obj05, segi='A'
alter obj06, segi='A'
alter obj07, segi='A'
alter obj08, segi='A'
alter obj09, segi='A'
alter obj10, segi='A'
alter obj11, segi='A'
alter obj12, segi='A'
alter obj13, segi='A'
alter obj14, segi='A'
alter obj15, segi='A'
alter obj16, segi='A'
alter obj17, segi='A'
alter obj18, segi='A'
alter obj19, segi='A'
alter obj20, segi='A'
#
#
alter obj21, segi='B'
alter obj22, segi='B'
alter obj23, segi='B'
alter obj24, segi='B'
alter obj25, segi='B'
alter obj26, segi='B'
alter obj27, segi='B'
alter obj28, segi='B'
alter obj29, segi='B'
alter obj30, segi='B'
alter obj31, segi='B'
alter obj32, segi='B'
alter obj33, segi='B'
alter obj34, segi='B'
alter obj35, segi='B'
alter obj36, segi='B'
alter obj37, segi='B'
alter obj38, segi='B'
alter obj39, segi='B'
alter obj40, segi='B'
#
alter obj41, segi='C'
alter obj42, segi='C'
alter obj43, segi='C'
alter obj44, segi='C'
alter obj45, segi='C'
alter obj46, segi='C'
alter obj47, segi='C'
alter obj48, segi='C'
alter obj49, segi='C'
alter obj50, segi='C'
alter obj51, segi='C'
alter obj52, segi='C'
alter obj53, segi='C'
alter obj54, segi='C'
alter obj55, segi='C'
alter obj56, segi='C'
alter obj57, segi='C'
alter obj58, segi='C'
alter obj59, segi='C'
alter obj60, segi='C'