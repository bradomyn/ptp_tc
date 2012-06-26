
wrc.elf:     file format elf32-lm32


Disassembly of section .boot:

00000000 <_reset_handler>:
   0:	98 00 00 00 	xor r0,r0,r0
   4:	d0 00 00 00 	wcsr IE,r0
   8:	d0 20 00 00 	wcsr IM,r0
   c:	78 01 00 00 	mvhi r1,0x0
  10:	38 21 00 00 	ori r1,r1,0x0
  14:	d0 e1 00 00 	wcsr EBA,r1
  18:	f8 00 00 3a 	calli 100 <_crt0>
  1c:	34 00 00 00 	nop
	...

000000c0 <_interrupt_handler>:
  c0:	5b 9d 00 00 	sw (sp+0),ra
  c4:	f8 00 00 20 	calli 144 <_save_all>
  c8:	34 01 00 02 	mvi r1,2
  cc:	f8 00 08 a8 	calli 236c <_irq_entry>
  d0:	e0 00 00 30 	bi 190 <_restore_all_and_return>
  d4:	34 00 00 00 	nop
  d8:	34 00 00 00 	nop
  dc:	34 00 00 00 	nop
	...

00000100 <_crt0>:
 100:	98 00 00 00 	xor r0,r0,r0
 104:	78 1c 00 01 	mvhi sp,0x1
 108:	3b 9c 7f fc 	ori sp,sp,0x7ffc
 10c:	78 1a 00 01 	mvhi gp,0x1
 110:	3b 5a d9 20 	ori gp,gp,0xd920
 114:	78 01 00 01 	mvhi r1,0x1
 118:	38 21 59 30 	ori r1,r1,0x5930
 11c:	34 02 00 00 	mvi r2,0
 120:	78 03 00 01 	mvhi r3,0x1
 124:	38 63 7d a0 	ori r3,r3,0x7da0
 128:	c8 61 18 00 	sub r3,r3,r1
 12c:	f8 00 49 de 	calli 128a4 <memset>
 130:	34 01 00 00 	mvi r1,0
 134:	34 02 00 00 	mvi r2,0
 138:	34 03 00 00 	mvi r3,0
 13c:	f8 00 02 e1 	calli cc0 <main>

00000140 <loopf>:
 140:	e0 00 00 00 	bi 140 <loopf>

00000144 <_save_all>:
 144:	37 9c ff c4 	addi sp,sp,-60
 148:	5b 81 00 04 	sw (sp+4),r1
 14c:	5b 82 00 08 	sw (sp+8),r2
 150:	5b 83 00 0c 	sw (sp+12),r3
 154:	5b 84 00 10 	sw (sp+16),r4
 158:	5b 85 00 14 	sw (sp+20),r5
 15c:	5b 86 00 18 	sw (sp+24),r6
 160:	5b 87 00 1c 	sw (sp+28),r7
 164:	5b 88 00 20 	sw (sp+32),r8
 168:	5b 89 00 24 	sw (sp+36),r9
 16c:	5b 8a 00 28 	sw (sp+40),r10
 170:	5b 9e 00 34 	sw (sp+52),ea
 174:	5b 9f 00 38 	sw (sp+56),ba
 178:	2b 81 00 3c 	lw r1,(sp+60)
 17c:	5b 81 00 30 	sw (sp+48),r1
 180:	bb 80 08 00 	mv r1,sp
 184:	34 21 00 3c 	addi r1,r1,60
 188:	5b 81 00 2c 	sw (sp+44),r1
 18c:	c3 a0 00 00 	ret

00000190 <_restore_all_and_return>:
 190:	2b 81 00 04 	lw r1,(sp+4)
 194:	2b 82 00 08 	lw r2,(sp+8)
 198:	2b 83 00 0c 	lw r3,(sp+12)
 19c:	2b 84 00 10 	lw r4,(sp+16)
 1a0:	2b 85 00 14 	lw r5,(sp+20)
 1a4:	2b 86 00 18 	lw r6,(sp+24)
 1a8:	2b 87 00 1c 	lw r7,(sp+28)
 1ac:	2b 88 00 20 	lw r8,(sp+32)
 1b0:	2b 89 00 24 	lw r9,(sp+36)
 1b4:	2b 8a 00 28 	lw r10,(sp+40)
 1b8:	2b 9d 00 30 	lw ra,(sp+48)
 1bc:	2b 9e 00 34 	lw ea,(sp+52)
 1c0:	2b 9f 00 38 	lw ba,(sp+56)
 1c4:	2b 9c 00 2c 	lw sp,(sp+44)
 1c8:	34 00 00 00 	nop
 1cc:	c3 c0 00 00 	eret
	...

00000200 <_debug_unit>:
 200:	3b a0 00 00 	ori r0,ra,0x0
 204:	f8 00 00 01 	calli 208 <_find0>

00000208 <_find0>:
 208:	37 bd 03 e4 	addi ra,ra,996
 20c:	5b ba 00 68 	sw (ra+104),gp
 210:	3b ba 00 00 	ori gp,ra,0x0
 214:	f8 00 00 46 	calli 32c <save_all>

00000218 <_eid_offset>:
 218:	f8 00 00 d1 	calli 55c <handle_debug_trap>
 21c:	e0 00 00 3d 	bi 310 <_e_restore_and_return>

00000220 <_breakpoint_handler>:
 220:	3b a0 00 00 	ori r0,ra,0x0
 224:	f8 00 00 01 	calli 228 <_find1>

00000228 <_find1>:
 228:	37 bd 03 c4 	addi ra,ra,964
 22c:	5b ba 00 68 	sw (ra+104),gp
 230:	3b ba 00 00 	ori gp,ra,0x0
 234:	f8 00 00 3e 	calli 32c <save_all>
 238:	f8 00 00 c9 	calli 55c <handle_debug_trap>
 23c:	e0 00 00 31 	bi 300 <_b_restore_and_return>

00000240 <_instruction_bus_error_handler>:
 240:	3b a0 00 00 	ori r0,ra,0x0
 244:	f8 00 00 01 	calli 248 <_find2>

00000248 <_find2>:
 248:	37 bd 03 a4 	addi ra,ra,932
 24c:	5b ba 00 68 	sw (ra+104),gp
 250:	3b ba 00 00 	ori gp,ra,0x0
 254:	f8 00 00 36 	calli 32c <save_all>
 258:	f8 00 00 c1 	calli 55c <handle_debug_trap>
 25c:	e0 00 00 2d 	bi 310 <_e_restore_and_return>

00000260 <_watchpoint_handler>:
 260:	3b a0 00 00 	ori r0,ra,0x0
 264:	f8 00 00 01 	calli 268 <_find3>

00000268 <_find3>:
 268:	37 bd 03 84 	addi ra,ra,900
 26c:	5b ba 00 68 	sw (ra+104),gp
 270:	3b ba 00 00 	ori gp,ra,0x0
 274:	f8 00 00 2e 	calli 32c <save_all>
 278:	f8 00 00 b9 	calli 55c <handle_debug_trap>
 27c:	e0 00 00 21 	bi 300 <_b_restore_and_return>

00000280 <_data_bus_error_handler>:
 280:	3b a0 00 00 	ori r0,ra,0x0
 284:	f8 00 00 01 	calli 288 <_find4>

00000288 <_find4>:
 288:	37 bd 03 64 	addi ra,ra,868
 28c:	5b ba 00 68 	sw (ra+104),gp
 290:	3b ba 00 00 	ori gp,ra,0x0
 294:	f8 00 00 26 	calli 32c <save_all>
 298:	f8 00 00 b1 	calli 55c <handle_debug_trap>
 29c:	e0 00 00 1d 	bi 310 <_e_restore_and_return>

000002a0 <_divide_by_zero_handler>:
 2a0:	3b a0 00 00 	ori r0,ra,0x0
 2a4:	f8 00 00 01 	calli 2a8 <_find5>

000002a8 <_find5>:
 2a8:	37 bd 03 44 	addi ra,ra,836
 2ac:	5b ba 00 68 	sw (ra+104),gp
 2b0:	3b ba 00 00 	ori gp,ra,0x0
 2b4:	f8 00 00 1e 	calli 32c <save_all>
 2b8:	f8 00 00 a9 	calli 55c <handle_debug_trap>
 2bc:	e0 00 00 15 	bi 310 <_e_restore_and_return>

000002c0 <_interrupt_handler>:
 2c0:	3b a0 00 00 	ori r0,ra,0x0
 2c4:	f8 00 00 01 	calli 2c8 <_find6>

000002c8 <_find6>:
 2c8:	37 bd 03 24 	addi ra,ra,804
 2cc:	5b ba 00 68 	sw (ra+104),gp
 2d0:	3b ba 00 00 	ori gp,ra,0x0
 2d4:	f8 00 00 16 	calli 32c <save_all>
 2d8:	f8 00 00 a1 	calli 55c <handle_debug_trap>
 2dc:	e0 00 00 0d 	bi 310 <_e_restore_and_return>

000002e0 <_system_call_handler>:
 2e0:	3b a0 00 00 	ori r0,ra,0x0
 2e4:	f8 00 00 01 	calli 2e8 <_find7>

000002e8 <_find7>:
 2e8:	37 bd 03 04 	addi ra,ra,772
 2ec:	5b ba 00 68 	sw (ra+104),gp
 2f0:	3b ba 00 00 	ori gp,ra,0x0
 2f4:	f8 00 00 0e 	calli 32c <save_all>
 2f8:	f8 00 00 99 	calli 55c <handle_debug_trap>
 2fc:	e0 00 00 05 	bi 310 <_e_restore_and_return>

00000300 <_b_restore_and_return>:
 300:	f8 00 00 3c 	calli 3f0 <restore_gp>
 304:	2b 5d 00 74 	lw ra,116
 308:	2b 5a 00 68 	lw gp,104
 30c:	c3 e0 00 00 	bret

00000310 <_e_restore_and_return>:
 310:	f8 00 00 38 	calli 3f0 <restore_gp>
 314:	2b 5f 00 84 	lw ba,132
 318:	90 e0 e8 00 	rcsr ra,EBA
 31c:	b7 fd f8 00 	add ba,ba,ra
 320:	2b 5d 00 74 	lw ra,116
 324:	2b 5a 00 68 	lw gp,104
 328:	c3 e0 00 00 	bret

0000032c <save_all>:
 32c:	5b 41 00 04 	sw 4,r1
 330:	5b 42 00 08 	sw 8,r2
 334:	5b 43 00 0c 	sw 12,r3
 338:	5b 44 00 10 	sw 16,r4
 33c:	5b 45 00 14 	sw 20,r5
 340:	5b 46 00 18 	sw 24,r6
 344:	5b 47 00 1c 	sw 28,r7
 348:	5b 48 00 20 	sw 32,r8
 34c:	5b 49 00 24 	sw 36,r9
 350:	5b 4a 00 28 	sw 40,r10
 354:	5b 4b 00 2c 	sw 44,r11
 358:	5b 4c 00 30 	sw 48,r12
 35c:	5b 4d 00 34 	sw 52,r13
 360:	5b 4e 00 38 	sw 56,r14
 364:	5b 4f 00 3c 	sw 60,r15
 368:	5b 50 00 40 	sw 64,r16
 36c:	5b 51 00 44 	sw 68,r17
 370:	5b 52 00 48 	sw 72,r18
 374:	5b 53 00 4c 	sw 76,r19
 378:	5b 54 00 50 	sw 80,r20
 37c:	5b 55 00 54 	sw 84,r21
 380:	5b 56 00 58 	sw 88,r22
 384:	5b 57 00 5c 	sw 92,r23
 388:	5b 58 00 60 	sw 96,r24
 38c:	5b 59 00 64 	sw 100,r25
 390:	5b 5b 00 6c 	sw 108,fp
 394:	5b 5c 00 70 	sw 112,sp
 398:	5b 40 00 74 	sw 116,r0
 39c:	5b 5e 00 78 	sw 120,ea
 3a0:	5b 5f 00 7c 	sw 124,ba
 3a4:	cb ba 08 00 	sub r1,ra,gp
 3a8:	34 21 03 d4 	addi r1,r1,980
 3ac:	5b 41 00 84 	sw 132,r1
 3b0:	90 e0 08 00 	rcsr r1,EBA
 3b4:	5b 41 00 88 	sw 136,r1
 3b8:	91 20 08 00 	rcsr r1,DEBA
 3bc:	5b 41 00 8c 	sw 140,r1
 3c0:	90 00 08 00 	rcsr r1,IE
 3c4:	5b 41 00 90 	sw 144,r1
 3c8:	90 20 08 00 	rcsr r1,IM
 3cc:	5b 41 00 94 	sw 148,r1
 3d0:	90 40 08 00 	rcsr r1,IP
 3d4:	5b 41 00 98 	sw 152,r1
 3d8:	90 a0 08 00 	rcsr r1,CC
 3dc:	5b 41 00 9c 	sw 156,r1
 3e0:	90 c0 08 00 	rcsr r1,CFG
 3e4:	5b 41 00 a0 	sw 160,r1
 3e8:	98 00 00 00 	xor r0,r0,r0
 3ec:	c3 a0 00 00 	ret

000003f0 <restore_gp>:
 3f0:	2b 41 00 88 	lw r1,136
 3f4:	d0 e1 00 00 	wcsr EBA,r1
 3f8:	2b 41 00 8c 	lw r1,140
 3fc:	d1 21 00 00 	wcsr DEBA,r1
 400:	2b 41 00 90 	lw r1,144
 404:	d0 01 00 00 	wcsr IE,r1
 408:	2b 41 00 94 	lw r1,148
 40c:	d0 21 00 00 	wcsr IM,r1
 410:	2b 41 00 a4 	lw r1,164
 414:	d1 01 00 00 	wcsr DC,r1
 418:	2b 41 00 a8 	lw r1,168
 41c:	d2 01 00 00 	wcsr BP0,r1
 420:	2b 41 00 ac 	lw r1,172
 424:	d2 21 00 00 	wcsr BP1,r1
 428:	2b 41 00 b0 	lw r1,176
 42c:	d2 41 00 00 	wcsr BP2,r1
 430:	2b 41 00 b4 	lw r1,180
 434:	d2 61 00 00 	wcsr BP3,r1
 438:	2b 41 00 b8 	lw r1,184
 43c:	d3 01 00 00 	wcsr WP0,r1
 440:	2b 41 00 bc 	lw r1,188
 444:	d3 21 00 00 	wcsr WP1,r1
 448:	2b 41 00 c0 	lw r1,192
 44c:	d3 41 00 00 	wcsr WP2,r1
 450:	2b 41 00 c4 	lw r1,196
 454:	d3 61 00 00 	wcsr WP3,r1
 458:	2b 41 00 04 	lw r1,4
 45c:	2b 42 00 08 	lw r2,8
 460:	2b 43 00 0c 	lw r3,12
 464:	2b 44 00 10 	lw r4,16
 468:	2b 45 00 14 	lw r5,20
 46c:	2b 46 00 18 	lw r6,24
 470:	2b 47 00 1c 	lw r7,28
 474:	2b 48 00 20 	lw r8,32
 478:	2b 49 00 24 	lw r9,36
 47c:	2b 4a 00 28 	lw r10,40
 480:	2b 4b 00 2c 	lw r11,44
 484:	2b 4c 00 30 	lw r12,48
 488:	2b 4d 00 34 	lw r13,52
 48c:	2b 4e 00 38 	lw r14,56
 490:	2b 4f 00 3c 	lw r15,60
 494:	2b 50 00 40 	lw r16,64
 498:	2b 51 00 44 	lw r17,68
 49c:	2b 52 00 48 	lw r18,72
 4a0:	2b 53 00 4c 	lw r19,76
 4a4:	2b 54 00 50 	lw r20,80
 4a8:	2b 55 00 54 	lw r21,84
 4ac:	2b 56 00 58 	lw r22,88
 4b0:	2b 57 00 5c 	lw r23,92
 4b4:	2b 58 00 60 	lw r24,96
 4b8:	2b 59 00 64 	lw r25,100
 4bc:	2b 5b 00 6c 	lw fp,108
 4c0:	2b 5c 00 70 	lw sp,112
 4c4:	2b 5e 00 78 	lw ea,120
 4c8:	2b 5f 00 7c 	lw ba,124
 4cc:	c3 a0 00 00 	ret

000004d0 <jtag_get_byte>:
 4d0:	91 e0 10 00 	rcsr r2,JRX
 4d4:	20 41 01 00 	andi r1,r2,0x100
 4d8:	44 20 ff fe 	be r1,r0,4d0 <jtag_get_byte>
 4dc:	d1 e0 00 00 	wcsr JRX,r0
 4e0:	20 41 00 ff 	andi r1,r2,0xff
 4e4:	c3 a0 00 00 	ret

000004e8 <jtag_get_word>:
 4e8:	3b bb 00 00 	ori fp,ra,0x0
 4ec:	fb ff ff f9 	calli 4d0 <jtag_get_byte>
 4f0:	33 41 00 c8 	sb 200,r1
 4f4:	fb ff ff f7 	calli 4d0 <jtag_get_byte>
 4f8:	33 41 00 c9 	sb 201,r1
 4fc:	fb ff ff f5 	calli 4d0 <jtag_get_byte>
 500:	33 41 00 ca 	sb 202,r1
 504:	fb ff ff f3 	calli 4d0 <jtag_get_byte>
 508:	33 41 00 cb 	sb 203,r1
 50c:	2b 41 00 c8 	lw r1,200
 510:	3b 7d 00 00 	ori ra,fp,0x0
 514:	c3 a0 00 00 	ret

00000518 <jtag_put_byte>:
 518:	91 c0 10 00 	rcsr r2,JTX
 51c:	5c 40 ff ff 	bne r2,r0,518 <jtag_put_byte>
 520:	20 22 00 ff 	andi r2,r1,0xff
 524:	d1 c2 00 00 	wcsr JTX,r2
 528:	c3 a0 00 00 	ret

0000052c <jtag_put_word>:
 52c:	3b bb 00 00 	ori fp,ra,0x0
 530:	5b 41 00 c8 	sw 200,r1
 534:	43 41 00 c8 	lbu r1,200
 538:	fb ff ff f8 	calli 518 <jtag_put_byte>
 53c:	43 41 00 c9 	lbu r1,201
 540:	fb ff ff f6 	calli 518 <jtag_put_byte>
 544:	43 41 00 ca 	lbu r1,202
 548:	fb ff ff f4 	calli 518 <jtag_put_byte>
 54c:	43 41 00 cb 	lbu r1,203
 550:	fb ff ff f2 	calli 518 <jtag_put_byte>
 554:	3b 7d 00 00 	ori ra,fp,0x0
 558:	c3 a0 00 00 	ret

0000055c <handle_debug_trap>:
 55c:	3b bc 00 00 	ori sp,ra,0x0
 560:	34 01 00 c2 	mvi r1,194
 564:	fb ff ff ed 	calli 518 <jtag_put_byte>

00000568 <_get_command>:
 568:	fb ff ff da 	calli 4d0 <jtag_get_byte>
 56c:	44 20 00 18 	be r1,r0,5cc <_done_debug_trap>
 570:	20 2a 00 80 	andi r10,r1,0x80
 574:	20 2c 00 7f 	andi r12,r1,0x7f
 578:	45 80 00 12 	be r12,r0,5c0 <_read_registers>
 57c:	fb ff ff db 	calli 4e8 <jtag_get_word>
 580:	b8 20 58 00 	mv r11,r1
 584:	5d 40 00 08 	bne r10,r0,5a4 <_read_mem>

00000588 <_write_mem>:
 588:	45 80 00 06 	be r12,r0,5a0 <_write_end>
 58c:	fb ff ff d1 	calli 4d0 <jtag_get_byte>
 590:	31 61 00 00 	sb (r11+0),r1
 594:	35 6b 00 01 	addi r11,r11,1
 598:	35 8c ff ff 	addi r12,r12,-1
 59c:	e3 ff ff fb 	bi 588 <_write_mem>

000005a0 <_write_end>:
 5a0:	e3 ff ff f2 	bi 568 <_get_command>

000005a4 <_read_mem>:
 5a4:	45 80 00 06 	be r12,r0,5bc <_read_end>
 5a8:	41 61 00 00 	lbu r1,(r11+0)
 5ac:	fb ff ff db 	calli 518 <jtag_put_byte>
 5b0:	35 6b 00 01 	addi r11,r11,1
 5b4:	35 8c ff ff 	addi r12,r12,-1
 5b8:	e3 ff ff fb 	bi 5a4 <_read_mem>

000005bc <_read_end>:
 5bc:	e3 ff ff eb 	bi 568 <_get_command>

000005c0 <_read_registers>:
 5c0:	bb 40 08 00 	mv r1,gp
 5c4:	fb ff ff da 	calli 52c <jtag_put_word>
 5c8:	e3 ff ff e8 	bi 568 <_get_command>

000005cc <_done_debug_trap>:
 5cc:	d0 80 00 00 	wcsr DCC,r0
 5d0:	d0 60 00 00 	wcsr ICC,r0
 5d4:	34 00 00 00 	nop
 5d8:	34 00 00 00 	nop
 5dc:	34 00 00 00 	nop
 5e0:	34 00 00 00 	nop
 5e4:	3b 9d 00 00 	ori ra,sp,0x0
 5e8:	c3 a0 00 00 	ret

000005ec <_r0>:
 5ec:	00 00 00 00 	srui r0,r0,0

000005f0 <_r1>:
 5f0:	00 00 00 00 	srui r0,r0,0

000005f4 <_r2>:
 5f4:	00 00 00 00 	srui r0,r0,0

000005f8 <_r3>:
 5f8:	00 00 00 00 	srui r0,r0,0

000005fc <_r4>:
 5fc:	00 00 00 00 	srui r0,r0,0

00000600 <_r5>:
 600:	00 00 00 00 	srui r0,r0,0

00000604 <_r6>:
 604:	00 00 00 00 	srui r0,r0,0

00000608 <_r7>:
 608:	00 00 00 00 	srui r0,r0,0

0000060c <_r8>:
 60c:	00 00 00 00 	srui r0,r0,0

00000610 <_r9>:
 610:	00 00 00 00 	srui r0,r0,0

00000614 <_r10>:
 614:	00 00 00 00 	srui r0,r0,0

00000618 <_r11>:
 618:	00 00 00 00 	srui r0,r0,0

0000061c <_r12>:
 61c:	00 00 00 00 	srui r0,r0,0

00000620 <_r13>:
 620:	00 00 00 00 	srui r0,r0,0

00000624 <_r14>:
 624:	00 00 00 00 	srui r0,r0,0

00000628 <_r15>:
 628:	00 00 00 00 	srui r0,r0,0

0000062c <_r16>:
 62c:	00 00 00 00 	srui r0,r0,0

00000630 <_r17>:
 630:	00 00 00 00 	srui r0,r0,0

00000634 <_r18>:
 634:	00 00 00 00 	srui r0,r0,0

00000638 <_r19>:
 638:	00 00 00 00 	srui r0,r0,0

0000063c <_r20>:
 63c:	00 00 00 00 	srui r0,r0,0

00000640 <_r21>:
 640:	00 00 00 00 	srui r0,r0,0

00000644 <_r22>:
 644:	00 00 00 00 	srui r0,r0,0

00000648 <_r23>:
 648:	00 00 00 00 	srui r0,r0,0

0000064c <_r24>:
 64c:	00 00 00 00 	srui r0,r0,0

00000650 <_r25>:
 650:	00 00 00 00 	srui r0,r0,0

00000654 <_gp>:
 654:	00 00 00 00 	srui r0,r0,0

00000658 <_fp>:
 658:	00 00 00 00 	srui r0,r0,0

0000065c <_sp>:
 65c:	00 00 00 00 	srui r0,r0,0

00000660 <_ra>:
 660:	00 00 00 00 	srui r0,r0,0

00000664 <_ea>:
 664:	00 00 00 00 	srui r0,r0,0

00000668 <_ba>:
 668:	00 00 00 00 	srui r0,r0,0

0000066c <_pc>:
 66c:	00 00 00 00 	srui r0,r0,0

00000670 <_eid>:
 670:	00 00 00 00 	srui r0,r0,0

00000674 <_eba>:
 674:	00 00 00 00 	srui r0,r0,0

00000678 <_deba>:
 678:	00 00 00 00 	srui r0,r0,0

0000067c <_ie>:
 67c:	00 00 00 00 	srui r0,r0,0

00000680 <_im>:
 680:	00 00 00 00 	srui r0,r0,0

00000684 <_ip>:
 684:	00 00 00 00 	srui r0,r0,0

00000688 <_cc>:
 688:	00 00 00 00 	srui r0,r0,0

0000068c <_cfg>:
 68c:	00 00 00 00 	srui r0,r0,0

00000690 <_dc>:
 690:	00 00 00 00 	srui r0,r0,0

00000694 <_bp0>:
 694:	00 00 00 00 	srui r0,r0,0

00000698 <_bp1>:
 698:	00 00 00 00 	srui r0,r0,0

0000069c <_bp2>:
 69c:	00 00 00 00 	srui r0,r0,0

000006a0 <_bp3>:
 6a0:	00 00 00 00 	srui r0,r0,0

000006a4 <_wp0>:
 6a4:	00 00 00 00 	srui r0,r0,0

000006a8 <_wp1>:
 6a8:	00 00 00 00 	srui r0,r0,0

000006ac <_wp2>:
 6ac:	00 00 00 00 	srui r0,r0,0

000006b0 <_wp3>:
 6b0:	00 00 00 00 	srui r0,r0,0

000006b4 <_scratch>:
	...

Disassembly of section .text:

00000700 <disable_irq>:
     700:	90 00 10 00 	rcsr r2,IE
     704:	34 01 ff fe 	mvi r1,-2
     708:	a0 41 08 00 	and r1,r2,r1
     70c:	d0 01 00 00 	wcsr IE,r1
     710:	90 20 10 00 	rcsr r2,IM
     714:	34 01 ff fe 	mvi r1,-2
     718:	a0 41 08 00 	and r1,r2,r1
     71c:	d0 21 00 00 	wcsr IM,r1
     720:	c3 a0 00 00 	ret

00000724 <enable_irq>:
     724:	90 00 10 00 	rcsr r2,IE
     728:	34 01 ff fe 	mvi r1,-2
     72c:	a0 41 08 00 	and r1,r2,r1
     730:	d0 01 00 00 	wcsr IE,r1
     734:	90 20 10 00 	rcsr r2,IM
     738:	38 42 00 01 	ori r2,r2,0x1
     73c:	d0 22 00 00 	wcsr IM,r2
     740:	38 21 00 01 	ori r1,r1,0x1
     744:	d0 01 00 00 	wcsr IE,r1
     748:	c3 a0 00 00 	ret

0000074c <get_sfp_id>:
     74c:	37 9c ff e0 	addi sp,sp,-32
     750:	5b 8b 00 1c 	sw (sp+28),r11
     754:	5b 8c 00 18 	sw (sp+24),r12
     758:	5b 8d 00 14 	sw (sp+20),r13
     75c:	5b 8e 00 10 	sw (sp+16),r14
     760:	5b 8f 00 0c 	sw (sp+12),r15
     764:	5b 90 00 08 	sw (sp+8),r16
     768:	5b 9d 00 04 	sw (sp+4),ra
     76c:	78 02 00 01 	mvhi r2,0x1
     770:	38 42 2b 04 	ori r2,r2,0x2b04
     774:	b8 20 68 00 	mv r13,r1
     778:	28 41 00 00 	lw r1,(r2+0)
     77c:	28 22 00 04 	lw r2,(r1+4)
     780:	20 42 00 80 	andi r2,r2,0x80
     784:	5c 40 ff fe 	bne r2,r0,77c <get_sfp_id+0x30>
     788:	34 01 00 01 	mvi r1,1
     78c:	f8 00 10 89 	calli 49b0 <mi2c_init>
     790:	34 01 00 01 	mvi r1,1
     794:	f8 00 0f b8 	calli 4674 <mi2c_start>
     798:	34 02 00 a0 	mvi r2,160
     79c:	34 01 00 01 	mvi r1,1
     7a0:	f8 00 0f fd 	calli 4794 <mi2c_put_byte>
     7a4:	34 02 00 00 	mvi r2,0
     7a8:	34 01 00 01 	mvi r1,1
     7ac:	f8 00 0f fa 	calli 4794 <mi2c_put_byte>
     7b0:	34 01 00 01 	mvi r1,1
     7b4:	f8 00 0f c4 	calli 46c4 <mi2c_repeat_start>
     7b8:	34 02 00 a1 	mvi r2,161
     7bc:	34 01 00 01 	mvi r1,1
     7c0:	f8 00 0f f5 	calli 4794 <mi2c_put_byte>
     7c4:	37 8e 00 23 	addi r14,sp,35
     7c8:	b9 c0 10 00 	mv r2,r14
     7cc:	34 03 00 01 	mvi r3,1
     7d0:	34 01 00 01 	mvi r1,1
     7d4:	f8 00 10 2d 	calli 4888 <mi2c_get_byte>
     7d8:	34 01 00 01 	mvi r1,1
     7dc:	f8 00 0f d6 	calli 4734 <mi2c_stop>
     7e0:	34 01 00 01 	mvi r1,1
     7e4:	43 8c 00 23 	lbu r12,(sp+35)
     7e8:	f8 00 0f a3 	calli 4674 <mi2c_start>
     7ec:	34 01 00 01 	mvi r1,1
     7f0:	34 02 00 a1 	mvi r2,161
     7f4:	f8 00 0f e8 	calli 4794 <mi2c_put_byte>
     7f8:	34 0b 00 d9 	mvi r11,217
     7fc:	34 10 00 0f 	mvi r16,15
     800:	34 0f 00 17 	mvi r15,23
     804:	34 01 00 01 	mvi r1,1
     808:	b9 c0 10 00 	mv r2,r14
     80c:	34 03 00 00 	mvi r3,0
     810:	f8 00 10 1e 	calli 4888 <mi2c_get_byte>
     814:	43 81 00 23 	lbu r1,(sp+35)
     818:	b5 81 60 00 	add r12,r12,r1
     81c:	21 8c 00 ff 	andi r12,r12,0xff
     820:	55 70 00 02 	bgu r11,r16,828 <get_sfp_id+0xdc>
     824:	31 a1 ff d9 	sb (r13+-39),r1
     828:	35 6b 00 01 	addi r11,r11,1
     82c:	21 6b 00 ff 	andi r11,r11,0xff
     830:	35 ad 00 01 	addi r13,r13,1
     834:	5d 6f ff f4 	bne r11,r15,804 <get_sfp_id+0xb8>
     838:	37 82 00 23 	addi r2,sp,35
     83c:	34 03 00 01 	mvi r3,1
     840:	34 01 00 01 	mvi r1,1
     844:	f8 00 10 11 	calli 4888 <mi2c_get_byte>
     848:	34 01 00 01 	mvi r1,1
     84c:	f8 00 0f ba 	calli 4734 <mi2c_stop>
     850:	43 81 00 23 	lbu r1,(sp+35)
     854:	fc 2c 60 00 	cmpne r12,r1,r12
     858:	c8 0c 08 00 	sub r1,r0,r12
     85c:	2b 9d 00 04 	lw ra,(sp+4)
     860:	2b 8b 00 1c 	lw r11,(sp+28)
     864:	2b 8c 00 18 	lw r12,(sp+24)
     868:	2b 8d 00 14 	lw r13,(sp+20)
     86c:	2b 8e 00 10 	lw r14,(sp+16)
     870:	2b 8f 00 0c 	lw r15,(sp+12)
     874:	2b 90 00 08 	lw r16,(sp+8)
     878:	37 9c 00 20 	addi sp,sp,32
     87c:	c3 a0 00 00 	ret

00000880 <wrc_debug_printf>:
     880:	37 9c ff e0 	addi sp,sp,-32
     884:	5b 9d 00 04 	sw (sp+4),ra
     888:	5b 83 00 0c 	sw (sp+12),r3
     88c:	78 03 00 01 	mvhi r3,0x1
     890:	5b 82 00 08 	sw (sp+8),r2
     894:	5b 84 00 10 	sw (sp+16),r4
     898:	5b 85 00 14 	sw (sp+20),r5
     89c:	5b 86 00 18 	sw (sp+24),r6
     8a0:	5b 87 00 1c 	sw (sp+28),r7
     8a4:	5b 88 00 20 	sw (sp+32),r8
     8a8:	38 63 59 0c 	ori r3,r3,0x590c
     8ac:	28 64 00 00 	lw r4,(r3+0)
     8b0:	5c 80 00 0a 	bne r4,r0,8d8 <wrc_debug_printf+0x58>
     8b4:	78 03 00 01 	mvhi r3,0x1
     8b8:	38 63 59 38 	ori r3,r3,0x5938
     8bc:	28 63 00 00 	lw r3,(r3+0)
     8c0:	5c 64 00 03 	bne r3,r4,8cc <wrc_debug_printf+0x4c>
     8c4:	20 21 00 20 	andi r1,r1,0x20
     8c8:	44 23 00 04 	be r1,r3,8d8 <wrc_debug_printf+0x58>
     8cc:	b8 40 08 00 	mv r1,r2
     8d0:	37 82 00 0c 	addi r2,sp,12
     8d4:	f8 00 0c f5 	calli 3ca8 <vprintf>
     8d8:	2b 9d 00 04 	lw ra,(sp+4)
     8dc:	37 9c 00 20 	addi sp,sp,32
     8e0:	c3 a0 00 00 	ret

000008e4 <wrc_check_link>:
     8e4:	37 9c ff f8 	addi sp,sp,-8
     8e8:	5b 8b 00 08 	sw (sp+8),r11
     8ec:	5b 9d 00 04 	sw (sp+4),ra
     8f0:	34 01 00 00 	mvi r1,0
     8f4:	f8 00 01 e0 	calli 1074 <ep_link_up>
     8f8:	b8 20 58 00 	mv r11,r1
     8fc:	78 01 00 01 	mvhi r1,0x1
     900:	38 21 59 14 	ori r1,r1,0x5914
     904:	28 24 00 00 	lw r4,(r1+0)
     908:	7d 61 00 00 	cmpnei r1,r11,0
     90c:	64 82 00 00 	cmpei r2,r4,0
     910:	a0 22 10 00 	and r2,r1,r2
     914:	44 40 00 10 	be r2,r0,954 <wrc_check_link+0x70>
     918:	78 01 00 01 	mvhi r1,0x1
     91c:	38 21 59 38 	ori r1,r1,0x5938
     920:	28 21 00 00 	lw r1,(r1+0)
     924:	44 20 00 05 	be r1,r0,938 <wrc_check_link+0x54>
     928:	78 02 00 01 	mvhi r2,0x1
     92c:	34 01 00 00 	mvi r1,0
     930:	38 42 2b 08 	ori r2,r2,0x2b08
     934:	fb ff ff d3 	calli 880 <wrc_debug_printf>
     938:	78 03 00 01 	mvhi r3,0x1
     93c:	38 63 2b 04 	ori r3,r3,0x2b04
     940:	28 61 00 00 	lw r1,(r3+0)
     944:	34 02 00 02 	mvi r2,2
     948:	58 22 00 04 	sw (r1+4),r2
     94c:	34 01 00 01 	mvi r1,1
     950:	e0 00 00 16 	bi 9a8 <wrc_check_link+0xc4>
     954:	7c 84 00 00 	cmpnei r4,r4,0
     958:	65 63 00 00 	cmpei r3,r11,0
     95c:	a0 64 18 00 	and r3,r3,r4
     960:	fc 23 08 00 	cmpne r1,r1,r3
     964:	34 04 00 04 	mvi r4,4
     968:	c8 81 08 00 	sub r1,r4,r1
     96c:	44 62 00 0f 	be r3,r2,9a8 <wrc_check_link+0xc4>
     970:	78 01 00 01 	mvhi r1,0x1
     974:	38 21 59 38 	ori r1,r1,0x5938
     978:	28 21 00 00 	lw r1,(r1+0)
     97c:	44 20 00 05 	be r1,r0,990 <wrc_check_link+0xac>
     980:	78 02 00 01 	mvhi r2,0x1
     984:	34 01 00 00 	mvi r1,0
     988:	38 42 2b 14 	ori r2,r2,0x2b14
     98c:	fb ff ff bd 	calli 880 <wrc_debug_printf>
     990:	78 03 00 01 	mvhi r3,0x1
     994:	38 63 2b 04 	ori r3,r3,0x2b04
     998:	28 61 00 00 	lw r1,(r3+0)
     99c:	34 02 00 02 	mvi r2,2
     9a0:	58 22 00 08 	sw (r1+8),r2
     9a4:	34 01 00 02 	mvi r1,2
     9a8:	78 02 00 01 	mvhi r2,0x1
     9ac:	38 42 59 14 	ori r2,r2,0x5914
     9b0:	58 4b 00 00 	sw (r2+0),r11
     9b4:	2b 9d 00 04 	lw ra,(sp+4)
     9b8:	2b 8b 00 08 	lw r11,(sp+8)
     9bc:	37 9c 00 08 	addi sp,sp,8
     9c0:	c3 a0 00 00 	ret

000009c4 <wrc_initialize>:
     9c4:	37 9c ff c0 	addi sp,sp,-64
     9c8:	5b 8b 00 18 	sw (sp+24),r11
     9cc:	5b 8c 00 14 	sw (sp+20),r12
     9d0:	5b 8d 00 10 	sw (sp+16),r13
     9d4:	5b 9d 00 0c 	sw (sp+12),ra
     9d8:	5b 80 00 30 	sw (sp+48),r0
     9dc:	5b 80 00 34 	sw (sp+52),r0
     9e0:	f8 00 00 e8 	calli d80 <uart_init>
     9e4:	34 01 00 01 	mvi r1,1
     9e8:	f8 00 04 14 	calli 1a38 <timer_init>
     9ec:	78 01 00 01 	mvhi r1,0x1
     9f0:	38 21 2b 20 	ori r1,r1,0x2b20
     9f4:	f8 00 00 ff 	calli df0 <uart_write_string>
     9f8:	78 01 00 01 	mvhi r1,0x1
     9fc:	38 21 2b 58 	ori r1,r1,0x2b58
     a00:	f8 00 0d 22 	calli 3e88 <mprintf>
     a04:	37 8b 00 1c 	addi r11,sp,28
     a08:	b9 60 08 00 	mv r1,r11
     a0c:	fb ff ff 50 	calli 74c <get_sfp_id>
     a10:	48 01 00 1e 	bg r0,r1,a88 <wrc_initialize+0xc4>
     a14:	78 0c 00 01 	mvhi r12,0x1
     a18:	37 8d 00 2c 	addi r13,sp,44
     a1c:	39 8c 2b b0 	ori r12,r12,0x2bb0
     a20:	41 62 00 00 	lbu r2,(r11+0)
     a24:	b9 80 08 00 	mv r1,r12
     a28:	35 6b 00 01 	addi r11,r11,1
     a2c:	f8 00 0d 17 	calli 3e88 <mprintf>
     a30:	5d 6d ff fc 	bne r11,r13,a20 <wrc_initialize+0x5c>
     a34:	78 01 00 01 	mvhi r1,0x1
     a38:	38 21 31 b4 	ori r1,r1,0x31b4
     a3c:	78 0d 00 01 	mvhi r13,0x1
     a40:	78 0c 00 01 	mvhi r12,0x1
     a44:	78 0b 00 01 	mvhi r11,0x1
     a48:	f8 00 0d 10 	calli 3e88 <mprintf>
     a4c:	39 ad 59 04 	ori r13,r13,0x5904
     a50:	39 8c 59 30 	ori r12,r12,0x5930
     a54:	39 6b 59 34 	ori r11,r11,0x5934
     a58:	37 81 00 1c 	addi r1,sp,28
     a5c:	b9 a0 10 00 	mv r2,r13
     a60:	b9 80 18 00 	mv r3,r12
     a64:	b9 60 20 00 	mv r4,r11
     a68:	f8 00 13 2e 	calli 5720 <access_eeprom>
     a6c:	5c 20 00 07 	bne r1,r0,a88 <wrc_initialize+0xc4>
     a70:	29 a2 00 00 	lw r2,(r13+0)
     a74:	29 83 00 00 	lw r3,(r12+0)
     a78:	29 64 00 00 	lw r4,(r11+0)
     a7c:	78 01 00 01 	mvhi r1,0x1
     a80:	38 21 2b b4 	ori r1,r1,0x2bb4
     a84:	f8 00 0d 01 	calli 3e88 <mprintf>
     a88:	f8 00 11 3e 	calli 4f80 <ow_init>
     a8c:	37 81 00 30 	addi r1,sp,48
     a90:	f8 00 11 d1 	calli 51d4 <ds18x_read_serial>
     a94:	5c 20 00 12 	bne r1,r0,adc <wrc_initialize+0x118>
     a98:	78 02 00 01 	mvhi r2,0x1
     a9c:	38 42 59 38 	ori r2,r2,0x5938
     aa0:	28 42 00 00 	lw r2,(r2+0)
     aa4:	44 41 00 0e 	be r2,r1,adc <wrc_initialize+0x118>
     aa8:	43 82 00 31 	lbu r2,(sp+49)
     aac:	43 83 00 37 	lbu r3,(sp+55)
     ab0:	43 84 00 36 	lbu r4,(sp+54)
     ab4:	5b 82 00 04 	sw (sp+4),r2
     ab8:	43 82 00 30 	lbu r2,(sp+48)
     abc:	43 85 00 35 	lbu r5,(sp+53)
     ac0:	43 86 00 34 	lbu r6,(sp+52)
     ac4:	43 87 00 33 	lbu r7,(sp+51)
     ac8:	43 88 00 32 	lbu r8,(sp+50)
     acc:	5b 82 00 08 	sw (sp+8),r2
     ad0:	78 02 00 01 	mvhi r2,0x1
     ad4:	38 42 2b dc 	ori r2,r2,0x2bdc
     ad8:	fb ff ff 6a 	calli 880 <wrc_debug_printf>
     adc:	34 01 00 08 	mvi r1,8
     ae0:	33 81 00 38 	sb (sp+56),r1
     ae4:	34 01 00 30 	mvi r1,48
     ae8:	33 81 00 3a 	sb (sp+58),r1
     aec:	78 01 00 01 	mvhi r1,0x1
     af0:	43 86 00 33 	lbu r6,(sp+51)
     af4:	43 87 00 32 	lbu r7,(sp+50)
     af8:	43 88 00 31 	lbu r8,(sp+49)
     afc:	38 21 59 38 	ori r1,r1,0x5938
     b00:	28 21 00 00 	lw r1,(r1+0)
     b04:	33 80 00 39 	sb (sp+57),r0
     b08:	33 86 00 3b 	sb (sp+59),r6
     b0c:	33 87 00 3c 	sb (sp+60),r7
     b10:	33 88 00 3d 	sb (sp+61),r8
     b14:	44 20 00 08 	be r1,r0,b34 <wrc_initialize+0x170>
     b18:	78 02 00 01 	mvhi r2,0x1
     b1c:	34 01 00 00 	mvi r1,0
     b20:	38 42 2c 0c 	ori r2,r2,0x2c0c
     b24:	34 03 00 08 	mvi r3,8
     b28:	34 04 00 00 	mvi r4,0
     b2c:	34 05 00 30 	mvi r5,48
     b30:	fb ff ff 54 	calli 880 <wrc_debug_printf>
     b34:	37 81 00 38 	addi r1,sp,56
     b38:	f8 00 00 f8 	calli f18 <ep_init>
     b3c:	34 02 00 01 	mvi r2,1
     b40:	34 01 00 01 	mvi r1,1
     b44:	f8 00 01 19 	calli fa8 <ep_enable>
     b48:	f8 00 01 d9 	calli 12ac <minic_init>
     b4c:	78 0c 00 01 	mvhi r12,0x1
     b50:	f8 00 03 3f 	calli 184c <pps_gen_init>
     b54:	78 0d 00 01 	mvhi r13,0x1
     b58:	f8 00 1a d0 	calli 7698 <netStartup>
     b5c:	39 8c 58 64 	ori r12,r12,0x5864
     b60:	39 ad 59 48 	ori r13,r13,0x5948
     b64:	37 83 00 40 	addi r3,sp,64
     b68:	b9 80 20 00 	mv r4,r12
     b6c:	b9 a0 28 00 	mv r5,r13
     b70:	34 02 00 00 	mvi r2,0
     b74:	34 01 00 00 	mvi r1,0
     b78:	78 0b 00 01 	mvhi r11,0x1
     b7c:	f8 00 3b 96 	calli f9d4 <ptpdStartup>
     b80:	39 6b 59 40 	ori r11,r11,0x5940
     b84:	b9 a0 10 00 	mv r2,r13
     b88:	59 61 00 00 	sw (r11+0),r1
     b8c:	b9 80 08 00 	mv r1,r12
     b90:	f8 00 14 96 	calli 5de8 <initDataClock>
     b94:	b9 80 08 00 	mv r1,r12
     b98:	f8 00 3b b6 	calli fa70 <displayConfigINFO>
     b9c:	29 63 00 00 	lw r3,(r11+0)
     ba0:	b9 80 10 00 	mv r2,r12
     ba4:	34 61 00 04 	addi r1,r3,4
     ba8:	f8 00 1a c3 	calli 76b4 <netInit>
     bac:	44 20 00 03 	be r1,r0,bb8 <wrc_initialize+0x1f4>
     bb0:	29 61 00 00 	lw r1,(r11+0)
     bb4:	58 20 0f 00 	sw (r1+3840),r0
     bb8:	2b 9d 00 0c 	lw ra,(sp+12)
     bbc:	2b 8b 00 18 	lw r11,(sp+24)
     bc0:	2b 8c 00 14 	lw r12,(sp+20)
     bc4:	2b 8d 00 10 	lw r13,(sp+16)
     bc8:	37 9c 00 40 	addi sp,sp,64
     bcc:	c3 a0 00 00 	ret

00000bd0 <wrc_handle_input>:
     bd0:	37 9c ff fc 	addi sp,sp,-4
     bd4:	5b 9d 00 04 	sw (sp+4),ra
     bd8:	f8 00 00 93 	calli e24 <uart_poll>
     bdc:	44 20 00 36 	be r1,r0,cb4 <wrc_handle_input+0xe4>
     be0:	f8 00 00 97 	calli e3c <uart_read_byte>
     be4:	34 02 00 64 	mvi r2,100
     be8:	44 22 00 19 	be r1,r2,c4c <wrc_handle_input+0x7c>
     bec:	48 22 00 06 	bg r1,r2,c04 <wrc_handle_input+0x34>
     bf0:	34 02 00 2b 	mvi r2,43
     bf4:	44 22 00 25 	be r1,r2,c88 <wrc_handle_input+0xb8>
     bf8:	34 02 00 2d 	mvi r2,45
     bfc:	5c 22 00 2e 	bne r1,r2,cb4 <wrc_handle_input+0xe4>
     c00:	e0 00 00 22 	bi c88 <wrc_handle_input+0xb8>
     c04:	34 02 00 67 	mvi r2,103
     c08:	44 22 00 04 	be r1,r2,c18 <wrc_handle_input+0x48>
     c0c:	34 02 00 74 	mvi r2,116
     c10:	5c 22 00 29 	bne r1,r2,cb4 <wrc_handle_input+0xe4>
     c14:	e0 00 00 15 	bi c68 <wrc_handle_input+0x98>
     c18:	78 01 00 01 	mvhi r1,0x1
     c1c:	38 21 59 0c 	ori r1,r1,0x590c
     c20:	28 23 00 00 	lw r3,(r1+0)
     c24:	34 02 00 01 	mvi r2,1
     c28:	c8 43 10 00 	sub r2,r2,r3
     c2c:	58 22 00 00 	sw (r1+0),r2
     c30:	5c 40 00 21 	bne r2,r0,cb4 <wrc_handle_input+0xe4>
     c34:	f8 00 0c f5 	calli 4008 <m_term_clear>
     c38:	78 02 00 01 	mvhi r2,0x1
     c3c:	34 01 00 00 	mvi r1,0
     c40:	38 42 2c 3c 	ori r2,r2,0x2c3c
     c44:	fb ff ff 0f 	calli 880 <wrc_debug_printf>
     c48:	e0 00 00 1b 	bi cb4 <wrc_handle_input+0xe4>
     c4c:	78 01 00 01 	mvhi r1,0x1
     c50:	38 21 59 38 	ori r1,r1,0x5938
     c54:	28 23 00 00 	lw r3,(r1+0)
     c58:	34 02 00 01 	mvi r2,1
     c5c:	c8 43 10 00 	sub r2,r2,r3
     c60:	58 22 00 00 	sw (r1+0),r2
     c64:	e0 00 00 14 	bi cb4 <wrc_handle_input+0xe4>
     c68:	78 02 00 01 	mvhi r2,0x1
     c6c:	38 42 59 10 	ori r2,r2,0x5910
     c70:	28 43 00 00 	lw r3,(r2+0)
     c74:	34 01 00 01 	mvi r1,1
     c78:	c8 23 08 00 	sub r1,r1,r3
     c7c:	58 41 00 00 	sw (r2+0),r1
     c80:	f8 00 1c 60 	calli 7e00 <wr_servo_enable_tracking>
     c84:	e0 00 00 0c 	bi cb4 <wrc_handle_input+0xe4>
     c88:	78 02 00 01 	mvhi r2,0x1
     c8c:	7c 21 00 2b 	cmpnei r1,r1,43
     c90:	38 42 59 3c 	ori r2,r2,0x593c
     c94:	28 44 00 00 	lw r4,(r2+0)
     c98:	c8 01 08 00 	sub r1,r0,r1
     c9c:	34 03 ff 38 	mvi r3,-200
     ca0:	a0 23 08 00 	and r1,r1,r3
     ca4:	34 21 00 64 	addi r1,r1,100
     ca8:	b4 24 08 00 	add r1,r1,r4
     cac:	58 41 00 00 	sw (r2+0),r1
     cb0:	f8 00 1c cd 	calli 7fe4 <wr_servo_man_adjust_phase>
     cb4:	2b 9d 00 04 	lw ra,(sp+4)
     cb8:	37 9c 00 04 	addi sp,sp,4
     cbc:	c3 a0 00 00 	ret

00000cc0 <main>:
     cc0:	37 9c ff ec 	addi sp,sp,-20
     cc4:	5b 8b 00 14 	sw (sp+20),r11
     cc8:	5b 8c 00 10 	sw (sp+16),r12
     ccc:	5b 8d 00 0c 	sw (sp+12),r13
     cd0:	5b 8e 00 08 	sw (sp+8),r14
     cd4:	5b 9d 00 04 	sw (sp+4),ra
     cd8:	78 01 00 01 	mvhi r1,0x1
     cdc:	78 0b 00 01 	mvhi r11,0x1
     ce0:	38 21 59 38 	ori r1,r1,0x5938
     ce4:	34 02 00 01 	mvi r2,1
     ce8:	39 6b 59 0c 	ori r11,r11,0x590c
     cec:	58 22 00 00 	sw (r1+0),r2
     cf0:	59 60 00 00 	sw (r11+0),r0
     cf4:	fb ff ff 34 	calli 9c4 <wrc_initialize>
     cf8:	34 01 00 03 	mvi r1,3
     cfc:	34 02 00 00 	mvi r2,0
     d00:	34 03 00 01 	mvi r3,1
     d04:	b9 60 68 00 	mv r13,r11
     d08:	78 0c 00 01 	mvhi r12,0x1
     d0c:	78 0b 00 01 	mvhi r11,0x1
     d10:	f8 00 07 4e 	calli 2a48 <spll_init>
     d14:	34 0e 00 02 	mvi r14,2
     d18:	39 8c 58 64 	ori r12,r12,0x5864
     d1c:	39 6b 59 40 	ori r11,r11,0x5940
     d20:	fb ff ff ac 	calli bd0 <wrc_handle_input>
     d24:	29 a1 00 00 	lw r1,(r13+0)
     d28:	44 20 00 03 	be r1,r0,d34 <main+0x74>
     d2c:	f8 00 0f 3d 	calli 4a20 <wrc_mon_gui>
     d30:	e0 00 00 02 	bi d38 <main+0x78>
     d34:	f8 00 10 56 	calli 4e8c <wrc_log_stats>
     d38:	fb ff fe eb 	calli 8e4 <wrc_check_link>
     d3c:	44 2e 00 05 	be r1,r14,d50 <main+0x90>
     d40:	34 02 00 03 	mvi r2,3
     d44:	5c 22 00 07 	bne r1,r2,d60 <main+0xa0>
     d48:	f8 00 3d 6c 	calli 102f8 <update_rx_queues>
     d4c:	e0 00 00 05 	bi d60 <main+0xa0>
     d50:	34 01 00 03 	mvi r1,3
     d54:	34 02 00 00 	mvi r2,0
     d58:	34 03 00 01 	mvi r3,1
     d5c:	f8 00 07 3b 	calli 2a48 <spll_init>
     d60:	29 62 00 00 	lw r2,(r11+0)
     d64:	34 03 00 00 	mvi r3,0
     d68:	b9 80 08 00 	mv r1,r12
     d6c:	f8 00 37 dc 	calli ecdc <singlePortLoop>
     d70:	29 61 00 00 	lw r1,(r11+0)
     d74:	f8 00 38 2f 	calli ee30 <sharedPortsLoop>
     d78:	f8 00 0a 8a 	calli 37a0 <spll_update_aux_clocks>
     d7c:	e3 ff ff e9 	bi d20 <main+0x60>

00000d80 <uart_init>:
     d80:	78 03 00 01 	mvhi r3,0x1
     d84:	38 63 2c 50 	ori r3,r3,0x2c50
     d88:	28 61 00 00 	lw r1,(r3+0)
     d8c:	34 02 03 c6 	mvi r2,966
     d90:	58 22 00 04 	sw (r1+4),r2
     d94:	c3 a0 00 00 	ret

00000d98 <uart_write_byte>:
     d98:	37 9c ff f8 	addi sp,sp,-8
     d9c:	5b 8b 00 08 	sw (sp+8),r11
     da0:	5b 9d 00 04 	sw (sp+4),ra
     da4:	b8 20 58 00 	mv r11,r1
     da8:	34 01 00 0a 	mvi r1,10
     dac:	5d 61 00 03 	bne r11,r1,db8 <uart_write_byte+0x20>
     db0:	34 01 00 0d 	mvi r1,13
     db4:	fb ff ff f9 	calli d98 <uart_write_byte>
     db8:	78 02 00 01 	mvhi r2,0x1
     dbc:	38 42 2c 50 	ori r2,r2,0x2c50
     dc0:	28 41 00 00 	lw r1,(r2+0)
     dc4:	28 22 00 00 	lw r2,(r1+0)
     dc8:	20 42 00 01 	andi r2,r2,0x1
     dcc:	5c 40 ff fe 	bne r2,r0,dc4 <uart_write_byte+0x2c>
     dd0:	78 02 00 01 	mvhi r2,0x1
     dd4:	38 42 2c 50 	ori r2,r2,0x2c50
     dd8:	28 41 00 00 	lw r1,(r2+0)
     ddc:	58 2b 00 08 	sw (r1+8),r11
     de0:	2b 9d 00 04 	lw ra,(sp+4)
     de4:	2b 8b 00 08 	lw r11,(sp+8)
     de8:	37 9c 00 08 	addi sp,sp,8
     dec:	c3 a0 00 00 	ret

00000df0 <uart_write_string>:
     df0:	37 9c ff f8 	addi sp,sp,-8
     df4:	5b 8b 00 08 	sw (sp+8),r11
     df8:	5b 9d 00 04 	sw (sp+4),ra
     dfc:	b8 20 58 00 	mv r11,r1
     e00:	e0 00 00 03 	bi e0c <uart_write_string+0x1c>
     e04:	35 6b 00 01 	addi r11,r11,1
     e08:	fb ff ff e4 	calli d98 <uart_write_byte>
     e0c:	41 61 00 00 	lbu r1,(r11+0)
     e10:	5c 20 ff fd 	bne r1,r0,e04 <uart_write_string+0x14>
     e14:	2b 9d 00 04 	lw ra,(sp+4)
     e18:	2b 8b 00 08 	lw r11,(sp+8)
     e1c:	37 9c 00 08 	addi sp,sp,8
     e20:	c3 a0 00 00 	ret

00000e24 <uart_poll>:
     e24:	78 02 00 01 	mvhi r2,0x1
     e28:	38 42 2c 50 	ori r2,r2,0x2c50
     e2c:	28 41 00 00 	lw r1,(r2+0)
     e30:	28 21 00 00 	lw r1,(r1+0)
     e34:	20 21 00 02 	andi r1,r1,0x2
     e38:	c3 a0 00 00 	ret

00000e3c <uart_read_byte>:
     e3c:	78 02 00 01 	mvhi r2,0x1
     e40:	38 42 2c 50 	ori r2,r2,0x2c50
     e44:	28 41 00 00 	lw r1,(r2+0)
     e48:	28 21 00 0c 	lw r1,(r1+12)
     e4c:	20 21 00 ff 	andi r1,r1,0xff
     e50:	c3 a0 00 00 	ret

00000e54 <pcs_read>:
     e54:	14 21 00 02 	sri r1,r1,2
     e58:	78 03 00 01 	mvhi r3,0x1
     e5c:	20 21 00 ff 	andi r1,r1,0xff
     e60:	38 63 2c 54 	ori r3,r3,0x2c54
     e64:	3c 22 00 10 	sli r2,r1,16
     e68:	28 61 00 00 	lw r1,(r3+0)
     e6c:	58 22 00 2c 	sw (r1+44),r2
     e70:	28 22 00 30 	lw r2,(r1+48)
     e74:	4c 40 ff ff 	bge r2,r0,e70 <pcs_read+0x1c>
     e78:	78 02 00 01 	mvhi r2,0x1
     e7c:	38 42 2c 54 	ori r2,r2,0x2c54
     e80:	28 41 00 00 	lw r1,(r2+0)
     e84:	28 21 00 30 	lw r1,(r1+48)
     e88:	20 21 ff ff 	andi r1,r1,0xffff
     e8c:	c3 a0 00 00 	ret

00000e90 <pcs_write>:
     e90:	14 21 00 02 	sri r1,r1,2
     e94:	78 03 80 00 	mvhi r3,0x8000
     e98:	20 42 ff ff 	andi r2,r2,0xffff
     e9c:	20 21 00 ff 	andi r1,r1,0xff
     ea0:	b8 43 10 00 	or r2,r2,r3
     ea4:	3c 21 00 10 	sli r1,r1,16
     ea8:	78 03 00 01 	mvhi r3,0x1
     eac:	38 63 2c 54 	ori r3,r3,0x2c54
     eb0:	b8 41 10 00 	or r2,r2,r1
     eb4:	28 61 00 00 	lw r1,(r3+0)
     eb8:	58 22 00 2c 	sw (r1+44),r2
     ebc:	28 22 00 30 	lw r2,(r1+48)
     ec0:	4c 40 ff ff 	bge r2,r0,ebc <pcs_write+0x2c>
     ec4:	c3 a0 00 00 	ret

00000ec8 <get_mac_addr>:
     ec8:	78 03 00 01 	mvhi r3,0x1
     ecc:	38 63 2c 54 	ori r3,r3,0x2c54
     ed0:	28 62 00 00 	lw r2,(r3+0)
     ed4:	28 43 00 28 	lw r3,(r2+40)
     ed8:	30 23 00 05 	sb (r1+5),r3
     edc:	28 43 00 28 	lw r3,(r2+40)
     ee0:	00 63 00 08 	srui r3,r3,8
     ee4:	30 23 00 04 	sb (r1+4),r3
     ee8:	28 43 00 28 	lw r3,(r2+40)
     eec:	00 63 00 10 	srui r3,r3,16
     ef0:	30 23 00 03 	sb (r1+3),r3
     ef4:	28 43 00 28 	lw r3,(r2+40)
     ef8:	00 63 00 18 	srui r3,r3,24
     efc:	30 23 00 02 	sb (r1+2),r3
     f00:	28 43 00 24 	lw r3,(r2+36)
     f04:	30 23 00 01 	sb (r1+1),r3
     f08:	28 42 00 24 	lw r2,(r2+36)
     f0c:	00 42 00 08 	srui r2,r2,8
     f10:	30 22 00 00 	sb (r1+0),r2
     f14:	c3 a0 00 00 	ret

00000f18 <ep_init>:
     f18:	40 23 00 02 	lbu r3,(r1+2)
     f1c:	40 22 00 03 	lbu r2,(r1+3)
     f20:	78 04 00 01 	mvhi r4,0x1
     f24:	3c 63 00 18 	sli r3,r3,24
     f28:	3c 42 00 10 	sli r2,r2,16
     f2c:	38 84 2c 54 	ori r4,r4,0x2c54
     f30:	b8 62 18 00 	or r3,r3,r2
     f34:	40 22 00 05 	lbu r2,(r1+5)
     f38:	b8 62 18 00 	or r3,r3,r2
     f3c:	40 22 00 04 	lbu r2,(r1+4)
     f40:	3c 42 00 08 	sli r2,r2,8
     f44:	b8 62 18 00 	or r3,r3,r2
     f48:	28 82 00 00 	lw r2,(r4+0)
     f4c:	78 04 00 01 	mvhi r4,0x1
     f50:	38 84 2c 5c 	ori r4,r4,0x2c5c
     f54:	58 43 00 28 	sw (r2+40),r3
     f58:	40 23 00 01 	lbu r3,(r1+1)
     f5c:	40 21 00 00 	lbu r1,(r1+0)
     f60:	3c 21 00 08 	sli r1,r1,8
     f64:	b8 61 08 00 	or r1,r3,r1
     f68:	78 03 00 01 	mvhi r3,0x1
     f6c:	38 63 2c 58 	ori r3,r3,0x2c58
     f70:	58 41 00 24 	sw (r2+36),r1
     f74:	28 61 00 00 	lw r1,(r3+0)
     f78:	28 83 00 00 	lw r3,(r4+0)
     f7c:	58 20 00 00 	sw (r1+0),r0
     f80:	58 40 00 00 	sw (r2+0),r0
     f84:	34 01 00 03 	mvi r1,3
     f88:	58 41 00 0c 	sw (r2+12),r1
     f8c:	58 43 00 08 	sw (r2+8),r3
     f90:	78 03 00 01 	mvhi r3,0x1
     f94:	38 63 2c 60 	ori r3,r3,0x2c60
     f98:	58 41 00 04 	sw (r2+4),r1
     f9c:	28 61 00 00 	lw r1,(r3+0)
     fa0:	58 41 00 3c 	sw (r2+60),r1
     fa4:	c3 a0 00 00 	ret

00000fa8 <ep_enable>:
     fa8:	37 9c ff f4 	addi sp,sp,-12
     fac:	5b 8b 00 0c 	sw (sp+12),r11
     fb0:	5b 8c 00 08 	sw (sp+8),r12
     fb4:	5b 9d 00 04 	sw (sp+4),ra
     fb8:	b8 40 60 00 	mv r12,r2
     fbc:	5c 20 00 06 	bne r1,r0,fd4 <ep_enable+0x2c>
     fc0:	78 02 00 01 	mvhi r2,0x1
     fc4:	38 42 2c 54 	ori r2,r2,0x2c54
     fc8:	28 41 00 00 	lw r1,(r2+0)
     fcc:	58 20 00 00 	sw (r1+0),r0
     fd0:	e0 00 00 23 	bi 105c <ep_enable+0xb4>
     fd4:	78 01 00 01 	mvhi r1,0x1
     fd8:	38 21 2c 54 	ori r1,r1,0x2c54
     fdc:	28 2b 00 00 	lw r11,(r1+0)
     fe0:	78 01 00 01 	mvhi r1,0x1
     fe4:	38 21 2c 6c 	ori r1,r1,0x2c6c
     fe8:	59 60 00 00 	sw (r11+0),r0
     fec:	29 62 00 34 	lw r2,(r11+52)
     ff0:	f8 00 0b a6 	calli 3e88 <mprintf>
     ff4:	f8 00 0c cb 	calli 4320 <pfilter_init_default>
     ff8:	34 01 00 e0 	mvi r1,224
     ffc:	59 61 00 00 	sw (r11+0),r1
    1000:	78 01 00 01 	mvhi r1,0x1
    1004:	38 21 59 e8 	ori r1,r1,0x59e8
    1008:	34 02 08 00 	mvi r2,2048
    100c:	58 2c 00 00 	sw (r1+0),r12
    1010:	34 01 00 00 	mvi r1,0
    1014:	fb ff ff 9f 	calli e90 <pcs_write>
    1018:	34 01 00 c8 	mvi r1,200
    101c:	f8 00 02 aa 	calli 1ac4 <timer_delay>
    1020:	34 01 00 00 	mvi r1,0
    1024:	38 02 80 00 	mvu r2,0x8000
    1028:	fb ff ff 9a 	calli e90 <pcs_write>
    102c:	34 01 00 00 	mvi r1,0
    1030:	34 02 00 00 	mvi r2,0
    1034:	fb ff ff 97 	calli e90 <pcs_write>
    1038:	34 01 00 10 	mvi r1,16
    103c:	34 02 00 00 	mvi r2,0
    1040:	fb ff ff 94 	calli e90 <pcs_write>
    1044:	7d 82 00 00 	cmpnei r2,r12,0
    1048:	34 01 00 00 	mvi r1,0
    104c:	c8 02 10 00 	sub r2,r0,r2
    1050:	20 42 12 00 	andi r2,r2,0x1200
    1054:	34 42 01 40 	addi r2,r2,320
    1058:	fb ff ff 8e 	calli e90 <pcs_write>
    105c:	34 01 00 00 	mvi r1,0
    1060:	2b 9d 00 04 	lw ra,(sp+4)
    1064:	2b 8b 00 0c 	lw r11,(sp+12)
    1068:	2b 8c 00 08 	lw r12,(sp+8)
    106c:	37 9c 00 0c 	addi sp,sp,12
    1070:	c3 a0 00 00 	ret

00001074 <ep_link_up>:
    1074:	37 9c ff f0 	addi sp,sp,-16
    1078:	5b 8b 00 0c 	sw (sp+12),r11
    107c:	5b 8c 00 08 	sw (sp+8),r12
    1080:	5b 9d 00 04 	sw (sp+4),ra
    1084:	78 02 00 01 	mvhi r2,0x1
    1088:	38 42 59 e8 	ori r2,r2,0x59e8
    108c:	28 4b 00 00 	lw r11,(r2+0)
    1090:	b8 20 60 00 	mv r12,r1
    1094:	34 01 00 04 	mvi r1,4
    1098:	fb ff ff 6f 	calli e54 <pcs_read>
    109c:	7d 6b 00 00 	cmpnei r11,r11,0
    10a0:	0f 81 00 12 	sh (sp+18),r1
    10a4:	34 01 00 04 	mvi r1,4
    10a8:	c8 0b 58 00 	sub r11,r0,r11
    10ac:	fb ff ff 6a 	calli e54 <pcs_read>
    10b0:	21 6b 00 20 	andi r11,r11,0x20
    10b4:	0f 81 00 12 	sh (sp+18),r1
    10b8:	35 6b 00 04 	addi r11,r11,4
    10bc:	45 80 00 04 	be r12,r0,10cc <ep_link_up+0x58>
    10c0:	34 01 00 14 	mvi r1,20
    10c4:	fb ff ff 64 	calli e54 <pcs_read>
    10c8:	0d 81 00 00 	sh (r12+0),r1
    10cc:	2f 81 00 12 	lhu r1,(sp+18)
    10d0:	a1 61 08 00 	and r1,r11,r1
    10d4:	e4 2b 08 00 	cmpe r1,r1,r11
    10d8:	2b 9d 00 04 	lw ra,(sp+4)
    10dc:	2b 8b 00 0c 	lw r11,(sp+12)
    10e0:	2b 8c 00 08 	lw r12,(sp+8)
    10e4:	37 9c 00 10 	addi sp,sp,16
    10e8:	c3 a0 00 00 	ret

000010ec <ep_get_deltas>:
    10ec:	37 9c ff f8 	addi sp,sp,-8
    10f0:	5b 8b 00 08 	sw (sp+8),r11
    10f4:	5b 9d 00 04 	sw (sp+4),ra
    10f8:	b8 40 58 00 	mv r11,r2
    10fc:	38 02 b5 47 	mvu r2,0xb547
    1100:	58 22 00 00 	sw (r1+0),r2
    1104:	34 01 00 40 	mvi r1,64
    1108:	fb ff ff 53 	calli e54 <pcs_read>
    110c:	00 21 00 04 	srui r1,r1,4
    1110:	78 03 00 01 	mvhi r3,0x1
    1114:	38 63 2c 64 	ori r3,r3,0x2c64
    1118:	20 21 00 0f 	andi r1,r1,0xf
    111c:	28 62 00 00 	lw r2,(r3+0)
    1120:	08 21 03 20 	muli r1,r1,800
    1124:	b4 22 08 00 	add r1,r1,r2
    1128:	59 61 00 00 	sw (r11+0),r1
    112c:	34 01 00 00 	mvi r1,0
    1130:	2b 9d 00 04 	lw ra,(sp+4)
    1134:	2b 8b 00 08 	lw r11,(sp+8)
    1138:	37 9c 00 08 	addi sp,sp,8
    113c:	c3 a0 00 00 	ret

00001140 <ep_show_counters>:
    1140:	37 9c ff e8 	addi sp,sp,-24
    1144:	5b 8b 00 18 	sw (sp+24),r11
    1148:	5b 8c 00 14 	sw (sp+20),r12
    114c:	5b 8d 00 10 	sw (sp+16),r13
    1150:	5b 8e 00 0c 	sw (sp+12),r14
    1154:	5b 8f 00 08 	sw (sp+8),r15
    1158:	5b 9d 00 04 	sw (sp+4),ra
    115c:	78 01 00 01 	mvhi r1,0x1
    1160:	38 21 2c 54 	ori r1,r1,0x2c54
    1164:	28 2f 00 00 	lw r15,(r1+0)
    1168:	78 0c 00 01 	mvhi r12,0x1
    116c:	78 0d 00 01 	mvhi r13,0x1
    1170:	34 0b 00 00 	mvi r11,0
    1174:	39 8c 59 38 	ori r12,r12,0x5938
    1178:	39 ad 2c 74 	ori r13,r13,0x2c74
    117c:	34 0e 00 10 	mvi r14,16
    1180:	29 81 00 00 	lw r1,(r12+0)
    1184:	44 20 00 09 	be r1,r0,11a8 <ep_show_counters+0x68>
    1188:	35 61 00 20 	addi r1,r11,32
    118c:	3c 21 00 02 	sli r1,r1,2
    1190:	b9 a0 10 00 	mv r2,r13
    1194:	b5 e1 08 00 	add r1,r15,r1
    1198:	28 24 00 00 	lw r4,(r1+0)
    119c:	b9 60 18 00 	mv r3,r11
    11a0:	34 01 00 00 	mvi r1,0
    11a4:	fb ff fd b7 	calli 880 <wrc_debug_printf>
    11a8:	35 6b 00 01 	addi r11,r11,1
    11ac:	5d 6e ff f5 	bne r11,r14,1180 <ep_show_counters+0x40>
    11b0:	2b 9d 00 04 	lw ra,(sp+4)
    11b4:	2b 8b 00 18 	lw r11,(sp+24)
    11b8:	2b 8c 00 14 	lw r12,(sp+20)
    11bc:	2b 8d 00 10 	lw r13,(sp+16)
    11c0:	2b 8e 00 0c 	lw r14,(sp+12)
    11c4:	2b 8f 00 08 	lw r15,(sp+8)
    11c8:	37 9c 00 18 	addi sp,sp,24
    11cc:	c3 a0 00 00 	ret

000011d0 <ep_get_psval>:
    11d0:	78 03 00 01 	mvhi r3,0x1
    11d4:	38 63 2c 54 	ori r3,r3,0x2c54
    11d8:	28 62 00 00 	lw r2,(r3+0)
    11dc:	28 43 00 40 	lw r3,(r2+64)
    11e0:	78 02 01 00 	mvhi r2,0x100
    11e4:	a0 62 10 00 	and r2,r3,r2
    11e8:	44 40 00 07 	be r2,r0,1204 <ep_get_psval+0x34>
    11ec:	78 05 00 01 	mvhi r5,0x1
    11f0:	38 a5 2c 68 	ori r5,r5,0x2c68
    11f4:	28 a4 00 00 	lw r4,(r5+0)
    11f8:	a0 64 18 00 	and r3,r3,r4
    11fc:	58 23 00 00 	sw (r1+0),r3
    1200:	e0 00 00 02 	bi 1208 <ep_get_psval+0x38>
    1204:	58 20 00 00 	sw (r1+0),r0
    1208:	7c 41 00 00 	cmpnei r1,r2,0
    120c:	c3 a0 00 00 	ret

00001210 <ep_cal_pattern_enable>:
    1210:	37 9c ff fc 	addi sp,sp,-4
    1214:	5b 9d 00 04 	sw (sp+4),ra
    1218:	34 01 00 40 	mvi r1,64
    121c:	fb ff ff 0e 	calli e54 <pcs_read>
    1220:	38 22 00 01 	ori r2,r1,0x1
    1224:	34 01 00 40 	mvi r1,64
    1228:	fb ff ff 1a 	calli e90 <pcs_write>
    122c:	34 01 00 00 	mvi r1,0
    1230:	2b 9d 00 04 	lw ra,(sp+4)
    1234:	37 9c 00 04 	addi sp,sp,4
    1238:	c3 a0 00 00 	ret

0000123c <ep_cal_pattern_disable>:
    123c:	37 9c ff fc 	addi sp,sp,-4
    1240:	5b 9d 00 04 	sw (sp+4),ra
    1244:	34 01 00 40 	mvi r1,64
    1248:	fb ff ff 03 	calli e54 <pcs_read>
    124c:	34 02 ff fe 	mvi r2,-2
    1250:	a0 22 10 00 	and r2,r1,r2
    1254:	34 01 00 40 	mvi r1,64
    1258:	fb ff ff 0e 	calli e90 <pcs_write>
    125c:	34 01 00 00 	mvi r1,0
    1260:	2b 9d 00 04 	lw ra,(sp+4)
    1264:	37 9c 00 04 	addi sp,sp,4
    1268:	c3 a0 00 00 	ret

0000126c <minic_new_rx_buffer>:
    126c:	78 01 00 01 	mvhi r1,0x1
    1270:	38 21 59 ec 	ori r1,r1,0x59ec
    1274:	28 24 00 04 	lw r4,(r1+4)
    1278:	78 02 00 02 	mvhi r2,0x2
    127c:	38 43 00 08 	ori r3,r2,0x8
    1280:	58 24 00 00 	sw (r1+0),r4
    1284:	58 40 00 00 	sw (r2+0),r0
    1288:	58 64 00 00 	sw (r3+0),r4
    128c:	28 23 00 0c 	lw r3,(r1+12)
    1290:	38 41 00 0c 	ori r1,r2,0xc
    1294:	34 63 ff 00 	addi r3,r3,-256
    1298:	00 63 00 02 	srui r3,r3,2
    129c:	58 23 00 00 	sw (r1+0),r3
    12a0:	34 01 04 00 	mvi r1,1024
    12a4:	58 41 00 00 	sw (r2+0),r1
    12a8:	c3 a0 00 00 	ret

000012ac <minic_init>:
    12ac:	37 9c ff f8 	addi sp,sp,-8
    12b0:	5b 8b 00 08 	sw (sp+8),r11
    12b4:	5b 9d 00 04 	sw (sp+4),ra
    12b8:	78 02 00 01 	mvhi r2,0x1
    12bc:	38 42 2c 84 	ori r2,r2,0x2c84
    12c0:	28 41 00 00 	lw r1,(r2+0)
    12c4:	78 04 00 01 	mvhi r4,0x1
    12c8:	34 0b 00 02 	mvi r11,2
    12cc:	38 84 2c 88 	ori r4,r4,0x2c88
    12d0:	58 2b 00 00 	sw (r1+0),r11
    12d4:	28 81 00 00 	lw r1,(r4+0)
    12d8:	78 02 00 01 	mvhi r2,0x1
    12dc:	38 42 5a 28 	ori r2,r2,0x5a28
    12e0:	58 2b 00 00 	sw (r1+0),r11
    12e4:	78 01 00 01 	mvhi r1,0x1
    12e8:	38 21 59 ec 	ori r1,r1,0x59ec
    12ec:	58 22 00 04 	sw (r1+4),r2
    12f0:	00 42 00 02 	srui r2,r2,2
    12f4:	34 03 08 00 	mvi r3,2048
    12f8:	58 23 00 0c 	sw (r1+12),r3
    12fc:	34 43 01 ff 	addi r3,r2,511
    1300:	3c 63 00 10 	sli r3,r3,16
    1304:	78 04 00 01 	mvhi r4,0x1
    1308:	38 84 2c 8c 	ori r4,r4,0x2c8c
    130c:	20 42 ff ff 	andi r2,r2,0xffff
    1310:	b8 62 10 00 	or r2,r3,r2
    1314:	28 83 00 00 	lw r3,(r4+0)
    1318:	58 62 00 00 	sw (r3+0),r2
    131c:	78 02 00 01 	mvhi r2,0x1
    1320:	38 42 62 28 	ori r2,r2,0x6228
    1324:	58 22 00 14 	sw (r1+20),r2
    1328:	34 02 04 00 	mvi r2,1024
    132c:	58 22 00 1c 	sw (r1+28),r2
    1330:	58 20 00 2c 	sw (r1+44),r0
    1334:	58 20 00 30 	sw (r1+48),r0
    1338:	fb ff ff cd 	calli 126c <minic_new_rx_buffer>
    133c:	78 02 00 01 	mvhi r2,0x1
    1340:	38 42 2c 90 	ori r2,r2,0x2c90
    1344:	28 41 00 00 	lw r1,(r2+0)
    1348:	58 2b 00 00 	sw (r1+0),r11
    134c:	2b 9d 00 04 	lw ra,(sp+4)
    1350:	2b 8b 00 08 	lw r11,(sp+8)
    1354:	37 9c 00 08 	addi sp,sp,8
    1358:	c3 a0 00 00 	ret

0000135c <minic_disable>:
    135c:	78 01 00 02 	mvhi r1,0x2
    1360:	58 20 00 00 	sw (r1+0),r0
    1364:	c3 a0 00 00 	ret

00001368 <minic_poll_rx>:
    1368:	78 02 00 01 	mvhi r2,0x1
    136c:	38 42 2c 88 	ori r2,r2,0x2c88
    1370:	28 41 00 00 	lw r1,(r2+0)
    1374:	28 21 00 00 	lw r1,(r1+0)
    1378:	20 21 00 02 	andi r1,r1,0x2
    137c:	7c 21 00 00 	cmpnei r1,r1,0
    1380:	c3 a0 00 00 	ret

00001384 <minic_rx_frame>:
    1384:	37 9c ff cc 	addi sp,sp,-52
    1388:	5b 8b 00 24 	sw (sp+36),r11
    138c:	5b 8c 00 20 	sw (sp+32),r12
    1390:	5b 8d 00 1c 	sw (sp+28),r13
    1394:	5b 8e 00 18 	sw (sp+24),r14
    1398:	5b 8f 00 14 	sw (sp+20),r15
    139c:	5b 90 00 10 	sw (sp+16),r16
    13a0:	5b 91 00 0c 	sw (sp+12),r17
    13a4:	5b 92 00 08 	sw (sp+8),r18
    13a8:	5b 9d 00 04 	sw (sp+4),ra
    13ac:	b8 40 80 00 	mv r16,r2
    13b0:	78 02 00 01 	mvhi r2,0x1
    13b4:	38 42 2c 88 	ori r2,r2,0x2c88
    13b8:	b8 20 88 00 	mv r17,r1
    13bc:	28 41 00 00 	lw r1,(r2+0)
    13c0:	b8 60 78 00 	mv r15,r3
    13c4:	b8 80 58 00 	mv r11,r4
    13c8:	28 21 00 00 	lw r1,(r1+0)
    13cc:	34 0c 00 00 	mvi r12,0
    13d0:	20 21 00 02 	andi r1,r1,0x2
    13d4:	44 20 00 79 	be r1,r0,15b8 <minic_rx_frame+0x234>
    13d8:	78 0d 00 01 	mvhi r13,0x1
    13dc:	39 ad 59 ec 	ori r13,r13,0x59ec
    13e0:	29 a5 00 00 	lw r5,(r13+0)
    13e4:	28 a4 00 00 	lw r4,(r5+0)
    13e8:	48 04 00 03 	bg r0,r4,13f4 <minic_rx_frame+0x70>
    13ec:	fb ff ff a0 	calli 126c <minic_new_rx_buffer>
    13f0:	e0 00 00 72 	bi 15b8 <minic_rx_frame+0x234>
    13f4:	20 81 00 01 	andi r1,r4,0x1
    13f8:	20 8c 0f fe 	andi r12,r4,0xffe
    13fc:	c9 81 60 00 	sub r12,r12,r1
    1400:	35 8e 00 03 	addi r14,r12,3
    1404:	01 ce 00 02 	srui r14,r14,2
    1408:	78 03 40 00 	mvhi r3,0x4000
    140c:	a0 83 18 00 	and r3,r4,r3
    1410:	35 ce 00 01 	addi r14,r14,1
    1414:	5c 60 00 52 	bne r3,r0,155c <minic_rx_frame+0x1d8>
    1418:	7d 61 00 00 	cmpnei r1,r11,0
    141c:	00 84 00 1d 	srui r4,r4,29
    1420:	a0 81 20 00 	and r4,r4,r1
    1424:	44 83 00 38 	be r4,r3,1504 <minic_rx_frame+0x180>
    1428:	b4 ac 10 00 	add r2,r5,r12
    142c:	34 03 00 04 	mvi r3,4
    1430:	37 81 00 30 	addi r1,sp,48
    1434:	f8 00 44 e3 	calli 127c0 <memcpy>
    1438:	29 a3 00 00 	lw r3,(r13+0)
    143c:	35 92 ff fa 	addi r18,r12,-6
    1440:	35 8c ff fe 	addi r12,r12,-2
    1444:	b4 6c 10 00 	add r2,r3,r12
    1448:	37 81 00 36 	addi r1,sp,54
    144c:	34 03 00 02 	mvi r3,2
    1450:	f8 00 44 dc 	calli 127c0 <memcpy>
    1454:	78 03 00 01 	mvhi r3,0x1
    1458:	38 63 2c 94 	ori r3,r3,0x2c94
    145c:	37 81 00 28 	addi r1,sp,40
    1460:	37 82 00 2c 	addi r2,sp,44
    1464:	2b 8d 00 30 	lw r13,(sp+48)
    1468:	28 6c 00 00 	lw r12,(r3+0)
    146c:	f8 00 01 4b 	calli 1998 <pps_gen_get_time>
    1470:	78 02 00 01 	mvhi r2,0x1
    1474:	38 42 2c 98 	ori r2,r2,0x2c98
    1478:	28 41 00 00 	lw r1,(r2+0)
    147c:	a1 ac 60 00 	and r12,r13,r12
    1480:	01 ad 00 1c 	srui r13,r13,28
    1484:	50 2c 00 09 	bgeu r1,r12,14a8 <minic_rx_frame+0x124>
    1488:	78 03 00 01 	mvhi r3,0x1
    148c:	38 63 2c 9c 	ori r3,r3,0x2c9c
    1490:	2b 82 00 2c 	lw r2,(sp+44)
    1494:	28 61 00 00 	lw r1,(r3+0)
    1498:	54 41 00 04 	bgu r2,r1,14a8 <minic_rx_frame+0x124>
    149c:	2b 81 00 28 	lw r1,(sp+40)
    14a0:	34 21 ff ff 	addi r1,r1,-1
    14a4:	5b 81 00 28 	sw (sp+40),r1
    14a8:	78 02 00 01 	mvhi r2,0x1
    14ac:	38 42 2c a0 	ori r2,r2,0x2ca0
    14b0:	28 41 00 00 	lw r1,(r2+0)
    14b4:	2b 82 00 28 	lw r2,(sp+40)
    14b8:	21 83 00 0f 	andi r3,r12,0xf
    14bc:	c8 6d 18 00 	sub r3,r3,r13
    14c0:	a0 41 08 00 	and r1,r2,r1
    14c4:	59 61 00 08 	sw (r11+8),r1
    14c8:	64 61 ff f1 	cmpei r1,r3,-15
    14cc:	64 63 00 01 	cmpei r3,r3,1
    14d0:	b8 23 18 00 	or r3,r1,r3
    14d4:	44 60 00 04 	be r3,r0,14e4 <minic_rx_frame+0x160>
    14d8:	34 01 00 01 	mvi r1,1
    14dc:	59 61 00 04 	sw (r11+4),r1
    14e0:	e0 00 00 02 	bi 14e8 <minic_rx_frame+0x164>
    14e4:	59 60 00 04 	sw (r11+4),r0
    14e8:	2f 81 00 36 	lhu r1,(sp+54)
    14ec:	3d 8c 00 03 	sli r12,r12,3
    14f0:	20 21 08 00 	andi r1,r1,0x800
    14f4:	64 21 00 00 	cmpei r1,r1,0
    14f8:	59 6c 00 0c 	sw (r11+12),r12
    14fc:	31 61 00 00 	sb (r11+0),r1
    1500:	ba 40 60 00 	mv r12,r18
    1504:	51 ec 00 02 	bgeu r15,r12,150c <minic_rx_frame+0x188>
    1508:	b9 e0 60 00 	mv r12,r15
    150c:	78 0b 00 01 	mvhi r11,0x1
    1510:	39 6b 59 ec 	ori r11,r11,0x59ec
    1514:	29 61 00 30 	lw r1,(r11+48)
    1518:	29 62 00 00 	lw r2,(r11+0)
    151c:	34 03 00 0e 	mvi r3,14
    1520:	34 21 00 01 	addi r1,r1,1
    1524:	59 61 00 30 	sw (r11+48),r1
    1528:	34 42 00 04 	addi r2,r2,4
    152c:	ba 20 08 00 	mv r1,r17
    1530:	f8 00 44 a4 	calli 127c0 <memcpy>
    1534:	29 62 00 00 	lw r2,(r11+0)
    1538:	ba 00 08 00 	mv r1,r16
    153c:	35 83 ff f2 	addi r3,r12,-14
    1540:	34 42 00 12 	addi r2,r2,18
    1544:	f8 00 44 9f 	calli 127c0 <memcpy>
    1548:	29 61 00 00 	lw r1,(r11+0)
    154c:	3d ce 00 02 	sli r14,r14,2
    1550:	b4 2e 70 00 	add r14,r1,r14
    1554:	59 6e 00 00 	sw (r11+0),r14
    1558:	e0 00 00 05 	bi 156c <minic_rx_frame+0x1e8>
    155c:	3d ce 00 02 	sli r14,r14,2
    1560:	34 0c ff ff 	mvi r12,-1
    1564:	b4 ae 28 00 	add r5,r5,r14
    1568:	59 a5 00 00 	sw (r13+0),r5
    156c:	78 03 00 01 	mvhi r3,0x1
    1570:	38 63 2c a4 	ori r3,r3,0x2ca4
    1574:	28 61 00 00 	lw r1,(r3+0)
    1578:	28 22 00 00 	lw r2,(r1+0)
    157c:	78 01 00 01 	mvhi r1,0x1
    1580:	38 21 59 ec 	ori r1,r1,0x59ec
    1584:	28 21 00 00 	lw r1,(r1+0)
    1588:	20 42 ff ff 	andi r2,r2,0xffff
    158c:	50 41 00 0b 	bgeu r2,r1,15b8 <minic_rx_frame+0x234>
    1590:	78 01 00 02 	mvhi r1,0x2
    1594:	28 21 00 00 	lw r1,(r1+0)
    1598:	20 21 02 00 	andi r1,r1,0x200
    159c:	44 20 00 02 	be r1,r0,15a4 <minic_rx_frame+0x220>
    15a0:	fb ff ff 33 	calli 126c <minic_new_rx_buffer>
    15a4:	78 03 00 01 	mvhi r3,0x1
    15a8:	38 63 2c 88 	ori r3,r3,0x2c88
    15ac:	28 61 00 00 	lw r1,(r3+0)
    15b0:	34 02 00 02 	mvi r2,2
    15b4:	58 22 00 00 	sw (r1+0),r2
    15b8:	b9 80 08 00 	mv r1,r12
    15bc:	2b 9d 00 04 	lw ra,(sp+4)
    15c0:	2b 8b 00 24 	lw r11,(sp+36)
    15c4:	2b 8c 00 20 	lw r12,(sp+32)
    15c8:	2b 8d 00 1c 	lw r13,(sp+28)
    15cc:	2b 8e 00 18 	lw r14,(sp+24)
    15d0:	2b 8f 00 14 	lw r15,(sp+20)
    15d4:	2b 90 00 10 	lw r16,(sp+16)
    15d8:	2b 91 00 0c 	lw r17,(sp+12)
    15dc:	2b 92 00 08 	lw r18,(sp+8)
    15e0:	37 9c 00 34 	addi sp,sp,52
    15e4:	c3 a0 00 00 	ret

000015e8 <minic_tx_frame>:
    15e8:	37 9c ff e0 	addi sp,sp,-32
    15ec:	5b 8b 00 18 	sw (sp+24),r11
    15f0:	5b 8c 00 14 	sw (sp+20),r12
    15f4:	5b 8d 00 10 	sw (sp+16),r13
    15f8:	5b 8e 00 0c 	sw (sp+12),r14
    15fc:	5b 8f 00 08 	sw (sp+8),r15
    1600:	5b 9d 00 04 	sw (sp+4),ra
    1604:	78 0b 00 01 	mvhi r11,0x1
    1608:	39 6b 59 ec 	ori r11,r11,0x59ec
    160c:	b8 40 70 00 	mv r14,r2
    1610:	29 62 00 1c 	lw r2,(r11+28)
    1614:	b8 60 60 00 	mv r12,r3
    1618:	78 03 00 01 	mvhi r3,0x1
    161c:	34 42 ff 00 	addi r2,r2,-256
    1620:	00 42 00 02 	srui r2,r2,2
    1624:	38 63 2c a8 	ori r3,r3,0x2ca8
    1628:	b8 20 78 00 	mv r15,r1
    162c:	29 61 00 14 	lw r1,(r11+20)
    1630:	59 62 00 18 	sw (r11+24),r2
    1634:	28 62 00 00 	lw r2,(r3+0)
    1638:	59 61 00 10 	sw (r11+16),r1
    163c:	35 83 00 10 	addi r3,r12,16
    1640:	58 41 00 00 	sw (r2+0),r1
    1644:	34 02 00 00 	mvi r2,0
    1648:	b8 80 68 00 	mv r13,r4
    164c:	f8 00 44 96 	calli 128a4 <memset>
    1650:	29 61 00 10 	lw r1,(r11+16)
    1654:	34 02 00 3c 	mvi r2,60
    1658:	b9 80 18 00 	mv r3,r12
    165c:	34 21 00 04 	addi r1,r1,4
    1660:	51 82 00 02 	bgeu r12,r2,1668 <minic_tx_frame+0x80>
    1664:	34 03 00 3c 	mvi r3,60
    1668:	34 02 00 00 	mvi r2,0
    166c:	78 0b 00 01 	mvhi r11,0x1
    1670:	f8 00 44 8d 	calli 128a4 <memset>
    1674:	39 6b 59 ec 	ori r11,r11,0x59ec
    1678:	29 61 00 10 	lw r1,(r11+16)
    167c:	b9 e0 10 00 	mv r2,r15
    1680:	34 03 00 0e 	mvi r3,14
    1684:	34 21 00 04 	addi r1,r1,4
    1688:	f8 00 44 4e 	calli 127c0 <memcpy>
    168c:	29 61 00 10 	lw r1,(r11+16)
    1690:	b9 c0 10 00 	mv r2,r14
    1694:	35 83 ff f2 	addi r3,r12,-14
    1698:	34 21 00 12 	addi r1,r1,18
    169c:	f8 00 44 49 	calli 127c0 <memcpy>
    16a0:	34 01 00 3b 	mvi r1,59
    16a4:	50 2c 00 02 	bgeu r1,r12,16ac <minic_tx_frame+0xc4>
    16a8:	e0 00 00 02 	bi 16b0 <minic_tx_frame+0xc8>
    16ac:	34 0c 00 3c 	mvi r12,60
    16b0:	35 82 00 01 	addi r2,r12,1
    16b4:	00 42 00 01 	srui r2,r2,1
    16b8:	34 01 00 00 	mvi r1,0
    16bc:	45 a0 00 07 	be r13,r0,16d8 <minic_tx_frame+0xf0>
    16c0:	78 01 00 01 	mvhi r1,0x1
    16c4:	38 21 5a 24 	ori r1,r1,0x5a24
    16c8:	2c 21 00 00 	lhu r1,(r1+0)
    16cc:	78 03 40 00 	mvhi r3,0x4000
    16d0:	3c 21 00 0c 	sli r1,r1,12
    16d4:	b8 23 08 00 	or r1,r1,r3
    16d8:	78 03 80 00 	mvhi r3,0x8000
    16dc:	b8 43 18 00 	or r3,r2,r3
    16e0:	b8 61 18 00 	or r3,r3,r1
    16e4:	78 01 00 01 	mvhi r1,0x1
    16e8:	38 21 59 ec 	ori r1,r1,0x59ec
    16ec:	28 21 00 10 	lw r1,(r1+16)
    16f0:	3c 42 00 02 	sli r2,r2,2
    16f4:	58 23 00 00 	sw (r1+0),r3
    16f8:	b4 22 08 00 	add r1,r1,r2
    16fc:	58 20 00 00 	sw (r1+0),r0
    1700:	78 01 00 02 	mvhi r1,0x2
    1704:	28 22 00 00 	lw r2,(r1+0)
    1708:	38 42 00 01 	ori r2,r2,0x1
    170c:	58 22 00 00 	sw (r1+0),r2
    1710:	28 22 00 00 	lw r2,(r1+0)
    1714:	20 42 00 02 	andi r2,r2,0x2
    1718:	44 40 ff fe 	be r2,r0,1710 <minic_tx_frame+0x128>
    171c:	45 a0 00 37 	be r13,r0,17f8 <minic_tx_frame+0x210>
    1720:	78 02 00 01 	mvhi r2,0x1
    1724:	78 03 00 01 	mvhi r3,0x1
    1728:	38 42 2c ac 	ori r2,r2,0x2cac
    172c:	38 63 2c b0 	ori r3,r3,0x2cb0
    1730:	28 41 00 00 	lw r1,(r2+0)
    1734:	28 62 00 00 	lw r2,(r3+0)
    1738:	28 2e 00 00 	lw r14,(r1+0)
    173c:	28 4b 00 00 	lw r11,(r2+0)
    1740:	28 23 00 00 	lw r3,(r1+0)
    1744:	78 01 00 01 	mvhi r1,0x1
    1748:	38 21 5a 24 	ori r1,r1,0x5a24
    174c:	00 63 00 06 	srui r3,r3,6
    1750:	2c 24 00 00 	lhu r4,(r1+0)
    1754:	20 63 ff ff 	andi r3,r3,0xffff
    1758:	21 ce 00 01 	andi r14,r14,0x1
    175c:	44 64 00 09 	be r3,r4,1780 <minic_tx_frame+0x198>
    1760:	78 01 00 01 	mvhi r1,0x1
    1764:	38 21 59 38 	ori r1,r1,0x5938
    1768:	28 21 00 00 	lw r1,(r1+0)
    176c:	44 20 00 05 	be r1,r0,1780 <minic_tx_frame+0x198>
    1770:	78 02 00 01 	mvhi r2,0x1
    1774:	34 01 00 00 	mvi r1,0
    1778:	38 42 2c b4 	ori r2,r2,0x2cb4
    177c:	fb ff fc 41 	calli 880 <wrc_debug_printf>
    1780:	78 02 00 01 	mvhi r2,0x1
    1784:	38 42 2c 94 	ori r2,r2,0x2c94
    1788:	28 41 00 00 	lw r1,(r2+0)
    178c:	37 82 00 1c 	addi r2,sp,28
    1790:	a1 61 58 00 	and r11,r11,r1
    1794:	37 81 00 20 	addi r1,sp,32
    1798:	f8 00 00 80 	calli 1998 <pps_gen_get_time>
    179c:	78 03 00 01 	mvhi r3,0x1
    17a0:	38 63 2c 98 	ori r3,r3,0x2c98
    17a4:	28 61 00 00 	lw r1,(r3+0)
    17a8:	50 2b 00 09 	bgeu r1,r11,17cc <minic_tx_frame+0x1e4>
    17ac:	78 03 00 01 	mvhi r3,0x1
    17b0:	38 63 2c 9c 	ori r3,r3,0x2c9c
    17b4:	2b 82 00 1c 	lw r2,(sp+28)
    17b8:	28 61 00 00 	lw r1,(r3+0)
    17bc:	54 41 00 04 	bgu r2,r1,17cc <minic_tx_frame+0x1e4>
    17c0:	2b 81 00 20 	lw r1,(sp+32)
    17c4:	34 21 ff ff 	addi r1,r1,-1
    17c8:	5b 81 00 20 	sw (sp+32),r1
    17cc:	2b 81 00 20 	lw r1,(sp+32)
    17d0:	31 ae 00 00 	sb (r13+0),r14
    17d4:	3d 6b 00 03 	sli r11,r11,3
    17d8:	59 a1 00 08 	sw (r13+8),r1
    17dc:	78 01 00 01 	mvhi r1,0x1
    17e0:	38 21 59 ec 	ori r1,r1,0x59ec
    17e4:	28 22 00 2c 	lw r2,(r1+44)
    17e8:	59 a0 00 04 	sw (r13+4),r0
    17ec:	59 ab 00 0c 	sw (r13+12),r11
    17f0:	34 42 00 01 	addi r2,r2,1
    17f4:	58 22 00 2c 	sw (r1+44),r2
    17f8:	78 01 00 01 	mvhi r1,0x1
    17fc:	38 21 5a 24 	ori r1,r1,0x5a24
    1800:	2c 22 00 00 	lhu r2,(r1+0)
    1804:	34 42 00 01 	addi r2,r2,1
    1808:	0c 22 00 00 	sh (r1+0),r2
    180c:	b9 80 08 00 	mv r1,r12
    1810:	2b 9d 00 04 	lw ra,(sp+4)
    1814:	2b 8b 00 18 	lw r11,(sp+24)
    1818:	2b 8c 00 14 	lw r12,(sp+20)
    181c:	2b 8d 00 10 	lw r13,(sp+16)
    1820:	2b 8e 00 0c 	lw r14,(sp+12)
    1824:	2b 8f 00 08 	lw r15,(sp+8)
    1828:	37 9c 00 20 	addi sp,sp,32
    182c:	c3 a0 00 00 	ret

00001830 <minic_get_stats>:
    1830:	78 03 00 01 	mvhi r3,0x1
    1834:	38 63 59 ec 	ori r3,r3,0x59ec
    1838:	28 64 00 2c 	lw r4,(r3+44)
    183c:	58 24 00 00 	sw (r1+0),r4
    1840:	28 61 00 30 	lw r1,(r3+48)
    1844:	58 41 00 00 	sw (r2+0),r1
    1848:	c3 a0 00 00 	ret

0000184c <pps_gen_init>:
    184c:	78 02 00 01 	mvhi r2,0x1
    1850:	78 03 00 01 	mvhi r3,0x1
    1854:	38 42 2c dc 	ori r2,r2,0x2cdc
    1858:	38 63 2c e0 	ori r3,r3,0x2ce0
    185c:	28 41 00 00 	lw r1,(r2+0)
    1860:	28 62 00 00 	lw r2,(r3+0)
    1864:	78 04 00 01 	mvhi r4,0x1
    1868:	34 03 00 64 	mvi r3,100
    186c:	58 22 00 00 	sw (r1+0),r2
    1870:	58 20 00 1c 	sw (r1+28),r0
    1874:	38 84 2c e4 	ori r4,r4,0x2ce4
    1878:	58 23 00 14 	sw (r1+20),r3
    187c:	28 83 00 00 	lw r3,(r4+0)
    1880:	58 20 00 18 	sw (r1+24),r0
    1884:	58 20 00 10 	sw (r1+16),r0
    1888:	58 23 00 00 	sw (r1+0),r3
    188c:	58 22 00 00 	sw (r1+0),r2
    1890:	c3 a0 00 00 	ret

00001894 <pps_gen_adjust_nsec>:
    1894:	37 9c ff f8 	addi sp,sp,-8
    1898:	5b 8b 00 08 	sw (sp+8),r11
    189c:	5b 9d 00 04 	sw (sp+4),ra
    18a0:	b8 20 58 00 	mv r11,r1
    18a4:	78 01 00 01 	mvhi r1,0x1
    18a8:	38 21 59 38 	ori r1,r1,0x5938
    18ac:	28 21 00 00 	lw r1,(r1+0)
    18b0:	44 20 00 06 	be r1,r0,18c8 <pps_gen_adjust_nsec+0x34>
    18b4:	78 02 00 01 	mvhi r2,0x1
    18b8:	34 01 00 00 	mvi r1,0
    18bc:	38 42 2c ec 	ori r2,r2,0x2cec
    18c0:	b9 60 18 00 	mv r3,r11
    18c4:	fb ff fb ef 	calli 880 <wrc_debug_printf>
    18c8:	78 01 00 01 	mvhi r1,0x1
    18cc:	38 21 2c dc 	ori r1,r1,0x2cdc
    18d0:	28 22 00 00 	lw r2,(r1+0)
    18d4:	15 61 00 1f 	sri r1,r11,31
    18d8:	78 03 00 01 	mvhi r3,0x1
    18dc:	00 21 00 1d 	srui r1,r1,29
    18e0:	38 63 2c e8 	ori r3,r3,0x2ce8
    18e4:	b4 2b 58 00 	add r11,r1,r11
    18e8:	58 40 00 14 	sw (r2+20),r0
    18ec:	15 6b 00 03 	sri r11,r11,3
    18f0:	28 61 00 00 	lw r1,(r3+0)
    18f4:	58 40 00 18 	sw (r2+24),r0
    18f8:	58 4b 00 10 	sw (r2+16),r11
    18fc:	58 41 00 00 	sw (r2+0),r1
    1900:	2b 9d 00 04 	lw ra,(sp+4)
    1904:	2b 8b 00 08 	lw r11,(sp+8)
    1908:	37 9c 00 08 	addi sp,sp,8
    190c:	c3 a0 00 00 	ret

00001910 <pps_gen_adjust_utc>:
    1910:	37 9c ff f8 	addi sp,sp,-8
    1914:	5b 8b 00 08 	sw (sp+8),r11
    1918:	5b 9d 00 04 	sw (sp+4),ra
    191c:	78 02 00 01 	mvhi r2,0x1
    1920:	38 42 59 38 	ori r2,r2,0x5938
    1924:	b8 20 58 00 	mv r11,r1
    1928:	28 41 00 00 	lw r1,(r2+0)
    192c:	44 20 00 06 	be r1,r0,1944 <pps_gen_adjust_utc+0x34>
    1930:	78 02 00 01 	mvhi r2,0x1
    1934:	34 01 00 00 	mvi r1,0
    1938:	38 42 2d 08 	ori r2,r2,0x2d08
    193c:	b9 60 18 00 	mv r3,r11
    1940:	fb ff fb d0 	calli 880 <wrc_debug_printf>
    1944:	78 01 00 01 	mvhi r1,0x1
    1948:	38 21 2c dc 	ori r1,r1,0x2cdc
    194c:	28 22 00 00 	lw r2,(r1+0)
    1950:	78 03 00 01 	mvhi r3,0x1
    1954:	38 63 2c e8 	ori r3,r3,0x2ce8
    1958:	58 4b 00 14 	sw (r2+20),r11
    195c:	28 61 00 00 	lw r1,(r3+0)
    1960:	58 40 00 18 	sw (r2+24),r0
    1964:	58 40 00 10 	sw (r2+16),r0
    1968:	58 41 00 00 	sw (r2+0),r1
    196c:	2b 9d 00 04 	lw ra,(sp+4)
    1970:	2b 8b 00 08 	lw r11,(sp+8)
    1974:	37 9c 00 08 	addi sp,sp,8
    1978:	c3 a0 00 00 	ret

0000197c <pps_gen_busy>:
    197c:	78 02 00 01 	mvhi r2,0x1
    1980:	38 42 2c dc 	ori r2,r2,0x2cdc
    1984:	28 41 00 00 	lw r1,(r2+0)
    1988:	28 21 00 00 	lw r1,(r1+0)
    198c:	20 21 00 04 	andi r1,r1,0x4
    1990:	64 21 00 00 	cmpei r1,r1,0
    1994:	c3 a0 00 00 	ret

00001998 <pps_gen_get_time>:
    1998:	78 04 00 01 	mvhi r4,0x1
    199c:	38 84 2c dc 	ori r4,r4,0x2cdc
    19a0:	28 83 00 00 	lw r3,(r4+0)
    19a4:	78 04 00 01 	mvhi r4,0x1
    19a8:	38 84 2c 94 	ori r4,r4,0x2c94
    19ac:	28 85 00 00 	lw r5,(r4+0)
    19b0:	28 67 00 04 	lw r7,(r3+4)
    19b4:	28 66 00 08 	lw r6,(r3+8)
    19b8:	28 64 00 04 	lw r4,(r3+4)
    19bc:	a0 e5 38 00 	and r7,r7,r5
    19c0:	a0 85 20 00 	and r4,r4,r5
    19c4:	54 e4 ff fb 	bgu r7,r4,19b0 <pps_gen_get_time+0x18>
    19c8:	44 20 00 02 	be r1,r0,19d0 <pps_gen_get_time+0x38>
    19cc:	58 26 00 00 	sw (r1+0),r6
    19d0:	44 40 00 02 	be r2,r0,19d8 <pps_gen_get_time+0x40>
    19d4:	58 44 00 00 	sw (r2+0),r4
    19d8:	c3 a0 00 00 	ret

000019dc <pps_gen_enable_output>:
    19dc:	37 9c ff fc 	addi sp,sp,-4
    19e0:	5b 9d 00 04 	sw (sp+4),ra
    19e4:	44 20 00 07 	be r1,r0,1a00 <pps_gen_enable_output+0x24>
    19e8:	78 03 00 01 	mvhi r3,0x1
    19ec:	38 63 2c dc 	ori r3,r3,0x2cdc
    19f0:	28 61 00 00 	lw r1,(r3+0)
    19f4:	34 02 00 06 	mvi r2,6
    19f8:	58 22 00 1c 	sw (r1+28),r2
    19fc:	e0 00 00 0c 	bi 1a2c <pps_gen_enable_output+0x50>
    1a00:	78 02 00 01 	mvhi r2,0x1
    1a04:	38 42 59 38 	ori r2,r2,0x5938
    1a08:	28 42 00 00 	lw r2,(r2+0)
    1a0c:	44 41 00 04 	be r2,r1,1a1c <pps_gen_enable_output+0x40>
    1a10:	78 02 00 01 	mvhi r2,0x1
    1a14:	38 42 2d 20 	ori r2,r2,0x2d20
    1a18:	fb ff fb 9a 	calli 880 <wrc_debug_printf>
    1a1c:	78 02 00 01 	mvhi r2,0x1
    1a20:	38 42 2c dc 	ori r2,r2,0x2cdc
    1a24:	28 41 00 00 	lw r1,(r2+0)
    1a28:	58 20 00 1c 	sw (r1+28),r0
    1a2c:	2b 9d 00 04 	lw ra,(sp+4)
    1a30:	37 9c 00 04 	addi sp,sp,4
    1a34:	c3 a0 00 00 	ret

00001a38 <timer_init>:
    1a38:	37 9c ff f4 	addi sp,sp,-12
    1a3c:	5b 8b 00 0c 	sw (sp+12),r11
    1a40:	5b 8c 00 08 	sw (sp+8),r12
    1a44:	5b 9d 00 04 	sw (sp+4),ra
    1a48:	b8 20 60 00 	mv r12,r1
    1a4c:	78 01 00 01 	mvhi r1,0x1
    1a50:	38 21 2b 04 	ori r1,r1,0x2b04
    1a54:	28 2b 00 00 	lw r11,(r1+0)
    1a58:	78 03 00 01 	mvhi r3,0x1
    1a5c:	b8 60 08 00 	mv r1,r3
    1a60:	29 62 00 0c 	lw r2,(r11+12)
    1a64:	38 21 2d 38 	ori r1,r1,0x2d38
    1a68:	20 42 00 0f 	andi r2,r2,0xf
    1a6c:	f8 00 09 07 	calli 3e88 <mprintf>
    1a70:	45 80 00 05 	be r12,r0,1a84 <timer_init+0x4c>
    1a74:	29 62 00 10 	lw r2,(r11+16)
    1a78:	78 01 80 00 	mvhi r1,0x8000
    1a7c:	b8 41 08 00 	or r1,r2,r1
    1a80:	e0 00 00 06 	bi 1a98 <timer_init+0x60>
    1a84:	78 03 00 01 	mvhi r3,0x1
    1a88:	38 63 2c a0 	ori r3,r3,0x2ca0
    1a8c:	29 62 00 10 	lw r2,(r11+16)
    1a90:	28 61 00 00 	lw r1,(r3+0)
    1a94:	a0 41 08 00 	and r1,r2,r1
    1a98:	59 61 00 10 	sw (r11+16),r1
    1a9c:	2b 9d 00 04 	lw ra,(sp+4)
    1aa0:	2b 8b 00 0c 	lw r11,(sp+12)
    1aa4:	2b 8c 00 08 	lw r12,(sp+8)
    1aa8:	37 9c 00 0c 	addi sp,sp,12
    1aac:	c3 a0 00 00 	ret

00001ab0 <timer_get_tics>:
    1ab0:	78 02 00 01 	mvhi r2,0x1
    1ab4:	38 42 2b 04 	ori r2,r2,0x2b04
    1ab8:	28 41 00 00 	lw r1,(r2+0)
    1abc:	28 21 00 14 	lw r1,(r1+20)
    1ac0:	c3 a0 00 00 	ret

00001ac4 <timer_delay>:
    1ac4:	78 02 00 01 	mvhi r2,0x1
    1ac8:	38 42 2b 04 	ori r2,r2,0x2b04
    1acc:	28 44 00 00 	lw r4,(r2+0)
    1ad0:	a4 20 18 00 	not r3,r1
    1ad4:	28 82 00 14 	lw r2,(r4+20)
    1ad8:	54 43 ff ff 	bgu r2,r3,1ad4 <timer_delay+0x10>
    1adc:	78 04 00 01 	mvhi r4,0x1
    1ae0:	38 84 2b 04 	ori r4,r4,0x2b04
    1ae4:	28 83 00 00 	lw r3,(r4+0)
    1ae8:	b4 41 08 00 	add r1,r2,r1
    1aec:	28 62 00 14 	lw r2,(r3+20)
    1af0:	54 22 ff ff 	bgu r1,r2,1aec <timer_delay+0x28>
    1af4:	c3 a0 00 00 	ret

00001af8 <pi_update>:
    1af8:	28 25 00 08 	lw r5,(r1+8)
    1afc:	28 24 00 00 	lw r4,(r1+0)
    1b00:	28 26 00 04 	lw r6,(r1+4)
    1b04:	b4 45 18 00 	add r3,r2,r5
    1b08:	88 64 20 00 	mul r4,r3,r4
    1b0c:	58 22 00 1c 	sw (r1+28),r2
    1b10:	88 46 10 00 	mul r2,r2,r6
    1b14:	b4 82 10 00 	add r2,r4,r2
    1b18:	28 24 00 0c 	lw r4,(r1+12)
    1b1c:	14 42 00 0c 	sri r2,r2,12
    1b20:	b4 44 20 00 	add r4,r2,r4
    1b24:	28 22 00 14 	lw r2,(r1+20)
    1b28:	4c 82 00 05 	bge r4,r2,1b3c <pi_update+0x44>
    1b2c:	28 24 00 10 	lw r4,(r1+16)
    1b30:	44 80 00 08 	be r4,r0,1b50 <pi_update+0x58>
    1b34:	4c a3 00 0b 	bge r5,r3,1b60 <pi_update+0x68>
    1b38:	e0 00 00 06 	bi 1b50 <pi_update+0x58>
    1b3c:	28 22 00 18 	lw r2,(r1+24)
    1b40:	4c 44 00 06 	bge r2,r4,1b58 <pi_update+0x60>
    1b44:	28 24 00 10 	lw r4,(r1+16)
    1b48:	44 80 00 02 	be r4,r0,1b50 <pi_update+0x58>
    1b4c:	4c 65 00 05 	bge r3,r5,1b60 <pi_update+0x68>
    1b50:	58 23 00 08 	sw (r1+8),r3
    1b54:	e0 00 00 03 	bi 1b60 <pi_update+0x68>
    1b58:	58 23 00 08 	sw (r1+8),r3
    1b5c:	b8 80 10 00 	mv r2,r4
    1b60:	58 22 00 20 	sw (r1+32),r2
    1b64:	b8 40 08 00 	mv r1,r2
    1b68:	c3 a0 00 00 	ret

00001b6c <spll_enable_tagger>:
    1b6c:	78 03 00 01 	mvhi r3,0x1
    1b70:	38 63 68 40 	ori r3,r3,0x6840
    1b74:	28 63 00 00 	lw r3,(r3+0)
    1b78:	48 61 00 15 	bg r3,r1,1bcc <spll_enable_tagger+0x60>
    1b7c:	c8 23 08 00 	sub r1,r1,r3
    1b80:	44 40 00 09 	be r2,r0,1ba4 <spll_enable_tagger+0x38>
    1b84:	78 03 00 01 	mvhi r3,0x1
    1b88:	38 63 2d 44 	ori r3,r3,0x2d44
    1b8c:	28 62 00 00 	lw r2,(r3+0)
    1b90:	34 04 00 01 	mvi r4,1
    1b94:	bc 81 08 00 	sl r1,r4,r1
    1b98:	28 43 00 18 	lw r3,(r2+24)
    1b9c:	b8 23 08 00 	or r1,r1,r3
    1ba0:	e0 00 00 09 	bi 1bc4 <spll_enable_tagger+0x58>
    1ba4:	78 03 00 01 	mvhi r3,0x1
    1ba8:	38 63 2d 44 	ori r3,r3,0x2d44
    1bac:	28 62 00 00 	lw r2,(r3+0)
    1bb0:	34 04 00 01 	mvi r4,1
    1bb4:	bc 81 08 00 	sl r1,r4,r1
    1bb8:	28 43 00 18 	lw r3,(r2+24)
    1bbc:	a4 20 08 00 	not r1,r1
    1bc0:	a0 23 08 00 	and r1,r1,r3
    1bc4:	58 41 00 18 	sw (r2+24),r1
    1bc8:	c3 a0 00 00 	ret
    1bcc:	44 40 00 09 	be r2,r0,1bf0 <spll_enable_tagger+0x84>
    1bd0:	78 03 00 01 	mvhi r3,0x1
    1bd4:	38 63 2d 44 	ori r3,r3,0x2d44
    1bd8:	28 62 00 00 	lw r2,(r3+0)
    1bdc:	34 04 00 01 	mvi r4,1
    1be0:	bc 81 08 00 	sl r1,r4,r1
    1be4:	28 43 00 14 	lw r3,(r2+20)
    1be8:	b8 23 08 00 	or r1,r1,r3
    1bec:	e0 00 00 09 	bi 1c10 <spll_enable_tagger+0xa4>
    1bf0:	78 03 00 01 	mvhi r3,0x1
    1bf4:	38 63 2d 44 	ori r3,r3,0x2d44
    1bf8:	28 62 00 00 	lw r2,(r3+0)
    1bfc:	34 04 00 01 	mvi r4,1
    1c00:	bc 81 08 00 	sl r1,r4,r1
    1c04:	28 43 00 14 	lw r3,(r2+20)
    1c08:	a4 20 08 00 	not r1,r1
    1c0c:	a0 23 08 00 	and r1,r1,r3
    1c10:	58 41 00 14 	sw (r2+20),r1
    1c14:	c3 a0 00 00 	ret

00001c18 <spll_debug>:
    1c18:	34 04 00 00 	mvi r4,0
    1c1c:	44 60 00 02 	be r3,r0,1c24 <spll_debug+0xc>
    1c20:	78 04 80 00 	mvhi r4,0x8000
    1c24:	78 05 00 01 	mvhi r5,0x1
    1c28:	38 a5 2c 68 	ori r5,r5,0x2c68
    1c2c:	28 a3 00 00 	lw r3,(r5+0)
    1c30:	3c 21 00 18 	sli r1,r1,24
    1c34:	a0 43 10 00 	and r2,r2,r3
    1c38:	b8 41 08 00 	or r1,r2,r1
    1c3c:	b8 24 20 00 	or r4,r1,r4
    1c40:	78 01 00 01 	mvhi r1,0x1
    1c44:	38 21 2d 44 	ori r1,r1,0x2d44
    1c48:	28 23 00 00 	lw r3,(r1+0)
    1c4c:	58 64 00 2c 	sw (r3+44),r4
    1c50:	c3 a0 00 00 	ret

00001c54 <set_phase_shift>:
    1c54:	37 9c ff f4 	addi sp,sp,-12
    1c58:	5b 8b 00 0c 	sw (sp+12),r11
    1c5c:	5b 8c 00 08 	sw (sp+8),r12
    1c60:	5b 9d 00 04 	sw (sp+4),ra
    1c64:	78 0c 00 01 	mvhi r12,0x1
    1c68:	b8 40 58 00 	mv r11,r2
    1c6c:	39 8c 67 04 	ori r12,r12,0x6704
    1c70:	44 20 00 06 	be r1,r0,1c88 <set_phase_shift+0x34>
    1c74:	3c 2c 00 07 	sli r12,r1,7
    1c78:	78 02 00 01 	mvhi r2,0x1
    1c7c:	35 8c 00 d8 	addi r12,r12,216
    1c80:	38 42 66 2c 	ori r2,r2,0x662c
    1c84:	b5 82 60 00 	add r12,r12,r2
    1c88:	15 61 00 1f 	sri r1,r11,31
    1c8c:	01 62 00 12 	srui r2,r11,18
    1c90:	3c 21 00 0e 	sli r1,r1,14
    1c94:	34 03 00 00 	mvi r3,0
    1c98:	b8 41 08 00 	or r1,r2,r1
    1c9c:	3d 62 00 0e 	sli r2,r11,14
    1ca0:	34 04 1f 40 	mvi r4,8000
    1ca4:	f8 00 3a a9 	calli 10748 <__divdi3>
    1ca8:	00 41 00 1f 	srui r1,r2,31
    1cac:	b4 22 10 00 	add r2,r1,r2
    1cb0:	14 42 00 01 	sri r2,r2,1
    1cb4:	78 01 00 01 	mvhi r1,0x1
    1cb8:	59 82 00 64 	sw (r12+100),r2
    1cbc:	38 21 66 2c 	ori r1,r1,0x662c
    1cc0:	58 2b 00 18 	sw (r1+24),r11
    1cc4:	2b 9d 00 04 	lw ra,(sp+4)
    1cc8:	2b 8b 00 0c 	lw r11,(sp+12)
    1ccc:	2b 8c 00 08 	lw r12,(sp+8)
    1cd0:	37 9c 00 0c 	addi sp,sp,12
    1cd4:	c3 a0 00 00 	ret

00001cd8 <ld_update>:
    1cd8:	37 9c ff f8 	addi sp,sp,-8
    1cdc:	5b 8b 00 08 	sw (sp+8),r11
    1ce0:	5b 9d 00 04 	sw (sp+4),ra
    1ce4:	b8 20 58 00 	mv r11,r1
    1ce8:	b8 40 08 00 	mv r1,r2
    1cec:	f8 00 42 90 	calli 1272c <abs>
    1cf0:	29 63 00 0c 	lw r3,(r11+12)
    1cf4:	29 62 00 00 	lw r2,(r11+0)
    1cf8:	48 23 00 0a 	bg r1,r3,1d20 <ld_update+0x48>
    1cfc:	29 61 00 04 	lw r1,(r11+4)
    1d00:	4c 41 00 03 	bge r2,r1,1d0c <ld_update+0x34>
    1d04:	34 42 00 01 	addi r2,r2,1
    1d08:	59 62 00 00 	sw (r11+0),r2
    1d0c:	29 62 00 00 	lw r2,(r11+0)
    1d10:	5c 41 00 0e 	bne r2,r1,1d48 <ld_update+0x70>
    1d14:	34 01 00 01 	mvi r1,1
    1d18:	59 61 00 10 	sw (r11+16),r1
    1d1c:	e0 00 00 0c 	bi 1d4c <ld_update+0x74>
    1d20:	29 61 00 08 	lw r1,(r11+8)
    1d24:	4c 22 00 03 	bge r1,r2,1d30 <ld_update+0x58>
    1d28:	34 42 ff ff 	addi r2,r2,-1
    1d2c:	59 62 00 00 	sw (r11+0),r2
    1d30:	29 62 00 00 	lw r2,(r11+0)
    1d34:	5c 41 00 05 	bne r2,r1,1d48 <ld_update+0x70>
    1d38:	59 60 00 00 	sw (r11+0),r0
    1d3c:	59 60 00 10 	sw (r11+16),r0
    1d40:	34 01 ff ff 	mvi r1,-1
    1d44:	e0 00 00 02 	bi 1d4c <ld_update+0x74>
    1d48:	29 61 00 10 	lw r1,(r11+16)
    1d4c:	2b 9d 00 04 	lw ra,(sp+4)
    1d50:	2b 8b 00 08 	lw r11,(sp+8)
    1d54:	37 9c 00 08 	addi sp,sp,8
    1d58:	c3 a0 00 00 	ret

00001d5c <helper_update>:
    1d5c:	37 9c ff f0 	addi sp,sp,-16
    1d60:	5b 8b 00 10 	sw (sp+16),r11
    1d64:	5b 8c 00 0c 	sw (sp+12),r12
    1d68:	5b 8d 00 08 	sw (sp+8),r13
    1d6c:	5b 9d 00 04 	sw (sp+4),ra
    1d70:	b8 20 58 00 	mv r11,r1
    1d74:	28 21 00 0c 	lw r1,(r1+12)
    1d78:	b8 40 68 00 	mv r13,r2
    1d7c:	34 0c 00 00 	mvi r12,0
    1d80:	5c 61 00 47 	bne r3,r1,1e9c <helper_update+0x140>
    1d84:	34 01 00 22 	mvi r1,34
    1d88:	34 03 00 00 	mvi r3,0
    1d8c:	fb ff ff a3 	calli 1c18 <spll_debug>
    1d90:	29 62 00 04 	lw r2,(r11+4)
    1d94:	34 01 00 25 	mvi r1,37
    1d98:	34 03 00 00 	mvi r3,0
    1d9c:	fb ff ff 9f 	calli 1c18 <spll_debug>
    1da0:	29 61 00 08 	lw r1,(r11+8)
    1da4:	4c 20 00 04 	bge r1,r0,1db4 <helper_update+0x58>
    1da8:	59 6d 00 04 	sw (r11+4),r13
    1dac:	59 6d 00 08 	sw (r11+8),r13
    1db0:	e0 00 00 3b 	bi 1e9c <helper_update+0x140>
    1db4:	4d a1 00 05 	bge r13,r1,1dc8 <helper_update+0x6c>
    1db8:	29 62 00 00 	lw r2,(r11+0)
    1dbc:	78 01 00 40 	mvhi r1,0x40
    1dc0:	b4 41 08 00 	add r1,r2,r1
    1dc4:	59 61 00 00 	sw (r11+0),r1
    1dc8:	29 63 00 00 	lw r3,(r11+0)
    1dcc:	78 05 00 01 	mvhi r5,0x1
    1dd0:	29 62 00 04 	lw r2,(r11+4)
    1dd4:	38 a5 2d 48 	ori r5,r5,0x2d48
    1dd8:	28 a1 00 00 	lw r1,(r5+0)
    1ddc:	b5 a3 20 00 	add r4,r13,r3
    1de0:	c8 82 60 00 	sub r12,r4,r2
    1de4:	48 2c 00 06 	bg r1,r12,1dfc <helper_update+0xa0>
    1de8:	78 05 00 01 	mvhi r5,0x1
    1dec:	38 a5 2d 4c 	ori r5,r5,0x2d4c
    1df0:	28 a1 00 00 	lw r1,(r5+0)
    1df4:	49 81 00 02 	bg r12,r1,1dfc <helper_update+0xa0>
    1df8:	e0 00 00 02 	bi 1e00 <helper_update+0xa4>
    1dfc:	b8 20 60 00 	mv r12,r1
    1e00:	78 05 00 01 	mvhi r5,0x1
    1e04:	38 a5 2d 50 	ori r5,r5,0x2d50
    1e08:	28 a1 00 00 	lw r1,(r5+0)
    1e0c:	4c 24 00 06 	bge r1,r4,1e24 <helper_update+0xc8>
    1e10:	4c 22 00 05 	bge r1,r2,1e24 <helper_update+0xc8>
    1e14:	c8 61 18 00 	sub r3,r3,r1
    1e18:	c8 41 08 00 	sub r1,r2,r1
    1e1c:	59 63 00 00 	sw (r11+0),r3
    1e20:	59 61 00 04 	sw (r11+4),r1
    1e24:	29 61 00 04 	lw r1,(r11+4)
    1e28:	b9 80 10 00 	mv r2,r12
    1e2c:	59 6d 00 08 	sw (r11+8),r13
    1e30:	34 21 40 00 	addi r1,r1,16384
    1e34:	59 61 00 04 	sw (r11+4),r1
    1e38:	35 61 00 18 	addi r1,r11,24
    1e3c:	fb ff ff 2f 	calli 1af8 <pi_update>
    1e40:	78 02 00 01 	mvhi r2,0x1
    1e44:	38 42 2d 44 	ori r2,r2,0x2d44
    1e48:	b8 20 68 00 	mv r13,r1
    1e4c:	28 41 00 00 	lw r1,(r2+0)
    1e50:	34 03 00 00 	mvi r3,0
    1e54:	58 2d 00 20 	sw (r1+32),r13
    1e58:	29 62 00 10 	lw r2,(r11+16)
    1e5c:	34 41 00 01 	addi r1,r2,1
    1e60:	59 61 00 10 	sw (r11+16),r1
    1e64:	34 01 00 26 	mvi r1,38
    1e68:	fb ff ff 6c 	calli 1c18 <spll_debug>
    1e6c:	34 01 00 20 	mvi r1,32
    1e70:	b9 a0 10 00 	mv r2,r13
    1e74:	34 03 00 00 	mvi r3,0
    1e78:	fb ff ff 68 	calli 1c18 <spll_debug>
    1e7c:	b9 80 10 00 	mv r2,r12
    1e80:	34 01 00 21 	mvi r1,33
    1e84:	34 03 00 01 	mvi r3,1
    1e88:	fb ff ff 64 	calli 1c18 <spll_debug>
    1e8c:	b9 80 10 00 	mv r2,r12
    1e90:	35 61 00 3c 	addi r1,r11,60
    1e94:	fb ff ff 91 	calli 1cd8 <ld_update>
    1e98:	7c 2c 00 00 	cmpnei r12,r1,0
    1e9c:	b9 80 08 00 	mv r1,r12
    1ea0:	2b 9d 00 04 	lw ra,(sp+4)
    1ea4:	2b 8b 00 10 	lw r11,(sp+16)
    1ea8:	2b 8c 00 0c 	lw r12,(sp+12)
    1eac:	2b 8d 00 08 	lw r13,(sp+8)
    1eb0:	37 9c 00 10 	addi sp,sp,16
    1eb4:	c3 a0 00 00 	ret

00001eb8 <external_update>:
    1eb8:	37 9c ff ec 	addi sp,sp,-20
    1ebc:	5b 8b 00 14 	sw (sp+20),r11
    1ec0:	5b 8c 00 10 	sw (sp+16),r12
    1ec4:	5b 8d 00 0c 	sw (sp+12),r13
    1ec8:	5b 8e 00 08 	sw (sp+8),r14
    1ecc:	5b 9d 00 04 	sw (sp+4),ra
    1ed0:	b8 40 68 00 	mv r13,r2
    1ed4:	28 22 00 00 	lw r2,(r1+0)
    1ed8:	b8 20 58 00 	mv r11,r1
    1edc:	34 01 00 00 	mvi r1,0
    1ee0:	5c 62 00 9b 	bne r3,r2,214c <external_update+0x294>
    1ee4:	29 61 00 1c 	lw r1,(r11+28)
    1ee8:	78 0e 00 01 	mvhi r14,0x1
    1eec:	34 03 00 02 	mvi r3,2
    1ef0:	a1 ae 70 00 	and r14,r13,r14
    1ef4:	44 23 00 12 	be r1,r3,1f3c <external_update+0x84>
    1ef8:	48 23 00 04 	bg r1,r3,1f08 <external_update+0x50>
    1efc:	34 02 00 01 	mvi r2,1
    1f00:	5c 22 00 43 	bne r1,r2,200c <external_update+0x154>
    1f04:	e0 00 00 06 	bi 1f1c <external_update+0x64>
    1f08:	34 02 00 03 	mvi r2,3
    1f0c:	44 22 00 1e 	be r1,r2,1f84 <external_update+0xcc>
    1f10:	34 02 00 04 	mvi r2,4
    1f14:	5c 22 00 3e 	bne r1,r2,200c <external_update+0x154>
    1f18:	e0 00 00 2b 	bi 1fc4 <external_update+0x10c>
    1f1c:	78 02 00 01 	mvhi r2,0x1
    1f20:	38 42 2d 44 	ori r2,r2,0x2d44
    1f24:	28 41 00 00 	lw r1,(r2+0)
    1f28:	28 22 00 04 	lw r2,(r1+4)
    1f2c:	38 42 00 04 	ori r2,r2,0x4
    1f30:	58 22 00 04 	sw (r1+4),r2
    1f34:	59 63 00 1c 	sw (r11+28),r3
    1f38:	e0 00 00 20 	bi 1fb8 <external_update+0x100>
    1f3c:	78 03 00 01 	mvhi r3,0x1
    1f40:	38 63 2d 44 	ori r3,r3,0x2d44
    1f44:	28 6c 00 00 	lw r12,(r3+0)
    1f48:	29 81 00 04 	lw r1,(r12+4)
    1f4c:	20 21 00 08 	andi r1,r1,0x8
    1f50:	44 20 00 03 	be r1,r0,1f5c <external_update+0xa4>
    1f54:	34 01 00 03 	mvi r1,3
    1f58:	e0 00 00 2c 	bi 2008 <external_update+0x150>
    1f5c:	fb ff fe d5 	calli 1ab0 <timer_get_tics>
    1f60:	29 62 00 20 	lw r2,(r11+32)
    1f64:	c8 22 08 00 	sub r1,r1,r2
    1f68:	34 02 07 d0 	mvi r2,2000
    1f6c:	50 41 00 28 	bgeu r2,r1,200c <external_update+0x154>
    1f70:	29 82 00 04 	lw r2,(r12+4)
    1f74:	34 01 ff fb 	mvi r1,-5
    1f78:	a0 41 08 00 	and r1,r2,r1
    1f7c:	59 81 00 04 	sw (r12+4),r1
    1f80:	e0 00 00 21 	bi 2004 <external_update+0x14c>
    1f84:	29 62 00 68 	lw r2,(r11+104)
    1f88:	44 40 00 21 	be r2,r0,200c <external_update+0x154>
    1f8c:	78 02 00 01 	mvhi r2,0x1
    1f90:	38 42 2c dc 	ori r2,r2,0x2cdc
    1f94:	28 43 00 00 	lw r3,(r2+0)
    1f98:	58 61 00 00 	sw (r3+0),r1
    1f9c:	58 60 00 14 	sw (r3+20),r0
    1fa0:	58 60 00 18 	sw (r3+24),r0
    1fa4:	58 60 00 10 	sw (r3+16),r0
    1fa8:	34 01 00 01 	mvi r1,1
    1fac:	58 61 00 1c 	sw (r3+28),r1
    1fb0:	34 01 00 04 	mvi r1,4
    1fb4:	59 61 00 1c 	sw (r11+28),r1
    1fb8:	fb ff fe be 	calli 1ab0 <timer_get_tics>
    1fbc:	59 61 00 20 	sw (r11+32),r1
    1fc0:	e0 00 00 13 	bi 200c <external_update+0x154>
    1fc4:	78 03 00 01 	mvhi r3,0x1
    1fc8:	38 63 2c dc 	ori r3,r3,0x2cdc
    1fcc:	28 6c 00 00 	lw r12,(r3+0)
    1fd0:	29 81 00 1c 	lw r1,(r12+28)
    1fd4:	20 21 00 01 	andi r1,r1,0x1
    1fd8:	44 20 00 05 	be r1,r0,1fec <external_update+0x134>
    1fdc:	34 01 00 06 	mvi r1,6
    1fe0:	59 81 00 1c 	sw (r12+28),r1
    1fe4:	34 01 00 07 	mvi r1,7
    1fe8:	e0 00 00 08 	bi 2008 <external_update+0x150>
    1fec:	fb ff fe b1 	calli 1ab0 <timer_get_tics>
    1ff0:	29 62 00 20 	lw r2,(r11+32)
    1ff4:	c8 22 08 00 	sub r1,r1,r2
    1ff8:	34 02 07 d0 	mvi r2,2000
    1ffc:	50 41 00 04 	bgeu r2,r1,200c <external_update+0x154>
    2000:	59 80 00 1c 	sw (r12+28),r0
    2004:	34 01 00 05 	mvi r1,5
    2008:	59 61 00 1c 	sw (r11+28),r1
    200c:	21 a2 ff ff 	andi r2,r13,0xffff
    2010:	45 c0 00 09 	be r14,r0,2034 <external_update+0x17c>
    2014:	29 63 00 14 	lw r3,(r11+20)
    2018:	29 61 00 08 	lw r1,(r11+8)
    201c:	4c 62 00 03 	bge r3,r2,2028 <external_update+0x170>
    2020:	78 03 ff ff 	mvhi r3,0xffff
    2024:	e0 00 00 02 	bi 202c <external_update+0x174>
    2028:	78 03 00 01 	mvhi r3,0x1
    202c:	b4 23 08 00 	add r1,r1,r3
    2030:	59 61 00 08 	sw (r11+8),r1
    2034:	29 61 00 08 	lw r1,(r11+8)
    2038:	29 63 00 10 	lw r3,(r11+16)
    203c:	59 62 00 14 	sw (r11+20),r2
    2040:	b4 41 10 00 	add r2,r2,r1
    2044:	59 62 00 10 	sw (r11+16),r2
    2048:	35 61 00 24 	addi r1,r11,36
    204c:	c8 43 10 00 	sub r2,r2,r3
    2050:	fb ff fe aa 	calli 1af8 <pi_update>
    2054:	29 62 00 4c 	lw r2,(r11+76)
    2058:	78 03 80 00 	mvhi r3,0x8000
    205c:	5c 43 00 04 	bne r2,r3,206c <external_update+0x1b4>
    2060:	59 61 00 4c 	sw (r11+76),r1
    2064:	b8 20 60 00 	mv r12,r1
    2068:	e0 00 00 0a 	bi 2090 <external_update+0x1d8>
    206c:	29 6c 00 48 	lw r12,(r11+72)
    2070:	c8 22 18 00 	sub r3,r1,r2
    2074:	88 6c 18 00 	mul r3,r3,r12
    2078:	14 6c 00 0f 	sri r12,r3,15
    207c:	14 63 00 10 	sri r3,r3,16
    2080:	21 8c 00 01 	andi r12,r12,0x1
    2084:	b4 6c 60 00 	add r12,r3,r12
    2088:	b5 82 60 00 	add r12,r12,r2
    208c:	59 6c 00 4c 	sw (r11+76),r12
    2090:	29 62 00 54 	lw r2,(r11+84)
    2094:	78 03 80 00 	mvhi r3,0x8000
    2098:	5c 43 00 04 	bne r2,r3,20a8 <external_update+0x1f0>
    209c:	59 61 00 54 	sw (r11+84),r1
    20a0:	b8 20 68 00 	mv r13,r1
    20a4:	e0 00 00 0a 	bi 20cc <external_update+0x214>
    20a8:	29 6d 00 50 	lw r13,(r11+80)
    20ac:	c8 22 08 00 	sub r1,r1,r2
    20b0:	88 2d 08 00 	mul r1,r1,r13
    20b4:	14 2d 00 0f 	sri r13,r1,15
    20b8:	14 21 00 10 	sri r1,r1,16
    20bc:	21 ad 00 01 	andi r13,r13,0x1
    20c0:	b4 2d 68 00 	add r13,r1,r13
    20c4:	b5 a2 68 00 	add r13,r13,r2
    20c8:	59 6d 00 54 	sw (r11+84),r13
    20cc:	78 02 00 01 	mvhi r2,0x1
    20d0:	38 42 2d 44 	ori r2,r2,0x2d44
    20d4:	28 41 00 00 	lw r1,(r2+0)
    20d8:	28 21 00 04 	lw r1,(r1+4)
    20dc:	20 21 00 10 	andi r1,r1,0x10
    20e0:	5c 20 00 04 	bne r1,r0,20f0 <external_update+0x238>
    20e4:	59 60 00 68 	sw (r11+104),r0
    20e8:	59 60 00 58 	sw (r11+88),r0
    20ec:	34 0c 7d 00 	mvi r12,32000
    20f0:	78 03 00 01 	mvhi r3,0x1
    20f4:	38 63 2d 44 	ori r3,r3,0x2d44
    20f8:	28 61 00 00 	lw r1,(r3+0)
    20fc:	21 82 ff ff 	andi r2,r12,0xffff
    2100:	34 03 00 00 	mvi r3,0
    2104:	58 22 00 24 	sw (r1+36),r2
    2108:	34 01 00 41 	mvi r1,65
    210c:	b9 a0 10 00 	mv r2,r13
    2110:	fb ff fe c2 	calli 1c18 <spll_debug>
    2114:	29 62 00 04 	lw r2,(r11+4)
    2118:	34 03 00 00 	mvi r3,0
    211c:	34 41 00 01 	addi r1,r2,1
    2120:	59 61 00 04 	sw (r11+4),r1
    2124:	34 01 00 46 	mvi r1,70
    2128:	fb ff fe bc 	calli 1c18 <spll_debug>
    212c:	34 01 00 40 	mvi r1,64
    2130:	b9 80 10 00 	mv r2,r12
    2134:	34 03 00 01 	mvi r3,1
    2138:	fb ff fe b8 	calli 1c18 <spll_debug>
    213c:	35 61 00 58 	addi r1,r11,88
    2140:	c9 8d 10 00 	sub r2,r12,r13
    2144:	fb ff fe e5 	calli 1cd8 <ld_update>
    2148:	7c 21 00 00 	cmpnei r1,r1,0
    214c:	2b 9d 00 04 	lw ra,(sp+4)
    2150:	2b 8b 00 14 	lw r11,(sp+20)
    2154:	2b 8c 00 10 	lw r12,(sp+16)
    2158:	2b 8d 00 0c 	lw r13,(sp+12)
    215c:	2b 8e 00 08 	lw r14,(sp+8)
    2160:	37 9c 00 14 	addi sp,sp,20
    2164:	c3 a0 00 00 	ret

00002168 <mpll_update>:
    2168:	37 9c ff f0 	addi sp,sp,-16
    216c:	5b 8b 00 10 	sw (sp+16),r11
    2170:	5b 8c 00 0c 	sw (sp+12),r12
    2174:	5b 8d 00 08 	sw (sp+8),r13
    2178:	5b 9d 00 04 	sw (sp+4),ra
    217c:	b8 20 58 00 	mv r11,r1
    2180:	28 21 00 6c 	lw r1,(r1+108)
    2184:	5c 61 00 02 	bne r3,r1,218c <mpll_update+0x24>
    2188:	59 62 00 44 	sw (r11+68),r2
    218c:	29 61 00 70 	lw r1,(r11+112)
    2190:	5c 61 00 02 	bne r3,r1,2198 <mpll_update+0x30>
    2194:	59 62 00 48 	sw (r11+72),r2
    2198:	29 63 00 44 	lw r3,(r11+68)
    219c:	34 01 00 00 	mvi r1,0
    21a0:	48 03 00 6d 	bg r0,r3,2354 <mpll_update+0x1ec>
    21a4:	29 62 00 48 	lw r2,(r11+72)
    21a8:	48 02 00 6b 	bg r0,r2,2354 <mpll_update+0x1ec>
    21ac:	29 61 00 4c 	lw r1,(r11+76)
    21b0:	48 01 00 06 	bg r0,r1,21c8 <mpll_update+0x60>
    21b4:	4c 61 00 05 	bge r3,r1,21c8 <mpll_update+0x60>
    21b8:	29 63 00 3c 	lw r3,(r11+60)
    21bc:	78 01 00 40 	mvhi r1,0x40
    21c0:	b4 61 08 00 	add r1,r3,r1
    21c4:	59 61 00 3c 	sw (r11+60),r1
    21c8:	29 61 00 50 	lw r1,(r11+80)
    21cc:	48 01 00 06 	bg r0,r1,21e4 <mpll_update+0x7c>
    21d0:	4c 41 00 05 	bge r2,r1,21e4 <mpll_update+0x7c>
    21d4:	29 62 00 40 	lw r2,(r11+64)
    21d8:	78 01 00 40 	mvhi r1,0x40
    21dc:	b4 41 08 00 	add r1,r2,r1
    21e0:	59 61 00 40 	sw (r11+64),r1
    21e4:	29 62 00 44 	lw r2,(r11+68)
    21e8:	29 6c 00 3c 	lw r12,(r11+60)
    21ec:	29 61 00 48 	lw r1,(r11+72)
    21f0:	59 62 00 4c 	sw (r11+76),r2
    21f4:	b4 4c 60 00 	add r12,r2,r12
    21f8:	29 62 00 40 	lw r2,(r11+64)
    21fc:	59 61 00 50 	sw (r11+80),r1
    2200:	c9 82 60 00 	sub r12,r12,r2
    2204:	c9 81 60 00 	sub r12,r12,r1
    2208:	29 61 00 38 	lw r1,(r11+56)
    220c:	44 20 00 06 	be r1,r0,2224 <mpll_update+0xbc>
    2210:	21 8c 3f ff 	andi r12,r12,0x3fff
    2214:	21 81 20 00 	andi r1,r12,0x2000
    2218:	44 20 00 03 	be r1,r0,2224 <mpll_update+0xbc>
    221c:	34 01 c0 00 	mvi r1,-16384
    2220:	b9 81 60 00 	or r12,r12,r1
    2224:	b9 80 10 00 	mv r2,r12
    2228:	35 61 00 04 	addi r1,r11,4
    222c:	fb ff fe 33 	calli 1af8 <pi_update>
    2230:	29 62 00 7c 	lw r2,(r11+124)
    2234:	78 03 00 01 	mvhi r3,0x1
    2238:	b8 20 68 00 	mv r13,r1
    223c:	20 42 00 0f 	andi r2,r2,0xf
    2240:	3c 42 00 10 	sli r2,r2,16
    2244:	20 21 ff ff 	andi r1,r1,0xffff
    2248:	38 63 2d 44 	ori r3,r3,0x2d44
    224c:	b8 22 10 00 	or r2,r1,r2
    2250:	28 61 00 00 	lw r1,(r3+0)
    2254:	58 22 00 24 	sw (r1+36),r2
    2258:	29 63 00 3c 	lw r3,(r11+60)
    225c:	29 62 00 44 	lw r2,(r11+68)
    2260:	34 01 00 05 	mvi r1,5
    2264:	b4 62 10 00 	add r2,r3,r2
    2268:	34 03 00 00 	mvi r3,0
    226c:	fb ff fe 6b 	calli 1c18 <spll_debug>
    2270:	29 63 00 40 	lw r3,(r11+64)
    2274:	29 62 00 48 	lw r2,(r11+72)
    2278:	34 01 00 02 	mvi r1,2
    227c:	b4 62 10 00 	add r2,r3,r2
    2280:	34 03 00 00 	mvi r3,0
    2284:	fb ff fe 65 	calli 1c18 <spll_debug>
    2288:	34 01 00 01 	mvi r1,1
    228c:	b9 80 10 00 	mv r2,r12
    2290:	34 03 00 00 	mvi r3,0
    2294:	fb ff fe 61 	calli 1c18 <spll_debug>
    2298:	29 62 00 74 	lw r2,(r11+116)
    229c:	34 03 00 00 	mvi r3,0
    22a0:	34 41 00 01 	addi r1,r2,1
    22a4:	59 61 00 74 	sw (r11+116),r1
    22a8:	34 01 00 06 	mvi r1,6
    22ac:	fb ff fe 5b 	calli 1c18 <spll_debug>
    22b0:	34 01 00 00 	mvi r1,0
    22b4:	34 03 00 01 	mvi r3,1
    22b8:	b9 a0 10 00 	mv r2,r13
    22bc:	fb ff fe 57 	calli 1c18 <spll_debug>
    22c0:	78 04 00 01 	mvhi r4,0x1
    22c4:	34 01 ff ff 	mvi r1,-1
    22c8:	38 84 2d 54 	ori r4,r4,0x2d54
    22cc:	59 61 00 48 	sw (r11+72),r1
    22d0:	59 61 00 44 	sw (r11+68),r1
    22d4:	29 63 00 3c 	lw r3,(r11+60)
    22d8:	28 81 00 00 	lw r1,(r4+0)
    22dc:	4c 23 00 0a 	bge r1,r3,2304 <mpll_update+0x19c>
    22e0:	29 62 00 40 	lw r2,(r11+64)
    22e4:	4c 22 00 08 	bge r1,r2,2304 <mpll_update+0x19c>
    22e8:	78 04 00 01 	mvhi r4,0x1
    22ec:	38 84 2d 58 	ori r4,r4,0x2d58
    22f0:	28 81 00 00 	lw r1,(r4+0)
    22f4:	b4 61 18 00 	add r3,r3,r1
    22f8:	b4 41 08 00 	add r1,r2,r1
    22fc:	59 63 00 3c 	sw (r11+60),r3
    2300:	59 61 00 40 	sw (r11+64),r1
    2304:	29 61 00 38 	lw r1,(r11+56)
    2308:	44 20 00 0f 	be r1,r0,2344 <mpll_update+0x1dc>
    230c:	29 61 00 68 	lw r1,(r11+104)
    2310:	29 62 00 64 	lw r2,(r11+100)
    2314:	4c 22 00 06 	bge r1,r2,232c <mpll_update+0x1c4>
    2318:	34 21 00 01 	addi r1,r1,1
    231c:	59 61 00 68 	sw (r11+104),r1
    2320:	29 61 00 3c 	lw r1,(r11+60)
    2324:	34 21 00 01 	addi r1,r1,1
    2328:	e0 00 00 06 	bi 2340 <mpll_update+0x1d8>
    232c:	4c 41 00 06 	bge r2,r1,2344 <mpll_update+0x1dc>
    2330:	34 21 ff ff 	addi r1,r1,-1
    2334:	59 61 00 68 	sw (r11+104),r1
    2338:	29 61 00 3c 	lw r1,(r11+60)
    233c:	34 21 ff ff 	addi r1,r1,-1
    2340:	59 61 00 3c 	sw (r11+60),r1
    2344:	35 61 00 28 	addi r1,r11,40
    2348:	b9 80 10 00 	mv r2,r12
    234c:	fb ff fe 63 	calli 1cd8 <ld_update>
    2350:	7c 21 00 00 	cmpnei r1,r1,0
    2354:	2b 9d 00 04 	lw ra,(sp+4)
    2358:	2b 8b 00 10 	lw r11,(sp+16)
    235c:	2b 8c 00 0c 	lw r12,(sp+12)
    2360:	2b 8d 00 08 	lw r13,(sp+8)
    2364:	37 9c 00 10 	addi sp,sp,16
    2368:	c3 a0 00 00 	ret

0000236c <_irq_entry>:
    236c:	37 9c ff ac 	addi sp,sp,-84
    2370:	5b 8b 00 44 	sw (sp+68),r11
    2374:	5b 8c 00 40 	sw (sp+64),r12
    2378:	5b 8d 00 3c 	sw (sp+60),r13
    237c:	5b 8e 00 38 	sw (sp+56),r14
    2380:	5b 8f 00 34 	sw (sp+52),r15
    2384:	5b 90 00 30 	sw (sp+48),r16
    2388:	5b 91 00 2c 	sw (sp+44),r17
    238c:	5b 92 00 28 	sw (sp+40),r18
    2390:	5b 93 00 24 	sw (sp+36),r19
    2394:	5b 94 00 20 	sw (sp+32),r20
    2398:	5b 95 00 1c 	sw (sp+28),r21
    239c:	5b 96 00 18 	sw (sp+24),r22
    23a0:	5b 97 00 14 	sw (sp+20),r23
    23a4:	5b 98 00 10 	sw (sp+16),r24
    23a8:	5b 99 00 0c 	sw (sp+12),r25
    23ac:	5b 9b 00 08 	sw (sp+8),fp
    23b0:	5b 9d 00 04 	sw (sp+4),ra
    23b4:	78 01 00 01 	mvhi r1,0x1
    23b8:	38 21 2d 44 	ori r1,r1,0x2d44
    23bc:	78 0b 00 01 	mvhi r11,0x1
    23c0:	78 18 00 01 	mvhi r24,0x1
    23c4:	78 11 00 01 	mvhi r17,0x1
    23c8:	78 14 00 01 	mvhi r20,0x1
    23cc:	78 12 00 01 	mvhi r18,0x1
    23d0:	78 16 00 01 	mvhi r22,0x1
    23d4:	78 15 00 01 	mvhi r21,0x1
    23d8:	78 17 00 01 	mvhi r23,0x1
    23dc:	28 33 00 00 	lw r19,(r1+0)
    23e0:	39 6b 66 2c 	ori r11,r11,0x662c
    23e4:	34 19 00 09 	mvi r25,9
    23e8:	3b 18 2d 5c 	ori r24,r24,0x2d5c
    23ec:	34 10 00 01 	mvi r16,1
    23f0:	3a 31 68 40 	ori r17,r17,0x6840
    23f4:	3a 94 68 3c 	ori r20,r20,0x683c
    23f8:	3a 52 66 98 	ori r18,r18,0x6698
    23fc:	3a d6 66 48 	ori r22,r22,0x6648
    2400:	3a b5 68 38 	ori r21,r21,0x6838
    2404:	3a f7 67 04 	ori r23,r23,0x6704
    2408:	e0 00 01 64 	bi 2998 <_irq_entry+0x62c>
    240c:	2a 61 00 5c 	lw r1,(r19+92)
    2410:	78 02 00 ff 	mvhi r2,0xff
    2414:	38 42 ff ff 	ori r2,r2,0xffff
    2418:	5b 81 00 54 	sw (sp+84),r1
    241c:	2b 8d 00 54 	lw r13,(sp+84)
    2420:	2b 8e 00 54 	lw r14,(sp+84)
    2424:	29 61 00 04 	lw r1,(r11+4)
    2428:	01 ad 00 18 	srui r13,r13,24
    242c:	a1 c2 70 00 	and r14,r14,r2
    2430:	34 21 ff ff 	addi r1,r1,-1
    2434:	21 ad 00 7f 	andi r13,r13,0x7f
    2438:	54 39 00 bf 	bgu r1,r25,2734 <_irq_entry+0x3c8>
    243c:	3c 21 00 02 	sli r1,r1,2
    2440:	b7 01 08 00 	add r1,r24,r1
    2444:	28 21 00 00 	lw r1,(r1+0)
    2448:	c0 20 00 00 	b r1
    244c:	38 01 ff ff 	mvu r1,0xffff
    2450:	5a 61 00 20 	sw (r19+32),r1
    2454:	29 61 00 10 	lw r1,(r11+16)
    2458:	5a 61 00 24 	sw (r19+36),r1
    245c:	34 01 00 0a 	mvi r1,10
    2460:	59 61 00 04 	sw (r11+4),r1
    2464:	fb ff fd 93 	calli 1ab0 <timer_get_tics>
    2468:	59 61 00 0c 	sw (r11+12),r1
    246c:	e0 00 00 b2 	bi 2734 <_irq_entry+0x3c8>
    2470:	fb ff fd 90 	calli 1ab0 <timer_get_tics>
    2474:	29 62 00 0c 	lw r2,(r11+12)
    2478:	c8 22 08 00 	sub r1,r1,r2
    247c:	34 02 00 32 	mvi r2,50
    2480:	50 41 00 ad 	bgeu r2,r1,2734 <_irq_entry+0x3c8>
    2484:	29 61 00 00 	lw r1,(r11+0)
    2488:	7c 21 00 01 	cmpnei r1,r1,1
    248c:	c8 01 08 00 	sub r1,r0,r1
    2490:	20 21 00 02 	andi r1,r1,0x2
    2494:	34 21 00 01 	addi r1,r1,1
    2498:	e0 00 00 13 	bi 24e4 <_irq_entry+0x178>
    249c:	b9 c0 10 00 	mv r2,r14
    24a0:	b9 a0 18 00 	mv r3,r13
    24a4:	ba 40 08 00 	mv r1,r18
    24a8:	fb ff fe 84 	calli 1eb8 <external_update>
    24ac:	5a 60 00 04 	sw (r19+4),r0
    24b0:	59 60 00 70 	sw (r11+112),r0
    24b4:	29 61 00 84 	lw r1,(r11+132)
    24b8:	34 02 00 01 	mvi r2,1
    24bc:	34 03 00 01 	mvi r3,1
    24c0:	64 21 00 00 	cmpei r1,r1,0
    24c4:	c8 01 08 00 	sub r1,r0,r1
    24c8:	20 21 00 05 	andi r1,r1,0x5
    24cc:	34 21 00 01 	addi r1,r1,1
    24d0:	59 61 00 88 	sw (r11+136),r1
    24d4:	5a 70 00 04 	sw (r19+4),r16
    24d8:	34 01 00 44 	mvi r1,68
    24dc:	fb ff fd cf 	calli 1c18 <spll_debug>
    24e0:	34 01 00 02 	mvi r1,2
    24e4:	59 61 00 04 	sw (r11+4),r1
    24e8:	e0 00 00 93 	bi 2734 <_irq_entry+0x3c8>
    24ec:	29 61 00 d4 	lw r1,(r11+212)
    24f0:	44 20 00 91 	be r1,r0,2734 <_irq_entry+0x3c8>
    24f4:	29 61 00 84 	lw r1,(r11+132)
    24f8:	44 20 00 04 	be r1,r0,2508 <_irq_entry+0x19c>
    24fc:	29 62 00 88 	lw r2,(r11+136)
    2500:	34 01 00 07 	mvi r1,7
    2504:	5c 41 00 8c 	bne r2,r1,2734 <_irq_entry+0x3c8>
    2508:	34 01 00 03 	mvi r1,3
    250c:	e3 ff ff f6 	bi 24e4 <_irq_entry+0x178>
    2510:	59 60 00 08 	sw (r11+8),r0
    2514:	29 61 00 4c 	lw r1,(r11+76)
    2518:	34 02 00 01 	mvi r2,1
    251c:	59 61 00 40 	sw (r11+64),r1
    2520:	59 60 00 20 	sw (r11+32),r0
    2524:	59 60 00 1c 	sw (r11+28),r0
    2528:	59 60 00 2c 	sw (r11+44),r0
    252c:	34 01 ff ff 	mvi r1,-1
    2530:	59 61 00 24 	sw (r11+36),r1
    2534:	59 60 00 3c 	sw (r11+60),r0
    2538:	59 60 00 68 	sw (r11+104),r0
    253c:	59 60 00 58 	sw (r11+88),r0
    2540:	29 61 00 28 	lw r1,(r11+40)
    2544:	fb ff fd 8a 	calli 1b6c <spll_enable_tagger>
    2548:	34 01 00 24 	mvi r1,36
    254c:	34 02 00 01 	mvi r2,1
    2550:	34 03 00 01 	mvi r3,1
    2554:	fb ff fd b1 	calli 1c18 <spll_debug>
    2558:	34 01 00 04 	mvi r1,4
    255c:	e3 ff ff e2 	bi 24e4 <_irq_entry+0x178>
    2560:	29 61 00 68 	lw r1,(r11+104)
    2564:	44 20 00 74 	be r1,r0,2734 <_irq_entry+0x3c8>
    2568:	29 61 00 08 	lw r1,(r11+8)
    256c:	5c 20 00 72 	bne r1,r0,2734 <_irq_entry+0x3c8>
    2570:	59 70 00 08 	sw (r11+8),r16
    2574:	29 62 00 00 	lw r2,(r11+0)
    2578:	34 01 00 03 	mvi r1,3
    257c:	34 0f 00 00 	mvi r15,0
    2580:	34 1b ff ff 	mvi fp,-1
    2584:	5c 41 00 18 	bne r2,r1,25e4 <_irq_entry+0x278>
    2588:	34 01 00 05 	mvi r1,5
    258c:	e3 ff ff d6 	bi 24e4 <_irq_entry+0x178>
    2590:	2a 81 00 00 	lw r1,(r20+0)
    2594:	94 2f 08 00 	sr r1,r1,r15
    2598:	20 21 00 01 	andi r1,r1,0x1
    259c:	44 20 00 11 	be r1,r0,25e0 <_irq_entry+0x274>
    25a0:	09 ec 00 2c 	muli r12,r15,44
    25a4:	34 02 00 01 	mvi r2,1
    25a8:	b5 6c 60 00 	add r12,r11,r12
    25ac:	59 9b 02 00 	sw (r12+512),fp
    25b0:	29 81 02 00 	lw r1,(r12+512)
    25b4:	59 81 01 fc 	sw (r12+508),r1
    25b8:	59 80 01 f8 	sw (r12+504),r0
    25bc:	59 80 01 ec 	sw (r12+492),r0
    25c0:	59 80 01 f0 	sw (r12+496),r0
    25c4:	59 80 02 04 	sw (r12+516),r0
    25c8:	59 80 02 08 	sw (r12+520),r0
    25cc:	29 81 01 e0 	lw r1,(r12+480)
    25d0:	fb ff fd 67 	calli 1b6c <spll_enable_tagger>
    25d4:	29 81 01 e4 	lw r1,(r12+484)
    25d8:	34 02 00 01 	mvi r2,1
    25dc:	fb ff fd 64 	calli 1b6c <spll_enable_tagger>
    25e0:	35 ef 00 01 	addi r15,r15,1
    25e4:	2a 21 00 00 	lw r1,(r17+0)
    25e8:	48 2f ff ea 	bg r1,r15,2590 <_irq_entry+0x224>
    25ec:	34 01 00 08 	mvi r1,8
    25f0:	e3 ff ff bd 	bi 24e4 <_irq_entry+0x178>
    25f4:	59 60 01 18 	sw (r11+280),r0
    25f8:	29 61 01 18 	lw r1,(r11+280)
    25fc:	34 02 ff ff 	mvi r2,-1
    2600:	59 61 01 14 	sw (r11+276),r1
    2604:	59 62 01 1c 	sw (r11+284),r2
    2608:	59 62 01 20 	sw (r11+288),r2
    260c:	59 62 01 24 	sw (r11+292),r2
    2610:	59 62 01 28 	sw (r11+296),r2
    2614:	59 60 01 2c 	sw (r11+300),r0
    2618:	59 60 01 30 	sw (r11+304),r0
    261c:	59 60 01 34 	sw (r11+308),r0
    2620:	59 60 01 3c 	sw (r11+316),r0
    2624:	59 60 01 40 	sw (r11+320),r0
    2628:	59 60 01 4c 	sw (r11+332),r0
    262c:	59 60 00 e4 	sw (r11+228),r0
    2630:	59 60 01 10 	sw (r11+272),r0
    2634:	59 60 01 00 	sw (r11+256),r0
    2638:	29 61 01 44 	lw r1,(r11+324)
    263c:	34 02 00 01 	mvi r2,1
    2640:	fb ff fd 4b 	calli 1b6c <spll_enable_tagger>
    2644:	29 61 01 48 	lw r1,(r11+328)
    2648:	34 02 00 01 	mvi r2,1
    264c:	fb ff fd 48 	calli 1b6c <spll_enable_tagger>
    2650:	34 01 00 04 	mvi r1,4
    2654:	34 02 00 01 	mvi r2,1
    2658:	34 03 00 01 	mvi r3,1
    265c:	fb ff fd 6f 	calli 1c18 <spll_debug>
    2660:	34 01 00 06 	mvi r1,6
    2664:	e3 ff ff a0 	bi 24e4 <_irq_entry+0x178>
    2668:	29 61 01 10 	lw r1,(r11+272)
    266c:	44 20 00 32 	be r1,r0,2734 <_irq_entry+0x3c8>
    2670:	34 01 00 08 	mvi r1,8
    2674:	59 61 00 04 	sw (r11+4),r1
    2678:	34 0f 00 00 	mvi r15,0
    267c:	34 1b ff ff 	mvi fp,-1
    2680:	e0 00 00 16 	bi 26d8 <_irq_entry+0x36c>
    2684:	2a 81 00 00 	lw r1,(r20+0)
    2688:	94 2f 08 00 	sr r1,r1,r15
    268c:	20 21 00 01 	andi r1,r1,0x1
    2690:	44 20 00 11 	be r1,r0,26d4 <_irq_entry+0x368>
    2694:	09 ec 00 2c 	muli r12,r15,44
    2698:	34 02 00 01 	mvi r2,1
    269c:	b5 6c 60 00 	add r12,r11,r12
    26a0:	59 9b 02 00 	sw (r12+512),fp
    26a4:	29 81 02 00 	lw r1,(r12+512)
    26a8:	59 81 01 fc 	sw (r12+508),r1
    26ac:	59 80 01 f8 	sw (r12+504),r0
    26b0:	59 80 01 ec 	sw (r12+492),r0
    26b4:	59 80 01 f0 	sw (r12+496),r0
    26b8:	59 80 02 04 	sw (r12+516),r0
    26bc:	59 80 02 08 	sw (r12+520),r0
    26c0:	29 81 01 e0 	lw r1,(r12+480)
    26c4:	fb ff fd 2a 	calli 1b6c <spll_enable_tagger>
    26c8:	29 81 01 e4 	lw r1,(r12+484)
    26cc:	34 02 00 01 	mvi r2,1
    26d0:	fb ff fd 27 	calli 1b6c <spll_enable_tagger>
    26d4:	35 ef 00 01 	addi r15,r15,1
    26d8:	2a 21 00 00 	lw r1,(r17+0)
    26dc:	48 2f ff ea 	bg r1,r15,2684 <_irq_entry+0x318>
    26e0:	e0 00 00 15 	bi 2734 <_irq_entry+0x3c8>
    26e4:	29 61 00 68 	lw r1,(r11+104)
    26e8:	44 20 00 0f 	be r1,r0,2724 <_irq_entry+0x3b8>
    26ec:	29 61 00 00 	lw r1,(r11+0)
    26f0:	5c 30 00 08 	bne r1,r16,2710 <_irq_entry+0x3a4>
    26f4:	29 61 00 d4 	lw r1,(r11+212)
    26f8:	44 20 00 c6 	be r1,r0,2a10 <_irq_entry+0x6a4>
    26fc:	29 61 00 84 	lw r1,(r11+132)
    2700:	44 20 00 04 	be r1,r0,2710 <_irq_entry+0x3a4>
    2704:	29 62 00 88 	lw r2,(r11+136)
    2708:	34 01 00 07 	mvi r1,7
    270c:	5c 41 00 c1 	bne r2,r1,2a10 <_irq_entry+0x6a4>
    2710:	29 62 00 00 	lw r2,(r11+0)
    2714:	34 01 00 03 	mvi r1,3
    2718:	5c 41 00 07 	bne r2,r1,2734 <_irq_entry+0x3c8>
    271c:	29 61 01 10 	lw r1,(r11+272)
    2720:	5c 20 00 05 	bne r1,r0,2734 <_irq_entry+0x3c8>
    2724:	59 79 00 04 	sw (r11+4),r25
    2728:	29 61 00 14 	lw r1,(r11+20)
    272c:	34 21 00 01 	addi r1,r1,1
    2730:	59 61 00 14 	sw (r11+20),r1
    2734:	29 62 00 04 	lw r2,(r11+4)
    2738:	34 01 00 04 	mvi r1,4
    273c:	44 41 00 0f 	be r2,r1,2778 <_irq_entry+0x40c>
    2740:	48 41 00 04 	bg r2,r1,2750 <_irq_entry+0x3e4>
    2744:	34 01 00 02 	mvi r1,2
    2748:	5c 41 00 94 	bne r2,r1,2998 <_irq_entry+0x62c>
    274c:	e0 00 00 06 	bi 2764 <_irq_entry+0x3f8>
    2750:	34 01 00 06 	mvi r1,6
    2754:	44 41 00 14 	be r2,r1,27a4 <_irq_entry+0x438>
    2758:	34 01 00 08 	mvi r1,8
    275c:	5c 41 00 8f 	bne r2,r1,2998 <_irq_entry+0x62c>
    2760:	e0 00 00 11 	bi 27a4 <_irq_entry+0x438>
    2764:	ba 40 08 00 	mv r1,r18
    2768:	b9 c0 10 00 	mv r2,r14
    276c:	b9 a0 18 00 	mv r3,r13
    2770:	fb ff fd d2 	calli 1eb8 <external_update>
    2774:	e0 00 00 89 	bi 2998 <_irq_entry+0x62c>
    2778:	29 61 00 00 	lw r1,(r11+0)
    277c:	5c 30 00 05 	bne r1,r16,2790 <_irq_entry+0x424>
    2780:	ba 40 08 00 	mv r1,r18
    2784:	b9 c0 10 00 	mv r2,r14
    2788:	b9 a0 18 00 	mv r3,r13
    278c:	fb ff fd cb 	calli 1eb8 <external_update>
    2790:	ba c0 08 00 	mv r1,r22
    2794:	b9 c0 10 00 	mv r2,r14
    2798:	b9 a0 18 00 	mv r3,r13
    279c:	fb ff fd 70 	calli 1d5c <helper_update>
    27a0:	e0 00 00 7e 	bi 2998 <_irq_entry+0x62c>
    27a4:	ba c0 08 00 	mv r1,r22
    27a8:	b9 c0 10 00 	mv r2,r14
    27ac:	b9 a0 18 00 	mv r3,r13
    27b0:	fb ff fd 6b 	calli 1d5c <helper_update>
    27b4:	29 61 00 00 	lw r1,(r11+0)
    27b8:	5c 30 00 05 	bne r1,r16,27cc <_irq_entry+0x460>
    27bc:	ba 40 08 00 	mv r1,r18
    27c0:	b9 c0 10 00 	mv r2,r14
    27c4:	b9 a0 18 00 	mv r3,r13
    27c8:	fb ff fd bc 	calli 1eb8 <external_update>
    27cc:	29 62 00 00 	lw r2,(r11+0)
    27d0:	34 01 00 03 	mvi r1,3
    27d4:	5c 41 00 05 	bne r2,r1,27e8 <_irq_entry+0x47c>
    27d8:	ba e0 08 00 	mv r1,r23
    27dc:	b9 c0 10 00 	mv r2,r14
    27e0:	b9 a0 18 00 	mv r3,r13
    27e4:	fb ff fe 61 	calli 2168 <mpll_update>
    27e8:	2a 26 00 00 	lw r6,(r17+0)
    27ec:	34 0c 00 00 	mvi r12,0
    27f0:	34 05 ff ff 	mvi r5,-1
    27f4:	34 03 10 00 	mvi r3,4096
    27f8:	34 1b 2f ff 	mvi fp,12287
    27fc:	e0 00 00 5a 	bi 2964 <_irq_entry+0x5f8>
    2800:	2a 81 00 00 	lw r1,(r20+0)
    2804:	94 2c 08 00 	sr r1,r1,r12
    2808:	20 21 00 01 	andi r1,r1,0x1
    280c:	44 20 00 55 	be r1,r0,2960 <_irq_entry+0x5f4>
    2810:	09 81 00 2c 	muli r1,r12,44
    2814:	b5 61 08 00 	add r1,r11,r1
    2818:	28 22 01 e0 	lw r2,(r1+480)
    281c:	5d a2 00 02 	bne r13,r2,2824 <_irq_entry+0x4b8>
    2820:	58 2e 01 fc 	sw (r1+508),r14
    2824:	09 81 00 2c 	muli r1,r12,44
    2828:	b5 61 08 00 	add r1,r11,r1
    282c:	28 22 01 e4 	lw r2,(r1+484)
    2830:	5d a2 00 02 	bne r13,r2,2838 <_irq_entry+0x4cc>
    2834:	58 2e 02 00 	sw (r1+512),r14
    2838:	09 84 00 2c 	muli r4,r12,44
    283c:	b5 64 20 00 	add r4,r11,r4
    2840:	28 81 01 fc 	lw r1,(r4+508)
    2844:	48 01 00 47 	bg r0,r1,2960 <_irq_entry+0x5f4>
    2848:	28 81 02 00 	lw r1,(r4+512)
    284c:	48 01 00 45 	bg r0,r1,2960 <_irq_entry+0x5f4>
    2850:	28 82 01 fc 	lw r2,(r4+508)
    2854:	28 81 02 00 	lw r1,(r4+512)
    2858:	c8 41 10 00 	sub r2,r2,r1
    285c:	28 81 02 04 	lw r1,(r4+516)
    2860:	20 42 3f ff 	andi r2,r2,0x3fff
    2864:	34 21 00 01 	addi r1,r1,1
    2868:	58 81 02 04 	sw (r4+516),r1
    286c:	28 81 01 f0 	lw r1,(r4+496)
    2870:	5c 20 00 0f 	bne r1,r0,28ac <_irq_entry+0x540>
    2874:	48 43 00 03 	bg r2,r3,2880 <_irq_entry+0x514>
    2878:	58 85 02 08 	sw (r4+520),r5
    287c:	e0 00 00 05 	bi 2890 <_irq_entry+0x524>
    2880:	4f 62 00 03 	bge fp,r2,288c <_irq_entry+0x520>
    2884:	58 90 02 08 	sw (r4+520),r16
    2888:	e0 00 00 02 	bi 2890 <_irq_entry+0x524>
    288c:	58 80 02 08 	sw (r4+520),r0
    2890:	09 81 00 2c 	muli r1,r12,44
    2894:	b5 61 08 00 	add r1,r11,r1
    2898:	28 24 01 f0 	lw r4,(r1+496)
    289c:	34 84 00 01 	addi r4,r4,1
    28a0:	58 24 01 f0 	sw (r1+496),r4
    28a4:	58 22 01 ec 	sw (r1+492),r2
    28a8:	e0 00 00 29 	bi 294c <_irq_entry+0x5e0>
    28ac:	48 43 00 06 	bg r2,r3,28c4 <_irq_entry+0x558>
    28b0:	28 81 02 08 	lw r1,(r4+520)
    28b4:	4c 01 00 0c 	bge r0,r1,28e4 <_irq_entry+0x578>
    28b8:	28 81 01 ec 	lw r1,(r4+492)
    28bc:	34 21 40 00 	addi r1,r1,16384
    28c0:	e0 00 00 06 	bi 28d8 <_irq_entry+0x56c>
    28c4:	4f 62 00 08 	bge fp,r2,28e4 <_irq_entry+0x578>
    28c8:	28 81 02 08 	lw r1,(r4+520)
    28cc:	4c 20 00 06 	bge r1,r0,28e4 <_irq_entry+0x578>
    28d0:	28 81 01 ec 	lw r1,(r4+492)
    28d4:	34 21 c0 00 	addi r1,r1,-16384
    28d8:	b4 22 10 00 	add r2,r1,r2
    28dc:	58 82 01 ec 	sw (r4+492),r2
    28e0:	e0 00 00 06 	bi 28f8 <_irq_entry+0x58c>
    28e4:	09 81 00 2c 	muli r1,r12,44
    28e8:	b5 61 08 00 	add r1,r11,r1
    28ec:	28 24 01 ec 	lw r4,(r1+492)
    28f0:	b4 44 10 00 	add r2,r2,r4
    28f4:	58 22 01 ec 	sw (r1+492),r2
    28f8:	09 8f 00 2c 	muli r15,r12,44
    28fc:	b5 6f 78 00 	add r15,r11,r15
    2900:	29 e1 01 f0 	lw r1,(r15+496)
    2904:	34 21 00 01 	addi r1,r1,1
    2908:	59 e1 01 f0 	sw (r15+496),r1
    290c:	29 e2 01 f0 	lw r2,(r15+496)
    2910:	29 e1 01 e8 	lw r1,(r15+488)
    2914:	5c 41 00 0e 	bne r2,r1,294c <_irq_entry+0x5e0>
    2918:	29 e1 01 ec 	lw r1,(r15+492)
    291c:	29 e2 01 e8 	lw r2,(r15+488)
    2920:	5b 83 00 48 	sw (sp+72),r3
    2924:	5b 85 00 4c 	sw (sp+76),r5
    2928:	5b 86 00 50 	sw (sp+80),r6
    292c:	f8 00 3e d9 	calli 12490 <__divsi3>
    2930:	59 e1 01 f4 	sw (r15+500),r1
    2934:	59 f0 01 f8 	sw (r15+504),r16
    2938:	2b 86 00 50 	lw r6,(sp+80)
    293c:	2b 85 00 4c 	lw r5,(sp+76)
    2940:	2b 83 00 48 	lw r3,(sp+72)
    2944:	59 e0 01 ec 	sw (r15+492),r0
    2948:	59 e0 01 f0 	sw (r15+496),r0
    294c:	09 81 00 2c 	muli r1,r12,44
    2950:	b5 61 08 00 	add r1,r11,r1
    2954:	58 25 01 fc 	sw (r1+508),r5
    2958:	28 22 01 fc 	lw r2,(r1+508)
    295c:	58 22 02 00 	sw (r1+512),r2
    2960:	35 8c 00 01 	addi r12,r12,1
    2964:	48 cc ff a7 	bg r6,r12,2800 <_irq_entry+0x494>
    2968:	34 0c 00 00 	mvi r12,0
    296c:	e0 00 00 08 	bi 298c <_irq_entry+0x620>
    2970:	3d 81 00 07 	sli r1,r12,7
    2974:	b9 c0 10 00 	mv r2,r14
    2978:	34 21 01 58 	addi r1,r1,344
    297c:	b5 61 08 00 	add r1,r11,r1
    2980:	b9 a0 18 00 	mv r3,r13
    2984:	fb ff fd f9 	calli 2168 <mpll_update>
    2988:	35 8c 00 01 	addi r12,r12,1
    298c:	2a a1 00 00 	lw r1,(r21+0)
    2990:	34 21 ff ff 	addi r1,r1,-1
    2994:	48 2c ff f7 	bg r1,r12,2970 <_irq_entry+0x604>
    2998:	2a 61 00 60 	lw r1,(r19+96)
    299c:	78 02 00 02 	mvhi r2,0x2
    29a0:	a0 22 08 00 	and r1,r1,r2
    29a4:	44 20 fe 9a 	be r1,r0,240c <_irq_entry+0xa0>
    29a8:	78 01 00 01 	mvhi r1,0x1
    29ac:	38 21 66 28 	ori r1,r1,0x6628
    29b0:	28 22 00 00 	lw r2,(r1+0)
    29b4:	34 42 00 01 	addi r2,r2,1
    29b8:	58 22 00 00 	sw (r1+0),r2
    29bc:	34 01 00 01 	mvi r1,1
    29c0:	d0 41 00 00 	wcsr IP,r1
    29c4:	2b 9d 00 04 	lw ra,(sp+4)
    29c8:	2b 8b 00 44 	lw r11,(sp+68)
    29cc:	2b 8c 00 40 	lw r12,(sp+64)
    29d0:	2b 8d 00 3c 	lw r13,(sp+60)
    29d4:	2b 8e 00 38 	lw r14,(sp+56)
    29d8:	2b 8f 00 34 	lw r15,(sp+52)
    29dc:	2b 90 00 30 	lw r16,(sp+48)
    29e0:	2b 91 00 2c 	lw r17,(sp+44)
    29e4:	2b 92 00 28 	lw r18,(sp+40)
    29e8:	2b 93 00 24 	lw r19,(sp+36)
    29ec:	2b 94 00 20 	lw r20,(sp+32)
    29f0:	2b 95 00 1c 	lw r21,(sp+28)
    29f4:	2b 96 00 18 	lw r22,(sp+24)
    29f8:	2b 97 00 14 	lw r23,(sp+20)
    29fc:	2b 98 00 10 	lw r24,(sp+16)
    2a00:	2b 99 00 0c 	lw r25,(sp+12)
    2a04:	2b 9b 00 08 	lw fp,(sp+8)
    2a08:	37 9c 00 54 	addi sp,sp,84
    2a0c:	c3 a0 00 00 	ret
    2a10:	59 70 00 04 	sw (r11+4),r16
    2a14:	e3 ff ff 45 	bi 2728 <_irq_entry+0x3bc>

00002a18 <spll_clear_dacs>:
    2a18:	37 9c ff fc 	addi sp,sp,-4
    2a1c:	5b 9d 00 04 	sw (sp+4),ra
    2a20:	78 02 00 01 	mvhi r2,0x1
    2a24:	38 42 2d 44 	ori r2,r2,0x2d44
    2a28:	28 41 00 00 	lw r1,(r2+0)
    2a2c:	58 20 00 20 	sw (r1+32),r0
    2a30:	58 20 00 24 	sw (r1+36),r0
    2a34:	34 01 27 10 	mvi r1,10000
    2a38:	fb ff fc 23 	calli 1ac4 <timer_delay>
    2a3c:	2b 9d 00 04 	lw ra,(sp+4)
    2a40:	37 9c 00 04 	addi sp,sp,4
    2a44:	c3 a0 00 00 	ret

00002a48 <spll_init>:
    2a48:	37 9c ff a0 	addi sp,sp,-96
    2a4c:	5b 8b 00 44 	sw (sp+68),r11
    2a50:	5b 8c 00 40 	sw (sp+64),r12
    2a54:	5b 8d 00 3c 	sw (sp+60),r13
    2a58:	5b 8e 00 38 	sw (sp+56),r14
    2a5c:	5b 8f 00 34 	sw (sp+52),r15
    2a60:	5b 90 00 30 	sw (sp+48),r16
    2a64:	5b 91 00 2c 	sw (sp+44),r17
    2a68:	5b 92 00 28 	sw (sp+40),r18
    2a6c:	5b 93 00 24 	sw (sp+36),r19
    2a70:	5b 94 00 20 	sw (sp+32),r20
    2a74:	5b 95 00 1c 	sw (sp+28),r21
    2a78:	5b 96 00 18 	sw (sp+24),r22
    2a7c:	5b 97 00 14 	sw (sp+20),r23
    2a80:	5b 98 00 10 	sw (sp+16),r24
    2a84:	5b 99 00 0c 	sw (sp+12),r25
    2a88:	5b 9b 00 08 	sw (sp+8),fp
    2a8c:	5b 9d 00 04 	sw (sp+4),ra
    2a90:	b8 20 68 00 	mv r13,r1
    2a94:	b8 40 78 00 	mv r15,r2
    2a98:	b8 60 90 00 	mv r18,r3
    2a9c:	fb ff f7 19 	calli 700 <disable_irq>
    2aa0:	78 01 00 01 	mvhi r1,0x1
    2aa4:	38 21 2d 44 	ori r1,r1,0x2d44
    2aa8:	28 24 00 00 	lw r4,(r1+0)
    2aac:	78 0c 00 01 	mvhi r12,0x1
    2ab0:	39 8c 68 40 	ori r12,r12,0x6840
    2ab4:	28 81 00 00 	lw r1,(r4+0)
    2ab8:	78 0b 00 01 	mvhi r11,0x1
    2abc:	39 6b 66 2c 	ori r11,r11,0x662c
    2ac0:	00 21 00 08 	srui r1,r1,8
    2ac4:	78 0e 00 01 	mvhi r14,0x1
    2ac8:	20 21 00 3f 	andi r1,r1,0x3f
    2acc:	59 81 00 00 	sw (r12+0),r1
    2ad0:	28 81 00 00 	lw r1,(r4+0)
    2ad4:	59 60 00 08 	sw (r11+8),r0
    2ad8:	59 6d 00 00 	sw (r11+0),r13
    2adc:	00 21 00 10 	srui r1,r1,16
    2ae0:	59 60 00 10 	sw (r11+16),r0
    2ae4:	20 21 00 07 	andi r1,r1,0x7
    2ae8:	39 ce 68 38 	ori r14,r14,0x6838
    2aec:	59 c1 00 00 	sw (r14+0),r1
    2af0:	59 60 00 14 	sw (r11+20),r0
    2af4:	58 80 00 20 	sw (r4+32),r0
    2af8:	58 80 00 24 	sw (r4+36),r0
    2afc:	58 80 00 00 	sw (r4+0),r0
    2b00:	58 80 00 18 	sw (r4+24),r0
    2b04:	58 80 00 14 	sw (r4+20),r0
    2b08:	58 80 00 04 	sw (r4+4),r0
    2b0c:	78 02 00 01 	mvhi r2,0x1
    2b10:	58 80 00 0c 	sw (r4+12),r0
    2b14:	38 42 2c dc 	ori r2,r2,0x2cdc
    2b18:	58 80 00 08 	sw (r4+8),r0
    2b1c:	28 41 00 00 	lw r1,(r2+0)
    2b20:	58 80 00 10 	sw (r4+16),r0
    2b24:	34 10 03 e8 	mvi r16,1000
    2b28:	58 90 00 28 	sw (r4+40),r16
    2b2c:	58 20 00 1c 	sw (r1+28),r0
    2b30:	34 02 06 43 	mvi r2,1603
    2b34:	58 22 00 00 	sw (r1+0),r2
    2b38:	34 11 00 02 	mvi r17,2
    2b3c:	45 b1 00 95 	be r13,r17,2d90 <spll_init+0x348>
    2b40:	49 b1 00 04 	bg r13,r17,2b50 <spll_init+0x108>
    2b44:	34 01 00 01 	mvi r1,1
    2b48:	5d a1 00 fc 	bne r13,r1,2f38 <spll_init+0x4f0>
    2b4c:	e0 00 00 0c 	bi 2b7c <spll_init+0x134>
    2b50:	34 01 00 03 	mvi r1,3
    2b54:	45 a1 01 02 	be r13,r1,2f5c <spll_init+0x514>
    2b58:	34 01 00 04 	mvi r1,4
    2b5c:	5d a1 00 f7 	bne r13,r1,2f38 <spll_init+0x4f0>
    2b60:	78 02 00 01 	mvhi r2,0x1
    2b64:	37 81 00 4c 	addi r1,sp,76
    2b68:	38 42 2d 84 	ori r2,r2,0x2d84
    2b6c:	f8 00 3f 8f 	calli 129a8 <strcpy>
    2b70:	34 01 00 07 	mvi r1,7
    2b74:	59 61 00 04 	sw (r11+4),r1
    2b78:	e0 00 00 f0 	bi 2f38 <spll_init+0x4f0>
    2b7c:	78 02 00 01 	mvhi r2,0x1
    2b80:	38 42 2d 90 	ori r2,r2,0x2d90
    2b84:	37 81 00 4c 	addi r1,sp,76
    2b88:	f8 00 3f 88 	calli 129a8 <strcpy>
    2b8c:	34 01 00 09 	mvi r1,9
    2b90:	59 61 00 04 	sw (r11+4),r1
    2b94:	34 01 00 05 	mvi r1,5
    2b98:	59 61 00 a4 	sw (r11+164),r1
    2b9c:	38 05 ff fb 	mvu r5,0xfffb
    2ba0:	59 65 00 a8 	sw (r11+168),r5
    2ba4:	34 06 01 2c 	mvi r6,300
    2ba8:	59 66 00 94 	sw (r11+148),r6
    2bac:	59 6d 00 90 	sw (r11+144),r13
    2bb0:	59 6d 00 a0 	sw (r11+160),r13
    2bb4:	38 04 80 00 	mvu r4,0x8000
    2bb8:	59 64 00 9c 	sw (r11+156),r4
    2bbc:	29 82 00 00 	lw r2,(r12+0)
    2bc0:	29 c3 00 00 	lw r3,(r14+0)
    2bc4:	34 04 00 fa 	mvi r4,250
    2bc8:	59 64 00 d0 	sw (r11+208),r4
    2bcc:	34 04 27 10 	mvi r4,10000
    2bd0:	59 64 00 c8 	sw (r11+200),r4
    2bd4:	34 07 27 06 	mvi r7,9990
    2bd8:	59 67 00 cc 	sw (r11+204),r7
    2bdc:	b4 43 18 00 	add r3,r2,r3
    2be0:	59 63 00 6c 	sw (r11+108),r3
    2be4:	66 43 00 00 	cmpei r3,r18,0
    2be8:	59 60 00 78 	sw (r11+120),r0
    2bec:	59 60 00 7c 	sw (r11+124),r0
    2bf0:	c8 03 18 00 	sub r3,r0,r3
    2bf4:	59 60 00 80 	sw (r11+128),r0
    2bf8:	20 63 00 05 	andi r3,r3,0x5
    2bfc:	59 72 00 84 	sw (r11+132),r18
    2c00:	34 63 00 01 	addi r3,r3,1
    2c04:	59 63 00 88 	sw (r11+136),r3
    2c08:	59 60 00 98 	sw (r11+152),r0
    2c0c:	59 60 00 d4 	sw (r11+212),r0
    2c10:	59 60 00 c4 	sw (r11+196),r0
    2c14:	78 03 80 00 	mvhi r3,0x8000
    2c18:	59 63 00 b8 	sw (r11+184),r3
    2c1c:	34 07 0f a0 	mvi r7,4000
    2c20:	59 67 00 b4 	sw (r11+180),r7
    2c24:	59 63 00 c0 	sw (r11+192),r3
    2c28:	59 66 00 bc 	sw (r11+188),r6
    2c2c:	59 61 00 48 	sw (r11+72),r1
    2c30:	59 65 00 4c 	sw (r11+76),r5
    2c34:	34 03 00 99 	mvi r3,153
    2c38:	59 63 00 38 	sw (r11+56),r3
    2c3c:	59 71 00 34 	sw (r11+52),r17
    2c40:	59 6d 00 44 	sw (r11+68),r13
    2c44:	34 03 00 c8 	mvi r3,200
    2c48:	59 63 00 64 	sw (r11+100),r3
    2c4c:	59 64 00 5c 	sw (r11+92),r4
    2c50:	34 03 00 64 	mvi r3,100
    2c54:	59 63 00 60 	sw (r11+96),r3
    2c58:	59 62 00 28 	sw (r11+40),r2
    2c5c:	59 60 00 30 	sw (r11+48),r0
    2c60:	59 61 00 f0 	sw (r11+240),r1
    2c64:	38 12 ff fa 	mvu r18,0xfffa
    2c68:	59 72 00 f4 	sw (r11+244),r18
    2c6c:	59 6d 00 ec 	sw (r11+236),r13
    2c70:	38 11 fd e8 	mvu r17,0xfde8
    2c74:	59 71 00 e8 	sw (r11+232),r17
    2c78:	34 01 04 4c 	mvi r1,1100
    2c7c:	59 61 00 e0 	sw (r11+224),r1
    2c80:	34 01 00 1e 	mvi r1,30
    2c84:	59 61 00 dc 	sw (r11+220),r1
    2c88:	59 60 01 50 	sw (r11+336),r0
    2c8c:	34 01 04 b0 	mvi r1,1200
    2c90:	59 61 01 0c 	sw (r11+268),r1
    2c94:	59 70 01 04 	sw (r11+260),r16
    2c98:	59 63 01 08 	sw (r11+264),r3
    2c9c:	59 6f 01 44 	sw (r11+324),r15
    2ca0:	59 62 01 48 	sw (r11+328),r2
    2ca4:	59 60 01 54 	sw (r11+340),r0
    2ca8:	29 62 01 54 	lw r2,(r11+340)
    2cac:	78 10 00 01 	mvhi r16,0x1
    2cb0:	3a 10 2d a0 	ori r16,r16,0x2da0
    2cb4:	ba 00 08 00 	mv r1,r16
    2cb8:	f8 00 04 74 	calli 3e88 <mprintf>
    2cbc:	59 60 00 e4 	sw (r11+228),r0
    2cc0:	59 60 01 10 	sw (r11+272),r0
    2cc4:	ba 40 d8 00 	mv fp,r18
    2cc8:	59 60 01 00 	sw (r11+256),r0
    2ccc:	34 0d 00 00 	mvi r13,0
    2cd0:	b9 80 98 00 	mv r19,r12
    2cd4:	34 03 00 05 	mvi r3,5
    2cd8:	34 12 00 01 	mvi r18,1
    2cdc:	34 19 04 4c 	mvi r25,1100
    2ce0:	34 18 00 1e 	mvi r24,30
    2ce4:	34 17 04 b0 	mvi r23,1200
    2ce8:	34 16 03 e8 	mvi r22,1000
    2cec:	34 15 00 64 	mvi r21,100
    2cf0:	e0 00 00 24 	bi 2d80 <spll_init+0x338>
    2cf4:	3d ac 00 07 	sli r12,r13,7
    2cf8:	35 b4 00 03 	addi r20,r13,3
    2cfc:	b5 6c 60 00 	add r12,r11,r12
    2d00:	59 83 01 70 	sw (r12+368),r3
    2d04:	59 9b 01 74 	sw (r12+372),fp
    2d08:	59 92 01 6c 	sw (r12+364),r18
    2d0c:	59 91 01 68 	sw (r12+360),r17
    2d10:	59 99 01 60 	sw (r12+352),r25
    2d14:	59 98 01 5c 	sw (r12+348),r24
    2d18:	3e 94 00 07 	sli r20,r20,7
    2d1c:	59 80 01 d0 	sw (r12+464),r0
    2d20:	2a 61 00 00 	lw r1,(r19+0)
    2d24:	59 97 01 8c 	sw (r12+396),r23
    2d28:	b5 74 a0 00 	add r20,r11,r20
    2d2c:	5a 96 00 04 	sw (r20+4),r22
    2d30:	59 95 01 88 	sw (r12+392),r21
    2d34:	34 22 00 01 	addi r2,r1,1
    2d38:	59 8f 01 c4 	sw (r12+452),r15
    2d3c:	b4 4d 10 00 	add r2,r2,r13
    2d40:	59 82 01 c8 	sw (r12+456),r2
    2d44:	c8 41 10 00 	sub r2,r2,r1
    2d48:	59 82 01 d4 	sw (r12+468),r2
    2d4c:	29 82 01 d4 	lw r2,(r12+468)
    2d50:	ba 00 08 00 	mv r1,r16
    2d54:	5b 83 00 48 	sw (sp+72),r3
    2d58:	f8 00 04 4c 	calli 3e88 <mprintf>
    2d5c:	35 a1 00 3b 	addi r1,r13,59
    2d60:	59 80 01 64 	sw (r12+356),r0
    2d64:	3c 21 00 03 	sli r1,r1,3
    2d68:	59 80 01 90 	sw (r12+400),r0
    2d6c:	2b 83 00 48 	lw r3,(sp+72)
    2d70:	5a 80 00 00 	sw (r20+0),r0
    2d74:	b5 61 08 00 	add r1,r11,r1
    2d78:	58 32 00 00 	sw (r1+0),r18
    2d7c:	35 ad 00 01 	addi r13,r13,1
    2d80:	29 c1 00 00 	lw r1,(r14+0)
    2d84:	34 21 ff ff 	addi r1,r1,-1
    2d88:	48 2d ff db 	bg r1,r13,2cf4 <spll_init+0x2ac>
    2d8c:	e0 00 00 6b 	bi 2f38 <spll_init+0x4f0>
    2d90:	78 02 00 01 	mvhi r2,0x1
    2d94:	38 42 2d b0 	ori r2,r2,0x2db0
    2d98:	37 81 00 4c 	addi r1,sp,76
    2d9c:	f8 00 3f 03 	calli 129a8 <strcpy>
    2da0:	34 01 00 09 	mvi r1,9
    2da4:	59 61 00 04 	sw (r11+4),r1
    2da8:	34 01 7d 00 	mvi r1,32000
    2dac:	59 61 00 10 	sw (r11+16),r1
    2db0:	34 03 00 05 	mvi r3,5
    2db4:	59 63 00 48 	sw (r11+72),r3
    2db8:	38 01 ff fb 	mvu r1,0xfffb
    2dbc:	59 61 00 4c 	sw (r11+76),r1
    2dc0:	34 01 00 99 	mvi r1,153
    2dc4:	59 61 00 38 	sw (r11+56),r1
    2dc8:	59 6d 00 34 	sw (r11+52),r13
    2dcc:	34 02 00 01 	mvi r2,1
    2dd0:	59 62 00 44 	sw (r11+68),r2
    2dd4:	34 01 00 c8 	mvi r1,200
    2dd8:	59 61 00 64 	sw (r11+100),r1
    2ddc:	29 84 00 00 	lw r4,(r12+0)
    2de0:	34 01 27 10 	mvi r1,10000
    2de4:	59 61 00 5c 	sw (r11+92),r1
    2de8:	34 01 00 64 	mvi r1,100
    2dec:	59 61 00 60 	sw (r11+96),r1
    2df0:	59 64 00 28 	sw (r11+40),r4
    2df4:	59 60 00 30 	sw (r11+48),r0
    2df8:	59 63 00 f0 	sw (r11+240),r3
    2dfc:	38 12 ff fa 	mvu r18,0xfffa
    2e00:	59 72 00 f4 	sw (r11+244),r18
    2e04:	59 62 00 ec 	sw (r11+236),r2
    2e08:	38 11 fd e8 	mvu r17,0xfde8
    2e0c:	59 71 00 e8 	sw (r11+232),r17
    2e10:	34 02 04 4c 	mvi r2,1100
    2e14:	59 62 00 e0 	sw (r11+224),r2
    2e18:	34 02 00 1e 	mvi r2,30
    2e1c:	59 62 00 dc 	sw (r11+220),r2
    2e20:	59 60 01 50 	sw (r11+336),r0
    2e24:	34 02 04 b0 	mvi r2,1200
    2e28:	59 62 01 0c 	sw (r11+268),r2
    2e2c:	59 70 01 04 	sw (r11+260),r16
    2e30:	59 61 01 08 	sw (r11+264),r1
    2e34:	59 6f 01 44 	sw (r11+324),r15
    2e38:	59 64 01 48 	sw (r11+328),r4
    2e3c:	59 60 01 54 	sw (r11+340),r0
    2e40:	29 62 01 54 	lw r2,(r11+340)
    2e44:	78 10 00 01 	mvhi r16,0x1
    2e48:	3a 10 2d a0 	ori r16,r16,0x2da0
    2e4c:	ba 00 08 00 	mv r1,r16
    2e50:	f8 00 04 0e 	calli 3e88 <mprintf>
    2e54:	59 60 00 e4 	sw (r11+228),r0
    2e58:	59 60 01 10 	sw (r11+272),r0
    2e5c:	ba 40 d8 00 	mv fp,r18
    2e60:	59 60 01 00 	sw (r11+256),r0
    2e64:	34 0d 00 00 	mvi r13,0
    2e68:	b9 80 98 00 	mv r19,r12
    2e6c:	34 03 00 05 	mvi r3,5
    2e70:	34 12 00 01 	mvi r18,1
    2e74:	34 19 04 4c 	mvi r25,1100
    2e78:	34 18 00 1e 	mvi r24,30
    2e7c:	34 17 04 b0 	mvi r23,1200
    2e80:	34 16 03 e8 	mvi r22,1000
    2e84:	34 15 00 64 	mvi r21,100
    2e88:	e0 00 00 24 	bi 2f18 <spll_init+0x4d0>
    2e8c:	3d ac 00 07 	sli r12,r13,7
    2e90:	35 b4 00 03 	addi r20,r13,3
    2e94:	b5 6c 60 00 	add r12,r11,r12
    2e98:	59 83 01 70 	sw (r12+368),r3
    2e9c:	59 9b 01 74 	sw (r12+372),fp
    2ea0:	59 92 01 6c 	sw (r12+364),r18
    2ea4:	59 91 01 68 	sw (r12+360),r17
    2ea8:	59 99 01 60 	sw (r12+352),r25
    2eac:	59 98 01 5c 	sw (r12+348),r24
    2eb0:	3e 94 00 07 	sli r20,r20,7
    2eb4:	59 80 01 d0 	sw (r12+464),r0
    2eb8:	2a 61 00 00 	lw r1,(r19+0)
    2ebc:	59 97 01 8c 	sw (r12+396),r23
    2ec0:	b5 74 a0 00 	add r20,r11,r20
    2ec4:	5a 96 00 04 	sw (r20+4),r22
    2ec8:	59 95 01 88 	sw (r12+392),r21
    2ecc:	34 22 00 01 	addi r2,r1,1
    2ed0:	59 8f 01 c4 	sw (r12+452),r15
    2ed4:	b4 4d 10 00 	add r2,r2,r13
    2ed8:	59 82 01 c8 	sw (r12+456),r2
    2edc:	c8 41 10 00 	sub r2,r2,r1
    2ee0:	59 82 01 d4 	sw (r12+468),r2
    2ee4:	29 82 01 d4 	lw r2,(r12+468)
    2ee8:	ba 00 08 00 	mv r1,r16
    2eec:	5b 83 00 48 	sw (sp+72),r3
    2ef0:	f8 00 03 e6 	calli 3e88 <mprintf>
    2ef4:	35 a1 00 3b 	addi r1,r13,59
    2ef8:	59 80 01 64 	sw (r12+356),r0
    2efc:	3c 21 00 03 	sli r1,r1,3
    2f00:	59 80 01 90 	sw (r12+400),r0
    2f04:	2b 83 00 48 	lw r3,(sp+72)
    2f08:	5a 80 00 00 	sw (r20+0),r0
    2f0c:	b5 61 08 00 	add r1,r11,r1
    2f10:	58 32 00 00 	sw (r1+0),r18
    2f14:	35 ad 00 01 	addi r13,r13,1
    2f18:	29 c1 00 00 	lw r1,(r14+0)
    2f1c:	34 21 ff ff 	addi r1,r1,-1
    2f20:	48 2d ff db 	bg r1,r13,2e8c <spll_init+0x444>
    2f24:	78 03 00 01 	mvhi r3,0x1
    2f28:	38 63 2c dc 	ori r3,r3,0x2cdc
    2f2c:	28 61 00 00 	lw r1,(r3+0)
    2f30:	34 02 00 06 	mvi r2,6
    2f34:	58 22 00 1c 	sw (r1+28),r2
    2f38:	78 01 00 01 	mvhi r1,0x1
    2f3c:	38 21 68 40 	ori r1,r1,0x6840
    2f40:	78 03 00 01 	mvhi r3,0x1
    2f44:	28 24 00 00 	lw r4,(r1+0)
    2f48:	34 02 00 00 	mvi r2,0
    2f4c:	38 63 66 2c 	ori r3,r3,0x662c
    2f50:	34 06 ff ff 	mvi r6,-1
    2f54:	34 05 02 00 	mvi r5,512
    2f58:	e0 00 00 73 	bi 3124 <spll_init+0x6dc>
    2f5c:	78 02 00 01 	mvhi r2,0x1
    2f60:	38 42 2d c4 	ori r2,r2,0x2dc4
    2f64:	37 81 00 4c 	addi r1,sp,76
    2f68:	f8 00 3e 90 	calli 129a8 <strcpy>
    2f6c:	34 01 00 09 	mvi r1,9
    2f70:	59 61 00 04 	sw (r11+4),r1
    2f74:	34 03 00 05 	mvi r3,5
    2f78:	59 63 00 48 	sw (r11+72),r3
    2f7c:	38 01 ff fb 	mvu r1,0xfffb
    2f80:	59 61 00 4c 	sw (r11+76),r1
    2f84:	34 01 00 99 	mvi r1,153
    2f88:	59 61 00 38 	sw (r11+56),r1
    2f8c:	59 71 00 34 	sw (r11+52),r17
    2f90:	34 02 00 01 	mvi r2,1
    2f94:	59 62 00 44 	sw (r11+68),r2
    2f98:	34 01 00 c8 	mvi r1,200
    2f9c:	59 61 00 64 	sw (r11+100),r1
    2fa0:	34 01 27 10 	mvi r1,10000
    2fa4:	59 61 00 5c 	sw (r11+92),r1
    2fa8:	34 01 00 64 	mvi r1,100
    2fac:	59 61 00 60 	sw (r11+96),r1
    2fb0:	59 6f 00 28 	sw (r11+40),r15
    2fb4:	59 60 00 30 	sw (r11+48),r0
    2fb8:	59 63 00 f0 	sw (r11+240),r3
    2fbc:	38 12 ff fa 	mvu r18,0xfffa
    2fc0:	59 72 00 f4 	sw (r11+244),r18
    2fc4:	59 62 00 ec 	sw (r11+236),r2
    2fc8:	38 11 fd e8 	mvu r17,0xfde8
    2fcc:	59 71 00 e8 	sw (r11+232),r17
    2fd0:	34 02 04 4c 	mvi r2,1100
    2fd4:	59 62 00 e0 	sw (r11+224),r2
    2fd8:	34 02 00 1e 	mvi r2,30
    2fdc:	59 62 00 dc 	sw (r11+220),r2
    2fe0:	59 60 01 50 	sw (r11+336),r0
    2fe4:	34 02 04 b0 	mvi r2,1200
    2fe8:	59 62 01 0c 	sw (r11+268),r2
    2fec:	59 70 01 04 	sw (r11+260),r16
    2ff0:	29 84 00 00 	lw r4,(r12+0)
    2ff4:	59 61 01 08 	sw (r11+264),r1
    2ff8:	59 6f 01 44 	sw (r11+324),r15
    2ffc:	59 64 01 48 	sw (r11+328),r4
    3000:	59 60 01 54 	sw (r11+340),r0
    3004:	29 62 01 54 	lw r2,(r11+340)
    3008:	78 10 00 01 	mvhi r16,0x1
    300c:	3a 10 2d a0 	ori r16,r16,0x2da0
    3010:	ba 00 08 00 	mv r1,r16
    3014:	f8 00 03 9d 	calli 3e88 <mprintf>
    3018:	59 60 00 e4 	sw (r11+228),r0
    301c:	59 60 01 10 	sw (r11+272),r0
    3020:	ba 40 d8 00 	mv fp,r18
    3024:	59 60 01 00 	sw (r11+256),r0
    3028:	34 0d 00 00 	mvi r13,0
    302c:	b9 80 98 00 	mv r19,r12
    3030:	34 03 00 05 	mvi r3,5
    3034:	34 12 00 01 	mvi r18,1
    3038:	34 19 04 4c 	mvi r25,1100
    303c:	34 18 00 1e 	mvi r24,30
    3040:	34 17 04 b0 	mvi r23,1200
    3044:	34 16 03 e8 	mvi r22,1000
    3048:	34 15 00 64 	mvi r21,100
    304c:	e0 00 00 24 	bi 30dc <spll_init+0x694>
    3050:	3d ac 00 07 	sli r12,r13,7
    3054:	35 b4 00 03 	addi r20,r13,3
    3058:	b5 6c 60 00 	add r12,r11,r12
    305c:	59 83 01 70 	sw (r12+368),r3
    3060:	59 9b 01 74 	sw (r12+372),fp
    3064:	59 92 01 6c 	sw (r12+364),r18
    3068:	59 91 01 68 	sw (r12+360),r17
    306c:	59 99 01 60 	sw (r12+352),r25
    3070:	59 98 01 5c 	sw (r12+348),r24
    3074:	3e 94 00 07 	sli r20,r20,7
    3078:	59 80 01 d0 	sw (r12+464),r0
    307c:	2a 61 00 00 	lw r1,(r19+0)
    3080:	59 97 01 8c 	sw (r12+396),r23
    3084:	b5 74 a0 00 	add r20,r11,r20
    3088:	5a 96 00 04 	sw (r20+4),r22
    308c:	59 95 01 88 	sw (r12+392),r21
    3090:	34 22 00 01 	addi r2,r1,1
    3094:	59 8f 01 c4 	sw (r12+452),r15
    3098:	b4 4d 10 00 	add r2,r2,r13
    309c:	59 82 01 c8 	sw (r12+456),r2
    30a0:	c8 41 10 00 	sub r2,r2,r1
    30a4:	59 82 01 d4 	sw (r12+468),r2
    30a8:	29 82 01 d4 	lw r2,(r12+468)
    30ac:	ba 00 08 00 	mv r1,r16
    30b0:	5b 83 00 48 	sw (sp+72),r3
    30b4:	f8 00 03 75 	calli 3e88 <mprintf>
    30b8:	35 a1 00 3b 	addi r1,r13,59
    30bc:	59 80 01 64 	sw (r12+356),r0
    30c0:	3c 21 00 03 	sli r1,r1,3
    30c4:	59 80 01 90 	sw (r12+400),r0
    30c8:	2b 83 00 48 	lw r3,(sp+72)
    30cc:	5a 80 00 00 	sw (r20+0),r0
    30d0:	b5 61 08 00 	add r1,r11,r1
    30d4:	58 32 00 00 	sw (r1+0),r18
    30d8:	35 ad 00 01 	addi r13,r13,1
    30dc:	29 c1 00 00 	lw r1,(r14+0)
    30e0:	34 21 ff ff 	addi r1,r1,-1
    30e4:	48 2d ff db 	bg r1,r13,3050 <spll_init+0x608>
    30e8:	e3 ff ff 94 	bi 2f38 <spll_init+0x4f0>
    30ec:	08 41 00 2c 	muli r1,r2,44
    30f0:	b4 61 08 00 	add r1,r3,r1
    30f4:	58 26 02 00 	sw (r1+512),r6
    30f8:	28 27 02 00 	lw r7,(r1+512)
    30fc:	58 27 01 fc 	sw (r1+508),r7
    3100:	58 24 01 e0 	sw (r1+480),r4
    3104:	58 22 01 e4 	sw (r1+484),r2
    3108:	58 20 01 f8 	sw (r1+504),r0
    310c:	58 25 01 e8 	sw (r1+488),r5
    3110:	58 20 01 ec 	sw (r1+492),r0
    3114:	58 20 01 f0 	sw (r1+496),r0
    3118:	58 20 02 04 	sw (r1+516),r0
    311c:	58 20 02 08 	sw (r1+520),r0
    3120:	34 42 00 01 	addi r2,r2,1
    3124:	48 82 ff f2 	bg r4,r2,30ec <spll_init+0x6a4>
    3128:	78 01 00 01 	mvhi r1,0x1
    312c:	38 21 59 38 	ori r1,r1,0x5938
    3130:	28 21 00 00 	lw r1,(r1+0)
    3134:	44 20 00 0d 	be r1,r0,3168 <spll_init+0x720>
    3138:	78 05 00 01 	mvhi r5,0x1
    313c:	38 a5 68 38 	ori r5,r5,0x6838
    3140:	28 a5 00 00 	lw r5,(r5+0)
    3144:	78 02 00 01 	mvhi r2,0x1
    3148:	34 01 00 00 	mvi r1,0
    314c:	38 42 2d cc 	ori r2,r2,0x2dcc
    3150:	37 83 00 4c 	addi r3,sp,76
    3154:	fb ff f5 cb 	calli 880 <wrc_debug_printf>
    3158:	e0 00 00 04 	bi 3168 <spll_init+0x720>
    315c:	28 41 00 5c 	lw r1,(r2+92)
    3160:	5b 81 00 60 	sw (sp+96),r1
    3164:	e0 00 00 05 	bi 3178 <spll_init+0x730>
    3168:	78 04 00 01 	mvhi r4,0x1
    316c:	38 84 2d 44 	ori r4,r4,0x2d44
    3170:	28 82 00 00 	lw r2,(r4+0)
    3174:	78 03 00 02 	mvhi r3,0x2
    3178:	78 04 00 01 	mvhi r4,0x1
    317c:	38 84 2d 44 	ori r4,r4,0x2d44
    3180:	28 81 00 00 	lw r1,(r4+0)
    3184:	28 44 00 60 	lw r4,(r2+96)
    3188:	a0 83 20 00 	and r4,r4,r3
    318c:	44 80 ff f4 	be r4,r0,315c <spll_init+0x714>
    3190:	28 22 00 1c 	lw r2,(r1+28)
    3194:	5b 82 00 60 	sw (sp+96),r2
    3198:	34 02 00 01 	mvi r2,1
    319c:	58 22 00 44 	sw (r1+68),r2
    31a0:	28 22 00 18 	lw r2,(r1+24)
    31a4:	38 42 00 01 	ori r2,r2,0x1
    31a8:	58 22 00 18 	sw (r1+24),r2
    31ac:	fb ff f5 5e 	calli 724 <enable_irq>
    31b0:	2b 9d 00 04 	lw ra,(sp+4)
    31b4:	2b 8b 00 44 	lw r11,(sp+68)
    31b8:	2b 8c 00 40 	lw r12,(sp+64)
    31bc:	2b 8d 00 3c 	lw r13,(sp+60)
    31c0:	2b 8e 00 38 	lw r14,(sp+56)
    31c4:	2b 8f 00 34 	lw r15,(sp+52)
    31c8:	2b 90 00 30 	lw r16,(sp+48)
    31cc:	2b 91 00 2c 	lw r17,(sp+44)
    31d0:	2b 92 00 28 	lw r18,(sp+40)
    31d4:	2b 93 00 24 	lw r19,(sp+36)
    31d8:	2b 94 00 20 	lw r20,(sp+32)
    31dc:	2b 95 00 1c 	lw r21,(sp+28)
    31e0:	2b 96 00 18 	lw r22,(sp+24)
    31e4:	2b 97 00 14 	lw r23,(sp+20)
    31e8:	2b 98 00 10 	lw r24,(sp+16)
    31ec:	2b 99 00 0c 	lw r25,(sp+12)
    31f0:	2b 9b 00 08 	lw fp,(sp+8)
    31f4:	37 9c 00 60 	addi sp,sp,96
    31f8:	c3 a0 00 00 	ret

000031fc <spll_shutdown>:
    31fc:	78 02 00 01 	mvhi r2,0x1
    3200:	38 42 2d 44 	ori r2,r2,0x2d44
    3204:	28 41 00 00 	lw r1,(r2+0)
    3208:	34 02 00 01 	mvi r2,1
    320c:	58 20 00 18 	sw (r1+24),r0
    3210:	58 20 00 14 	sw (r1+20),r0
    3214:	58 20 00 04 	sw (r1+4),r0
    3218:	58 22 00 40 	sw (r1+64),r2
    321c:	c3 a0 00 00 	ret

00003220 <spll_start_channel>:
    3220:	37 9c ff f8 	addi sp,sp,-8
    3224:	5b 8b 00 08 	sw (sp+8),r11
    3228:	5b 9d 00 04 	sw (sp+4),ra
    322c:	78 02 00 01 	mvhi r2,0x1
    3230:	38 42 66 2c 	ori r2,r2,0x662c
    3234:	28 44 00 04 	lw r4,(r2+4)
    3238:	b8 20 18 00 	mv r3,r1
    323c:	34 01 00 08 	mvi r1,8
    3240:	5c 81 00 02 	bne r4,r1,3248 <spll_start_channel+0x28>
    3244:	5c 60 00 0a 	bne r3,r0,326c <spll_start_channel+0x4c>
    3248:	78 01 00 01 	mvhi r1,0x1
    324c:	38 21 59 38 	ori r1,r1,0x5938
    3250:	28 21 00 00 	lw r1,(r1+0)
    3254:	44 20 00 27 	be r1,r0,32f0 <spll_start_channel+0xd0>
    3258:	78 02 00 01 	mvhi r2,0x1
    325c:	34 01 00 00 	mvi r1,0
    3260:	38 42 2e 08 	ori r2,r2,0x2e08
    3264:	fb ff f5 87 	calli 880 <wrc_debug_printf>
    3268:	e0 00 00 22 	bi 32f0 <spll_start_channel+0xd0>
    326c:	34 6b ff ff 	addi r11,r3,-1
    3270:	3d 6b 00 07 	sli r11,r11,7
    3274:	34 63 00 02 	addi r3,r3,2
    3278:	b4 4b 58 00 	add r11,r2,r11
    327c:	59 60 01 98 	sw (r11+408),r0
    3280:	29 61 01 98 	lw r1,(r11+408)
    3284:	3c 63 00 07 	sli r3,r3,7
    3288:	59 61 01 94 	sw (r11+404),r1
    328c:	34 01 ff ff 	mvi r1,-1
    3290:	59 61 01 9c 	sw (r11+412),r1
    3294:	59 61 01 a0 	sw (r11+416),r1
    3298:	59 61 01 a4 	sw (r11+420),r1
    329c:	59 61 01 a8 	sw (r11+424),r1
    32a0:	59 60 01 ac 	sw (r11+428),r0
    32a4:	59 60 01 b0 	sw (r11+432),r0
    32a8:	59 60 01 b4 	sw (r11+436),r0
    32ac:	59 60 01 bc 	sw (r11+444),r0
    32b0:	59 60 01 c0 	sw (r11+448),r0
    32b4:	59 60 01 cc 	sw (r11+460),r0
    32b8:	59 60 01 64 	sw (r11+356),r0
    32bc:	b4 43 10 00 	add r2,r2,r3
    32c0:	59 60 01 90 	sw (r11+400),r0
    32c4:	58 40 00 00 	sw (r2+0),r0
    32c8:	29 61 01 c4 	lw r1,(r11+452)
    32cc:	34 02 00 01 	mvi r2,1
    32d0:	fb ff fa 27 	calli 1b6c <spll_enable_tagger>
    32d4:	29 61 01 c8 	lw r1,(r11+456)
    32d8:	34 02 00 01 	mvi r2,1
    32dc:	fb ff fa 24 	calli 1b6c <spll_enable_tagger>
    32e0:	34 01 00 04 	mvi r1,4
    32e4:	34 02 00 01 	mvi r2,1
    32e8:	34 03 00 01 	mvi r3,1
    32ec:	fb ff fa 4b 	calli 1c18 <spll_debug>
    32f0:	2b 9d 00 04 	lw ra,(sp+4)
    32f4:	2b 8b 00 08 	lw r11,(sp+8)
    32f8:	37 9c 00 08 	addi sp,sp,8
    32fc:	c3 a0 00 00 	ret

00003300 <spll_stop_channel>:
    3300:	37 9c ff fc 	addi sp,sp,-4
    3304:	5b 9d 00 04 	sw (sp+4),ra
    3308:	44 20 00 09 	be r1,r0,332c <spll_stop_channel+0x2c>
    330c:	34 21 ff ff 	addi r1,r1,-1
    3310:	3c 21 00 07 	sli r1,r1,7
    3314:	78 02 00 01 	mvhi r2,0x1
    3318:	38 42 66 2c 	ori r2,r2,0x662c
    331c:	b4 41 10 00 	add r2,r2,r1
    3320:	28 41 01 c8 	lw r1,(r2+456)
    3324:	34 02 00 00 	mvi r2,0
    3328:	fb ff fa 11 	calli 1b6c <spll_enable_tagger>
    332c:	2b 9d 00 04 	lw ra,(sp+4)
    3330:	37 9c 00 04 	addi sp,sp,4
    3334:	c3 a0 00 00 	ret

00003338 <spll_check_lock>:
    3338:	78 02 00 01 	mvhi r2,0x1
    333c:	b8 20 18 00 	mv r3,r1
    3340:	38 42 66 2c 	ori r2,r2,0x662c
    3344:	5c 20 00 04 	bne r1,r0,3354 <spll_check_lock+0x1c>
    3348:	28 41 00 04 	lw r1,(r2+4)
    334c:	64 21 00 08 	cmpei r1,r1,8
    3350:	c3 a0 00 00 	ret
    3354:	28 45 00 04 	lw r5,(r2+4)
    3358:	34 04 00 08 	mvi r4,8
    335c:	34 01 00 00 	mvi r1,0
    3360:	5c a4 00 06 	bne r5,r4,3378 <spll_check_lock+0x40>
    3364:	34 63 ff ff 	addi r3,r3,-1
    3368:	3c 63 00 07 	sli r3,r3,7
    336c:	b4 43 10 00 	add r2,r2,r3
    3370:	28 41 01 90 	lw r1,(r2+400)
    3374:	7c 21 00 00 	cmpnei r1,r1,0
    3378:	c3 a0 00 00 	ret

0000337c <spll_set_phase_shift>:
    337c:	37 9c ff e8 	addi sp,sp,-24
    3380:	5b 8b 00 18 	sw (sp+24),r11
    3384:	5b 8c 00 14 	sw (sp+20),r12
    3388:	5b 8d 00 10 	sw (sp+16),r13
    338c:	5b 8e 00 0c 	sw (sp+12),r14
    3390:	5b 8f 00 08 	sw (sp+8),r15
    3394:	5b 9d 00 04 	sw (sp+4),ra
    3398:	38 03 ff ff 	mvu r3,0xffff
    339c:	b8 40 78 00 	mv r15,r2
    33a0:	5c 23 00 17 	bne r1,r3,33fc <spll_set_phase_shift+0x80>
    33a4:	34 01 00 00 	mvi r1,0
    33a8:	78 0c 00 01 	mvhi r12,0x1
    33ac:	78 0d 00 01 	mvhi r13,0x1
    33b0:	fb ff ff f3 	calli 337c <spll_set_phase_shift>
    33b4:	34 0b 00 00 	mvi r11,0
    33b8:	39 8c 68 38 	ori r12,r12,0x6838
    33bc:	39 ad 66 2c 	ori r13,r13,0x662c
    33c0:	34 0e 00 04 	mvi r14,4
    33c4:	e0 00 00 0a 	bi 33ec <spll_set_phase_shift+0x70>
    33c8:	35 61 00 3b 	addi r1,r11,59
    33cc:	3c 21 00 03 	sli r1,r1,3
    33d0:	b5 a1 08 00 	add r1,r13,r1
    33d4:	28 21 00 00 	lw r1,(r1+0)
    33d8:	5c 2e 00 04 	bne r1,r14,33e8 <spll_set_phase_shift+0x6c>
    33dc:	35 61 00 01 	addi r1,r11,1
    33e0:	b9 e0 10 00 	mv r2,r15
    33e4:	fb ff fa 1c 	calli 1c54 <set_phase_shift>
    33e8:	35 6b 00 01 	addi r11,r11,1
    33ec:	29 81 00 00 	lw r1,(r12+0)
    33f0:	34 21 ff ff 	addi r1,r1,-1
    33f4:	48 2b ff f5 	bg r1,r11,33c8 <spll_set_phase_shift+0x4c>
    33f8:	e0 00 00 02 	bi 3400 <spll_set_phase_shift+0x84>
    33fc:	fb ff fa 16 	calli 1c54 <set_phase_shift>
    3400:	2b 9d 00 04 	lw ra,(sp+4)
    3404:	2b 8b 00 18 	lw r11,(sp+24)
    3408:	2b 8c 00 14 	lw r12,(sp+20)
    340c:	2b 8d 00 10 	lw r13,(sp+16)
    3410:	2b 8e 00 0c 	lw r14,(sp+12)
    3414:	2b 8f 00 08 	lw r15,(sp+8)
    3418:	37 9c 00 18 	addi sp,sp,24
    341c:	c3 a0 00 00 	ret

00003420 <spll_get_phase_shift>:
    3420:	37 9c ff f0 	addi sp,sp,-16
    3424:	5b 8b 00 10 	sw (sp+16),r11
    3428:	5b 8c 00 0c 	sw (sp+12),r12
    342c:	5b 8d 00 08 	sw (sp+8),r13
    3430:	5b 9d 00 04 	sw (sp+4),ra
    3434:	78 0b 00 01 	mvhi r11,0x1
    3438:	b8 40 68 00 	mv r13,r2
    343c:	b8 60 60 00 	mv r12,r3
    3440:	39 6b 67 04 	ori r11,r11,0x6704
    3444:	44 20 00 06 	be r1,r0,345c <spll_get_phase_shift+0x3c>
    3448:	3c 2b 00 07 	sli r11,r1,7
    344c:	78 04 00 01 	mvhi r4,0x1
    3450:	35 6b 00 d8 	addi r11,r11,216
    3454:	38 84 66 2c 	ori r4,r4,0x662c
    3458:	b5 64 58 00 	add r11,r11,r4
    345c:	45 a0 00 0b 	be r13,r0,3488 <spll_get_phase_shift+0x68>
    3460:	29 62 00 68 	lw r2,(r11+104)
    3464:	34 04 1f 40 	mvi r4,8000
    3468:	34 03 00 00 	mvi r3,0
    346c:	3c 42 00 01 	sli r2,r2,1
    3470:	14 41 00 1f 	sri r1,r2,31
    3474:	f8 00 34 9d 	calli 106e8 <__muldi3>
    3478:	3c 21 00 12 	sli r1,r1,18
    347c:	00 44 00 0e 	srui r4,r2,14
    3480:	b8 24 20 00 	or r4,r1,r4
    3484:	59 a4 00 00 	sw (r13+0),r4
    3488:	45 80 00 0b 	be r12,r0,34b4 <spll_get_phase_shift+0x94>
    348c:	29 62 00 64 	lw r2,(r11+100)
    3490:	34 03 00 00 	mvi r3,0
    3494:	34 04 1f 40 	mvi r4,8000
    3498:	3c 42 00 01 	sli r2,r2,1
    349c:	14 41 00 1f 	sri r1,r2,31
    34a0:	f8 00 34 92 	calli 106e8 <__muldi3>
    34a4:	3c 21 00 12 	sli r1,r1,18
    34a8:	00 42 00 0e 	srui r2,r2,14
    34ac:	b8 22 10 00 	or r2,r1,r2
    34b0:	59 82 00 00 	sw (r12+0),r2
    34b4:	2b 9d 00 04 	lw ra,(sp+4)
    34b8:	2b 8b 00 10 	lw r11,(sp+16)
    34bc:	2b 8c 00 0c 	lw r12,(sp+12)
    34c0:	2b 8d 00 08 	lw r13,(sp+8)
    34c4:	37 9c 00 10 	addi sp,sp,16
    34c8:	c3 a0 00 00 	ret

000034cc <spll_read_ptracker>:
    34cc:	37 9c ff f0 	addi sp,sp,-16
    34d0:	5b 8b 00 10 	sw (sp+16),r11
    34d4:	5b 8c 00 0c 	sw (sp+12),r12
    34d8:	5b 8d 00 08 	sw (sp+8),r13
    34dc:	5b 9d 00 04 	sw (sp+4),ra
    34e0:	b8 20 58 00 	mv r11,r1
    34e4:	b8 40 68 00 	mv r13,r2
    34e8:	09 62 00 2c 	muli r2,r11,44
    34ec:	78 01 00 01 	mvhi r1,0x1
    34f0:	38 21 66 2c 	ori r1,r1,0x662c
    34f4:	b4 22 08 00 	add r1,r1,r2
    34f8:	28 24 01 f4 	lw r4,(r1+500)
    34fc:	b8 60 60 00 	mv r12,r3
    3500:	4c 80 00 03 	bge r4,r0,350c <spll_read_ptracker+0x40>
    3504:	34 84 40 00 	addi r4,r4,16384
    3508:	e0 00 00 04 	bi 3518 <spll_read_ptracker+0x4c>
    350c:	34 01 3f ff 	mvi r1,16383
    3510:	4c 24 00 02 	bge r1,r4,3518 <spll_read_ptracker+0x4c>
    3514:	34 84 c0 00 	addi r4,r4,-16384
    3518:	3c 84 00 01 	sli r4,r4,1
    351c:	34 01 00 00 	mvi r1,0
    3520:	20 82 3f fe 	andi r2,r4,0x3ffe
    3524:	34 03 00 00 	mvi r3,0
    3528:	34 04 1f 40 	mvi r4,8000
    352c:	f8 00 34 6f 	calli 106e8 <__muldi3>
    3530:	3c 21 00 12 	sli r1,r1,18
    3534:	00 44 00 0e 	srui r4,r2,14
    3538:	b8 24 20 00 	or r4,r1,r4
    353c:	59 a4 00 00 	sw (r13+0),r4
    3540:	45 80 00 0c 	be r12,r0,3570 <spll_read_ptracker+0xa4>
    3544:	78 01 00 01 	mvhi r1,0x1
    3548:	38 21 68 3c 	ori r1,r1,0x683c
    354c:	09 63 00 2c 	muli r3,r11,44
    3550:	28 22 00 00 	lw r2,(r1+0)
    3554:	78 01 00 01 	mvhi r1,0x1
    3558:	38 21 66 2c 	ori r1,r1,0x662c
    355c:	b4 23 08 00 	add r1,r1,r3
    3560:	28 21 01 e4 	lw r1,(r1+484)
    3564:	94 41 08 00 	sr r1,r2,r1
    3568:	20 21 00 01 	andi r1,r1,0x1
    356c:	59 81 00 00 	sw (r12+0),r1
    3570:	09 6b 00 2c 	muli r11,r11,44
    3574:	78 02 00 01 	mvhi r2,0x1
    3578:	38 42 66 2c 	ori r2,r2,0x662c
    357c:	b4 4b 10 00 	add r2,r2,r11
    3580:	28 41 01 f8 	lw r1,(r2+504)
    3584:	2b 9d 00 04 	lw ra,(sp+4)
    3588:	2b 8b 00 10 	lw r11,(sp+16)
    358c:	2b 8c 00 0c 	lw r12,(sp+12)
    3590:	2b 8d 00 08 	lw r13,(sp+8)
    3594:	37 9c 00 10 	addi sp,sp,16
    3598:	c3 a0 00 00 	ret

0000359c <spll_get_num_channels>:
    359c:	44 20 00 05 	be r1,r0,35b0 <spll_get_num_channels+0x14>
    35a0:	78 03 00 01 	mvhi r3,0x1
    35a4:	38 63 68 40 	ori r3,r3,0x6840
    35a8:	28 63 00 00 	lw r3,(r3+0)
    35ac:	58 23 00 00 	sw (r1+0),r3
    35b0:	44 40 00 05 	be r2,r0,35c4 <spll_get_num_channels+0x28>
    35b4:	78 01 00 01 	mvhi r1,0x1
    35b8:	38 21 68 38 	ori r1,r1,0x6838
    35bc:	28 21 00 00 	lw r1,(r1+0)
    35c0:	58 41 00 00 	sw (r2+0),r1
    35c4:	c3 a0 00 00 	ret

000035c8 <spll_show_stats>:
    35c8:	37 9c ff ec 	addi sp,sp,-20
    35cc:	5b 9d 00 14 	sw (sp+20),ra
    35d0:	78 01 00 01 	mvhi r1,0x1
    35d4:	38 21 66 2c 	ori r1,r1,0x662c
    35d8:	28 22 00 00 	lw r2,(r1+0)
    35dc:	4c 02 00 19 	bge r0,r2,3640 <spll_show_stats+0x78>
    35e0:	78 02 00 01 	mvhi r2,0x1
    35e4:	38 42 59 38 	ori r2,r2,0x5938
    35e8:	28 42 00 00 	lw r2,(r2+0)
    35ec:	44 40 00 15 	be r2,r0,3640 <spll_show_stats+0x78>
    35f0:	78 02 00 01 	mvhi r2,0x1
    35f4:	38 42 66 28 	ori r2,r2,0x6628
    35f8:	28 43 00 00 	lw r3,(r2+0)
    35fc:	28 24 00 04 	lw r4,(r1+4)
    3600:	28 25 00 00 	lw r5,(r1+0)
    3604:	28 26 00 88 	lw r6,(r1+136)
    3608:	28 27 00 68 	lw r7,(r1+104)
    360c:	28 28 00 d4 	lw r8,(r1+212)
    3610:	28 2a 01 10 	lw r10,(r1+272)
    3614:	28 29 00 54 	lw r9,(r1+84)
    3618:	28 22 00 fc 	lw r2,(r1+252)
    361c:	28 21 00 14 	lw r1,(r1+20)
    3620:	5b 8a 00 04 	sw (sp+4),r10
    3624:	5b 82 00 0c 	sw (sp+12),r2
    3628:	78 02 00 01 	mvhi r2,0x1
    362c:	5b 81 00 10 	sw (sp+16),r1
    3630:	38 42 2e 38 	ori r2,r2,0x2e38
    3634:	34 01 00 00 	mvi r1,0
    3638:	5b 89 00 08 	sw (sp+8),r9
    363c:	fb ff f4 91 	calli 880 <wrc_debug_printf>
    3640:	2b 9d 00 14 	lw ra,(sp+20)
    3644:	37 9c 00 14 	addi sp,sp,20
    3648:	c3 a0 00 00 	ret

0000364c <spll_shifter_busy>:
    364c:	78 02 00 01 	mvhi r2,0x1
    3650:	38 42 66 2c 	ori r2,r2,0x662c
    3654:	5c 20 00 05 	bne r1,r0,3668 <spll_shifter_busy+0x1c>
    3658:	28 43 01 3c 	lw r3,(r2+316)
    365c:	28 41 01 40 	lw r1,(r2+320)
    3660:	fc 61 08 00 	cmpne r1,r3,r1
    3664:	c3 a0 00 00 	ret
    3668:	34 21 ff ff 	addi r1,r1,-1
    366c:	3c 21 00 07 	sli r1,r1,7
    3670:	b4 41 10 00 	add r2,r2,r1
    3674:	28 43 01 bc 	lw r3,(r2+444)
    3678:	28 41 01 c0 	lw r1,(r2+448)
    367c:	fc 61 08 00 	cmpne r1,r3,r1
    3680:	c3 a0 00 00 	ret

00003684 <spll_enable_ptracker>:
    3684:	37 9c ff f0 	addi sp,sp,-16
    3688:	5b 8b 00 10 	sw (sp+16),r11
    368c:	5b 8c 00 0c 	sw (sp+12),r12
    3690:	5b 8d 00 08 	sw (sp+8),r13
    3694:	5b 9d 00 04 	sw (sp+4),ra
    3698:	78 0b 00 01 	mvhi r11,0x1
    369c:	78 0d 00 01 	mvhi r13,0x1
    36a0:	b8 20 60 00 	mv r12,r1
    36a4:	39 6b 66 2c 	ori r11,r11,0x662c
    36a8:	39 ad 68 3c 	ori r13,r13,0x683c
    36ac:	44 40 00 21 	be r2,r0,3730 <spll_enable_ptracker+0xac>
    36b0:	34 02 00 01 	mvi r2,1
    36b4:	fb ff f9 2e 	calli 1b6c <spll_enable_tagger>
    36b8:	09 81 00 2c 	muli r1,r12,44
    36bc:	34 02 00 01 	mvi r2,1
    36c0:	b5 61 58 00 	add r11,r11,r1
    36c4:	34 01 ff ff 	mvi r1,-1
    36c8:	59 61 02 00 	sw (r11+512),r1
    36cc:	29 61 02 00 	lw r1,(r11+512)
    36d0:	59 61 01 fc 	sw (r11+508),r1
    36d4:	59 60 01 f8 	sw (r11+504),r0
    36d8:	59 60 01 ec 	sw (r11+492),r0
    36dc:	59 60 01 f0 	sw (r11+496),r0
    36e0:	59 60 02 04 	sw (r11+516),r0
    36e4:	59 60 02 08 	sw (r11+520),r0
    36e8:	29 61 01 e0 	lw r1,(r11+480)
    36ec:	fb ff f9 20 	calli 1b6c <spll_enable_tagger>
    36f0:	29 61 01 e4 	lw r1,(r11+484)
    36f4:	34 02 00 01 	mvi r2,1
    36f8:	fb ff f9 1d 	calli 1b6c <spll_enable_tagger>
    36fc:	29 a2 00 00 	lw r2,(r13+0)
    3700:	34 01 00 01 	mvi r1,1
    3704:	bc 2c 08 00 	sl r1,r1,r12
    3708:	b8 22 08 00 	or r1,r1,r2
    370c:	59 a1 00 00 	sw (r13+0),r1
    3710:	78 01 00 01 	mvhi r1,0x1
    3714:	38 21 59 38 	ori r1,r1,0x5938
    3718:	28 21 00 00 	lw r1,(r1+0)
    371c:	44 20 00 17 	be r1,r0,3778 <spll_enable_ptracker+0xf4>
    3720:	78 02 00 01 	mvhi r2,0x1
    3724:	34 01 00 00 	mvi r1,0
    3728:	38 42 2e 9c 	ori r2,r2,0x2e9c
    372c:	e0 00 00 11 	bi 3770 <spll_enable_ptracker+0xec>
    3730:	34 03 00 01 	mvi r3,1
    3734:	29 a4 00 00 	lw r4,(r13+0)
    3738:	bc 61 18 00 	sl r3,r3,r1
    373c:	a4 60 18 00 	not r3,r3
    3740:	a0 64 18 00 	and r3,r3,r4
    3744:	59 a3 00 00 	sw (r13+0),r3
    3748:	29 63 01 44 	lw r3,(r11+324)
    374c:	44 23 00 02 	be r1,r3,3754 <spll_enable_ptracker+0xd0>
    3750:	fb ff f9 07 	calli 1b6c <spll_enable_tagger>
    3754:	78 01 00 01 	mvhi r1,0x1
    3758:	38 21 59 38 	ori r1,r1,0x5938
    375c:	28 21 00 00 	lw r1,(r1+0)
    3760:	44 20 00 06 	be r1,r0,3778 <spll_enable_ptracker+0xf4>
    3764:	78 02 00 01 	mvhi r2,0x1
    3768:	34 01 00 00 	mvi r1,0
    376c:	38 42 2e bc 	ori r2,r2,0x2ebc
    3770:	b9 80 18 00 	mv r3,r12
    3774:	fb ff f4 43 	calli 880 <wrc_debug_printf>
    3778:	2b 9d 00 04 	lw ra,(sp+4)
    377c:	2b 8b 00 10 	lw r11,(sp+16)
    3780:	2b 8c 00 0c 	lw r12,(sp+12)
    3784:	2b 8d 00 08 	lw r13,(sp+8)
    3788:	37 9c 00 10 	addi sp,sp,16
    378c:	c3 a0 00 00 	ret

00003790 <spll_get_delock_count>:
    3790:	78 01 00 01 	mvhi r1,0x1
    3794:	38 21 66 2c 	ori r1,r1,0x662c
    3798:	28 21 00 14 	lw r1,(r1+20)
    379c:	c3 a0 00 00 	ret

000037a0 <spll_update_aux_clocks>:
    37a0:	37 9c ff b8 	addi sp,sp,-72
    37a4:	5b 8b 00 44 	sw (sp+68),r11
    37a8:	5b 8c 00 40 	sw (sp+64),r12
    37ac:	5b 8d 00 3c 	sw (sp+60),r13
    37b0:	5b 8e 00 38 	sw (sp+56),r14
    37b4:	5b 8f 00 34 	sw (sp+52),r15
    37b8:	5b 90 00 30 	sw (sp+48),r16
    37bc:	5b 91 00 2c 	sw (sp+44),r17
    37c0:	5b 92 00 28 	sw (sp+40),r18
    37c4:	5b 93 00 24 	sw (sp+36),r19
    37c8:	5b 94 00 20 	sw (sp+32),r20
    37cc:	5b 95 00 1c 	sw (sp+28),r21
    37d0:	5b 96 00 18 	sw (sp+24),r22
    37d4:	5b 97 00 14 	sw (sp+20),r23
    37d8:	5b 98 00 10 	sw (sp+16),r24
    37dc:	5b 99 00 0c 	sw (sp+12),r25
    37e0:	5b 9b 00 08 	sw (sp+8),fp
    37e4:	5b 9d 00 04 	sw (sp+4),ra
    37e8:	78 01 00 01 	mvhi r1,0x1
    37ec:	38 21 2d 44 	ori r1,r1,0x2d44
    37f0:	28 2e 00 00 	lw r14,(r1+0)
    37f4:	78 11 00 01 	mvhi r17,0x1
    37f8:	78 0c 00 01 	mvhi r12,0x1
    37fc:	29 c1 00 10 	lw r1,(r14+16)
    3800:	78 0d 00 01 	mvhi r13,0x1
    3804:	78 17 00 01 	mvhi r23,0x1
    3808:	20 21 00 ff 	andi r1,r1,0xff
    380c:	78 16 00 01 	mvhi r22,0x1
    3810:	78 15 00 01 	mvhi r21,0x1
    3814:	78 14 00 01 	mvhi r20,0x1
    3818:	78 13 00 01 	mvhi r19,0x1
    381c:	5b 81 00 48 	sw (sp+72),r1
    3820:	34 0b 00 00 	mvi r11,0
    3824:	3a 31 68 38 	ori r17,r17,0x6838
    3828:	34 0f 00 01 	mvi r15,1
    382c:	39 8c 66 2c 	ori r12,r12,0x662c
    3830:	34 18 00 02 	mvi r24,2
    3834:	39 ad 59 38 	ori r13,r13,0x5938
    3838:	34 1b 00 03 	mvi fp,3
    383c:	3a f7 2f 14 	ori r23,r23,0x2f14
    3840:	34 19 00 04 	mvi r25,4
    3844:	3a d6 2f 40 	ori r22,r22,0x2f40
    3848:	3a b5 2f 60 	ori r21,r21,0x2f60
    384c:	3a 94 2e f8 	ori r20,r20,0x2ef8
    3850:	3a 73 2e dc 	ori r19,r19,0x2edc
    3854:	e0 00 00 6d 	bi 3a08 <spll_update_aux_clocks+0x268>
    3858:	35 70 00 01 	addi r16,r11,1
    385c:	2b 81 00 48 	lw r1,(sp+72)
    3860:	bd f0 90 00 	sl r18,r15,r16
    3864:	a2 41 10 00 	and r2,r18,r1
    3868:	5c 40 00 0f 	bne r2,r0,38a4 <spll_update_aux_clocks+0x104>
    386c:	35 61 00 3b 	addi r1,r11,59
    3870:	3c 21 00 03 	sli r1,r1,3
    3874:	b5 81 08 00 	add r1,r12,r1
    3878:	28 21 00 00 	lw r1,(r1+0)
    387c:	44 2f 00 0a 	be r1,r15,38a4 <spll_update_aux_clocks+0x104>
    3880:	29 a1 00 00 	lw r1,(r13+0)
    3884:	44 20 00 05 	be r1,r0,3898 <spll_update_aux_clocks+0xf8>
    3888:	34 01 00 00 	mvi r1,0
    388c:	ba 60 10 00 	mv r2,r19
    3890:	b9 60 18 00 	mv r3,r11
    3894:	fb ff f3 fb 	calli 880 <wrc_debug_printf>
    3898:	ba 00 08 00 	mv r1,r16
    389c:	fb ff fe 99 	calli 3300 <spll_stop_channel>
    38a0:	e0 00 00 4f 	bi 39dc <spll_update_aux_clocks+0x23c>
    38a4:	35 61 00 3b 	addi r1,r11,59
    38a8:	3c 21 00 03 	sli r1,r1,3
    38ac:	b5 81 08 00 	add r1,r12,r1
    38b0:	28 21 00 00 	lw r1,(r1+0)
    38b4:	44 38 00 17 	be r1,r24,3910 <spll_update_aux_clocks+0x170>
    38b8:	48 38 00 03 	bg r1,r24,38c4 <spll_update_aux_clocks+0x124>
    38bc:	5c 2f 00 52 	bne r1,r15,3a04 <spll_update_aux_clocks+0x264>
    38c0:	e0 00 00 04 	bi 38d0 <spll_update_aux_clocks+0x130>
    38c4:	44 3b 00 26 	be r1,fp,395c <spll_update_aux_clocks+0x1bc>
    38c8:	5c 39 00 4f 	bne r1,r25,3a04 <spll_update_aux_clocks+0x264>
    38cc:	e0 00 00 39 	bi 39b0 <spll_update_aux_clocks+0x210>
    38d0:	44 40 00 4d 	be r2,r0,3a04 <spll_update_aux_clocks+0x264>
    38d4:	29 81 01 10 	lw r1,(r12+272)
    38d8:	44 20 00 4b 	be r1,r0,3a04 <spll_update_aux_clocks+0x264>
    38dc:	29 a1 00 00 	lw r1,(r13+0)
    38e0:	44 20 00 05 	be r1,r0,38f4 <spll_update_aux_clocks+0x154>
    38e4:	34 01 00 00 	mvi r1,0
    38e8:	ba 80 10 00 	mv r2,r20
    38ec:	b9 60 18 00 	mv r3,r11
    38f0:	fb ff f3 e4 	calli 880 <wrc_debug_printf>
    38f4:	35 6b 00 3b 	addi r11,r11,59
    38f8:	3d 6b 00 03 	sli r11,r11,3
    38fc:	ba 00 08 00 	mv r1,r16
    3900:	b5 8b 58 00 	add r11,r12,r11
    3904:	59 78 00 00 	sw (r11+0),r24
    3908:	fb ff fe 46 	calli 3220 <spll_start_channel>
    390c:	e0 00 00 3e 	bi 3a04 <spll_update_aux_clocks+0x264>
    3910:	3d 61 00 07 	sli r1,r11,7
    3914:	b5 81 08 00 	add r1,r12,r1
    3918:	28 21 01 90 	lw r1,(r1+400)
    391c:	44 20 00 3a 	be r1,r0,3a04 <spll_update_aux_clocks+0x264>
    3920:	29 a1 00 00 	lw r1,(r13+0)
    3924:	44 20 00 06 	be r1,r0,393c <spll_update_aux_clocks+0x19c>
    3928:	29 84 00 18 	lw r4,(r12+24)
    392c:	34 01 00 00 	mvi r1,0
    3930:	ba e0 10 00 	mv r2,r23
    3934:	b9 60 18 00 	mv r3,r11
    3938:	fb ff f3 d2 	calli 880 <wrc_debug_printf>
    393c:	35 6b 00 3b 	addi r11,r11,59
    3940:	29 82 00 18 	lw r2,(r12+24)
    3944:	3d 6b 00 03 	sli r11,r11,3
    3948:	ba 00 08 00 	mv r1,r16
    394c:	b5 8b 58 00 	add r11,r12,r11
    3950:	fb ff f8 c1 	calli 1c54 <set_phase_shift>
    3954:	59 7b 00 00 	sw (r11+0),fp
    3958:	e0 00 00 2b 	bi 3a04 <spll_update_aux_clocks+0x264>
    395c:	3d 61 00 07 	sli r1,r11,7
    3960:	b5 81 08 00 	add r1,r12,r1
    3964:	28 22 01 bc 	lw r2,(r1+444)
    3968:	28 21 01 c0 	lw r1,(r1+448)
    396c:	5c 41 00 26 	bne r2,r1,3a04 <spll_update_aux_clocks+0x264>
    3970:	29 a1 00 00 	lw r1,(r13+0)
    3974:	44 20 00 05 	be r1,r0,3988 <spll_update_aux_clocks+0x1e8>
    3978:	34 01 00 00 	mvi r1,0
    397c:	ba c0 10 00 	mv r2,r22
    3980:	b9 60 18 00 	mv r3,r11
    3984:	fb ff f3 bf 	calli 880 <wrc_debug_printf>
    3988:	29 c1 00 10 	lw r1,(r14+16)
    398c:	3e 52 00 08 	sli r18,r18,8
    3990:	35 6b 00 3b 	addi r11,r11,59
    3994:	22 52 ff ff 	andi r18,r18,0xffff
    3998:	3d 6b 00 03 	sli r11,r11,3
    399c:	ba 41 90 00 	or r18,r18,r1
    39a0:	59 d2 00 10 	sw (r14+16),r18
    39a4:	b5 8b 58 00 	add r11,r12,r11
    39a8:	59 79 00 00 	sw (r11+0),r25
    39ac:	e0 00 00 16 	bi 3a04 <spll_update_aux_clocks+0x264>
    39b0:	29 81 01 10 	lw r1,(r12+272)
    39b4:	44 20 00 05 	be r1,r0,39c8 <spll_update_aux_clocks+0x228>
    39b8:	3d 61 00 07 	sli r1,r11,7
    39bc:	b5 81 08 00 	add r1,r12,r1
    39c0:	28 21 01 90 	lw r1,(r1+400)
    39c4:	5c 20 00 10 	bne r1,r0,3a04 <spll_update_aux_clocks+0x264>
    39c8:	29 a1 00 00 	lw r1,(r13+0)
    39cc:	44 20 00 04 	be r1,r0,39dc <spll_update_aux_clocks+0x23c>
    39d0:	34 01 00 00 	mvi r1,0
    39d4:	ba a0 10 00 	mv r2,r21
    39d8:	fb ff f3 aa 	calli 880 <wrc_debug_printf>
    39dc:	3e 52 00 08 	sli r18,r18,8
    39e0:	29 c1 00 10 	lw r1,(r14+16)
    39e4:	22 52 ff ff 	andi r18,r18,0xffff
    39e8:	35 6b 00 3b 	addi r11,r11,59
    39ec:	a6 40 90 00 	not r18,r18
    39f0:	3d 6b 00 03 	sli r11,r11,3
    39f4:	a2 41 90 00 	and r18,r18,r1
    39f8:	59 d2 00 10 	sw (r14+16),r18
    39fc:	b5 8b 58 00 	add r11,r12,r11
    3a00:	59 6f 00 00 	sw (r11+0),r15
    3a04:	ba 00 58 00 	mv r11,r16
    3a08:	2a 21 00 00 	lw r1,(r17+0)
    3a0c:	34 21 ff ff 	addi r1,r1,-1
    3a10:	48 2b ff 92 	bg r1,r11,3858 <spll_update_aux_clocks+0xb8>
    3a14:	2b 9d 00 04 	lw ra,(sp+4)
    3a18:	2b 8b 00 44 	lw r11,(sp+68)
    3a1c:	2b 8c 00 40 	lw r12,(sp+64)
    3a20:	2b 8d 00 3c 	lw r13,(sp+60)
    3a24:	2b 8e 00 38 	lw r14,(sp+56)
    3a28:	2b 8f 00 34 	lw r15,(sp+52)
    3a2c:	2b 90 00 30 	lw r16,(sp+48)
    3a30:	2b 91 00 2c 	lw r17,(sp+44)
    3a34:	2b 92 00 28 	lw r18,(sp+40)
    3a38:	2b 93 00 24 	lw r19,(sp+36)
    3a3c:	2b 94 00 20 	lw r20,(sp+32)
    3a40:	2b 95 00 1c 	lw r21,(sp+28)
    3a44:	2b 96 00 18 	lw r22,(sp+24)
    3a48:	2b 97 00 14 	lw r23,(sp+20)
    3a4c:	2b 98 00 10 	lw r24,(sp+16)
    3a50:	2b 99 00 0c 	lw r25,(sp+12)
    3a54:	2b 9b 00 08 	lw fp,(sp+8)
    3a58:	37 9c 00 48 	addi sp,sp,72
    3a5c:	c3 a0 00 00 	ret

00003a60 <spll_get_aux_status>:
    3a60:	34 21 00 3b 	addi r1,r1,59
    3a64:	3c 21 00 03 	sli r1,r1,3
    3a68:	78 02 00 01 	mvhi r2,0x1
    3a6c:	38 42 66 2c 	ori r2,r2,0x662c
    3a70:	b4 41 10 00 	add r2,r2,r1
    3a74:	28 41 00 00 	lw r1,(r2+0)
    3a78:	28 43 00 00 	lw r3,(r2+0)
    3a7c:	34 02 00 04 	mvi r2,4
    3a80:	7c 21 00 01 	cmpnei r1,r1,1
    3a84:	5c 62 00 02 	bne r3,r2,3a8c <spll_get_aux_status+0x2c>
    3a88:	38 21 00 02 	ori r1,r1,0x2
    3a8c:	c3 a0 00 00 	ret

00003a90 <spll_get_dac>:
    3a90:	4c 20 00 05 	bge r1,r0,3aa4 <spll_get_dac+0x14>
    3a94:	78 01 00 01 	mvhi r1,0x1
    3a98:	38 21 66 2c 	ori r1,r1,0x662c
    3a9c:	28 21 00 54 	lw r1,(r1+84)
    3aa0:	c3 a0 00 00 	ret
    3aa4:	78 02 00 01 	mvhi r2,0x1
    3aa8:	38 42 66 2c 	ori r2,r2,0x662c
    3aac:	5c 20 00 03 	bne r1,r0,3ab8 <spll_get_dac+0x28>
    3ab0:	28 41 00 fc 	lw r1,(r2+252)
    3ab4:	c3 a0 00 00 	ret
    3ab8:	34 21 ff ff 	addi r1,r1,-1
    3abc:	3c 21 00 07 	sli r1,r1,7
    3ac0:	b4 41 10 00 	add r2,r2,r1
    3ac4:	28 41 01 7c 	lw r1,(r2+380)
    3ac8:	c3 a0 00 00 	ret

00003acc <_p_vsprintf>:
    3acc:	37 9c ff b0 	addi sp,sp,-80
    3ad0:	5b 8b 00 3c 	sw (sp+60),r11
    3ad4:	5b 8c 00 38 	sw (sp+56),r12
    3ad8:	5b 8d 00 34 	sw (sp+52),r13
    3adc:	5b 8e 00 30 	sw (sp+48),r14
    3ae0:	5b 8f 00 2c 	sw (sp+44),r15
    3ae4:	5b 90 00 28 	sw (sp+40),r16
    3ae8:	5b 91 00 24 	sw (sp+36),r17
    3aec:	5b 92 00 20 	sw (sp+32),r18
    3af0:	5b 93 00 1c 	sw (sp+28),r19
    3af4:	5b 94 00 18 	sw (sp+24),r20
    3af8:	5b 95 00 14 	sw (sp+20),r21
    3afc:	5b 96 00 10 	sw (sp+16),r22
    3b00:	5b 97 00 0c 	sw (sp+12),r23
    3b04:	5b 98 00 08 	sw (sp+8),r24
    3b08:	5b 9d 00 04 	sw (sp+4),ra
    3b0c:	34 18 00 25 	mvi r24,37
    3b10:	b8 20 60 00 	mv r12,r1
    3b14:	5b 82 00 40 	sw (sp+64),r2
    3b18:	b8 60 58 00 	mv r11,r3
    3b1c:	34 17 00 08 	mvi r23,8
    3b20:	34 10 00 64 	mvi r16,100
    3b24:	34 16 00 39 	mvi r22,57
    3b28:	34 15 00 75 	mvi r21,117
    3b2c:	34 14 00 78 	mvi r20,120
    3b30:	34 13 00 73 	mvi r19,115
    3b34:	34 12 00 53 	mvi r18,83
    3b38:	34 11 00 63 	mvi r17,99
    3b3c:	e0 00 00 16 	bi 3b94 <_p_vsprintf+0xc8>
    3b40:	5c 20 00 13 	bne r1,r0,3b8c <_p_vsprintf+0xc0>
    3b44:	31 60 00 00 	sb (r11+0),r0
    3b48:	2b 9d 00 04 	lw ra,(sp+4)
    3b4c:	2b 8b 00 3c 	lw r11,(sp+60)
    3b50:	2b 8c 00 38 	lw r12,(sp+56)
    3b54:	2b 8d 00 34 	lw r13,(sp+52)
    3b58:	2b 8e 00 30 	lw r14,(sp+48)
    3b5c:	2b 8f 00 2c 	lw r15,(sp+44)
    3b60:	2b 90 00 28 	lw r16,(sp+40)
    3b64:	2b 91 00 24 	lw r17,(sp+36)
    3b68:	2b 92 00 20 	lw r18,(sp+32)
    3b6c:	2b 93 00 1c 	lw r19,(sp+28)
    3b70:	2b 94 00 18 	lw r20,(sp+24)
    3b74:	2b 95 00 14 	lw r21,(sp+20)
    3b78:	2b 96 00 10 	lw r22,(sp+16)
    3b7c:	2b 97 00 0c 	lw r23,(sp+12)
    3b80:	2b 98 00 08 	lw r24,(sp+8)
    3b84:	37 9c 00 50 	addi sp,sp,80
    3b88:	c3 a0 00 00 	ret
    3b8c:	31 61 00 00 	sb (r11+0),r1
    3b90:	35 6b 00 01 	addi r11,r11,1
    3b94:	41 81 00 00 	lbu r1,(r12+0)
    3b98:	35 8c 00 01 	addi r12,r12,1
    3b9c:	5c 38 ff e9 	bne r1,r24,3b40 <_p_vsprintf+0x74>
    3ba0:	41 81 00 00 	lbu r1,(r12+0)
    3ba4:	64 21 00 30 	cmpei r1,r1,48
    3ba8:	b5 81 60 00 	add r12,r12,r1
    3bac:	41 81 00 00 	lbu r1,(r12+0)
    3bb0:	34 21 ff cf 	addi r1,r1,-49
    3bb4:	20 21 00 ff 	andi r1,r1,0xff
    3bb8:	f2 e1 08 00 	cmpgeu r1,r23,r1
    3bbc:	b5 81 60 00 	add r12,r12,r1
    3bc0:	41 81 00 00 	lbu r1,(r12+0)
    3bc4:	35 8c 00 01 	addi r12,r12,1
    3bc8:	44 30 00 09 	be r1,r16,3bec <_p_vsprintf+0x120>
    3bcc:	54 30 00 04 	bgu r1,r16,3bdc <_p_vsprintf+0x110>
    3bd0:	44 32 00 0e 	be r1,r18,3c08 <_p_vsprintf+0x13c>
    3bd4:	5c 31 ff ee 	bne r1,r17,3b8c <_p_vsprintf+0xc0>
    3bd8:	e0 00 00 07 	bi 3bf4 <_p_vsprintf+0x128>
    3bdc:	44 35 00 04 	be r1,r21,3bec <_p_vsprintf+0x120>
    3be0:	44 34 00 15 	be r1,r20,3c34 <_p_vsprintf+0x168>
    3be4:	5c 33 ff ea 	bne r1,r19,3b8c <_p_vsprintf+0xc0>
    3be8:	e0 00 00 08 	bi 3c08 <_p_vsprintf+0x13c>
    3bec:	34 0f 00 0a 	mvi r15,10
    3bf0:	e0 00 00 12 	bi 3c38 <_p_vsprintf+0x16c>
    3bf4:	2b 81 00 40 	lw r1,(sp+64)
    3bf8:	34 22 00 04 	addi r2,r1,4
    3bfc:	5b 82 00 40 	sw (sp+64),r2
    3c00:	40 21 00 03 	lbu r1,(r1+3)
    3c04:	e3 ff ff e2 	bi 3b8c <_p_vsprintf+0xc0>
    3c08:	2b 81 00 40 	lw r1,(sp+64)
    3c0c:	34 22 00 04 	addi r2,r1,4
    3c10:	5b 82 00 40 	sw (sp+64),r2
    3c14:	28 21 00 00 	lw r1,(r1+0)
    3c18:	e0 00 00 04 	bi 3c28 <_p_vsprintf+0x15c>
    3c1c:	31 62 00 00 	sb (r11+0),r2
    3c20:	34 21 00 01 	addi r1,r1,1
    3c24:	35 6b 00 01 	addi r11,r11,1
    3c28:	40 22 00 00 	lbu r2,(r1+0)
    3c2c:	5c 40 ff fc 	bne r2,r0,3c1c <_p_vsprintf+0x150>
    3c30:	e3 ff ff d9 	bi 3b94 <_p_vsprintf+0xc8>
    3c34:	34 0f 00 10 	mvi r15,16
    3c38:	2b 81 00 40 	lw r1,(sp+64)
    3c3c:	37 8d 00 53 	addi r13,sp,83
    3c40:	34 22 00 04 	addi r2,r1,4
    3c44:	28 2e 00 00 	lw r14,(r1+0)
    3c48:	5b 82 00 40 	sw (sp+64),r2
    3c4c:	33 80 00 53 	sb (sp+83),r0
    3c50:	b9 c0 08 00 	mv r1,r14
    3c54:	b9 e0 10 00 	mv r2,r15
    3c58:	f8 00 3a 6b 	calli 12604 <__umodsi3>
    3c5c:	34 21 00 30 	addi r1,r1,48
    3c60:	20 21 00 ff 	andi r1,r1,0xff
    3c64:	52 c1 00 03 	bgeu r22,r1,3c70 <_p_vsprintf+0x1a4>
    3c68:	34 21 00 27 	addi r1,r1,39
    3c6c:	20 21 00 ff 	andi r1,r1,0xff
    3c70:	35 ad ff ff 	addi r13,r13,-1
    3c74:	31 a1 00 00 	sb (r13+0),r1
    3c78:	b9 e0 10 00 	mv r2,r15
    3c7c:	b9 c0 08 00 	mv r1,r14
    3c80:	f8 00 3a 51 	calli 125c4 <__udivsi3>
    3c84:	b8 20 70 00 	mv r14,r1
    3c88:	5c 20 ff f2 	bne r1,r0,3c50 <_p_vsprintf+0x184>
    3c8c:	e0 00 00 04 	bi 3c9c <_p_vsprintf+0x1d0>
    3c90:	31 61 00 00 	sb (r11+0),r1
    3c94:	35 ad 00 01 	addi r13,r13,1
    3c98:	35 6b 00 01 	addi r11,r11,1
    3c9c:	41 a1 00 00 	lbu r1,(r13+0)
    3ca0:	5c 20 ff fc 	bne r1,r0,3c90 <_p_vsprintf+0x1c4>
    3ca4:	e3 ff ff bc 	bi 3b94 <_p_vsprintf+0xc8>

00003ca8 <vprintf>:
    3ca8:	37 9c ff b4 	addi sp,sp,-76
    3cac:	5b 8b 00 38 	sw (sp+56),r11
    3cb0:	5b 8c 00 34 	sw (sp+52),r12
    3cb4:	5b 8d 00 30 	sw (sp+48),r13
    3cb8:	5b 8e 00 2c 	sw (sp+44),r14
    3cbc:	5b 8f 00 28 	sw (sp+40),r15
    3cc0:	5b 90 00 24 	sw (sp+36),r16
    3cc4:	5b 91 00 20 	sw (sp+32),r17
    3cc8:	5b 92 00 1c 	sw (sp+28),r18
    3ccc:	5b 93 00 18 	sw (sp+24),r19
    3cd0:	5b 94 00 14 	sw (sp+20),r20
    3cd4:	5b 95 00 10 	sw (sp+16),r21
    3cd8:	5b 96 00 0c 	sw (sp+12),r22
    3cdc:	5b 97 00 08 	sw (sp+8),r23
    3ce0:	5b 9d 00 04 	sw (sp+4),ra
    3ce4:	34 17 00 25 	mvi r23,37
    3ce8:	b8 20 58 00 	mv r11,r1
    3cec:	5b 82 00 3c 	sw (sp+60),r2
    3cf0:	34 16 00 08 	mvi r22,8
    3cf4:	34 0f 00 64 	mvi r15,100
    3cf8:	34 15 00 39 	mvi r21,57
    3cfc:	34 14 00 75 	mvi r20,117
    3d00:	34 13 00 78 	mvi r19,120
    3d04:	34 12 00 73 	mvi r18,115
    3d08:	34 11 00 53 	mvi r17,83
    3d0c:	34 10 00 63 	mvi r16,99
    3d10:	e0 00 00 13 	bi 3d5c <vprintf+0xb4>
    3d14:	5c 20 00 11 	bne r1,r0,3d58 <vprintf+0xb0>
    3d18:	2b 9d 00 04 	lw ra,(sp+4)
    3d1c:	2b 8b 00 38 	lw r11,(sp+56)
    3d20:	2b 8c 00 34 	lw r12,(sp+52)
    3d24:	2b 8d 00 30 	lw r13,(sp+48)
    3d28:	2b 8e 00 2c 	lw r14,(sp+44)
    3d2c:	2b 8f 00 28 	lw r15,(sp+40)
    3d30:	2b 90 00 24 	lw r16,(sp+36)
    3d34:	2b 91 00 20 	lw r17,(sp+32)
    3d38:	2b 92 00 1c 	lw r18,(sp+28)
    3d3c:	2b 93 00 18 	lw r19,(sp+24)
    3d40:	2b 94 00 14 	lw r20,(sp+20)
    3d44:	2b 95 00 10 	lw r21,(sp+16)
    3d48:	2b 96 00 0c 	lw r22,(sp+12)
    3d4c:	2b 97 00 08 	lw r23,(sp+8)
    3d50:	37 9c 00 4c 	addi sp,sp,76
    3d54:	c3 a0 00 00 	ret
    3d58:	fb ff f4 10 	calli d98 <uart_write_byte>
    3d5c:	41 61 00 00 	lbu r1,(r11+0)
    3d60:	35 6b 00 01 	addi r11,r11,1
    3d64:	5c 37 ff ec 	bne r1,r23,3d14 <vprintf+0x6c>
    3d68:	41 61 00 00 	lbu r1,(r11+0)
    3d6c:	64 21 00 30 	cmpei r1,r1,48
    3d70:	b5 61 58 00 	add r11,r11,r1
    3d74:	41 61 00 00 	lbu r1,(r11+0)
    3d78:	34 21 ff cf 	addi r1,r1,-49
    3d7c:	20 21 00 ff 	andi r1,r1,0xff
    3d80:	f2 c1 08 00 	cmpgeu r1,r22,r1
    3d84:	b5 61 58 00 	add r11,r11,r1
    3d88:	41 63 00 00 	lbu r3,(r11+0)
    3d8c:	35 6b 00 01 	addi r11,r11,1
    3d90:	44 6f 00 09 	be r3,r15,3db4 <vprintf+0x10c>
    3d94:	54 6f 00 04 	bgu r3,r15,3da4 <vprintf+0xfc>
    3d98:	44 71 00 0f 	be r3,r17,3dd4 <vprintf+0x12c>
    3d9c:	5c 70 00 0c 	bne r3,r16,3dcc <vprintf+0x124>
    3da0:	e0 00 00 07 	bi 3dbc <vprintf+0x114>
    3da4:	44 74 00 04 	be r3,r20,3db4 <vprintf+0x10c>
    3da8:	44 73 00 15 	be r3,r19,3dfc <vprintf+0x154>
    3dac:	5c 72 00 08 	bne r3,r18,3dcc <vprintf+0x124>
    3db0:	e0 00 00 09 	bi 3dd4 <vprintf+0x12c>
    3db4:	34 0e 00 0a 	mvi r14,10
    3db8:	e0 00 00 12 	bi 3e00 <vprintf+0x158>
    3dbc:	2b 81 00 3c 	lw r1,(sp+60)
    3dc0:	40 23 00 03 	lbu r3,(r1+3)
    3dc4:	34 22 00 04 	addi r2,r1,4
    3dc8:	5b 82 00 3c 	sw (sp+60),r2
    3dcc:	b8 60 08 00 	mv r1,r3
    3dd0:	e3 ff ff e2 	bi 3d58 <vprintf+0xb0>
    3dd4:	2b 81 00 3c 	lw r1,(sp+60)
    3dd8:	34 22 00 04 	addi r2,r1,4
    3ddc:	5b 82 00 3c 	sw (sp+60),r2
    3de0:	28 2c 00 00 	lw r12,(r1+0)
    3de4:	e0 00 00 03 	bi 3df0 <vprintf+0x148>
    3de8:	35 8c 00 01 	addi r12,r12,1
    3dec:	fb ff f3 eb 	calli d98 <uart_write_byte>
    3df0:	41 81 00 00 	lbu r1,(r12+0)
    3df4:	5c 20 ff fd 	bne r1,r0,3de8 <vprintf+0x140>
    3df8:	e3 ff ff d9 	bi 3d5c <vprintf+0xb4>
    3dfc:	34 0e 00 10 	mvi r14,16
    3e00:	2b 81 00 3c 	lw r1,(sp+60)
    3e04:	64 63 00 64 	cmpei r3,r3,100
    3e08:	28 2c 00 00 	lw r12,(r1+0)
    3e0c:	34 22 00 04 	addi r2,r1,4
    3e10:	5b 82 00 3c 	sw (sp+60),r2
    3e14:	01 81 00 1f 	srui r1,r12,31
    3e18:	a0 61 18 00 	and r3,r3,r1
    3e1c:	44 60 00 04 	be r3,r0,3e2c <vprintf+0x184>
    3e20:	34 01 00 2d 	mvi r1,45
    3e24:	fb ff f3 dd 	calli d98 <uart_write_byte>
    3e28:	c8 0c 60 00 	sub r12,r0,r12
    3e2c:	33 80 00 4f 	sb (sp+79),r0
    3e30:	37 8d 00 4f 	addi r13,sp,79
    3e34:	b9 80 08 00 	mv r1,r12
    3e38:	b9 c0 10 00 	mv r2,r14
    3e3c:	f8 00 39 f2 	calli 12604 <__umodsi3>
    3e40:	34 21 00 30 	addi r1,r1,48
    3e44:	20 21 00 ff 	andi r1,r1,0xff
    3e48:	52 a1 00 03 	bgeu r21,r1,3e54 <vprintf+0x1ac>
    3e4c:	34 21 00 27 	addi r1,r1,39
    3e50:	20 21 00 ff 	andi r1,r1,0xff
    3e54:	35 ad ff ff 	addi r13,r13,-1
    3e58:	31 a1 00 00 	sb (r13+0),r1
    3e5c:	b9 c0 10 00 	mv r2,r14
    3e60:	b9 80 08 00 	mv r1,r12
    3e64:	f8 00 39 d8 	calli 125c4 <__udivsi3>
    3e68:	b8 20 60 00 	mv r12,r1
    3e6c:	5c 20 ff f2 	bne r1,r0,3e34 <vprintf+0x18c>
    3e70:	e0 00 00 03 	bi 3e7c <vprintf+0x1d4>
    3e74:	35 ad 00 01 	addi r13,r13,1
    3e78:	fb ff f3 c8 	calli d98 <uart_write_byte>
    3e7c:	41 a1 00 00 	lbu r1,(r13+0)
    3e80:	5c 20 ff fd 	bne r1,r0,3e74 <vprintf+0x1cc>
    3e84:	e3 ff ff b6 	bi 3d5c <vprintf+0xb4>

00003e88 <mprintf>:
    3e88:	37 9c ff dc 	addi sp,sp,-36
    3e8c:	5b 9d 00 04 	sw (sp+4),ra
    3e90:	5b 82 00 0c 	sw (sp+12),r2
    3e94:	37 82 00 0c 	addi r2,sp,12
    3e98:	5b 81 00 08 	sw (sp+8),r1
    3e9c:	5b 83 00 10 	sw (sp+16),r3
    3ea0:	5b 84 00 14 	sw (sp+20),r4
    3ea4:	5b 85 00 18 	sw (sp+24),r5
    3ea8:	5b 86 00 1c 	sw (sp+28),r6
    3eac:	5b 87 00 20 	sw (sp+32),r7
    3eb0:	5b 88 00 24 	sw (sp+36),r8
    3eb4:	fb ff ff 7d 	calli 3ca8 <vprintf>
    3eb8:	2b 9d 00 04 	lw ra,(sp+4)
    3ebc:	37 9c 00 24 	addi sp,sp,36
    3ec0:	c3 a0 00 00 	ret

00003ec4 <msprintf>:
    3ec4:	37 9c ff e0 	addi sp,sp,-32
    3ec8:	5b 9d 00 04 	sw (sp+4),ra
    3ecc:	b8 20 48 00 	mv r9,r1
    3ed0:	5b 82 00 08 	sw (sp+8),r2
    3ed4:	5b 83 00 0c 	sw (sp+12),r3
    3ed8:	b8 40 08 00 	mv r1,r2
    3edc:	b9 20 18 00 	mv r3,r9
    3ee0:	37 82 00 0c 	addi r2,sp,12
    3ee4:	5b 84 00 10 	sw (sp+16),r4
    3ee8:	5b 85 00 14 	sw (sp+20),r5
    3eec:	5b 86 00 18 	sw (sp+24),r6
    3ef0:	5b 87 00 1c 	sw (sp+28),r7
    3ef4:	5b 88 00 20 	sw (sp+32),r8
    3ef8:	fb ff fe f5 	calli 3acc <_p_vsprintf>
    3efc:	2b 9d 00 04 	lw ra,(sp+4)
    3f00:	37 9c 00 20 	addi sp,sp,32
    3f04:	c3 a0 00 00 	ret

00003f08 <m_cprintf>:
    3f08:	37 9c ff dc 	addi sp,sp,-36
    3f0c:	5b 8b 00 08 	sw (sp+8),r11
    3f10:	5b 9d 00 04 	sw (sp+4),ra
    3f14:	5b 84 00 14 	sw (sp+20),r4
    3f18:	20 24 00 80 	andi r4,r1,0x80
    3f1c:	64 84 00 00 	cmpei r4,r4,0
    3f20:	5b 83 00 10 	sw (sp+16),r3
    3f24:	78 03 00 01 	mvhi r3,0x1
    3f28:	b8 20 48 00 	mv r9,r1
    3f2c:	b8 60 08 00 	mv r1,r3
    3f30:	34 03 00 02 	mvi r3,2
    3f34:	5b 82 00 0c 	sw (sp+12),r2
    3f38:	b8 40 58 00 	mv r11,r2
    3f3c:	38 21 2f 88 	ori r1,r1,0x2f88
    3f40:	c8 64 10 00 	sub r2,r3,r4
    3f44:	21 23 00 7f 	andi r3,r9,0x7f
    3f48:	5b 85 00 18 	sw (sp+24),r5
    3f4c:	5b 86 00 1c 	sw (sp+28),r6
    3f50:	5b 87 00 20 	sw (sp+32),r7
    3f54:	5b 88 00 24 	sw (sp+36),r8
    3f58:	fb ff ff cc 	calli 3e88 <mprintf>
    3f5c:	b9 60 08 00 	mv r1,r11
    3f60:	37 82 00 10 	addi r2,sp,16
    3f64:	fb ff ff 51 	calli 3ca8 <vprintf>
    3f68:	2b 9d 00 04 	lw ra,(sp+4)
    3f6c:	2b 8b 00 08 	lw r11,(sp+8)
    3f70:	37 9c 00 24 	addi sp,sp,36
    3f74:	c3 a0 00 00 	ret

00003f78 <m_pcprintf>:
    3f78:	37 9c ff e0 	addi sp,sp,-32
    3f7c:	5b 8b 00 0c 	sw (sp+12),r11
    3f80:	5b 8c 00 08 	sw (sp+8),r12
    3f84:	5b 9d 00 04 	sw (sp+4),ra
    3f88:	b8 40 48 00 	mv r9,r2
    3f8c:	78 02 00 01 	mvhi r2,0x1
    3f90:	b8 20 50 00 	mv r10,r1
    3f94:	b8 40 08 00 	mv r1,r2
    3f98:	b8 60 58 00 	mv r11,r3
    3f9c:	b9 40 10 00 	mv r2,r10
    3fa0:	b9 20 18 00 	mv r3,r9
    3fa4:	38 21 2f 94 	ori r1,r1,0x2f94
    3fa8:	b8 80 60 00 	mv r12,r4
    3fac:	5b 84 00 10 	sw (sp+16),r4
    3fb0:	5b 85 00 14 	sw (sp+20),r5
    3fb4:	5b 86 00 18 	sw (sp+24),r6
    3fb8:	5b 87 00 1c 	sw (sp+28),r7
    3fbc:	5b 88 00 20 	sw (sp+32),r8
    3fc0:	fb ff ff b2 	calli 3e88 <mprintf>
    3fc4:	21 62 00 80 	andi r2,r11,0x80
    3fc8:	78 03 00 01 	mvhi r3,0x1
    3fcc:	64 42 00 00 	cmpei r2,r2,0
    3fd0:	b8 60 08 00 	mv r1,r3
    3fd4:	34 03 00 02 	mvi r3,2
    3fd8:	c8 62 10 00 	sub r2,r3,r2
    3fdc:	38 21 2f 88 	ori r1,r1,0x2f88
    3fe0:	21 63 00 7f 	andi r3,r11,0x7f
    3fe4:	fb ff ff a9 	calli 3e88 <mprintf>
    3fe8:	b9 80 08 00 	mv r1,r12
    3fec:	37 82 00 14 	addi r2,sp,20
    3ff0:	fb ff ff 2e 	calli 3ca8 <vprintf>
    3ff4:	2b 9d 00 04 	lw ra,(sp+4)
    3ff8:	2b 8b 00 0c 	lw r11,(sp+12)
    3ffc:	2b 8c 00 08 	lw r12,(sp+8)
    4000:	37 9c 00 20 	addi sp,sp,32
    4004:	c3 a0 00 00 	ret

00004008 <m_term_clear>:
    4008:	37 9c ff fc 	addi sp,sp,-4
    400c:	5b 9d 00 04 	sw (sp+4),ra
    4010:	78 01 00 01 	mvhi r1,0x1
    4014:	38 21 2f a0 	ori r1,r1,0x2fa0
    4018:	fb ff ff 9c 	calli 3e88 <mprintf>
    401c:	2b 9d 00 04 	lw ra,(sp+4)
    4020:	37 9c 00 04 	addi sp,sp,4
    4024:	c3 a0 00 00 	ret

00004028 <pfilter_new>:
    4028:	78 01 00 01 	mvhi r1,0x1
    402c:	38 21 68 44 	ori r1,r1,0x6844
    4030:	58 20 00 00 	sw (r1+0),r0
    4034:	c3 a0 00 00 	ret

00004038 <pfilter_cmp>:
    4038:	37 9c ff f4 	addi sp,sp,-12
    403c:	5b 8b 00 0c 	sw (sp+12),r11
    4040:	5b 8c 00 08 	sw (sp+8),r12
    4044:	5b 8d 00 04 	sw (sp+4),r13
    4048:	14 29 00 1f 	sri r9,r1,31
    404c:	00 26 00 19 	srui r6,r1,25
    4050:	3d 29 00 07 	sli r9,r9,7
    4054:	20 67 00 10 	andi r7,r3,0x10
    4058:	7c e7 00 00 	cmpnei r7,r7,0
    405c:	b8 c9 48 00 	or r9,r6,r9
    4060:	20 68 00 01 	andi r8,r3,0x1
    4064:	20 66 01 00 	andi r6,r3,0x100
    4068:	3c 21 00 07 	sli r1,r1,7
    406c:	3d 08 00 1d 	sli r8,r8,29
    4070:	3c e7 00 1e 	sli r7,r7,30
    4074:	34 0b 00 00 	mvi r11,0
    4078:	44 c0 00 02 	be r6,r0,4080 <pfilter_cmp+0x48>
    407c:	78 0b 80 00 	mvhi r11,0x8000
    4080:	78 06 00 01 	mvhi r6,0x1
    4084:	20 42 ff ff 	andi r2,r2,0xffff
    4088:	38 c6 68 44 	ori r6,r6,0x6844
    408c:	3c 42 00 0d 	sli r2,r2,13
    4090:	28 cc 00 00 	lw r12,(r6+0)
    4094:	b8 81 20 00 	or r4,r4,r1
    4098:	3c a5 00 03 	sli r5,r5,3
    409c:	b8 82 20 00 	or r4,r4,r2
    40a0:	14 a1 00 1f 	sri r1,r5,31
    40a4:	20 63 10 00 	andi r3,r3,0x1000
    40a8:	b8 85 28 00 	or r5,r4,r5
    40ac:	7c 63 00 00 	cmpnei r3,r3,0
    40b0:	3d 8d 00 03 	sli r13,r12,3
    40b4:	b8 a8 40 00 	or r8,r5,r8
    40b8:	78 0a 00 01 	mvhi r10,0x1
    40bc:	b9 21 48 00 	or r9,r9,r1
    40c0:	b9 07 38 00 	or r7,r8,r7
    40c4:	39 4a 68 48 	ori r10,r10,0x6848
    40c8:	b5 4d 50 00 	add r10,r10,r13
    40cc:	b8 eb 58 00 	or r11,r7,r11
    40d0:	b9 23 48 00 	or r9,r9,r3
    40d4:	35 81 00 01 	addi r1,r12,1
    40d8:	59 49 00 00 	sw (r10+0),r9
    40dc:	59 4b 00 04 	sw (r10+4),r11
    40e0:	58 c1 00 00 	sw (r6+0),r1
    40e4:	2b 8b 00 0c 	lw r11,(sp+12)
    40e8:	2b 8c 00 08 	lw r12,(sp+8)
    40ec:	2b 8d 00 04 	lw r13,(sp+4)
    40f0:	37 9c 00 0c 	addi sp,sp,12
    40f4:	c3 a0 00 00 	ret

000040f8 <pfilter_btst>:
    40f8:	78 05 00 01 	mvhi r5,0x1
    40fc:	38 a5 68 44 	ori r5,r5,0x6844
    4100:	28 aa 00 00 	lw r10,(r5+0)
    4104:	78 06 00 01 	mvhi r6,0x1
    4108:	38 c6 68 48 	ori r6,r6,0x6848
    410c:	3d 47 00 03 	sli r7,r10,3
    4110:	00 28 00 19 	srui r8,r1,25
    4114:	b4 c7 38 00 	add r7,r6,r7
    4118:	14 26 00 1f 	sri r6,r1,31
    411c:	3c 21 00 07 	sli r1,r1,7
    4120:	3c c6 00 07 	sli r6,r6,7
    4124:	b8 23 18 00 	or r3,r1,r3
    4128:	b9 06 30 00 	or r6,r8,r6
    412c:	38 c1 00 02 	ori r1,r6,0x2
    4130:	14 46 00 1f 	sri r6,r2,31
    4134:	00 48 00 03 	srui r8,r2,3
    4138:	3c c6 00 1d 	sli r6,r6,29
    413c:	3c 89 00 01 	sli r9,r4,1
    4140:	b9 06 30 00 	or r6,r8,r6
    4144:	3c 42 00 1d 	sli r2,r2,29
    4148:	b8 26 30 00 	or r6,r1,r6
    414c:	14 81 00 1f 	sri r1,r4,31
    4150:	b8 62 18 00 	or r3,r3,r2
    4154:	3c 21 00 01 	sli r1,r1,1
    4158:	f4 89 10 00 	cmpgu r2,r4,r9
    415c:	3c 88 00 02 	sli r8,r4,2
    4160:	b4 41 08 00 	add r1,r2,r1
    4164:	f5 28 48 00 	cmpgu r9,r9,r8
    4168:	3c 21 00 01 	sli r1,r1,1
    416c:	3c 84 00 03 	sli r4,r4,3
    4170:	b5 21 48 00 	add r9,r9,r1
    4174:	f5 04 40 00 	cmpgu r8,r8,r4
    4178:	3d 29 00 01 	sli r9,r9,1
    417c:	b8 64 20 00 	or r4,r3,r4
    4180:	b5 09 40 00 	add r8,r8,r9
    4184:	b8 c8 30 00 	or r6,r6,r8
    4188:	35 41 00 01 	addi r1,r10,1
    418c:	58 e6 00 00 	sw (r7+0),r6
    4190:	58 e4 00 04 	sw (r7+4),r4
    4194:	58 a1 00 00 	sw (r5+0),r1
    4198:	c3 a0 00 00 	ret

0000419c <pfilter_nop>:
    419c:	78 01 00 01 	mvhi r1,0x1
    41a0:	38 21 68 44 	ori r1,r1,0x6844
    41a4:	28 23 00 00 	lw r3,(r1+0)
    41a8:	78 02 00 01 	mvhi r2,0x1
    41ac:	38 42 68 48 	ori r2,r2,0x6848
    41b0:	3c 64 00 03 	sli r4,r3,3
    41b4:	b4 44 10 00 	add r2,r2,r4
    41b8:	34 04 00 04 	mvi r4,4
    41bc:	58 44 00 00 	sw (r2+0),r4
    41c0:	58 40 00 04 	sw (r2+4),r0
    41c4:	34 62 00 01 	addi r2,r3,1
    41c8:	58 22 00 00 	sw (r1+0),r2
    41cc:	c3 a0 00 00 	ret

000041d0 <pfilter_logic2>:
    41d0:	20 25 00 0f 	andi r5,r1,0xf
    41d4:	3c a7 00 01 	sli r7,r5,1
    41d8:	3c a6 00 02 	sli r6,r5,2
    41dc:	f4 a7 48 00 	cmpgu r9,r5,r7
    41e0:	f4 e6 38 00 	cmpgu r7,r7,r6
    41e4:	3d 29 00 01 	sli r9,r9,1
    41e8:	3c a5 00 03 	sli r5,r5,3
    41ec:	b4 e9 48 00 	add r9,r7,r9
    41f0:	f4 c5 30 00 	cmpgu r6,r6,r5
    41f4:	3d 29 00 01 	sli r9,r9,1
    41f8:	00 47 00 18 	srui r7,r2,24
    41fc:	b4 c9 48 00 	add r9,r6,r9
    4200:	14 46 00 1f 	sri r6,r2,31
    4204:	3c 42 00 08 	sli r2,r2,8
    4208:	3c c6 00 08 	sli r6,r6,8
    420c:	b8 a2 28 00 	or r5,r5,r2
    4210:	b8 e6 30 00 	or r6,r7,r6
    4214:	00 82 00 13 	srui r2,r4,19
    4218:	b9 26 48 00 	or r9,r9,r6
    421c:	14 86 00 1f 	sri r6,r4,31
    4220:	3c 84 00 0d 	sli r4,r4,13
    4224:	3c c6 00 0d 	sli r6,r6,13
    4228:	b8 a4 20 00 	or r4,r5,r4
    422c:	78 05 00 01 	mvhi r5,0x1
    4230:	38 a5 68 44 	ori r5,r5,0x6844
    4234:	28 a8 00 00 	lw r8,(r5+0)
    4238:	20 21 00 10 	andi r1,r1,0x10
    423c:	7c 21 00 00 	cmpnei r1,r1,0
    4240:	b8 46 30 00 	or r6,r2,r6
    4244:	78 02 01 80 	mvhi r2,0x180
    4248:	b9 26 48 00 	or r9,r9,r6
    424c:	3c 21 00 07 	sli r1,r1,7
    4250:	78 06 00 01 	mvhi r6,0x1
    4254:	3d 07 00 03 	sli r7,r8,3
    4258:	b8 62 18 00 	or r3,r3,r2
    425c:	38 c6 68 48 	ori r6,r6,0x6848
    4260:	b8 64 18 00 	or r3,r3,r4
    4264:	b4 c7 38 00 	add r7,r6,r7
    4268:	b8 61 08 00 	or r1,r3,r1
    426c:	39 26 00 04 	ori r6,r9,0x4
    4270:	58 e1 00 04 	sw (r7+4),r1
    4274:	35 01 00 01 	addi r1,r8,1
    4278:	58 e6 00 00 	sw (r7+0),r6
    427c:	58 a1 00 00 	sw (r5+0),r1
    4280:	c3 a0 00 00 	ret

00004284 <pfilter_load>:
    4284:	78 02 00 01 	mvhi r2,0x1
    4288:	38 42 68 44 	ori r2,r2,0x6844
    428c:	28 45 00 00 	lw r5,(r2+0)
    4290:	78 01 00 01 	mvhi r1,0x1
    4294:	38 21 68 48 	ori r1,r1,0x6848
    4298:	3c a3 00 03 	sli r3,r5,3
    429c:	34 a5 00 01 	addi r5,r5,1
    42a0:	58 45 00 00 	sw (r2+0),r5
    42a4:	78 02 00 01 	mvhi r2,0x1
    42a8:	b4 23 18 00 	add r3,r1,r3
    42ac:	34 04 00 08 	mvi r4,8
    42b0:	38 42 2c 54 	ori r2,r2,0x2c54
    42b4:	58 64 00 00 	sw (r3+0),r4
    42b8:	28 44 00 00 	lw r4,(r2+0)
    42bc:	58 60 00 04 	sw (r3+4),r0
    42c0:	34 02 00 00 	mvi r2,0
    42c4:	58 80 00 14 	sw (r4+20),r0
    42c8:	e0 00 00 0f 	bi 4304 <pfilter_load+0x80>
    42cc:	28 23 00 04 	lw r3,(r1+4)
    42d0:	28 27 00 00 	lw r7,(r1+0)
    42d4:	34 21 00 08 	addi r1,r1,8
    42d8:	20 66 0f ff 	andi r6,r3,0xfff
    42dc:	3c e7 00 14 	sli r7,r7,20
    42e0:	00 63 00 0c 	srui r3,r3,12
    42e4:	58 86 00 18 	sw (r4+24),r6
    42e8:	b8 e3 18 00 	or r3,r7,r3
    42ec:	3c 63 00 08 	sli r3,r3,8
    42f0:	20 47 00 3f 	andi r7,r2,0x3f
    42f4:	38 63 00 40 	ori r3,r3,0x40
    42f8:	b8 67 18 00 	or r3,r3,r7
    42fc:	58 83 00 14 	sw (r4+20),r3
    4300:	34 42 00 01 	addi r2,r2,1
    4304:	48 a2 ff f2 	bg r5,r2,42cc <pfilter_load+0x48>
    4308:	78 03 00 01 	mvhi r3,0x1
    430c:	38 63 2c 54 	ori r3,r3,0x2c54
    4310:	28 61 00 00 	lw r1,(r3+0)
    4314:	34 02 00 80 	mvi r2,128
    4318:	58 22 00 14 	sw (r1+20),r2
    431c:	c3 a0 00 00 	ret

00004320 <pfilter_init_default>:
    4320:	37 9c ff f0 	addi sp,sp,-16
    4324:	5b 8b 00 10 	sw (sp+16),r11
    4328:	5b 8c 00 0c 	sw (sp+12),r12
    432c:	5b 8d 00 08 	sw (sp+8),r13
    4330:	5b 9d 00 04 	sw (sp+4),ra
    4334:	78 0c 00 01 	mvhi r12,0x1
    4338:	39 8c 68 44 	ori r12,r12,0x6844
    433c:	38 0b ff ff 	mvu r11,0xffff
    4340:	59 80 00 00 	sw (r12+0),r0
    4344:	fb ff ff 96 	calli 419c <pfilter_nop>
    4348:	b9 60 10 00 	mv r2,r11
    434c:	b9 60 18 00 	mv r3,r11
    4350:	34 01 00 00 	mvi r1,0
    4354:	34 04 00 03 	mvi r4,3
    4358:	34 05 00 01 	mvi r5,1
    435c:	fb ff ff 37 	calli 4038 <pfilter_cmp>
    4360:	b9 60 10 00 	mv r2,r11
    4364:	b9 60 18 00 	mv r3,r11
    4368:	34 01 00 01 	mvi r1,1
    436c:	34 04 00 00 	mvi r4,0
    4370:	34 05 00 01 	mvi r5,1
    4374:	fb ff ff 31 	calli 4038 <pfilter_cmp>
    4378:	b9 60 10 00 	mv r2,r11
    437c:	b9 60 18 00 	mv r3,r11
    4380:	34 01 00 02 	mvi r1,2
    4384:	34 04 00 00 	mvi r4,0
    4388:	34 05 00 01 	mvi r5,1
    438c:	fb ff ff 2b 	calli 4038 <pfilter_cmp>
    4390:	78 01 00 01 	mvhi r1,0x1
    4394:	38 21 2c 54 	ori r1,r1,0x2c54
    4398:	28 2d 00 00 	lw r13,(r1+0)
    439c:	b9 60 18 00 	mv r3,r11
    43a0:	34 01 00 00 	mvi r1,0
    43a4:	29 a2 00 24 	lw r2,(r13+36)
    43a8:	34 04 00 03 	mvi r4,3
    43ac:	34 05 00 03 	mvi r5,3
    43b0:	20 42 ff ff 	andi r2,r2,0xffff
    43b4:	fb ff ff 21 	calli 4038 <pfilter_cmp>
    43b8:	29 a2 00 28 	lw r2,(r13+40)
    43bc:	b9 60 18 00 	mv r3,r11
    43c0:	34 01 00 01 	mvi r1,1
    43c4:	00 42 00 10 	srui r2,r2,16
    43c8:	34 04 00 00 	mvi r4,0
    43cc:	34 05 00 03 	mvi r5,3
    43d0:	fb ff ff 1a 	calli 4038 <pfilter_cmp>
    43d4:	29 a2 00 28 	lw r2,(r13+40)
    43d8:	b9 60 18 00 	mv r3,r11
    43dc:	34 01 00 02 	mvi r1,2
    43e0:	20 42 ff ff 	andi r2,r2,0xffff
    43e4:	34 04 00 00 	mvi r4,0
    43e8:	34 05 00 03 	mvi r5,3
    43ec:	fb ff ff 13 	calli 4038 <pfilter_cmp>
    43f0:	34 05 00 05 	mvi r5,5
    43f4:	b9 60 18 00 	mv r3,r11
    43f8:	34 01 00 06 	mvi r1,6
    43fc:	38 02 88 f7 	mvu r2,0x88f7
    4400:	34 04 00 03 	mvi r4,3
    4404:	fb ff ff 0d 	calli 4038 <pfilter_cmp>
    4408:	29 82 00 00 	lw r2,(r12+0)
    440c:	78 01 00 01 	mvhi r1,0x1
    4410:	38 21 68 48 	ori r1,r1,0x6848
    4414:	3c 43 00 03 	sli r3,r2,3
    4418:	78 04 00 01 	mvhi r4,0x1
    441c:	b4 23 08 00 	add r1,r1,r3
    4420:	38 84 2f ac 	ori r4,r4,0x2fac
    4424:	34 03 00 04 	mvi r3,4
    4428:	58 23 00 00 	sw (r1+0),r3
    442c:	28 83 00 00 	lw r3,(r4+0)
    4430:	34 04 00 00 	mvi r4,0
    4434:	58 23 00 04 	sw (r1+4),r3
    4438:	34 41 00 01 	addi r1,r2,1
    443c:	59 81 00 00 	sw (r12+0),r1
    4440:	34 02 00 07 	mvi r2,7
    4444:	34 01 00 17 	mvi r1,23
    4448:	34 03 00 07 	mvi r3,7
    444c:	fb ff ff 61 	calli 41d0 <pfilter_logic2>
    4450:	34 01 00 1f 	mvi r1,31
    4454:	34 02 00 03 	mvi r2,3
    4458:	34 03 00 00 	mvi r3,0
    445c:	34 04 00 04 	mvi r4,4
    4460:	fb ff ff 5c 	calli 41d0 <pfilter_logic2>
    4464:	34 01 00 18 	mvi r1,24
    4468:	34 02 00 05 	mvi r2,5
    446c:	34 03 00 03 	mvi r3,3
    4470:	34 04 00 00 	mvi r4,0
    4474:	fb ff ff 57 	calli 41d0 <pfilter_logic2>
    4478:	fb ff ff 83 	calli 4284 <pfilter_load>
    447c:	2b 9d 00 04 	lw ra,(sp+4)
    4480:	2b 8b 00 10 	lw r11,(sp+16)
    4484:	2b 8c 00 0c 	lw r12,(sp+12)
    4488:	2b 8d 00 08 	lw r13,(sp+8)
    448c:	37 9c 00 10 	addi sp,sp,16
    4490:	c3 a0 00 00 	ret

00004494 <gpio_out>:
    4494:	44 40 00 06 	be r2,r0,44ac <gpio_out+0x18>
    4498:	78 03 00 01 	mvhi r3,0x1
    449c:	38 63 2b 04 	ori r3,r3,0x2b04
    44a0:	28 62 00 00 	lw r2,(r3+0)
    44a4:	58 41 00 04 	sw (r2+4),r1
    44a8:	c3 a0 00 00 	ret
    44ac:	78 03 00 01 	mvhi r3,0x1
    44b0:	38 63 2b 04 	ori r3,r3,0x2b04
    44b4:	28 62 00 00 	lw r2,(r3+0)
    44b8:	58 41 00 08 	sw (r2+8),r1
    44bc:	c3 a0 00 00 	ret

000044c0 <delay.clone.0>:
    44c0:	34 01 00 0a 	mvi r1,10
    44c4:	34 02 ff ff 	mvi r2,-1
    44c8:	e0 00 00 02 	bi 44d0 <delay.clone.0+0x10>
    44cc:	34 00 00 00 	nop
    44d0:	34 21 ff ff 	addi r1,r1,-1
    44d4:	5c 22 ff fe 	bne r1,r2,44cc <delay.clone.0+0xc>
    44d8:	c3 a0 00 00 	ret

000044dc <dna_read>:
    44dc:	37 9c ff e0 	addi sp,sp,-32
    44e0:	5b 8b 00 20 	sw (sp+32),r11
    44e4:	5b 8c 00 1c 	sw (sp+28),r12
    44e8:	5b 8d 00 18 	sw (sp+24),r13
    44ec:	5b 8e 00 14 	sw (sp+20),r14
    44f0:	5b 8f 00 10 	sw (sp+16),r15
    44f4:	5b 90 00 0c 	sw (sp+12),r16
    44f8:	5b 91 00 08 	sw (sp+8),r17
    44fc:	5b 9d 00 04 	sw (sp+4),ra
    4500:	b8 20 78 00 	mv r15,r1
    4504:	b8 40 80 00 	mv r16,r2
    4508:	34 01 00 01 	mvi r1,1
    450c:	34 02 00 00 	mvi r2,0
    4510:	fb ff ff e1 	calli 4494 <gpio_out>
    4514:	fb ff ff eb 	calli 44c0 <delay.clone.0>
    4518:	34 01 00 04 	mvi r1,4
    451c:	34 02 00 00 	mvi r2,0
    4520:	fb ff ff dd 	calli 4494 <gpio_out>
    4524:	fb ff ff e7 	calli 44c0 <delay.clone.0>
    4528:	34 01 00 02 	mvi r1,2
    452c:	34 02 00 01 	mvi r2,1
    4530:	fb ff ff d9 	calli 4494 <gpio_out>
    4534:	fb ff ff e3 	calli 44c0 <delay.clone.0>
    4538:	34 01 00 03 	mvi r1,3
    453c:	34 02 00 00 	mvi r2,0
    4540:	fb ff ff d5 	calli 4494 <gpio_out>
    4544:	fb ff ff df 	calli 44c0 <delay.clone.0>
    4548:	fb ff ff de 	calli 44c0 <delay.clone.0>
    454c:	34 02 00 01 	mvi r2,1
    4550:	34 01 00 04 	mvi r1,4
    4554:	fb ff ff d0 	calli 4494 <gpio_out>
    4558:	fb ff ff da 	calli 44c0 <delay.clone.0>
    455c:	78 01 00 01 	mvhi r1,0x1
    4560:	38 21 2b 04 	ori r1,r1,0x2b04
    4564:	28 2e 00 00 	lw r14,(r1+0)
    4568:	34 0d 00 00 	mvi r13,0
    456c:	34 0c 00 39 	mvi r12,57
    4570:	29 cb 00 04 	lw r11,(r14+4)
    4574:	fb ff ff d3 	calli 44c0 <delay.clone.0>
    4578:	34 01 00 04 	mvi r1,4
    457c:	34 02 00 00 	mvi r2,0
    4580:	fb ff ff c5 	calli 4494 <gpio_out>
    4584:	fb ff ff cf 	calli 44c0 <delay.clone.0>
    4588:	34 01 00 02 	mvi r1,2
    458c:	34 02 00 00 	mvi r2,0
    4590:	fb ff ff c1 	calli 4494 <gpio_out>
    4594:	34 01 00 03 	mvi r1,3
    4598:	34 02 00 01 	mvi r2,1
    459c:	fb ff ff be 	calli 4494 <gpio_out>
    45a0:	21 6b 00 01 	andi r11,r11,0x1
    45a4:	fb ff ff c7 	calli 44c0 <delay.clone.0>
    45a8:	3d 63 00 01 	sli r3,r11,1
    45ac:	3d ad 00 01 	sli r13,r13,1
    45b0:	f5 63 58 00 	cmpgu r11,r11,r3
    45b4:	b5 6d 68 00 	add r13,r11,r13
    45b8:	b8 60 58 00 	mv r11,r3
    45bc:	fb ff ff c1 	calli 44c0 <delay.clone.0>
    45c0:	fb ff ff c0 	calli 44c0 <delay.clone.0>
    45c4:	34 01 00 04 	mvi r1,4
    45c8:	34 02 00 01 	mvi r2,1
    45cc:	fb ff ff b2 	calli 4494 <gpio_out>
    45d0:	fb ff ff bc 	calli 44c0 <delay.clone.0>
    45d4:	29 c1 00 04 	lw r1,(r14+4)
    45d8:	b9 a0 88 00 	mv r17,r13
    45dc:	20 21 00 01 	andi r1,r1,0x1
    45e0:	44 20 00 02 	be r1,r0,45e8 <dna_read+0x10c>
    45e4:	39 6b 00 01 	ori r11,r11,0x1
    45e8:	fb ff ff b6 	calli 44c0 <delay.clone.0>
    45ec:	34 01 00 04 	mvi r1,4
    45f0:	34 02 00 00 	mvi r2,0
    45f4:	35 8c ff ff 	addi r12,r12,-1
    45f8:	fb ff ff a7 	calli 4494 <gpio_out>
    45fc:	fb ff ff b1 	calli 44c0 <delay.clone.0>
    4600:	5d 80 ff ea 	bne r12,r0,45a8 <dna_read+0xcc>
    4604:	5a 11 00 00 	sw (r16+0),r17
    4608:	59 eb 00 00 	sw (r15+0),r11
    460c:	2b 9d 00 04 	lw ra,(sp+4)
    4610:	2b 8b 00 20 	lw r11,(sp+32)
    4614:	2b 8c 00 1c 	lw r12,(sp+28)
    4618:	2b 8d 00 18 	lw r13,(sp+24)
    461c:	2b 8e 00 14 	lw r14,(sp+20)
    4620:	2b 8f 00 10 	lw r15,(sp+16)
    4624:	2b 90 00 0c 	lw r16,(sp+12)
    4628:	2b 91 00 08 	lw r17,(sp+8)
    462c:	37 9c 00 20 	addi sp,sp,32
    4630:	c3 a0 00 00 	ret

00004634 <gpio_out>:
    4634:	44 40 00 06 	be r2,r0,464c <gpio_out+0x18>
    4638:	78 03 00 01 	mvhi r3,0x1
    463c:	38 63 2b 04 	ori r3,r3,0x2b04
    4640:	28 62 00 00 	lw r2,(r3+0)
    4644:	58 41 00 04 	sw (r2+4),r1
    4648:	c3 a0 00 00 	ret
    464c:	78 03 00 01 	mvhi r3,0x1
    4650:	38 63 2b 04 	ori r3,r3,0x2b04
    4654:	28 62 00 00 	lw r2,(r3+0)
    4658:	58 41 00 08 	sw (r2+8),r1
    465c:	c3 a0 00 00 	ret

00004660 <mi2c_delay>:
    4660:	34 01 01 2c 	mvi r1,300
    4664:	34 00 00 00 	nop
    4668:	34 21 ff ff 	addi r1,r1,-1
    466c:	5c 20 ff fe 	bne r1,r0,4664 <mi2c_delay+0x4>
    4670:	c3 a0 00 00 	ret

00004674 <mi2c_start>:
    4674:	37 9c ff f8 	addi sp,sp,-8
    4678:	5b 8b 00 08 	sw (sp+8),r11
    467c:	5b 9d 00 04 	sw (sp+4),ra
    4680:	20 21 00 ff 	andi r1,r1,0xff
    4684:	3c 2b 00 03 	sli r11,r1,3
    4688:	78 02 00 01 	mvhi r2,0x1
    468c:	38 42 59 18 	ori r2,r2,0x5918
    4690:	b4 4b 58 00 	add r11,r2,r11
    4694:	29 61 00 04 	lw r1,(r11+4)
    4698:	34 02 00 00 	mvi r2,0
    469c:	fb ff ff e6 	calli 4634 <gpio_out>
    46a0:	fb ff ff f0 	calli 4660 <mi2c_delay>
    46a4:	29 61 00 00 	lw r1,(r11+0)
    46a8:	34 02 00 00 	mvi r2,0
    46ac:	fb ff ff e2 	calli 4634 <gpio_out>
    46b0:	fb ff ff ec 	calli 4660 <mi2c_delay>
    46b4:	2b 9d 00 04 	lw ra,(sp+4)
    46b8:	2b 8b 00 08 	lw r11,(sp+8)
    46bc:	37 9c 00 08 	addi sp,sp,8
    46c0:	c3 a0 00 00 	ret

000046c4 <mi2c_repeat_start>:
    46c4:	37 9c ff f8 	addi sp,sp,-8
    46c8:	5b 8b 00 08 	sw (sp+8),r11
    46cc:	5b 9d 00 04 	sw (sp+4),ra
    46d0:	20 21 00 ff 	andi r1,r1,0xff
    46d4:	3c 2b 00 03 	sli r11,r1,3
    46d8:	78 02 00 01 	mvhi r2,0x1
    46dc:	38 42 59 18 	ori r2,r2,0x5918
    46e0:	b4 4b 58 00 	add r11,r2,r11
    46e4:	29 61 00 04 	lw r1,(r11+4)
    46e8:	34 02 00 01 	mvi r2,1
    46ec:	fb ff ff d2 	calli 4634 <gpio_out>
    46f0:	fb ff ff dc 	calli 4660 <mi2c_delay>
    46f4:	29 61 00 00 	lw r1,(r11+0)
    46f8:	34 02 00 01 	mvi r2,1
    46fc:	fb ff ff ce 	calli 4634 <gpio_out>
    4700:	fb ff ff d8 	calli 4660 <mi2c_delay>
    4704:	29 61 00 04 	lw r1,(r11+4)
    4708:	34 02 00 00 	mvi r2,0
    470c:	fb ff ff ca 	calli 4634 <gpio_out>
    4710:	fb ff ff d4 	calli 4660 <mi2c_delay>
    4714:	29 61 00 00 	lw r1,(r11+0)
    4718:	34 02 00 00 	mvi r2,0
    471c:	fb ff ff c6 	calli 4634 <gpio_out>
    4720:	fb ff ff d0 	calli 4660 <mi2c_delay>
    4724:	2b 9d 00 04 	lw ra,(sp+4)
    4728:	2b 8b 00 08 	lw r11,(sp+8)
    472c:	37 9c 00 08 	addi sp,sp,8
    4730:	c3 a0 00 00 	ret

00004734 <mi2c_stop>:
    4734:	37 9c ff f8 	addi sp,sp,-8
    4738:	5b 8b 00 08 	sw (sp+8),r11
    473c:	5b 9d 00 04 	sw (sp+4),ra
    4740:	20 21 00 ff 	andi r1,r1,0xff
    4744:	3c 2b 00 03 	sli r11,r1,3
    4748:	78 02 00 01 	mvhi r2,0x1
    474c:	38 42 59 18 	ori r2,r2,0x5918
    4750:	b4 4b 58 00 	add r11,r2,r11
    4754:	29 61 00 04 	lw r1,(r11+4)
    4758:	34 02 00 00 	mvi r2,0
    475c:	fb ff ff b6 	calli 4634 <gpio_out>
    4760:	fb ff ff c0 	calli 4660 <mi2c_delay>
    4764:	29 61 00 00 	lw r1,(r11+0)
    4768:	34 02 00 01 	mvi r2,1
    476c:	fb ff ff b2 	calli 4634 <gpio_out>
    4770:	fb ff ff bc 	calli 4660 <mi2c_delay>
    4774:	29 61 00 04 	lw r1,(r11+4)
    4778:	34 02 00 01 	mvi r2,1
    477c:	fb ff ff ae 	calli 4634 <gpio_out>
    4780:	fb ff ff b8 	calli 4660 <mi2c_delay>
    4784:	2b 9d 00 04 	lw ra,(sp+4)
    4788:	2b 8b 00 08 	lw r11,(sp+8)
    478c:	37 9c 00 08 	addi sp,sp,8
    4790:	c3 a0 00 00 	ret

00004794 <mi2c_put_byte>:
    4794:	37 9c ff ec 	addi sp,sp,-20
    4798:	5b 8b 00 14 	sw (sp+20),r11
    479c:	5b 8c 00 10 	sw (sp+16),r12
    47a0:	5b 8d 00 0c 	sw (sp+12),r13
    47a4:	5b 8e 00 08 	sw (sp+8),r14
    47a8:	5b 9d 00 04 	sw (sp+4),ra
    47ac:	20 21 00 ff 	andi r1,r1,0xff
    47b0:	78 03 00 01 	mvhi r3,0x1
    47b4:	3c 2b 00 03 	sli r11,r1,3
    47b8:	38 63 59 18 	ori r3,r3,0x5918
    47bc:	20 4e 00 ff 	andi r14,r2,0xff
    47c0:	34 0d 00 08 	mvi r13,8
    47c4:	b4 6b 58 00 	add r11,r3,r11
    47c8:	29 61 00 04 	lw r1,(r11+4)
    47cc:	21 c2 00 80 	andi r2,r14,0x80
    47d0:	35 ad ff ff 	addi r13,r13,-1
    47d4:	fb ff ff 98 	calli 4634 <gpio_out>
    47d8:	fb ff ff a2 	calli 4660 <mi2c_delay>
    47dc:	29 61 00 00 	lw r1,(r11+0)
    47e0:	34 02 00 01 	mvi r2,1
    47e4:	3d ce 00 01 	sli r14,r14,1
    47e8:	fb ff ff 93 	calli 4634 <gpio_out>
    47ec:	fb ff ff 9d 	calli 4660 <mi2c_delay>
    47f0:	29 61 00 00 	lw r1,(r11+0)
    47f4:	34 02 00 00 	mvi r2,0
    47f8:	21 ad 00 ff 	andi r13,r13,0xff
    47fc:	fb ff ff 8e 	calli 4634 <gpio_out>
    4800:	35 6c 00 04 	addi r12,r11,4
    4804:	fb ff ff 97 	calli 4660 <mi2c_delay>
    4808:	21 ce 00 ff 	andi r14,r14,0xff
    480c:	5d a0 ff ef 	bne r13,r0,47c8 <mi2c_put_byte+0x34>
    4810:	29 81 00 00 	lw r1,(r12+0)
    4814:	34 02 00 01 	mvi r2,1
    4818:	fb ff ff 87 	calli 4634 <gpio_out>
    481c:	fb ff ff 91 	calli 4660 <mi2c_delay>
    4820:	29 61 00 00 	lw r1,(r11+0)
    4824:	34 02 00 01 	mvi r2,1
    4828:	fb ff ff 83 	calli 4634 <gpio_out>
    482c:	fb ff ff 8d 	calli 4660 <mi2c_delay>
    4830:	78 02 00 01 	mvhi r2,0x1
    4834:	38 42 2b 04 	ori r2,r2,0x2b04
    4838:	28 41 00 00 	lw r1,(r2+0)
    483c:	29 8d 00 00 	lw r13,(r12+0)
    4840:	34 02 00 00 	mvi r2,0
    4844:	28 21 00 04 	lw r1,(r1+4)
    4848:	a0 2d 68 00 	and r13,r1,r13
    484c:	29 61 00 00 	lw r1,(r11+0)
    4850:	fb ff ff 79 	calli 4634 <gpio_out>
    4854:	fb ff ff 83 	calli 4660 <mi2c_delay>
    4858:	29 81 00 00 	lw r1,(r12+0)
    485c:	34 02 00 00 	mvi r2,0
    4860:	fb ff ff 75 	calli 4634 <gpio_out>
    4864:	fb ff ff 7f 	calli 4660 <mi2c_delay>
    4868:	7d a1 00 00 	cmpnei r1,r13,0
    486c:	2b 9d 00 04 	lw ra,(sp+4)
    4870:	2b 8b 00 14 	lw r11,(sp+20)
    4874:	2b 8c 00 10 	lw r12,(sp+16)
    4878:	2b 8d 00 0c 	lw r13,(sp+12)
    487c:	2b 8e 00 08 	lw r14,(sp+8)
    4880:	37 9c 00 14 	addi sp,sp,20
    4884:	c3 a0 00 00 	ret

00004888 <mi2c_get_byte>:
    4888:	37 9c ff e0 	addi sp,sp,-32
    488c:	5b 8b 00 20 	sw (sp+32),r11
    4890:	5b 8c 00 1c 	sw (sp+28),r12
    4894:	5b 8d 00 18 	sw (sp+24),r13
    4898:	5b 8e 00 14 	sw (sp+20),r14
    489c:	5b 8f 00 10 	sw (sp+16),r15
    48a0:	5b 90 00 0c 	sw (sp+12),r16
    48a4:	5b 91 00 08 	sw (sp+8),r17
    48a8:	5b 9d 00 04 	sw (sp+4),ra
    48ac:	20 21 00 ff 	andi r1,r1,0xff
    48b0:	3c 2b 00 03 	sli r11,r1,3
    48b4:	78 04 00 01 	mvhi r4,0x1
    48b8:	38 84 59 18 	ori r4,r4,0x5918
    48bc:	b4 8b 58 00 	add r11,r4,r11
    48c0:	29 61 00 04 	lw r1,(r11+4)
    48c4:	b8 40 70 00 	mv r14,r2
    48c8:	34 02 00 01 	mvi r2,1
    48cc:	20 6f 00 ff 	andi r15,r3,0xff
    48d0:	fb ff ff 59 	calli 4634 <gpio_out>
    48d4:	fb ff ff 63 	calli 4660 <mi2c_delay>
    48d8:	29 61 00 00 	lw r1,(r11+0)
    48dc:	34 02 00 00 	mvi r2,0
    48e0:	34 0c 00 00 	mvi r12,0
    48e4:	fb ff ff 54 	calli 4634 <gpio_out>
    48e8:	fb ff ff 5e 	calli 4660 <mi2c_delay>
    48ec:	78 01 00 01 	mvhi r1,0x1
    48f0:	38 21 2b 04 	ori r1,r1,0x2b04
    48f4:	28 31 00 00 	lw r17,(r1+0)
    48f8:	34 0d 00 00 	mvi r13,0
    48fc:	34 10 00 08 	mvi r16,8
    4900:	29 61 00 00 	lw r1,(r11+0)
    4904:	34 02 00 01 	mvi r2,1
    4908:	3d 8c 00 01 	sli r12,r12,1
    490c:	fb ff ff 4a 	calli 4634 <gpio_out>
    4910:	fb ff ff 54 	calli 4660 <mi2c_delay>
    4914:	2a 21 00 04 	lw r1,(r17+4)
    4918:	29 62 00 04 	lw r2,(r11+4)
    491c:	21 8c 00 ff 	andi r12,r12,0xff
    4920:	a0 22 08 00 	and r1,r1,r2
    4924:	44 20 00 02 	be r1,r0,492c <mi2c_get_byte+0xa4>
    4928:	39 8c 00 01 	ori r12,r12,0x1
    492c:	29 61 00 00 	lw r1,(r11+0)
    4930:	34 02 00 00 	mvi r2,0
    4934:	35 ad 00 01 	addi r13,r13,1
    4938:	fb ff ff 3f 	calli 4634 <gpio_out>
    493c:	fb ff ff 49 	calli 4660 <mi2c_delay>
    4940:	5d b0 ff f0 	bne r13,r16,4900 <mi2c_get_byte+0x78>
    4944:	45 e0 00 04 	be r15,r0,4954 <mi2c_get_byte+0xcc>
    4948:	29 61 00 04 	lw r1,(r11+4)
    494c:	34 02 00 01 	mvi r2,1
    4950:	e0 00 00 03 	bi 495c <mi2c_get_byte+0xd4>
    4954:	29 61 00 04 	lw r1,(r11+4)
    4958:	34 02 00 00 	mvi r2,0
    495c:	fb ff ff 36 	calli 4634 <gpio_out>
    4960:	fb ff ff 40 	calli 4660 <mi2c_delay>
    4964:	29 61 00 00 	lw r1,(r11+0)
    4968:	34 02 00 01 	mvi r2,1
    496c:	fb ff ff 32 	calli 4634 <gpio_out>
    4970:	fb ff ff 3c 	calli 4660 <mi2c_delay>
    4974:	29 61 00 00 	lw r1,(r11+0)
    4978:	34 02 00 00 	mvi r2,0
    497c:	fb ff ff 2e 	calli 4634 <gpio_out>
    4980:	fb ff ff 38 	calli 4660 <mi2c_delay>
    4984:	31 cc 00 00 	sb (r14+0),r12
    4988:	2b 9d 00 04 	lw ra,(sp+4)
    498c:	2b 8b 00 20 	lw r11,(sp+32)
    4990:	2b 8c 00 1c 	lw r12,(sp+28)
    4994:	2b 8d 00 18 	lw r13,(sp+24)
    4998:	2b 8e 00 14 	lw r14,(sp+20)
    499c:	2b 8f 00 10 	lw r15,(sp+16)
    49a0:	2b 90 00 0c 	lw r16,(sp+12)
    49a4:	2b 91 00 08 	lw r17,(sp+8)
    49a8:	37 9c 00 20 	addi sp,sp,32
    49ac:	c3 a0 00 00 	ret

000049b0 <mi2c_init>:
    49b0:	37 9c ff f8 	addi sp,sp,-8
    49b4:	5b 8b 00 08 	sw (sp+8),r11
    49b8:	5b 9d 00 04 	sw (sp+4),ra
    49bc:	20 21 00 ff 	andi r1,r1,0xff
    49c0:	3c 2b 00 03 	sli r11,r1,3
    49c4:	78 02 00 01 	mvhi r2,0x1
    49c8:	38 42 59 18 	ori r2,r2,0x5918
    49cc:	b4 4b 58 00 	add r11,r2,r11
    49d0:	29 61 00 00 	lw r1,(r11+0)
    49d4:	34 02 00 01 	mvi r2,1
    49d8:	fb ff ff 17 	calli 4634 <gpio_out>
    49dc:	fb ff ff 21 	calli 4660 <mi2c_delay>
    49e0:	29 61 00 04 	lw r1,(r11+4)
    49e4:	34 02 00 01 	mvi r2,1
    49e8:	fb ff ff 13 	calli 4634 <gpio_out>
    49ec:	fb ff ff 1d 	calli 4660 <mi2c_delay>
    49f0:	2b 9d 00 04 	lw ra,(sp+4)
    49f4:	2b 8b 00 08 	lw r11,(sp+8)
    49f8:	37 9c 00 08 	addi sp,sp,8
    49fc:	c3 a0 00 00 	ret

00004a00 <abs64>:
    4a00:	14 23 00 1f 	sri r3,r1,31
    4a04:	98 62 20 00 	xor r4,r3,r2
    4a08:	c8 83 10 00 	sub r2,r4,r3
    4a0c:	98 61 08 00 	xor r1,r3,r1
    4a10:	f4 44 20 00 	cmpgu r4,r2,r4
    4a14:	c8 23 08 00 	sub r1,r1,r3
    4a18:	c8 24 08 00 	sub r1,r1,r4
    4a1c:	c3 a0 00 00 	ret

00004a20 <wrc_mon_gui>:
    4a20:	37 9c ff 94 	addi sp,sp,-108
    4a24:	5b 8b 00 10 	sw (sp+16),r11
    4a28:	5b 8c 00 0c 	sw (sp+12),r12
    4a2c:	5b 8d 00 08 	sw (sp+8),r13
    4a30:	5b 9d 00 04 	sw (sp+4),ra
    4a34:	78 0b 00 01 	mvhi r11,0x1
    4a38:	fb ff f4 1e 	calli 1ab0 <timer_get_tics>
    4a3c:	39 6b 69 4c 	ori r11,r11,0x694c
    4a40:	29 62 00 00 	lw r2,(r11+0)
    4a44:	c8 22 08 00 	sub r1,r1,r2
    4a48:	34 02 03 e7 	mvi r2,999
    4a4c:	50 41 01 09 	bgeu r2,r1,4e70 <wrc_mon_gui+0x450>
    4a50:	fb ff f4 18 	calli 1ab0 <timer_get_tics>
    4a54:	59 61 00 00 	sw (r11+0),r1
    4a58:	fb ff fd 6c 	calli 4008 <m_term_clear>
    4a5c:	78 04 00 01 	mvhi r4,0x1
    4a60:	34 02 00 01 	mvi r2,1
    4a64:	34 03 00 04 	mvi r3,4
    4a68:	38 84 2f b0 	ori r4,r4,0x2fb0
    4a6c:	34 01 00 01 	mvi r1,1
    4a70:	fb ff fd 42 	calli 3f78 <m_pcprintf>
    4a74:	78 04 00 01 	mvhi r4,0x1
    4a78:	34 03 00 87 	mvi r3,135
    4a7c:	38 84 2f d0 	ori r4,r4,0x2fd0
    4a80:	34 02 00 01 	mvi r2,1
    4a84:	34 01 00 02 	mvi r1,2
    4a88:	fb ff fd 3c 	calli 3f78 <m_pcprintf>
    4a8c:	34 02 00 00 	mvi r2,0
    4a90:	37 81 00 14 	addi r1,sp,20
    4a94:	f8 00 2c 63 	calli fc20 <halexp_get_port_state>
    4a98:	78 04 00 01 	mvhi r4,0x1
    4a9c:	34 02 00 01 	mvi r2,1
    4aa0:	34 03 00 04 	mvi r3,4
    4aa4:	38 84 30 24 	ori r4,r4,0x3024
    4aa8:	34 01 00 04 	mvi r1,4
    4aac:	fb ff fd 33 	calli 3f78 <m_pcprintf>
    4ab0:	78 04 00 01 	mvhi r4,0x1
    4ab4:	78 05 00 01 	mvhi r5,0x1
    4ab8:	34 01 00 06 	mvi r1,6
    4abc:	34 02 00 01 	mvi r2,1
    4ac0:	34 03 00 07 	mvi r3,7
    4ac4:	38 84 30 34 	ori r4,r4,0x3034
    4ac8:	38 a5 30 3c 	ori r5,r5,0x303c
    4acc:	fb ff fd 2b 	calli 3f78 <m_pcprintf>
    4ad0:	2b 81 00 2c 	lw r1,(sp+44)
    4ad4:	44 20 00 05 	be r1,r0,4ae8 <wrc_mon_gui+0xc8>
    4ad8:	78 02 00 01 	mvhi r2,0x1
    4adc:	34 01 00 02 	mvi r1,2
    4ae0:	38 42 30 44 	ori r2,r2,0x3044
    4ae4:	e0 00 00 04 	bi 4af4 <wrc_mon_gui+0xd4>
    4ae8:	78 02 00 01 	mvhi r2,0x1
    4aec:	34 01 00 01 	mvi r1,1
    4af0:	38 42 30 50 	ori r2,r2,0x3050
    4af4:	fb ff fd 05 	calli 3f08 <m_cprintf>
    4af8:	2b 81 00 2c 	lw r1,(sp+44)
    4afc:	44 20 00 d9 	be r1,r0,4e60 <wrc_mon_gui+0x440>
    4b00:	37 82 00 68 	addi r2,sp,104
    4b04:	37 81 00 6c 	addi r1,sp,108
    4b08:	fb ff f3 4a 	calli 1830 <minic_get_stats>
    4b0c:	2b 83 00 68 	lw r3,(sp+104)
    4b10:	2b 84 00 6c 	lw r4,(sp+108)
    4b14:	78 02 00 01 	mvhi r2,0x1
    4b18:	38 42 30 5c 	ori r2,r2,0x305c
    4b1c:	34 01 00 87 	mvi r1,135
    4b20:	fb ff fc fa 	calli 3f08 <m_cprintf>
    4b24:	2b 81 00 18 	lw r1,(sp+24)
    4b28:	34 02 00 01 	mvi r2,1
    4b2c:	44 22 00 04 	be r1,r2,4b3c <wrc_mon_gui+0x11c>
    4b30:	34 02 00 02 	mvi r2,2
    4b34:	5c 22 00 0a 	bne r1,r2,4b5c <wrc_mon_gui+0x13c>
    4b38:	e0 00 00 05 	bi 4b4c <wrc_mon_gui+0x12c>
    4b3c:	78 02 00 01 	mvhi r2,0x1
    4b40:	34 01 00 07 	mvi r1,7
    4b44:	38 42 30 78 	ori r2,r2,0x3078
    4b48:	e0 00 00 04 	bi 4b58 <wrc_mon_gui+0x138>
    4b4c:	78 02 00 01 	mvhi r2,0x1
    4b50:	34 01 00 07 	mvi r1,7
    4b54:	38 42 30 84 	ori r2,r2,0x3084
    4b58:	fb ff fc ec 	calli 3f08 <m_cprintf>
    4b5c:	2b 81 00 40 	lw r1,(sp+64)
    4b60:	44 20 00 05 	be r1,r0,4b74 <wrc_mon_gui+0x154>
    4b64:	78 02 00 01 	mvhi r2,0x1
    4b68:	34 01 00 02 	mvi r1,2
    4b6c:	38 42 30 90 	ori r2,r2,0x3090
    4b70:	e0 00 00 04 	bi 4b80 <wrc_mon_gui+0x160>
    4b74:	78 02 00 01 	mvhi r2,0x1
    4b78:	34 01 00 01 	mvi r1,1
    4b7c:	38 42 30 9c 	ori r2,r2,0x309c
    4b80:	fb ff fc e2 	calli 3f08 <m_cprintf>
    4b84:	2b 81 00 34 	lw r1,(sp+52)
    4b88:	44 20 00 07 	be r1,r0,4ba4 <wrc_mon_gui+0x184>
    4b8c:	2b 81 00 30 	lw r1,(sp+48)
    4b90:	44 20 00 05 	be r1,r0,4ba4 <wrc_mon_gui+0x184>
    4b94:	78 02 00 01 	mvhi r2,0x1
    4b98:	34 01 00 02 	mvi r1,2
    4b9c:	38 42 30 a8 	ori r2,r2,0x30a8
    4ba0:	e0 00 00 04 	bi 4bb0 <wrc_mon_gui+0x190>
    4ba4:	78 02 00 01 	mvhi r2,0x1
    4ba8:	34 01 00 01 	mvi r1,1
    4bac:	38 42 30 b8 	ori r2,r2,0x30b8
    4bb0:	fb ff fc d6 	calli 3f08 <m_cprintf>
    4bb4:	78 02 00 01 	mvhi r2,0x1
    4bb8:	34 01 00 04 	mvi r1,4
    4bbc:	38 42 30 c8 	ori r2,r2,0x30c8
    4bc0:	78 0b 00 01 	mvhi r11,0x1
    4bc4:	fb ff fc d1 	calli 3f08 <m_cprintf>
    4bc8:	39 6b 7c f8 	ori r11,r11,0x7cf8
    4bcc:	29 61 00 00 	lw r1,(r11+0)
    4bd0:	5c 20 00 06 	bne r1,r0,4be8 <wrc_mon_gui+0x1c8>
    4bd4:	78 02 00 01 	mvhi r2,0x1
    4bd8:	38 42 30 e4 	ori r2,r2,0x30e4
    4bdc:	34 01 00 01 	mvi r1,1
    4be0:	fb ff fc ca 	calli 3f08 <m_cprintf>
    4be4:	e0 00 00 a4 	bi 4e74 <wrc_mon_gui+0x454>
    4be8:	78 02 00 01 	mvhi r2,0x1
    4bec:	38 42 31 0c 	ori r2,r2,0x310c
    4bf0:	34 01 00 87 	mvi r1,135
    4bf4:	fb ff fc c5 	calli 3f08 <m_cprintf>
    4bf8:	78 02 00 01 	mvhi r2,0x1
    4bfc:	78 03 00 01 	mvhi r3,0x1
    4c00:	38 42 31 28 	ori r2,r2,0x3128
    4c04:	38 63 7c fc 	ori r3,r3,0x7cfc
    4c08:	34 01 00 07 	mvi r1,7
    4c0c:	fb ff fc bf 	calli 3f08 <m_cprintf>
    4c10:	78 02 00 01 	mvhi r2,0x1
    4c14:	34 01 00 87 	mvi r1,135
    4c18:	38 42 31 2c 	ori r2,r2,0x312c
    4c1c:	fb ff fc bb 	calli 3f08 <m_cprintf>
    4c20:	29 61 00 44 	lw r1,(r11+68)
    4c24:	44 20 00 05 	be r1,r0,4c38 <wrc_mon_gui+0x218>
    4c28:	78 02 00 01 	mvhi r2,0x1
    4c2c:	34 01 00 02 	mvi r1,2
    4c30:	38 42 31 48 	ori r2,r2,0x3148
    4c34:	e0 00 00 04 	bi 4c44 <wrc_mon_gui+0x224>
    4c38:	78 02 00 01 	mvhi r2,0x1
    4c3c:	34 01 00 01 	mvi r1,1
    4c40:	38 42 31 4c 	ori r2,r2,0x314c
    4c44:	fb ff fc b1 	calli 3f08 <m_cprintf>
    4c48:	78 02 00 01 	mvhi r2,0x1
    4c4c:	38 42 31 54 	ori r2,r2,0x3154
    4c50:	34 01 00 87 	mvi r1,135
    4c54:	fb ff fc ad 	calli 3f08 <m_cprintf>
    4c58:	78 02 00 01 	mvhi r2,0x1
    4c5c:	78 03 00 01 	mvhi r3,0x1
    4c60:	38 63 7d 1c 	ori r3,r3,0x7d1c
    4c64:	38 42 31 28 	ori r2,r2,0x3128
    4c68:	34 01 00 07 	mvi r1,7
    4c6c:	fb ff fc a7 	calli 3f08 <m_cprintf>
    4c70:	78 02 00 01 	mvhi r2,0x1
    4c74:	38 42 31 70 	ori r2,r2,0x3170
    4c78:	34 01 00 87 	mvi r1,135
    4c7c:	fb ff fc a3 	calli 3f08 <m_cprintf>
    4c80:	34 01 00 00 	mvi r1,0
    4c84:	fb ff fb 77 	calli 3a60 <spll_get_aux_status>
    4c88:	b8 20 58 00 	mv r11,r1
    4c8c:	20 21 00 01 	andi r1,r1,0x1
    4c90:	44 20 00 05 	be r1,r0,4ca4 <wrc_mon_gui+0x284>
    4c94:	78 02 00 01 	mvhi r2,0x1
    4c98:	34 01 00 02 	mvi r1,2
    4c9c:	38 42 31 8c 	ori r2,r2,0x318c
    4ca0:	fb ff fc 9a 	calli 3f08 <m_cprintf>
    4ca4:	21 6b 00 02 	andi r11,r11,0x2
    4ca8:	45 60 00 05 	be r11,r0,4cbc <wrc_mon_gui+0x29c>
    4cac:	78 02 00 01 	mvhi r2,0x1
    4cb0:	34 01 00 02 	mvi r1,2
    4cb4:	38 42 31 94 	ori r2,r2,0x3194
    4cb8:	fb ff fc 94 	calli 3f08 <m_cprintf>
    4cbc:	78 01 00 01 	mvhi r1,0x1
    4cc0:	38 21 31 b4 	ori r1,r1,0x31b4
    4cc4:	fb ff fc 71 	calli 3e88 <mprintf>
    4cc8:	78 02 00 01 	mvhi r2,0x1
    4ccc:	38 42 31 a0 	ori r2,r2,0x31a0
    4cd0:	34 01 00 04 	mvi r1,4
    4cd4:	fb ff fc 8d 	calli 3f08 <m_cprintf>
    4cd8:	78 02 00 01 	mvhi r2,0x1
    4cdc:	38 42 31 b8 	ori r2,r2,0x31b8
    4ce0:	34 01 00 87 	mvi r1,135
    4ce4:	78 0b 00 01 	mvhi r11,0x1
    4ce8:	39 6b 7c f8 	ori r11,r11,0x7cf8
    4cec:	fb ff fc 87 	calli 3f08 <m_cprintf>
    4cf0:	29 63 00 4c 	lw r3,(r11+76)
    4cf4:	78 0c 00 01 	mvhi r12,0x1
    4cf8:	39 8c 31 d4 	ori r12,r12,0x31d4
    4cfc:	b9 80 10 00 	mv r2,r12
    4d00:	34 01 00 07 	mvi r1,7
    4d04:	fb ff fc 81 	calli 3f08 <m_cprintf>
    4d08:	78 02 00 01 	mvhi r2,0x1
    4d0c:	38 42 31 dc 	ori r2,r2,0x31dc
    4d10:	34 01 00 87 	mvi r1,135
    4d14:	fb ff fc 7d 	calli 3f08 <m_cprintf>
    4d18:	29 63 00 54 	lw r3,(r11+84)
    4d1c:	b9 80 10 00 	mv r2,r12
    4d20:	34 01 00 07 	mvi r1,7
    4d24:	fb ff fc 79 	calli 3f08 <m_cprintf>
    4d28:	78 02 00 01 	mvhi r2,0x1
    4d2c:	38 42 31 f8 	ori r2,r2,0x31f8
    4d30:	34 01 00 87 	mvi r1,135
    4d34:	fb ff fc 75 	calli 3f08 <m_cprintf>
    4d38:	29 63 00 5c 	lw r3,(r11+92)
    4d3c:	29 64 00 64 	lw r4,(r11+100)
    4d40:	78 0d 00 01 	mvhi r13,0x1
    4d44:	39 ad 32 14 	ori r13,r13,0x3214
    4d48:	b9 a0 10 00 	mv r2,r13
    4d4c:	34 01 00 07 	mvi r1,7
    4d50:	fb ff fc 6e 	calli 3f08 <m_cprintf>
    4d54:	78 02 00 01 	mvhi r2,0x1
    4d58:	38 42 32 2c 	ori r2,r2,0x322c
    4d5c:	34 01 00 87 	mvi r1,135
    4d60:	fb ff fc 6a 	calli 3f08 <m_cprintf>
    4d64:	29 64 00 74 	lw r4,(r11+116)
    4d68:	29 63 00 6c 	lw r3,(r11+108)
    4d6c:	b9 a0 10 00 	mv r2,r13
    4d70:	34 01 00 07 	mvi r1,7
    4d74:	fb ff fc 65 	calli 3f08 <m_cprintf>
    4d78:	78 02 00 01 	mvhi r2,0x1
    4d7c:	38 42 32 48 	ori r2,r2,0x3248
    4d80:	34 01 00 87 	mvi r1,135
    4d84:	fb ff fc 61 	calli 3f08 <m_cprintf>
    4d88:	29 63 00 84 	lw r3,(r11+132)
    4d8c:	b9 80 10 00 	mv r2,r12
    4d90:	34 01 00 07 	mvi r1,7
    4d94:	fb ff fc 5d 	calli 3f08 <m_cprintf>
    4d98:	78 02 00 01 	mvhi r2,0x1
    4d9c:	38 42 32 64 	ori r2,r2,0x3264
    4da0:	34 01 00 87 	mvi r1,135
    4da4:	fb ff fc 59 	calli 3f08 <m_cprintf>
    4da8:	29 61 00 5c 	lw r1,(r11+92)
    4dac:	29 63 00 4c 	lw r3,(r11+76)
    4db0:	29 64 00 74 	lw r4,(r11+116)
    4db4:	b9 80 10 00 	mv r2,r12
    4db8:	c8 61 18 00 	sub r3,r3,r1
    4dbc:	29 61 00 64 	lw r1,(r11+100)
    4dc0:	c8 61 18 00 	sub r3,r3,r1
    4dc4:	29 61 00 6c 	lw r1,(r11+108)
    4dc8:	c8 61 18 00 	sub r3,r3,r1
    4dcc:	c8 64 18 00 	sub r3,r3,r4
    4dd0:	34 01 00 07 	mvi r1,7
    4dd4:	fb ff fc 4d 	calli 3f08 <m_cprintf>
    4dd8:	78 02 00 01 	mvhi r2,0x1
    4ddc:	38 42 32 80 	ori r2,r2,0x3280
    4de0:	34 01 00 87 	mvi r1,135
    4de4:	fb ff fc 49 	calli 3f08 <m_cprintf>
    4de8:	29 63 00 8c 	lw r3,(r11+140)
    4dec:	b9 80 10 00 	mv r2,r12
    4df0:	34 01 00 07 	mvi r1,7
    4df4:	fb ff fc 45 	calli 3f08 <m_cprintf>
    4df8:	78 02 00 01 	mvhi r2,0x1
    4dfc:	38 42 32 9c 	ori r2,r2,0x329c
    4e00:	34 01 00 87 	mvi r1,135
    4e04:	fb ff fc 41 	calli 3f08 <m_cprintf>
    4e08:	29 63 00 94 	lw r3,(r11+148)
    4e0c:	b9 80 10 00 	mv r2,r12
    4e10:	34 01 00 07 	mvi r1,7
    4e14:	fb ff fc 3d 	calli 3f08 <m_cprintf>
    4e18:	78 02 00 01 	mvhi r2,0x1
    4e1c:	38 42 32 b8 	ori r2,r2,0x32b8
    4e20:	34 01 00 87 	mvi r1,135
    4e24:	fb ff fc 39 	calli 3f08 <m_cprintf>
    4e28:	29 63 00 9c 	lw r3,(r11+156)
    4e2c:	b9 80 10 00 	mv r2,r12
    4e30:	34 01 00 07 	mvi r1,7
    4e34:	fb ff fc 35 	calli 3f08 <m_cprintf>
    4e38:	78 02 00 01 	mvhi r2,0x1
    4e3c:	38 42 32 d4 	ori r2,r2,0x32d4
    4e40:	34 01 00 87 	mvi r1,135
    4e44:	fb ff fc 31 	calli 3f08 <m_cprintf>
    4e48:	78 03 00 01 	mvhi r3,0x1
    4e4c:	38 63 59 3c 	ori r3,r3,0x593c
    4e50:	28 63 00 00 	lw r3,(r3+0)
    4e54:	34 01 00 07 	mvi r1,7
    4e58:	b9 80 10 00 	mv r2,r12
    4e5c:	fb ff fc 2b 	calli 3f08 <m_cprintf>
    4e60:	78 02 00 01 	mvhi r2,0x1
    4e64:	34 01 00 87 	mvi r1,135
    4e68:	38 42 32 f0 	ori r2,r2,0x32f0
    4e6c:	fb ff fc 27 	calli 3f08 <m_cprintf>
    4e70:	34 01 00 00 	mvi r1,0
    4e74:	2b 9d 00 04 	lw ra,(sp+4)
    4e78:	2b 8b 00 10 	lw r11,(sp+16)
    4e7c:	2b 8c 00 0c 	lw r12,(sp+12)
    4e80:	2b 8d 00 08 	lw r13,(sp+8)
    4e84:	37 9c 00 6c 	addi sp,sp,108
    4e88:	c3 a0 00 00 	ret

00004e8c <wrc_log_stats>:
    4e8c:	37 9c ff 9c 	addi sp,sp,-100
    4e90:	5b 8b 00 08 	sw (sp+8),r11
    4e94:	5b 9d 00 04 	sw (sp+4),ra
    4e98:	78 0b 00 01 	mvhi r11,0x1
    4e9c:	fb ff f3 05 	calli 1ab0 <timer_get_tics>
    4ea0:	39 6b 69 48 	ori r11,r11,0x6948
    4ea4:	29 62 00 00 	lw r2,(r11+0)
    4ea8:	c8 22 08 00 	sub r1,r1,r2
    4eac:	34 02 03 e7 	mvi r2,999
    4eb0:	50 41 00 0e 	bgeu r2,r1,4ee8 <wrc_log_stats+0x5c>
    4eb4:	fb ff f2 ff 	calli 1ab0 <timer_get_tics>
    4eb8:	59 61 00 00 	sw (r11+0),r1
    4ebc:	34 02 00 00 	mvi r2,0
    4ec0:	37 81 00 0c 	addi r1,sp,12
    4ec4:	f8 00 2b 57 	calli fc20 <halexp_get_port_state>
    4ec8:	37 82 00 60 	addi r2,sp,96
    4ecc:	37 81 00 64 	addi r1,sp,100
    4ed0:	fb ff f2 58 	calli 1830 <minic_get_stats>
    4ed4:	34 01 00 00 	mvi r1,0
    4ed8:	fb ff fa e2 	calli 3a60 <spll_get_aux_status>
    4edc:	78 01 00 01 	mvhi r1,0x1
    4ee0:	38 21 31 b4 	ori r1,r1,0x31b4
    4ee4:	fb ff fb e9 	calli 3e88 <mprintf>
    4ee8:	34 01 00 00 	mvi r1,0
    4eec:	2b 9d 00 04 	lw ra,(sp+4)
    4ef0:	2b 8b 00 08 	lw r11,(sp+8)
    4ef4:	37 9c 00 64 	addi sp,sp,100
    4ef8:	c3 a0 00 00 	ret

00004efc <slot>:
    4efc:	3c 21 00 08 	sli r1,r1,8
    4f00:	78 03 00 01 	mvhi r3,0x1
    4f04:	20 21 0f 00 	andi r1,r1,0xf00
    4f08:	20 42 00 01 	andi r2,r2,0x1
    4f0c:	38 63 32 f4 	ori r3,r3,0x32f4
    4f10:	b8 22 10 00 	or r2,r1,r2
    4f14:	28 61 00 00 	lw r1,(r3+0)
    4f18:	38 42 00 08 	ori r2,r2,0x8
    4f1c:	58 22 00 00 	sw (r1+0),r2
    4f20:	28 22 00 00 	lw r2,(r1+0)
    4f24:	20 42 00 08 	andi r2,r2,0x8
    4f28:	5c 40 ff fe 	bne r2,r0,4f20 <slot+0x24>
    4f2c:	78 02 00 01 	mvhi r2,0x1
    4f30:	38 42 32 f4 	ori r2,r2,0x32f4
    4f34:	28 41 00 00 	lw r1,(r2+0)
    4f38:	28 21 00 00 	lw r1,(r1+0)
    4f3c:	20 21 00 01 	andi r1,r1,0x1
    4f40:	c3 a0 00 00 	ret

00004f44 <ow_reset.clone.0>:
    4f44:	78 02 00 01 	mvhi r2,0x1
    4f48:	38 42 32 f4 	ori r2,r2,0x32f4
    4f4c:	28 41 00 00 	lw r1,(r2+0)
    4f50:	34 02 00 0a 	mvi r2,10
    4f54:	58 22 00 00 	sw (r1+0),r2
    4f58:	28 22 00 00 	lw r2,(r1+0)
    4f5c:	20 42 00 08 	andi r2,r2,0x8
    4f60:	5c 40 ff fe 	bne r2,r0,4f58 <ow_reset.clone.0+0x14>
    4f64:	78 02 00 01 	mvhi r2,0x1
    4f68:	38 42 32 f4 	ori r2,r2,0x32f4
    4f6c:	28 41 00 00 	lw r1,(r2+0)
    4f70:	28 21 00 00 	lw r1,(r1+0)
    4f74:	20 21 00 01 	andi r1,r1,0x1
    4f78:	18 21 00 01 	xori r1,r1,0x1
    4f7c:	c3 a0 00 00 	ret

00004f80 <ow_init>:
    4f80:	78 01 00 01 	mvhi r1,0x1
    4f84:	78 03 00 01 	mvhi r3,0x1
    4f88:	38 21 32 f8 	ori r1,r1,0x32f8
    4f8c:	38 63 32 fc 	ori r3,r3,0x32fc
    4f90:	28 22 00 00 	lw r2,(r1+0)
    4f94:	28 61 00 00 	lw r1,(r3+0)
    4f98:	58 22 00 00 	sw (r1+0),r2
    4f9c:	c3 a0 00 00 	ret

00004fa0 <ow_read_byte>:
    4fa0:	37 9c ff ec 	addi sp,sp,-20
    4fa4:	5b 8b 00 14 	sw (sp+20),r11
    4fa8:	5b 8c 00 10 	sw (sp+16),r12
    4fac:	5b 8d 00 0c 	sw (sp+12),r13
    4fb0:	5b 8e 00 08 	sw (sp+8),r14
    4fb4:	5b 9d 00 04 	sw (sp+4),ra
    4fb8:	34 0b 00 00 	mvi r11,0
    4fbc:	b8 20 70 00 	mv r14,r1
    4fc0:	34 0c 00 00 	mvi r12,0
    4fc4:	34 0d 00 08 	mvi r13,8
    4fc8:	34 02 00 01 	mvi r2,1
    4fcc:	b9 c0 08 00 	mv r1,r14
    4fd0:	fb ff ff cb 	calli 4efc <slot>
    4fd4:	bc 2b 10 00 	sl r2,r1,r11
    4fd8:	35 6b 00 01 	addi r11,r11,1
    4fdc:	b9 82 60 00 	or r12,r12,r2
    4fe0:	5d 6d ff fa 	bne r11,r13,4fc8 <ow_read_byte+0x28>
    4fe4:	21 81 00 ff 	andi r1,r12,0xff
    4fe8:	2b 9d 00 04 	lw ra,(sp+4)
    4fec:	2b 8b 00 14 	lw r11,(sp+20)
    4ff0:	2b 8c 00 10 	lw r12,(sp+16)
    4ff4:	2b 8d 00 0c 	lw r13,(sp+12)
    4ff8:	2b 8e 00 08 	lw r14,(sp+8)
    4ffc:	37 9c 00 14 	addi sp,sp,20
    5000:	c3 a0 00 00 	ret

00005004 <ow_write_byte>:
    5004:	37 9c ff e4 	addi sp,sp,-28
    5008:	5b 8b 00 1c 	sw (sp+28),r11
    500c:	5b 8c 00 18 	sw (sp+24),r12
    5010:	5b 8d 00 14 	sw (sp+20),r13
    5014:	5b 8e 00 10 	sw (sp+16),r14
    5018:	5b 8f 00 0c 	sw (sp+12),r15
    501c:	5b 90 00 08 	sw (sp+8),r16
    5020:	5b 9d 00 04 	sw (sp+4),ra
    5024:	34 0b 00 00 	mvi r11,0
    5028:	b8 20 80 00 	mv r16,r1
    502c:	b8 40 70 00 	mv r14,r2
    5030:	b8 40 68 00 	mv r13,r2
    5034:	34 0c 00 00 	mvi r12,0
    5038:	34 0f 00 08 	mvi r15,8
    503c:	21 a2 00 01 	andi r2,r13,0x1
    5040:	ba 00 08 00 	mv r1,r16
    5044:	fb ff ff ae 	calli 4efc <slot>
    5048:	bc 2b 10 00 	sl r2,r1,r11
    504c:	35 6b 00 01 	addi r11,r11,1
    5050:	b9 82 60 00 	or r12,r12,r2
    5054:	01 ad 00 01 	srui r13,r13,1
    5058:	5d 6f ff f9 	bne r11,r15,503c <ow_write_byte+0x38>
    505c:	fd cc 60 00 	cmpne r12,r14,r12
    5060:	c8 0c 08 00 	sub r1,r0,r12
    5064:	2b 9d 00 04 	lw ra,(sp+4)
    5068:	2b 8b 00 1c 	lw r11,(sp+28)
    506c:	2b 8c 00 18 	lw r12,(sp+24)
    5070:	2b 8d 00 14 	lw r13,(sp+20)
    5074:	2b 8e 00 10 	lw r14,(sp+16)
    5078:	2b 8f 00 0c 	lw r15,(sp+12)
    507c:	2b 90 00 08 	lw r16,(sp+8)
    5080:	37 9c 00 1c 	addi sp,sp,28
    5084:	c3 a0 00 00 	ret

00005088 <ds18x_access>:
    5088:	37 9c ff f0 	addi sp,sp,-16
    508c:	5b 8b 00 10 	sw (sp+16),r11
    5090:	5b 8c 00 0c 	sw (sp+12),r12
    5094:	5b 8d 00 08 	sw (sp+8),r13
    5098:	5b 9d 00 04 	sw (sp+4),ra
    509c:	b8 20 68 00 	mv r13,r1
    50a0:	fb ff ff a9 	calli 4f44 <ow_reset.clone.0>
    50a4:	34 0b ff ff 	mvi r11,-1
    50a8:	44 20 00 11 	be r1,r0,50ec <ds18x_access+0x64>
    50ac:	34 01 00 00 	mvi r1,0
    50b0:	34 02 00 55 	mvi r2,85
    50b4:	fb ff ff d4 	calli 5004 <ow_write_byte>
    50b8:	48 01 00 0d 	bg r0,r1,50ec <ds18x_access+0x64>
    50bc:	34 0b 00 00 	mvi r11,0
    50c0:	34 0c 00 08 	mvi r12,8
    50c4:	b5 ab 10 00 	add r2,r13,r11
    50c8:	40 42 00 00 	lbu r2,(r2+0)
    50cc:	34 01 00 00 	mvi r1,0
    50d0:	fb ff ff cd 	calli 5004 <ow_write_byte>
    50d4:	48 01 00 05 	bg r0,r1,50e8 <ds18x_access+0x60>
    50d8:	35 6b 00 01 	addi r11,r11,1
    50dc:	5d 6c ff fa 	bne r11,r12,50c4 <ds18x_access+0x3c>
    50e0:	34 0b 00 00 	mvi r11,0
    50e4:	e0 00 00 02 	bi 50ec <ds18x_access+0x64>
    50e8:	34 0b ff ff 	mvi r11,-1
    50ec:	b9 60 08 00 	mv r1,r11
    50f0:	2b 9d 00 04 	lw ra,(sp+4)
    50f4:	2b 8b 00 10 	lw r11,(sp+16)
    50f8:	2b 8c 00 0c 	lw r12,(sp+12)
    50fc:	2b 8d 00 08 	lw r13,(sp+8)
    5100:	37 9c 00 10 	addi sp,sp,16
    5104:	c3 a0 00 00 	ret

00005108 <ow_write_block>:
    5108:	37 9c ff ec 	addi sp,sp,-20
    510c:	5b 8b 00 14 	sw (sp+20),r11
    5110:	5b 8c 00 10 	sw (sp+16),r12
    5114:	5b 8d 00 0c 	sw (sp+12),r13
    5118:	5b 8e 00 08 	sw (sp+8),r14
    511c:	5b 9d 00 04 	sw (sp+4),ra
    5120:	34 0c 00 00 	mvi r12,0
    5124:	b8 20 70 00 	mv r14,r1
    5128:	b8 40 58 00 	mv r11,r2
    512c:	b8 60 68 00 	mv r13,r3
    5130:	e0 00 00 07 	bi 514c <ow_write_block+0x44>
    5134:	41 62 00 00 	lbu r2,(r11+0)
    5138:	b9 c0 08 00 	mv r1,r14
    513c:	35 8c 00 01 	addi r12,r12,1
    5140:	fb ff ff b1 	calli 5004 <ow_write_byte>
    5144:	31 61 00 00 	sb (r11+0),r1
    5148:	35 6b 00 01 	addi r11,r11,1
    514c:	55 ac ff fa 	bgu r13,r12,5134 <ow_write_block+0x2c>
    5150:	34 01 00 00 	mvi r1,0
    5154:	2b 9d 00 04 	lw ra,(sp+4)
    5158:	2b 8b 00 14 	lw r11,(sp+20)
    515c:	2b 8c 00 10 	lw r12,(sp+16)
    5160:	2b 8d 00 0c 	lw r13,(sp+12)
    5164:	2b 8e 00 08 	lw r14,(sp+8)
    5168:	37 9c 00 14 	addi sp,sp,20
    516c:	c3 a0 00 00 	ret

00005170 <ow_read_block>:
    5170:	37 9c ff ec 	addi sp,sp,-20
    5174:	5b 8b 00 14 	sw (sp+20),r11
    5178:	5b 8c 00 10 	sw (sp+16),r12
    517c:	5b 8d 00 0c 	sw (sp+12),r13
    5180:	5b 8e 00 08 	sw (sp+8),r14
    5184:	5b 9d 00 04 	sw (sp+4),ra
    5188:	34 0b 00 00 	mvi r11,0
    518c:	b8 20 70 00 	mv r14,r1
    5190:	b8 40 68 00 	mv r13,r2
    5194:	b8 60 60 00 	mv r12,r3
    5198:	e0 00 00 06 	bi 51b0 <ow_read_block+0x40>
    519c:	b9 c0 08 00 	mv r1,r14
    51a0:	fb ff ff 80 	calli 4fa0 <ow_read_byte>
    51a4:	b5 ab 10 00 	add r2,r13,r11
    51a8:	30 41 00 00 	sb (r2+0),r1
    51ac:	35 6b 00 01 	addi r11,r11,1
    51b0:	55 8b ff fb 	bgu r12,r11,519c <ow_read_block+0x2c>
    51b4:	34 01 00 00 	mvi r1,0
    51b8:	2b 9d 00 04 	lw ra,(sp+4)
    51bc:	2b 8b 00 14 	lw r11,(sp+20)
    51c0:	2b 8c 00 10 	lw r12,(sp+16)
    51c4:	2b 8d 00 0c 	lw r13,(sp+12)
    51c8:	2b 8e 00 08 	lw r14,(sp+8)
    51cc:	37 9c 00 14 	addi sp,sp,20
    51d0:	c3 a0 00 00 	ret

000051d4 <ds18x_read_serial>:
    51d4:	37 9c ff f0 	addi sp,sp,-16
    51d8:	5b 8b 00 10 	sw (sp+16),r11
    51dc:	5b 8c 00 0c 	sw (sp+12),r12
    51e0:	5b 8d 00 08 	sw (sp+8),r13
    51e4:	5b 9d 00 04 	sw (sp+4),ra
    51e8:	b8 20 68 00 	mv r13,r1
    51ec:	fb ff ff 56 	calli 4f44 <ow_reset.clone.0>
    51f0:	34 0b ff ff 	mvi r11,-1
    51f4:	44 20 00 0e 	be r1,r0,522c <ds18x_read_serial+0x58>
    51f8:	34 01 00 00 	mvi r1,0
    51fc:	34 02 00 33 	mvi r2,51
    5200:	fb ff ff 81 	calli 5004 <ow_write_byte>
    5204:	48 01 00 0a 	bg r0,r1,522c <ds18x_read_serial+0x58>
    5208:	34 0b 00 00 	mvi r11,0
    520c:	34 0c 00 08 	mvi r12,8
    5210:	34 01 00 00 	mvi r1,0
    5214:	fb ff ff 63 	calli 4fa0 <ow_read_byte>
    5218:	b5 ab 10 00 	add r2,r13,r11
    521c:	30 41 00 00 	sb (r2+0),r1
    5220:	35 6b 00 01 	addi r11,r11,1
    5224:	5d 6c ff fb 	bne r11,r12,5210 <ds18x_read_serial+0x3c>
    5228:	34 0b 00 00 	mvi r11,0
    522c:	b9 60 08 00 	mv r1,r11
    5230:	2b 9d 00 04 	lw ra,(sp+4)
    5234:	2b 8b 00 10 	lw r11,(sp+16)
    5238:	2b 8c 00 0c 	lw r12,(sp+12)
    523c:	2b 8d 00 08 	lw r13,(sp+8)
    5240:	37 9c 00 10 	addi sp,sp,16
    5244:	c3 a0 00 00 	ret

00005248 <ds18x_read_temp>:
    5248:	37 9c ff e0 	addi sp,sp,-32
    524c:	5b 8b 00 14 	sw (sp+20),r11
    5250:	5b 8c 00 10 	sw (sp+16),r12
    5254:	5b 8d 00 0c 	sw (sp+12),r13
    5258:	5b 8e 00 08 	sw (sp+8),r14
    525c:	5b 9d 00 04 	sw (sp+4),ra
    5260:	b8 20 68 00 	mv r13,r1
    5264:	b8 40 60 00 	mv r12,r2
    5268:	fb ff ff 88 	calli 5088 <ds18x_access>
    526c:	34 03 ff ff 	mvi r3,-1
    5270:	48 01 00 1b 	bg r0,r1,52dc <ds18x_read_temp+0x94>
    5274:	34 01 00 00 	mvi r1,0
    5278:	34 02 00 be 	mvi r2,190
    527c:	fb ff ff 62 	calli 5004 <ow_write_byte>
    5280:	37 8b 00 18 	addi r11,sp,24
    5284:	37 8e 00 21 	addi r14,sp,33
    5288:	34 01 00 00 	mvi r1,0
    528c:	fb ff ff 45 	calli 4fa0 <ow_read_byte>
    5290:	31 61 00 00 	sb (r11+0),r1
    5294:	35 6b 00 01 	addi r11,r11,1
    5298:	5d 6e ff fc 	bne r11,r14,5288 <ds18x_read_temp+0x40>
    529c:	43 8b 00 19 	lbu r11,(sp+25)
    52a0:	43 81 00 18 	lbu r1,(sp+24)
    52a4:	3d 6b 00 08 	sli r11,r11,8
    52a8:	b9 61 58 00 	or r11,r11,r1
    52ac:	21 61 10 00 	andi r1,r11,0x1000
    52b0:	44 20 00 03 	be r1,r0,52bc <ds18x_read_temp+0x74>
    52b4:	78 01 ff ff 	mvhi r1,0xffff
    52b8:	b5 61 58 00 	add r11,r11,r1
    52bc:	b9 a0 08 00 	mv r1,r13
    52c0:	fb ff ff 72 	calli 5088 <ds18x_access>
    52c4:	34 01 00 00 	mvi r1,0
    52c8:	34 02 00 44 	mvi r2,68
    52cc:	fb ff ff 4e 	calli 5004 <ow_write_byte>
    52d0:	34 03 00 00 	mvi r3,0
    52d4:	45 80 00 02 	be r12,r0,52dc <ds18x_read_temp+0x94>
    52d8:	59 8b 00 00 	sw (r12+0),r11
    52dc:	b8 60 08 00 	mv r1,r3
    52e0:	2b 9d 00 04 	lw ra,(sp+4)
    52e4:	2b 8b 00 14 	lw r11,(sp+20)
    52e8:	2b 8c 00 10 	lw r12,(sp+16)
    52ec:	2b 8d 00 0c 	lw r13,(sp+12)
    52f0:	2b 8e 00 08 	lw r14,(sp+8)
    52f4:	37 9c 00 20 	addi sp,sp,32
    52f8:	c3 a0 00 00 	ret

000052fc <ds18x_init>:
    52fc:	37 9c ff f8 	addi sp,sp,-8
    5300:	5b 8b 00 08 	sw (sp+8),r11
    5304:	5b 9d 00 04 	sw (sp+4),ra
    5308:	78 01 00 01 	mvhi r1,0x1
    530c:	78 03 00 01 	mvhi r3,0x1
    5310:	38 21 32 f8 	ori r1,r1,0x32f8
    5314:	38 63 32 fc 	ori r3,r3,0x32fc
    5318:	28 22 00 00 	lw r2,(r1+0)
    531c:	28 61 00 00 	lw r1,(r3+0)
    5320:	78 0b 00 01 	mvhi r11,0x1
    5324:	39 6b 69 50 	ori r11,r11,0x6950
    5328:	58 22 00 00 	sw (r1+0),r2
    532c:	b9 60 08 00 	mv r1,r11
    5330:	fb ff ff a9 	calli 51d4 <ds18x_read_serial>
    5334:	b8 20 10 00 	mv r2,r1
    5338:	34 01 ff ff 	mvi r1,-1
    533c:	48 02 00 04 	bg r0,r2,534c <ds18x_init+0x50>
    5340:	b9 60 08 00 	mv r1,r11
    5344:	34 02 00 00 	mvi r2,0
    5348:	fb ff ff c0 	calli 5248 <ds18x_read_temp>
    534c:	2b 9d 00 04 	lw ra,(sp+4)
    5350:	2b 8b 00 08 	lw r11,(sp+8)
    5354:	37 9c 00 08 	addi sp,sp,8
    5358:	c3 a0 00 00 	ret

0000535c <eeprom_read>:
    535c:	37 9c ff e0 	addi sp,sp,-32
    5360:	5b 8b 00 1c 	sw (sp+28),r11
    5364:	5b 8c 00 18 	sw (sp+24),r12
    5368:	5b 8d 00 14 	sw (sp+20),r13
    536c:	5b 8e 00 10 	sw (sp+16),r14
    5370:	5b 8f 00 0c 	sw (sp+12),r15
    5374:	5b 90 00 08 	sw (sp+8),r16
    5378:	5b 9d 00 04 	sw (sp+4),ra
    537c:	20 2b 00 ff 	andi r11,r1,0xff
    5380:	20 4c 00 ff 	andi r12,r2,0xff
    5384:	3d 8c 00 01 	sli r12,r12,1
    5388:	b9 60 08 00 	mv r1,r11
    538c:	b8 60 70 00 	mv r14,r3
    5390:	b8 a0 68 00 	mv r13,r5
    5394:	b8 80 78 00 	mv r15,r4
    5398:	fb ff fc b7 	calli 4674 <mi2c_start>
    539c:	21 82 00 fe 	andi r2,r12,0xfe
    53a0:	b9 60 08 00 	mv r1,r11
    53a4:	fb ff fc fc 	calli 4794 <mi2c_put_byte>
    53a8:	01 c2 00 08 	srui r2,r14,8
    53ac:	b9 60 08 00 	mv r1,r11
    53b0:	20 42 00 ff 	andi r2,r2,0xff
    53b4:	fb ff fc f8 	calli 4794 <mi2c_put_byte>
    53b8:	21 c2 00 ff 	andi r2,r14,0xff
    53bc:	b9 60 08 00 	mv r1,r11
    53c0:	fb ff fc f5 	calli 4794 <mi2c_put_byte>
    53c4:	b9 60 08 00 	mv r1,r11
    53c8:	fb ff fc bf 	calli 46c4 <mi2c_repeat_start>
    53cc:	39 82 00 01 	ori r2,r12,0x1
    53d0:	b9 60 08 00 	mv r1,r11
    53d4:	20 42 00 ff 	andi r2,r2,0xff
    53d8:	fb ff fc ef 	calli 4794 <mi2c_put_byte>
    53dc:	34 0c 00 00 	mvi r12,0
    53e0:	35 ae ff ff 	addi r14,r13,-1
    53e4:	37 90 00 23 	addi r16,sp,35
    53e8:	e0 00 00 09 	bi 540c <eeprom_read+0xb0>
    53ec:	b9 60 08 00 	mv r1,r11
    53f0:	ba 00 10 00 	mv r2,r16
    53f4:	34 03 00 00 	mvi r3,0
    53f8:	fb ff fd 24 	calli 4888 <mi2c_get_byte>
    53fc:	43 82 00 23 	lbu r2,(sp+35)
    5400:	b5 ec 08 00 	add r1,r15,r12
    5404:	35 8c 00 01 	addi r12,r12,1
    5408:	30 22 00 00 	sb (r1+0),r2
    540c:	55 cc ff f8 	bgu r14,r12,53ec <eeprom_read+0x90>
    5410:	b9 60 08 00 	mv r1,r11
    5414:	ba 00 10 00 	mv r2,r16
    5418:	34 03 00 01 	mvi r3,1
    541c:	fb ff fd 1b 	calli 4888 <mi2c_get_byte>
    5420:	43 81 00 23 	lbu r1,(sp+35)
    5424:	b5 ee 70 00 	add r14,r15,r14
    5428:	31 c1 00 00 	sb (r14+0),r1
    542c:	b9 60 08 00 	mv r1,r11
    5430:	fb ff fc c1 	calli 4734 <mi2c_stop>
    5434:	b9 a0 08 00 	mv r1,r13
    5438:	2b 9d 00 04 	lw ra,(sp+4)
    543c:	2b 8b 00 1c 	lw r11,(sp+28)
    5440:	2b 8c 00 18 	lw r12,(sp+24)
    5444:	2b 8d 00 14 	lw r13,(sp+20)
    5448:	2b 8e 00 10 	lw r14,(sp+16)
    544c:	2b 8f 00 0c 	lw r15,(sp+12)
    5450:	2b 90 00 08 	lw r16,(sp+8)
    5454:	37 9c 00 20 	addi sp,sp,32
    5458:	c3 a0 00 00 	ret

0000545c <eeprom_sfp_section>:
    545c:	37 9c ff c4 	addi sp,sp,-60
    5460:	5b 8b 00 38 	sw (sp+56),r11
    5464:	5b 8c 00 34 	sw (sp+52),r12
    5468:	5b 8d 00 30 	sw (sp+48),r13
    546c:	5b 8e 00 2c 	sw (sp+44),r14
    5470:	5b 8f 00 28 	sw (sp+40),r15
    5474:	5b 90 00 24 	sw (sp+36),r16
    5478:	5b 91 00 20 	sw (sp+32),r17
    547c:	5b 92 00 1c 	sw (sp+28),r18
    5480:	5b 93 00 18 	sw (sp+24),r19
    5484:	5b 94 00 14 	sw (sp+20),r20
    5488:	5b 95 00 10 	sw (sp+16),r21
    548c:	5b 96 00 0c 	sw (sp+12),r22
    5490:	5b 97 00 08 	sw (sp+8),r23
    5494:	5b 9d 00 04 	sw (sp+4),ra
    5498:	20 4c 00 ff 	andi r12,r2,0xff
    549c:	20 2b 00 ff 	andi r11,r1,0xff
    54a0:	b9 60 08 00 	mv r1,r11
    54a4:	0c 80 00 00 	sh (r4+0),r0
    54a8:	3d 8c 00 01 	sli r12,r12,1
    54ac:	b8 60 b8 00 	mv r23,r3
    54b0:	b8 80 68 00 	mv r13,r4
    54b4:	fb ff fc 70 	calli 4674 <mi2c_start>
    54b8:	b9 60 08 00 	mv r1,r11
    54bc:	21 82 00 fe 	andi r2,r12,0xfe
    54c0:	fb ff fc b5 	calli 4794 <mi2c_put_byte>
    54c4:	44 20 00 05 	be r1,r0,54d8 <eeprom_sfp_section+0x7c>
    54c8:	b9 60 08 00 	mv r1,r11
    54cc:	fb ff fc 9a 	calli 4734 <mi2c_stop>
    54d0:	34 01 ff ff 	mvi r1,-1
    54d4:	e0 00 00 46 	bi 55ec <eeprom_sfp_section+0x190>
    54d8:	34 02 00 00 	mvi r2,0
    54dc:	b9 60 08 00 	mv r1,r11
    54e0:	fb ff fc ad 	calli 4794 <mi2c_put_byte>
    54e4:	34 02 00 00 	mvi r2,0
    54e8:	b9 60 08 00 	mv r1,r11
    54ec:	fb ff fc aa 	calli 4794 <mi2c_put_byte>
    54f0:	b9 60 08 00 	mv r1,r11
    54f4:	fb ff fc 74 	calli 46c4 <mi2c_repeat_start>
    54f8:	39 82 00 01 	ori r2,r12,0x1
    54fc:	b9 60 08 00 	mv r1,r11
    5500:	20 42 00 ff 	andi r2,r2,0xff
    5504:	fb ff fc a4 	calli 4794 <mi2c_put_byte>
    5508:	34 0e 00 00 	mvi r14,0
    550c:	34 0c 00 00 	mvi r12,0
    5510:	36 f7 ff ff 	addi r23,r23,-1
    5514:	37 8f 00 3f 	addi r15,sp,63
    5518:	34 16 00 0f 	mvi r22,15
    551c:	34 15 00 1f 	mvi r21,31
    5520:	34 14 00 de 	mvi r20,222
    5524:	34 13 00 ad 	mvi r19,173
    5528:	34 12 00 3f 	mvi r18,63
    552c:	34 11 00 be 	mvi r17,190
    5530:	34 10 00 ef 	mvi r16,239
    5534:	e0 00 00 26 	bi 55cc <eeprom_sfp_section+0x170>
    5538:	b9 60 08 00 	mv r1,r11
    553c:	b9 e0 10 00 	mv r2,r15
    5540:	34 03 00 00 	mvi r3,0
    5544:	fb ff fc d1 	calli 4888 <mi2c_get_byte>
    5548:	5d 96 00 06 	bne r12,r22,5560 <eeprom_sfp_section+0x104>
    554c:	43 81 00 3f 	lbu r1,(sp+63)
    5550:	34 0c 00 1f 	mvi r12,31
    5554:	3c 21 00 08 	sli r1,r1,8
    5558:	0d a1 00 00 	sh (r13+0),r1
    555c:	e0 00 00 1a 	bi 55c4 <eeprom_sfp_section+0x168>
    5560:	5d 95 00 06 	bne r12,r21,5578 <eeprom_sfp_section+0x11c>
    5564:	2d a2 00 00 	lhu r2,(r13+0)
    5568:	43 81 00 3f 	lbu r1,(sp+63)
    556c:	b8 41 08 00 	or r1,r2,r1
    5570:	0d a1 00 00 	sh (r13+0),r1
    5574:	e0 00 00 0c 	bi 55a4 <eeprom_sfp_section+0x148>
    5578:	43 81 00 3f 	lbu r1,(sp+63)
    557c:	44 34 00 2c 	be r1,r20,562c <eeprom_sfp_section+0x1d0>
    5580:	5c 33 00 03 	bne r1,r19,558c <eeprom_sfp_section+0x130>
    5584:	39 8c 00 02 	ori r12,r12,0x2
    5588:	e0 00 00 06 	bi 55a0 <eeprom_sfp_section+0x144>
    558c:	5c 31 00 03 	bne r1,r17,5598 <eeprom_sfp_section+0x13c>
    5590:	39 8c 00 04 	ori r12,r12,0x4
    5594:	e0 00 00 03 	bi 55a0 <eeprom_sfp_section+0x144>
    5598:	5c 30 00 27 	bne r1,r16,5634 <eeprom_sfp_section+0x1d8>
    559c:	39 8c 00 08 	ori r12,r12,0x8
    55a0:	5d 92 00 09 	bne r12,r18,55c4 <eeprom_sfp_section+0x168>
    55a4:	b9 60 08 00 	mv r1,r11
    55a8:	37 82 00 3f 	addi r2,sp,63
    55ac:	34 03 00 01 	mvi r3,1
    55b0:	fb ff fc b6 	calli 4888 <mi2c_get_byte>
    55b4:	b9 60 08 00 	mv r1,r11
    55b8:	fb ff fc 5f 	calli 4734 <mi2c_stop>
    55bc:	35 c1 00 01 	addi r1,r14,1
    55c0:	e0 00 00 0b 	bi 55ec <eeprom_sfp_section+0x190>
    55c4:	35 ce 00 01 	addi r14,r14,1
    55c8:	21 ce ff ff 	andi r14,r14,0xffff
    55cc:	56 ee ff db 	bgu r23,r14,5538 <eeprom_sfp_section+0xdc>
    55d0:	b9 60 08 00 	mv r1,r11
    55d4:	b9 e0 10 00 	mv r2,r15
    55d8:	34 03 00 01 	mvi r3,1
    55dc:	fb ff fc ab 	calli 4888 <mi2c_get_byte>
    55e0:	b9 60 08 00 	mv r1,r11
    55e4:	fb ff fc 54 	calli 4734 <mi2c_stop>
    55e8:	34 01 00 00 	mvi r1,0
    55ec:	2b 9d 00 04 	lw ra,(sp+4)
    55f0:	2b 8b 00 38 	lw r11,(sp+56)
    55f4:	2b 8c 00 34 	lw r12,(sp+52)
    55f8:	2b 8d 00 30 	lw r13,(sp+48)
    55fc:	2b 8e 00 2c 	lw r14,(sp+44)
    5600:	2b 8f 00 28 	lw r15,(sp+40)
    5604:	2b 90 00 24 	lw r16,(sp+36)
    5608:	2b 91 00 20 	lw r17,(sp+32)
    560c:	2b 92 00 1c 	lw r18,(sp+28)
    5610:	2b 93 00 18 	lw r19,(sp+24)
    5614:	2b 94 00 14 	lw r20,(sp+20)
    5618:	2b 95 00 10 	lw r21,(sp+16)
    561c:	2b 96 00 0c 	lw r22,(sp+12)
    5620:	2b 97 00 08 	lw r23,(sp+8)
    5624:	37 9c 00 3c 	addi sp,sp,60
    5628:	c3 a0 00 00 	ret
    562c:	34 0c 00 01 	mvi r12,1
    5630:	e3 ff ff e5 	bi 55c4 <eeprom_sfp_section+0x168>
    5634:	34 0c 00 00 	mvi r12,0
    5638:	e3 ff ff e3 	bi 55c4 <eeprom_sfp_section+0x168>

0000563c <eeprom_get_sfpinfo>:
    563c:	37 9c ff e0 	addi sp,sp,-32
    5640:	5b 8b 00 1c 	sw (sp+28),r11
    5644:	5b 8c 00 18 	sw (sp+24),r12
    5648:	5b 8d 00 14 	sw (sp+20),r13
    564c:	5b 8e 00 10 	sw (sp+16),r14
    5650:	5b 8f 00 0c 	sw (sp+12),r15
    5654:	5b 90 00 08 	sw (sp+8),r16
    5658:	5b 9d 00 04 	sw (sp+4),ra
    565c:	20 ab ff ff 	andi r11,r5,0xffff
    5660:	09 6c 00 1c 	muli r12,r11,28
    5664:	20 2e 00 ff 	andi r14,r1,0xff
    5668:	20 4d 00 ff 	andi r13,r2,0xff
    566c:	b9 a0 10 00 	mv r2,r13
    5670:	b9 80 28 00 	mv r5,r12
    5674:	b9 c0 08 00 	mv r1,r14
    5678:	b8 60 78 00 	mv r15,r3
    567c:	b8 80 80 00 	mv r16,r4
    5680:	fb ff ff 37 	calli 535c <eeprom_read>
    5684:	b5 8f 18 00 	add r3,r12,r15
    5688:	b9 c0 08 00 	mv r1,r14
    568c:	b9 a0 10 00 	mv r2,r13
    5690:	37 84 00 23 	addi r4,sp,35
    5694:	34 05 00 01 	mvi r5,1
    5698:	fb ff ff 31 	calli 535c <eeprom_read>
    569c:	01 63 00 08 	srui r3,r11,8
    56a0:	34 01 00 00 	mvi r1,0
    56a4:	b4 6b 18 00 	add r3,r3,r11
    56a8:	20 63 00 ff 	andi r3,r3,0xff
    56ac:	e0 00 00 06 	bi 56c4 <eeprom_get_sfpinfo+0x88>
    56b0:	b6 01 10 00 	add r2,r16,r1
    56b4:	40 42 00 00 	lbu r2,(r2+0)
    56b8:	34 21 00 01 	addi r1,r1,1
    56bc:	b4 62 18 00 	add r3,r3,r2
    56c0:	20 63 00 ff 	andi r3,r3,0xff
    56c4:	55 81 ff fb 	bgu r12,r1,56b0 <eeprom_get_sfpinfo+0x74>
    56c8:	43 84 00 23 	lbu r4,(sp+35)
    56cc:	78 02 00 01 	mvhi r2,0x1
    56d0:	38 42 34 00 	ori r2,r2,0x3400
    56d4:	5c 64 00 06 	bne r3,r4,56ec <eeprom_get_sfpinfo+0xb0>
    56d8:	78 01 00 01 	mvhi r1,0x1
    56dc:	38 21 33 00 	ori r1,r1,0x3300
    56e0:	fb ff f9 ea 	calli 3e88 <mprintf>
    56e4:	34 01 00 00 	mvi r1,0
    56e8:	e0 00 00 05 	bi 56fc <eeprom_get_sfpinfo+0xc0>
    56ec:	78 01 00 01 	mvhi r1,0x1
    56f0:	38 21 33 14 	ori r1,r1,0x3314
    56f4:	fb ff f9 e5 	calli 3e88 <mprintf>
    56f8:	34 01 ff ff 	mvi r1,-1
    56fc:	2b 9d 00 04 	lw ra,(sp+4)
    5700:	2b 8b 00 1c 	lw r11,(sp+28)
    5704:	2b 8c 00 18 	lw r12,(sp+24)
    5708:	2b 8d 00 14 	lw r13,(sp+20)
    570c:	2b 8e 00 10 	lw r14,(sp+16)
    5710:	2b 8f 00 0c 	lw r15,(sp+12)
    5714:	2b 90 00 08 	lw r16,(sp+8)
    5718:	37 9c 00 20 	addi sp,sp,32
    571c:	c3 a0 00 00 	ret

00005720 <access_eeprom>:
    5720:	37 9c ff 58 	addi sp,sp,-168
    5724:	5b 8b 00 34 	sw (sp+52),r11
    5728:	5b 8c 00 30 	sw (sp+48),r12
    572c:	5b 8d 00 2c 	sw (sp+44),r13
    5730:	5b 8e 00 28 	sw (sp+40),r14
    5734:	5b 8f 00 24 	sw (sp+36),r15
    5738:	5b 90 00 20 	sw (sp+32),r16
    573c:	5b 91 00 1c 	sw (sp+28),r17
    5740:	5b 92 00 18 	sw (sp+24),r18
    5744:	5b 93 00 14 	sw (sp+20),r19
    5748:	5b 94 00 10 	sw (sp+16),r20
    574c:	5b 95 00 0c 	sw (sp+12),r21
    5750:	5b 96 00 08 	sw (sp+8),r22
    5754:	5b 9d 00 04 	sw (sp+4),ra
    5758:	b8 20 98 00 	mv r19,r1
    575c:	34 01 00 00 	mvi r1,0
    5760:	b8 40 a0 00 	mv r20,r2
    5764:	b8 60 a8 00 	mv r21,r3
    5768:	b8 80 b0 00 	mv r22,r4
    576c:	fb ff fc 91 	calli 49b0 <mi2c_init>
    5770:	34 01 00 00 	mvi r1,0
    5774:	34 02 00 50 	mvi r2,80
    5778:	78 03 00 01 	mvhi r3,0x1
    577c:	37 84 00 aa 	addi r4,sp,170
    5780:	fb ff ff 37 	calli 545c <eeprom_sfp_section>
    5784:	b8 20 58 00 	mv r11,r1
    5788:	34 01 ff ff 	mvi r1,-1
    578c:	5d 61 00 04 	bne r11,r1,579c <access_eeprom+0x7c>
    5790:	78 01 00 01 	mvhi r1,0x1
    5794:	38 21 33 34 	ori r1,r1,0x3334
    5798:	e0 00 00 0e 	bi 57d0 <access_eeprom+0xb0>
    579c:	2f 85 00 aa 	lhu r5,(sp+170)
    57a0:	34 0c 00 04 	mvi r12,4
    57a4:	51 85 00 08 	bgeu r12,r5,57c4 <access_eeprom+0xa4>
    57a8:	78 06 00 01 	mvhi r6,0x1
    57ac:	b8 c0 08 00 	mv r1,r6
    57b0:	38 21 33 4c 	ori r1,r1,0x334c
    57b4:	b8 a0 10 00 	mv r2,r5
    57b8:	fb ff f9 b4 	calli 3e88 <mprintf>
    57bc:	0f 8c 00 aa 	sh (sp+170),r12
    57c0:	e0 00 00 07 	bi 57dc <access_eeprom+0xbc>
    57c4:	5c a0 00 06 	bne r5,r0,57dc <access_eeprom+0xbc>
    57c8:	78 01 00 01 	mvhi r1,0x1
    57cc:	38 21 33 74 	ori r1,r1,0x3374
    57d0:	fb ff f9 ae 	calli 3e88 <mprintf>
    57d4:	34 01 ff ff 	mvi r1,-1
    57d8:	e0 00 00 41 	bi 58dc <access_eeprom+0x1bc>
    57dc:	78 05 00 01 	mvhi r5,0x1
    57e0:	2f 83 00 aa 	lhu r3,(sp+170)
    57e4:	b8 a0 08 00 	mv r1,r5
    57e8:	b9 60 10 00 	mv r2,r11
    57ec:	38 21 33 b0 	ori r1,r1,0x33b0
    57f0:	fb ff f9 a6 	calli 3e88 <mprintf>
    57f4:	2f 85 00 aa 	lhu r5,(sp+170)
    57f8:	37 8c 00 38 	addi r12,sp,56
    57fc:	34 01 00 00 	mvi r1,0
    5800:	34 02 00 50 	mvi r2,80
    5804:	b9 60 18 00 	mv r3,r11
    5808:	b9 80 20 00 	mv r4,r12
    580c:	fb ff ff 8c 	calli 563c <eeprom_get_sfpinfo>
    5810:	5c 20 00 0a 	bne r1,r0,5838 <access_eeprom+0x118>
    5814:	78 0e 00 01 	mvhi r14,0x1
    5818:	78 0d 00 01 	mvhi r13,0x1
    581c:	34 0b 00 00 	mvi r11,0
    5820:	b9 80 90 00 	mv r18,r12
    5824:	34 11 00 10 	mvi r17,16
    5828:	39 ce 33 ec 	ori r14,r14,0x33ec
    582c:	39 ad 2b b0 	ori r13,r13,0x2bb0
    5830:	37 90 00 ac 	addi r16,sp,172
    5834:	e0 00 00 21 	bi 58b8 <access_eeprom+0x198>
    5838:	78 01 00 01 	mvhi r1,0x1
    583c:	38 21 33 dc 	ori r1,r1,0x33dc
    5840:	e3 ff ff e4 	bi 57d0 <access_eeprom+0xb0>
    5844:	40 e2 00 00 	lbu r2,(r7+0)
    5848:	40 c1 00 00 	lbu r1,(r6+0)
    584c:	5c 41 00 19 	bne r2,r1,58b0 <access_eeprom+0x190>
    5850:	34 a5 00 01 	addi r5,r5,1
    5854:	20 a5 00 ff 	andi r5,r5,0xff
    5858:	34 e7 00 01 	addi r7,r7,1
    585c:	34 c6 00 01 	addi r6,r6,1
    5860:	5c b1 ff f9 	bne r5,r17,5844 <access_eeprom+0x124>
    5864:	b9 c0 08 00 	mv r1,r14
    5868:	35 62 00 01 	addi r2,r11,1
    586c:	fb ff f9 87 	calli 3e88 <mprintf>
    5870:	34 0f 00 10 	mvi r15,16
    5874:	41 82 00 00 	lbu r2,(r12+0)
    5878:	35 ef ff ff 	addi r15,r15,-1
    587c:	b9 a0 08 00 	mv r1,r13
    5880:	21 ef 00 ff 	andi r15,r15,0xff
    5884:	fb ff f9 81 	calli 3e88 <mprintf>
    5888:	35 8c 00 01 	addi r12,r12,1
    588c:	5d e0 ff fa 	bne r15,r0,5874 <access_eeprom+0x154>
    5890:	09 65 00 1c 	muli r5,r11,28
    5894:	b6 05 28 00 	add r5,r16,r5
    5898:	28 a1 ff 9c 	lw r1,(r5+-100)
    589c:	5a 81 00 00 	sw (r20+0),r1
    58a0:	28 a1 ff a0 	lw r1,(r5+-96)
    58a4:	5a a1 00 00 	sw (r21+0),r1
    58a8:	28 a1 ff a4 	lw r1,(r5+-92)
    58ac:	5a c1 00 00 	sw (r22+0),r1
    58b0:	35 6b 00 01 	addi r11,r11,1
    58b4:	21 6b ff ff 	andi r11,r11,0xffff
    58b8:	2f 81 00 aa 	lhu r1,(sp+170)
    58bc:	51 61 00 07 	bgeu r11,r1,58d8 <access_eeprom+0x1b8>
    58c0:	09 6c 00 1c 	muli r12,r11,28
    58c4:	ba 60 38 00 	mv r7,r19
    58c8:	34 05 00 00 	mvi r5,0
    58cc:	b6 4c 60 00 	add r12,r18,r12
    58d0:	b9 80 30 00 	mv r6,r12
    58d4:	e3 ff ff dc 	bi 5844 <access_eeprom+0x124>
    58d8:	34 01 00 00 	mvi r1,0
    58dc:	2b 9d 00 04 	lw ra,(sp+4)
    58e0:	2b 8b 00 34 	lw r11,(sp+52)
    58e4:	2b 8c 00 30 	lw r12,(sp+48)
    58e8:	2b 8d 00 2c 	lw r13,(sp+44)
    58ec:	2b 8e 00 28 	lw r14,(sp+40)
    58f0:	2b 8f 00 24 	lw r15,(sp+36)
    58f4:	2b 90 00 20 	lw r16,(sp+32)
    58f8:	2b 91 00 1c 	lw r17,(sp+28)
    58fc:	2b 92 00 18 	lw r18,(sp+24)
    5900:	2b 93 00 14 	lw r19,(sp+20)
    5904:	2b 94 00 10 	lw r20,(sp+16)
    5908:	2b 95 00 0c 	lw r21,(sp+12)
    590c:	2b 96 00 08 	lw r22,(sp+8)
    5910:	37 9c 00 a8 	addi sp,sp,168
    5914:	c3 a0 00 00 	ret

00005918 <fromInternalTime>:
    5918:	28 23 00 00 	lw r3,(r1+0)
    591c:	48 03 00 06 	bg r0,r3,5934 <fromInternalTime+0x1c>
    5920:	28 21 00 04 	lw r1,(r1+4)
    5924:	48 01 00 04 	bg r0,r1,5934 <fromInternalTime+0x1c>
    5928:	58 43 00 00 	sw (r2+0),r3
    592c:	58 41 00 08 	sw (r2+8),r1
    5930:	0c 40 00 04 	sh (r2+4),r0
    5934:	c3 a0 00 00 	ret

00005938 <toInternalTime>:
    5938:	78 05 00 01 	mvhi r5,0x1
    593c:	38 a5 34 14 	ori r5,r5,0x3414
    5940:	28 43 00 00 	lw r3,(r2+0)
    5944:	28 a4 00 00 	lw r4,(r5+0)
    5948:	54 64 00 04 	bgu r3,r4,5958 <toInternalTime+0x20>
    594c:	28 42 00 08 	lw r2,(r2+8)
    5950:	58 23 00 00 	sw (r1+0),r3
    5954:	58 22 00 04 	sw (r1+4),r2
    5958:	c3 a0 00 00 	ret

0000595c <normalizeTime>:
    595c:	37 9c ff f0 	addi sp,sp,-16
    5960:	5b 8b 00 10 	sw (sp+16),r11
    5964:	5b 8c 00 0c 	sw (sp+12),r12
    5968:	5b 8d 00 08 	sw (sp+8),r13
    596c:	5b 9d 00 04 	sw (sp+4),ra
    5970:	78 03 00 01 	mvhi r3,0x1
    5974:	28 2d 00 04 	lw r13,(r1+4)
    5978:	38 63 34 18 	ori r3,r3,0x3418
    597c:	28 62 00 00 	lw r2,(r3+0)
    5980:	b8 20 58 00 	mv r11,r1
    5984:	b9 a0 08 00 	mv r1,r13
    5988:	f8 00 32 c2 	calli 12490 <__divsi3>
    598c:	78 03 00 01 	mvhi r3,0x1
    5990:	29 6c 00 00 	lw r12,(r11+0)
    5994:	38 63 34 18 	ori r3,r3,0x3418
    5998:	28 62 00 00 	lw r2,(r3+0)
    599c:	b4 2c 60 00 	add r12,r1,r12
    59a0:	59 6c 00 00 	sw (r11+0),r12
    59a4:	b9 a0 08 00 	mv r1,r13
    59a8:	f8 00 32 e7 	calli 12544 <__modsi3>
    59ac:	59 61 00 04 	sw (r11+4),r1
    59b0:	4c 0c 00 07 	bge r0,r12,59cc <normalizeTime+0x70>
    59b4:	4c 20 00 0f 	bge r1,r0,59f0 <normalizeTime+0x94>
    59b8:	35 8c ff ff 	addi r12,r12,-1
    59bc:	78 03 00 01 	mvhi r3,0x1
    59c0:	59 6c 00 00 	sw (r11+0),r12
    59c4:	38 63 34 18 	ori r3,r3,0x3418
    59c8:	e0 00 00 07 	bi 59e4 <normalizeTime+0x88>
    59cc:	45 80 00 09 	be r12,r0,59f0 <normalizeTime+0x94>
    59d0:	4c 01 00 08 	bge r0,r1,59f0 <normalizeTime+0x94>
    59d4:	35 8c 00 01 	addi r12,r12,1
    59d8:	78 03 00 01 	mvhi r3,0x1
    59dc:	59 6c 00 00 	sw (r11+0),r12
    59e0:	38 63 34 1c 	ori r3,r3,0x341c
    59e4:	28 62 00 00 	lw r2,(r3+0)
    59e8:	b4 22 08 00 	add r1,r1,r2
    59ec:	59 61 00 04 	sw (r11+4),r1
    59f0:	2b 9d 00 04 	lw ra,(sp+4)
    59f4:	2b 8b 00 10 	lw r11,(sp+16)
    59f8:	2b 8c 00 0c 	lw r12,(sp+12)
    59fc:	2b 8d 00 08 	lw r13,(sp+8)
    5a00:	37 9c 00 10 	addi sp,sp,16
    5a04:	c3 a0 00 00 	ret

00005a08 <integer64_to_internalTime>:
    5a08:	37 9c ff dc 	addi sp,sp,-36
    5a0c:	5b 8b 00 1c 	sw (sp+28),r11
    5a10:	5b 8c 00 18 	sw (sp+24),r12
    5a14:	5b 8d 00 14 	sw (sp+20),r13
    5a18:	5b 8e 00 10 	sw (sp+16),r14
    5a1c:	5b 8f 00 0c 	sw (sp+12),r15
    5a20:	5b 9b 00 08 	sw (sp+8),fp
    5a24:	5b 9d 00 04 	sw (sp+4),ra
    5a28:	5b 82 00 24 	sw (sp+36),r2
    5a2c:	b8 60 58 00 	mv r11,r3
    5a30:	37 9b 00 24 	addi fp,sp,36
    5a34:	37 83 00 20 	addi r3,sp,32
    5a38:	48 02 00 36 	bg r0,r2,5b10 <integer64_to_internalTime+0x108>
    5a3c:	00 21 00 10 	srui r1,r1,16
    5a40:	14 42 00 10 	sri r2,r2,16
    5a44:	5b 81 00 20 	sw (sp+32),r1
    5a48:	43 81 00 24 	lbu r1,(sp+36)
    5a4c:	3c 4d 00 02 	sli r13,r2,2
    5a50:	30 61 00 02 	sb (r3+2),r1
    5a54:	43 81 00 25 	lbu r1,(sp+37)
    5a58:	30 61 00 03 	sb (r3+3),r1
    5a5c:	b8 40 08 00 	mv r1,r2
    5a60:	f8 00 32 55 	calli 123b4 <__floatsidf>
    5a64:	78 04 00 01 	mvhi r4,0x1
    5a68:	78 05 00 01 	mvhi r5,0x1
    5a6c:	38 a5 34 24 	ori r5,r5,0x3424
    5a70:	38 84 34 20 	ori r4,r4,0x3420
    5a74:	28 83 00 00 	lw r3,(r4+0)
    5a78:	28 a4 00 00 	lw r4,(r5+0)
    5a7c:	2b 8e 00 20 	lw r14,(sp+32)
    5a80:	f8 00 2e 1e 	calli 112f8 <__muldf3>
    5a84:	b8 20 d8 00 	mv fp,r1
    5a88:	b8 40 78 00 	mv r15,r2
    5a8c:	f8 00 32 28 	calli 1232c <__fixdfsi>
    5a90:	b8 20 60 00 	mv r12,r1
    5a94:	f8 00 32 48 	calli 123b4 <__floatsidf>
    5a98:	b8 20 18 00 	mv r3,r1
    5a9c:	b8 40 20 00 	mv r4,r2
    5aa0:	bb 60 08 00 	mv r1,fp
    5aa4:	b9 e0 10 00 	mv r2,r15
    5aa8:	f8 00 2f bf 	calli 119a4 <__subdf3>
    5aac:	78 04 00 01 	mvhi r4,0x1
    5ab0:	38 84 34 28 	ori r4,r4,0x3428
    5ab4:	28 83 00 00 	lw r3,(r4+0)
    5ab8:	34 04 00 00 	mvi r4,0
    5abc:	f8 00 2e 0f 	calli 112f8 <__muldf3>
    5ac0:	f8 00 32 1b 	calli 1232c <__fixdfsi>
    5ac4:	78 05 00 01 	mvhi r5,0x1
    5ac8:	38 a5 34 18 	ori r5,r5,0x3418
    5acc:	28 a2 00 00 	lw r2,(r5+0)
    5ad0:	b8 20 78 00 	mv r15,r1
    5ad4:	b9 c0 08 00 	mv r1,r14
    5ad8:	f8 00 32 cb 	calli 12604 <__umodsi3>
    5adc:	b5 e1 18 00 	add r3,r15,r1
    5ae0:	59 63 00 04 	sw (r11+4),r3
    5ae4:	78 03 00 01 	mvhi r3,0x1
    5ae8:	38 63 34 18 	ori r3,r3,0x3418
    5aec:	28 62 00 00 	lw r2,(r3+0)
    5af0:	b9 c0 08 00 	mv r1,r14
    5af4:	f8 00 32 b4 	calli 125c4 <__udivsi3>
    5af8:	b5 a1 10 00 	add r2,r13,r1
    5afc:	b4 4c 10 00 	add r2,r2,r12
    5b00:	59 62 00 00 	sw (r11+0),r2
    5b04:	b9 60 08 00 	mv r1,r11
    5b08:	fb ff ff 95 	calli 595c <normalizeTime>
    5b0c:	e0 00 00 45 	bi 5c20 <integer64_to_internalTime+0x218>
    5b10:	a4 40 10 00 	not r2,r2
    5b14:	5b 82 00 24 	sw (sp+36),r2
    5b18:	a4 20 20 00 	not r4,r1
    5b1c:	5c 20 00 05 	bne r1,r0,5b30 <integer64_to_internalTime+0x128>
    5b20:	34 42 00 01 	addi r2,r2,1
    5b24:	5b 80 00 20 	sw (sp+32),r0
    5b28:	5b 82 00 24 	sw (sp+36),r2
    5b2c:	e0 00 00 03 	bi 5b38 <integer64_to_internalTime+0x130>
    5b30:	34 81 00 01 	addi r1,r4,1
    5b34:	5b 81 00 20 	sw (sp+32),r1
    5b38:	2f 81 00 20 	lhu r1,(sp+32)
    5b3c:	5b 81 00 20 	sw (sp+32),r1
    5b40:	43 61 00 00 	lbu r1,(fp+0)
    5b44:	30 61 00 02 	sb (r3+2),r1
    5b48:	43 61 00 01 	lbu r1,(fp+1)
    5b4c:	30 61 00 03 	sb (r3+3),r1
    5b50:	1f 82 00 24 	lh r2,(sp+36)
    5b54:	2b 8d 00 20 	lw r13,(sp+32)
    5b58:	b8 40 08 00 	mv r1,r2
    5b5c:	3c 4c 00 02 	sli r12,r2,2
    5b60:	f8 00 32 15 	calli 123b4 <__floatsidf>
    5b64:	78 04 00 01 	mvhi r4,0x1
    5b68:	78 05 00 01 	mvhi r5,0x1
    5b6c:	38 a5 34 24 	ori r5,r5,0x3424
    5b70:	38 84 34 20 	ori r4,r4,0x3420
    5b74:	28 83 00 00 	lw r3,(r4+0)
    5b78:	28 a4 00 00 	lw r4,(r5+0)
    5b7c:	f8 00 2d df 	calli 112f8 <__muldf3>
    5b80:	b8 40 70 00 	mv r14,r2
    5b84:	b8 20 78 00 	mv r15,r1
    5b88:	f8 00 31 e9 	calli 1232c <__fixdfsi>
    5b8c:	b8 20 d8 00 	mv fp,r1
    5b90:	f8 00 32 09 	calli 123b4 <__floatsidf>
    5b94:	b8 20 18 00 	mv r3,r1
    5b98:	b8 40 20 00 	mv r4,r2
    5b9c:	b9 e0 08 00 	mv r1,r15
    5ba0:	b9 c0 10 00 	mv r2,r14
    5ba4:	f8 00 2f 80 	calli 119a4 <__subdf3>
    5ba8:	78 04 00 01 	mvhi r4,0x1
    5bac:	38 84 34 28 	ori r4,r4,0x3428
    5bb0:	28 83 00 00 	lw r3,(r4+0)
    5bb4:	34 04 00 00 	mvi r4,0
    5bb8:	f8 00 2d d0 	calli 112f8 <__muldf3>
    5bbc:	f8 00 31 dc 	calli 1232c <__fixdfsi>
    5bc0:	78 05 00 01 	mvhi r5,0x1
    5bc4:	38 a5 34 18 	ori r5,r5,0x3418
    5bc8:	28 a2 00 00 	lw r2,(r5+0)
    5bcc:	b8 20 70 00 	mv r14,r1
    5bd0:	b9 a0 08 00 	mv r1,r13
    5bd4:	f8 00 32 8c 	calli 12604 <__umodsi3>
    5bd8:	b5 c1 18 00 	add r3,r14,r1
    5bdc:	59 63 00 04 	sw (r11+4),r3
    5be0:	78 03 00 01 	mvhi r3,0x1
    5be4:	38 63 34 18 	ori r3,r3,0x3418
    5be8:	28 62 00 00 	lw r2,(r3+0)
    5bec:	b9 a0 08 00 	mv r1,r13
    5bf0:	f8 00 32 75 	calli 125c4 <__udivsi3>
    5bf4:	b5 81 10 00 	add r2,r12,r1
    5bf8:	b4 5b 10 00 	add r2,r2,fp
    5bfc:	b9 60 08 00 	mv r1,r11
    5c00:	59 62 00 00 	sw (r11+0),r2
    5c04:	fb ff ff 56 	calli 595c <normalizeTime>
    5c08:	29 61 00 04 	lw r1,(r11+4)
    5c0c:	c8 01 08 00 	sub r1,r0,r1
    5c10:	59 61 00 04 	sw (r11+4),r1
    5c14:	29 61 00 00 	lw r1,(r11+0)
    5c18:	c8 01 08 00 	sub r1,r0,r1
    5c1c:	59 61 00 00 	sw (r11+0),r1
    5c20:	2b 9d 00 04 	lw ra,(sp+4)
    5c24:	2b 8b 00 1c 	lw r11,(sp+28)
    5c28:	2b 8c 00 18 	lw r12,(sp+24)
    5c2c:	2b 8d 00 14 	lw r13,(sp+20)
    5c30:	2b 8e 00 10 	lw r14,(sp+16)
    5c34:	2b 8f 00 0c 	lw r15,(sp+12)
    5c38:	2b 9b 00 08 	lw fp,(sp+8)
    5c3c:	37 9c 00 24 	addi sp,sp,36
    5c40:	c3 a0 00 00 	ret

00005c44 <addTime>:
    5c44:	37 9c ff fc 	addi sp,sp,-4
    5c48:	5b 9d 00 04 	sw (sp+4),ra
    5c4c:	28 66 00 00 	lw r6,(r3+0)
    5c50:	28 45 00 00 	lw r5,(r2+0)
    5c54:	28 63 00 04 	lw r3,(r3+4)
    5c58:	28 42 00 04 	lw r2,(r2+4)
    5c5c:	b4 c5 28 00 	add r5,r6,r5
    5c60:	58 25 00 00 	sw (r1+0),r5
    5c64:	b4 62 10 00 	add r2,r3,r2
    5c68:	58 22 00 04 	sw (r1+4),r2
    5c6c:	fb ff ff 3c 	calli 595c <normalizeTime>
    5c70:	2b 9d 00 04 	lw ra,(sp+4)
    5c74:	37 9c 00 04 	addi sp,sp,4
    5c78:	c3 a0 00 00 	ret

00005c7c <subTime>:
    5c7c:	37 9c ff fc 	addi sp,sp,-4
    5c80:	5b 9d 00 04 	sw (sp+4),ra
    5c84:	28 46 00 00 	lw r6,(r2+0)
    5c88:	28 65 00 00 	lw r5,(r3+0)
    5c8c:	c8 c5 28 00 	sub r5,r6,r5
    5c90:	58 25 00 00 	sw (r1+0),r5
    5c94:	28 45 00 04 	lw r5,(r2+4)
    5c98:	28 62 00 04 	lw r2,(r3+4)
    5c9c:	c8 a2 10 00 	sub r2,r5,r2
    5ca0:	58 22 00 04 	sw (r1+4),r2
    5ca4:	fb ff ff 2e 	calli 595c <normalizeTime>
    5ca8:	2b 9d 00 04 	lw ra,(sp+4)
    5cac:	37 9c 00 04 	addi sp,sp,4
    5cb0:	c3 a0 00 00 	ret

00005cb4 <initDataPort>:
    5cb4:	37 9c ff f4 	addi sp,sp,-12
    5cb8:	5b 8b 00 0c 	sw (sp+12),r11
    5cbc:	5b 8c 00 08 	sw (sp+8),r12
    5cc0:	5b 9d 00 04 	sw (sp+4),ra
    5cc4:	34 0a 00 03 	mvi r10,3
    5cc8:	b8 20 60 00 	mv r12,r1
    5ccc:	b8 40 58 00 	mv r11,r2
    5cd0:	58 40 0f 04 	sw (r2+3844),r0
    5cd4:	b8 40 18 00 	mv r3,r2
    5cd8:	34 01 00 00 	mvi r1,0
    5cdc:	34 02 00 00 	mvi r2,0
    5ce0:	34 09 00 04 	mvi r9,4
    5ce4:	34 08 00 05 	mvi r8,5
    5ce8:	34 07 ff fe 	mvi r7,-2
    5cec:	34 06 ff ff 	mvi r6,-1
    5cf0:	34 05 00 08 	mvi r5,8
    5cf4:	5c 2a 00 03 	bne r1,r10,5d00 <initDataPort+0x4c>
    5cf8:	31 66 00 cf 	sb (r11+207),r6
    5cfc:	e0 00 00 0d 	bi 5d30 <initDataPort+0x7c>
    5d00:	5c 29 00 03 	bne r1,r9,5d0c <initDataPort+0x58>
    5d04:	31 67 00 d0 	sb (r11+208),r7
    5d08:	e0 00 00 0a 	bi 5d30 <initDataPort+0x7c>
    5d0c:	5c 28 00 05 	bne r1,r8,5d20 <initDataPort+0x6c>
    5d10:	41 84 00 80 	lbu r4,(r12+128)
    5d14:	44 80 00 03 	be r4,r0,5d20 <initDataPort+0x6c>
    5d18:	31 64 00 d1 	sb (r11+209),r4
    5d1c:	e0 00 00 05 	bi 5d30 <initDataPort+0x7c>
    5d20:	b5 62 20 00 	add r4,r11,r2
    5d24:	40 84 0a f9 	lbu r4,(r4+2809)
    5d28:	34 42 00 01 	addi r2,r2,1
    5d2c:	30 64 00 cc 	sb (r3+204),r4
    5d30:	34 21 00 01 	addi r1,r1,1
    5d34:	34 63 00 01 	addi r3,r3,1
    5d38:	5c 25 ff ef 	bne r1,r5,5cf4 <initDataPort+0x40>
    5d3c:	41 81 00 81 	lbu r1,(r12+129)
    5d40:	34 02 00 00 	mvi r2,0
    5d44:	31 61 0b 62 	sb (r11+2914),r1
    5d48:	29 81 00 84 	lw r1,(r12+132)
    5d4c:	59 61 0b 64 	sw (r11+2916),r1
    5d50:	29 81 00 88 	lw r1,(r12+136)
    5d54:	59 61 0b 68 	sw (r11+2920),r1
    5d58:	41 81 00 8c 	lbu r1,(r12+140)
    5d5c:	31 61 0b 6c 	sb (r11+2924),r1
    5d60:	29 81 00 7c 	lw r1,(r12+124)
    5d64:	59 61 0b 70 	sw (r11+2928),r1
    5d68:	29 61 00 00 	lw r1,(r11+0)
    5d6c:	40 21 00 05 	lbu r1,(r1+5)
    5d70:	34 21 00 02 	addi r1,r1,2
    5d74:	31 61 0b 74 	sb (r11+2932),r1
    5d78:	b9 60 08 00 	mv r1,r11
    5d7c:	f8 00 24 f0 	calli f13c <initWrData>
    5d80:	35 61 00 d4 	addi r1,r11,212
    5d84:	35 62 00 cc 	addi r2,r11,204
    5d88:	34 03 00 08 	mvi r3,8
    5d8c:	f8 00 32 8d 	calli 127c0 <memcpy>
    5d90:	31 60 00 df 	sb (r11+223),r0
    5d94:	59 60 00 e0 	sw (r11+224),r0
    5d98:	59 60 00 e4 	sw (r11+228),r0
    5d9c:	41 81 00 00 	lbu r1,(r12+0)
    5da0:	31 61 00 f0 	sb (r11+240),r1
    5da4:	34 01 00 06 	mvi r1,6
    5da8:	31 61 00 f1 	sb (r11+241),r1
    5dac:	41 81 00 01 	lbu r1,(r12+1)
    5db0:	0d 60 00 fc 	sh (r11+252),r0
    5db4:	31 61 00 f2 	sb (r11+242),r1
    5db8:	34 01 00 01 	mvi r1,1
    5dbc:	31 61 00 f3 	sb (r11+243),r1
    5dc0:	31 61 00 f4 	sb (r11+244),r1
    5dc4:	34 01 00 02 	mvi r1,2
    5dc8:	31 61 00 f5 	sb (r11+245),r1
    5dcc:	2d 81 00 64 	lhu r1,(r12+100)
    5dd0:	0d 61 00 fe 	sh (r11+254),r1
    5dd4:	2b 9d 00 04 	lw ra,(sp+4)
    5dd8:	2b 8b 00 0c 	lw r11,(sp+12)
    5ddc:	2b 8c 00 08 	lw r12,(sp+8)
    5de0:	37 9c 00 0c 	addi sp,sp,12
    5de4:	c3 a0 00 00 	ret

00005de8 <initDataClock>:
    5de8:	37 9c ff ec 	addi sp,sp,-20
    5dec:	5b 8b 00 14 	sw (sp+20),r11
    5df0:	5b 8c 00 10 	sw (sp+16),r12
    5df4:	5b 8d 00 0c 	sw (sp+12),r13
    5df8:	5b 8e 00 08 	sw (sp+8),r14
    5dfc:	5b 9d 00 04 	sw (sp+4),ra
    5e00:	b8 20 58 00 	mv r11,r1
    5e04:	34 01 00 02 	mvi r1,2
    5e08:	58 41 00 00 	sw (r2+0),r1
    5e0c:	2d 61 00 78 	lhu r1,(r11+120)
    5e10:	b8 40 60 00 	mv r12,r2
    5e14:	0c 41 00 04 	sh (r2+4),r1
    5e18:	41 61 00 03 	lbu r1,(r11+3)
    5e1c:	30 41 00 07 	sb (r2+7),r1
    5e20:	2d 61 00 04 	lhu r1,(r11+4)
    5e24:	0c 41 00 08 	sh (r2+8),r1
    5e28:	41 61 00 06 	lbu r1,(r11+6)
    5e2c:	34 02 00 80 	mvi r2,128
    5e30:	5c 22 00 04 	bne r1,r2,5e40 <initDataClock+0x58>
    5e34:	41 62 00 81 	lbu r2,(r11+129)
    5e38:	44 40 00 02 	be r2,r0,5e40 <initDataClock+0x58>
    5e3c:	34 01 00 40 	mvi r1,64
    5e40:	31 81 00 0a 	sb (r12+10),r1
    5e44:	41 61 00 07 	lbu r1,(r11+7)
    5e48:	31 81 00 0b 	sb (r12+11),r1
    5e4c:	41 61 00 08 	lbu r1,(r11+8)
    5e50:	31 81 00 0c 	sb (r12+12),r1
    5e54:	34 01 00 05 	mvi r1,5
    5e58:	31 81 00 98 	sb (r12+152),r1
    5e5c:	29 62 00 98 	lw r2,(r11+152)
    5e60:	34 01 00 01 	mvi r1,1
    5e64:	44 41 00 06 	be r2,r1,5e7c <initDataClock+0x94>
    5e68:	29 62 00 94 	lw r2,(r11+148)
    5e6c:	44 41 00 04 	be r2,r1,5e7c <initDataClock+0x94>
    5e70:	41 62 00 02 	lbu r2,(r11+2)
    5e74:	34 01 00 06 	mvi r1,6
    5e78:	5c 41 00 13 	bne r2,r1,5ec4 <initDataClock+0xdc>
    5e7c:	f8 00 07 50 	calli 7bbc <extsrcLocked>
    5e80:	b8 20 70 00 	mv r14,r1
    5e84:	34 01 00 01 	mvi r1,1
    5e88:	5d c1 00 0d 	bne r14,r1,5ebc <initDataClock+0xd4>
    5e8c:	35 8d 00 88 	addi r13,r12,136
    5e90:	78 02 00 01 	mvhi r2,0x1
    5e94:	b9 a0 08 00 	mv r1,r13
    5e98:	38 42 34 2c 	ori r2,r2,0x342c
    5e9c:	f8 00 07 55 	calli 7bf0 <timerInit>
    5ea0:	41 81 00 98 	lbu r1,(r12+152)
    5ea4:	bd c1 70 00 	sl r14,r14,r1
    5ea8:	b9 a0 08 00 	mv r1,r13
    5eac:	09 c2 03 e8 	muli r2,r14,1000
    5eb0:	f8 00 07 52 	calli 7bf8 <timerStart>
    5eb4:	34 01 00 06 	mvi r1,6
    5eb8:	e0 00 00 02 	bi 5ec0 <initDataClock+0xd8>
    5ebc:	34 01 00 0d 	mvi r1,13
    5ec0:	31 61 00 02 	sb (r11+2),r1
    5ec4:	41 61 00 02 	lbu r1,(r11+2)
    5ec8:	0d 80 00 30 	sh (r12+48),r0
    5ecc:	31 81 00 06 	sb (r12+6),r1
    5ed0:	34 01 ff ff 	mvi r1,-1
    5ed4:	0d 81 00 76 	sh (r12+118),r1
    5ed8:	2b 9d 00 04 	lw ra,(sp+4)
    5edc:	2b 8b 00 14 	lw r11,(sp+20)
    5ee0:	2b 8c 00 10 	lw r12,(sp+16)
    5ee4:	2b 8d 00 0c 	lw r13,(sp+12)
    5ee8:	2b 8e 00 08 	lw r14,(sp+8)
    5eec:	37 9c 00 14 	addi sp,sp,20
    5ef0:	c3 a0 00 00 	ret

00005ef4 <m1>:
    5ef4:	40 22 0b 62 	lbu r2,(r1+2914)
    5ef8:	28 23 00 00 	lw r3,(r1+0)
    5efc:	30 22 0b 6d 	sb (r1+2925),r2
    5f00:	7c 42 00 00 	cmpnei r2,r2,0
    5f04:	58 22 0b b8 	sw (r1+3000),r2
    5f08:	28 22 0b 78 	lw r2,(r1+2936)
    5f0c:	58 22 0b a0 	sw (r1+2976),r2
    5f10:	28 22 0b 7c 	lw r2,(r1+2940)
    5f14:	58 22 0b a4 	sw (r1+2980),r2
    5f18:	34 02 ff a0 	mvi r2,-96
    5f1c:	30 62 00 74 	sb (r3+116),r2
    5f20:	30 20 0e fc 	sb (r1+3836),r0
    5f24:	28 21 00 00 	lw r1,(r1+0)
    5f28:	0c 20 00 30 	sh (r1+48),r0
    5f2c:	c3 a0 00 00 	ret

00005f30 <m3>:
    5f30:	30 20 0e fc 	sb (r1+3836),r0
    5f34:	c3 a0 00 00 	ret

00005f38 <p1>:
    5f38:	30 20 0e fc 	sb (r1+3836),r0
    5f3c:	c3 a0 00 00 	ret

00005f40 <s1>:
    5f40:	37 9c ff f0 	addi sp,sp,-16
    5f44:	5b 8b 00 10 	sw (sp+16),r11
    5f48:	5b 8c 00 0c 	sw (sp+12),r12
    5f4c:	5b 8d 00 08 	sw (sp+8),r13
    5f50:	5b 9d 00 04 	sw (sp+4),ra
    5f54:	b8 40 60 00 	mv r12,r2
    5f58:	2c 42 00 1e 	lhu r2,(r2+30)
    5f5c:	b8 20 68 00 	mv r13,r1
    5f60:	28 61 00 00 	lw r1,(r3+0)
    5f64:	34 42 00 01 	addi r2,r2,1
    5f68:	b8 60 58 00 	mv r11,r3
    5f6c:	0c 22 00 0e 	sh (r1+14),r2
    5f70:	34 03 00 08 	mvi r3,8
    5f74:	35 a2 00 14 	addi r2,r13,20
    5f78:	34 21 00 34 	addi r1,r1,52
    5f7c:	f8 00 32 11 	calli 127c0 <memcpy>
    5f80:	29 61 00 00 	lw r1,(r11+0)
    5f84:	2d a2 00 1c 	lhu r2,(r13+28)
    5f88:	34 03 00 08 	mvi r3,8
    5f8c:	0c 22 00 3c 	sh (r1+60),r2
    5f90:	35 82 00 15 	addi r2,r12,21
    5f94:	34 21 00 4c 	addi r1,r1,76
    5f98:	f8 00 32 0a 	calli 127c0 <memcpy>
    5f9c:	41 82 00 11 	lbu r2,(r12+17)
    5fa0:	29 61 00 00 	lw r1,(r11+0)
    5fa4:	30 22 00 55 	sb (r1+85),r2
    5fa8:	29 61 00 00 	lw r1,(r11+0)
    5fac:	41 82 00 10 	lbu r2,(r12+16)
    5fb0:	30 22 00 54 	sb (r1+84),r2
    5fb4:	29 61 00 00 	lw r1,(r11+0)
    5fb8:	2d 82 00 12 	lhu r2,(r12+18)
    5fbc:	0c 22 00 56 	sh (r1+86),r2
    5fc0:	41 82 00 0e 	lbu r2,(r12+14)
    5fc4:	30 22 00 58 	sb (r1+88),r2
    5fc8:	41 82 00 14 	lbu r2,(r12+20)
    5fcc:	29 61 00 00 	lw r1,(r11+0)
    5fd0:	30 22 00 59 	sb (r1+89),r2
    5fd4:	41 81 00 21 	lbu r1,(r12+33)
    5fd8:	2d 62 00 dc 	lhu r2,(r11+220)
    5fdc:	20 21 00 03 	andi r1,r1,0x3
    5fe0:	7c 21 00 00 	cmpnei r1,r1,0
    5fe4:	59 61 0b b8 	sw (r11+3000),r1
    5fe8:	41 81 00 21 	lbu r1,(r12+33)
    5fec:	20 21 00 08 	andi r1,r1,0x8
    5ff0:	7c 21 00 00 	cmpnei r1,r1,0
    5ff4:	59 61 0b a0 	sw (r11+2976),r1
    5ff8:	41 81 00 21 	lbu r1,(r12+33)
    5ffc:	20 21 00 04 	andi r1,r1,0x4
    6000:	7c 21 00 00 	cmpnei r1,r1,0
    6004:	59 61 0b a4 	sw (r11+2980),r1
    6008:	41 81 00 21 	lbu r1,(r12+33)
    600c:	20 21 00 03 	andi r1,r1,0x3
    6010:	31 61 0b 6d 	sb (r11+2925),r1
    6014:	29 61 00 00 	lw r1,(r11+0)
    6018:	0c 22 00 30 	sh (r1+48),r2
    601c:	2d 82 00 0c 	lhu r2,(r12+12)
    6020:	0c 22 00 5a 	sh (r1+90),r2
    6024:	41 a2 00 08 	lbu r2,(r13+8)
    6028:	20 42 00 04 	andi r2,r2,0x4
    602c:	7c 42 00 00 	cmpnei r2,r2,0
    6030:	58 22 00 5c 	sw (r1+92),r2
    6034:	41 a2 00 08 	lbu r2,(r13+8)
    6038:	20 42 00 02 	andi r2,r2,0x2
    603c:	7c 42 00 00 	cmpnei r2,r2,0
    6040:	58 22 00 60 	sw (r1+96),r2
    6044:	41 a2 00 08 	lbu r2,(r13+8)
    6048:	20 42 00 01 	andi r2,r2,0x1
    604c:	58 22 00 64 	sw (r1+100),r2
    6050:	41 a2 00 08 	lbu r2,(r13+8)
    6054:	20 42 00 10 	andi r2,r2,0x10
    6058:	7c 42 00 00 	cmpnei r2,r2,0
    605c:	58 22 00 68 	sw (r1+104),r2
    6060:	41 a2 00 08 	lbu r2,(r13+8)
    6064:	20 42 00 20 	andi r2,r2,0x20
    6068:	7c 42 00 00 	cmpnei r2,r2,0
    606c:	58 22 00 6c 	sw (r1+108),r2
    6070:	41 a2 00 08 	lbu r2,(r13+8)
    6074:	20 42 00 08 	andi r2,r2,0x8
    6078:	7c 42 00 00 	cmpnei r2,r2,0
    607c:	58 22 00 70 	sw (r1+112),r2
    6080:	41 82 00 20 	lbu r2,(r12+32)
    6084:	30 22 00 74 	sb (r1+116),r2
    6088:	34 01 00 01 	mvi r1,1
    608c:	31 61 0e fc 	sb (r11+3836),r1
    6090:	2b 9d 00 04 	lw ra,(sp+4)
    6094:	2b 8b 00 10 	lw r11,(sp+16)
    6098:	2b 8c 00 0c 	lw r12,(sp+12)
    609c:	2b 8d 00 08 	lw r13,(sp+8)
    60a0:	37 9c 00 10 	addi sp,sp,16
    60a4:	c3 a0 00 00 	ret

000060a8 <s2>:
    60a8:	37 9c ff f0 	addi sp,sp,-16
    60ac:	5b 8b 00 10 	sw (sp+16),r11
    60b0:	5b 8c 00 0c 	sw (sp+12),r12
    60b4:	5b 8d 00 08 	sw (sp+8),r13
    60b8:	5b 9d 00 04 	sw (sp+4),ra
    60bc:	b8 20 60 00 	mv r12,r1
    60c0:	34 01 00 02 	mvi r1,2
    60c4:	b8 60 58 00 	mv r11,r3
    60c8:	30 61 0e fc 	sb (r3+3836),r1
    60cc:	35 82 00 14 	addi r2,r12,20
    60d0:	34 61 0e a0 	addi r1,r3,3744
    60d4:	34 03 00 08 	mvi r3,8
    60d8:	f8 00 31 ba 	calli 127c0 <memcpy>
    60dc:	2d 81 00 1c 	lhu r1,(r12+28)
    60e0:	35 6d 05 50 	addi r13,r11,1360
    60e4:	35 6c 0e d4 	addi r12,r11,3796
    60e8:	0d 61 0e a8 	sh (r11+3752),r1
    60ec:	b9 80 10 00 	mv r2,r12
    60f0:	b9 a0 08 00 	mv r1,r13
    60f4:	0d 60 0e aa 	sh (r11+3754),r0
    60f8:	f8 00 01 f8 	calli 68d8 <msgUnpackHeader>
    60fc:	b9 a0 08 00 	mv r1,r13
    6100:	35 62 0e b0 	addi r2,r11,3760
    6104:	b9 80 18 00 	mv r3,r12
    6108:	f8 00 02 dd 	calli 6c7c <msgUnpackAnnounce>
    610c:	2d 61 00 dc 	lhu r1,(r11+220)
    6110:	0d 61 0e ac 	sh (r11+3756),r1
    6114:	2b 9d 00 04 	lw ra,(sp+4)
    6118:	2b 8b 00 10 	lw r11,(sp+16)
    611c:	2b 8c 00 0c 	lw r12,(sp+12)
    6120:	2b 8d 00 08 	lw r13,(sp+8)
    6124:	37 9c 00 10 	addi sp,sp,16
    6128:	c3 a0 00 00 	ret

0000612c <copyD0>:
    612c:	37 9c ff ec 	addi sp,sp,-20
    6130:	5b 8b 00 14 	sw (sp+20),r11
    6134:	5b 8c 00 10 	sw (sp+16),r12
    6138:	5b 8d 00 0c 	sw (sp+12),r13
    613c:	5b 8e 00 08 	sw (sp+8),r14
    6140:	5b 9d 00 04 	sw (sp+4),ra
    6144:	b8 20 70 00 	mv r14,r1
    6148:	28 61 00 00 	lw r1,(r3+0)
    614c:	34 6d 00 cc 	addi r13,r3,204
    6150:	b8 40 60 00 	mv r12,r2
    6154:	40 21 00 0a 	lbu r1,(r1+10)
    6158:	b8 60 58 00 	mv r11,r3
    615c:	34 03 00 08 	mvi r3,8
    6160:	30 41 00 0e 	sb (r2+14),r1
    6164:	34 41 00 15 	addi r1,r2,21
    6168:	b9 a0 10 00 	mv r2,r13
    616c:	f8 00 31 95 	calli 127c0 <memcpy>
    6170:	29 61 00 00 	lw r1,(r11+0)
    6174:	b9 a0 10 00 	mv r2,r13
    6178:	40 21 00 06 	lbu r1,(r1+6)
    617c:	31 81 00 10 	sb (r12+16),r1
    6180:	29 61 00 00 	lw r1,(r11+0)
    6184:	40 21 00 07 	lbu r1,(r1+7)
    6188:	31 81 00 11 	sb (r12+17),r1
    618c:	29 63 00 00 	lw r3,(r11+0)
    6190:	2c 61 00 08 	lhu r1,(r3+8)
    6194:	0d 81 00 12 	sh (r12+18),r1
    6198:	40 61 00 0b 	lbu r1,(r3+11)
    619c:	0d 80 00 1e 	sh (r12+30),r0
    61a0:	34 03 00 08 	mvi r3,8
    61a4:	31 81 00 14 	sb (r12+20),r1
    61a8:	35 c1 00 14 	addi r1,r14,20
    61ac:	f8 00 31 85 	calli 127c0 <memcpy>
    61b0:	41 81 00 21 	lbu r1,(r12+33)
    61b4:	41 62 0b 62 	lbu r2,(r11+2914)
    61b8:	b8 41 10 00 	or r2,r2,r1
    61bc:	20 42 00 03 	andi r2,r2,0x3
    61c0:	31 82 00 21 	sb (r12+33),r2
    61c4:	29 61 0b 7c 	lw r1,(r11+2940)
    61c8:	3c 21 00 02 	sli r1,r1,2
    61cc:	b8 41 08 00 	or r1,r2,r1
    61d0:	20 21 00 ff 	andi r1,r1,0xff
    61d4:	31 81 00 21 	sb (r12+33),r1
    61d8:	29 62 0b 78 	lw r2,(r11+2936)
    61dc:	3c 42 00 03 	sli r2,r2,3
    61e0:	b8 22 08 00 	or r1,r1,r2
    61e4:	31 81 00 21 	sb (r12+33),r1
    61e8:	2b 9d 00 04 	lw ra,(sp+4)
    61ec:	2b 8b 00 14 	lw r11,(sp+20)
    61f0:	2b 8c 00 10 	lw r12,(sp+16)
    61f4:	2b 8d 00 0c 	lw r13,(sp+12)
    61f8:	2b 8e 00 08 	lw r14,(sp+8)
    61fc:	37 9c 00 14 	addi sp,sp,20
    6200:	c3 a0 00 00 	ret

00006204 <bmcDataSetComparison>:
    6204:	37 9c ff d4 	addi sp,sp,-44
    6208:	5b 8b 00 2c 	sw (sp+44),r11
    620c:	5b 8c 00 28 	sw (sp+40),r12
    6210:	5b 8d 00 24 	sw (sp+36),r13
    6214:	5b 8e 00 20 	sw (sp+32),r14
    6218:	5b 8f 00 1c 	sw (sp+28),r15
    621c:	5b 90 00 18 	sw (sp+24),r16
    6220:	5b 91 00 14 	sw (sp+20),r17
    6224:	5b 92 00 10 	sw (sp+16),r18
    6228:	5b 93 00 0c 	sw (sp+12),r19
    622c:	5b 94 00 08 	sw (sp+8),r20
    6230:	5b 9d 00 04 	sw (sp+4),ra
    6234:	20 6f ff ff 	andi r15,r3,0xffff
    6238:	20 ce ff ff 	andi r14,r6,0xffff
    623c:	b8 20 90 00 	mv r18,r1
    6240:	b9 cf 08 00 	or r1,r14,r15
    6244:	b8 40 68 00 	mv r13,r2
    6248:	b8 80 a0 00 	mv r20,r4
    624c:	b8 a0 60 00 	mv r12,r5
    6250:	b8 e0 98 00 	mv r19,r7
    6254:	34 0b 00 00 	mvi r11,0
    6258:	44 20 00 7c 	be r1,r0,6448 <bmcDataSetComparison+0x244>
    625c:	34 0b ff ff 	mvi r11,-1
    6260:	45 c0 00 7a 	be r14,r0,6448 <bmcDataSetComparison+0x244>
    6264:	34 0b 00 01 	mvi r11,1
    6268:	45 e0 00 78 	be r15,r0,6448 <bmcDataSetComparison+0x244>
    626c:	34 51 00 15 	addi r17,r2,21
    6270:	34 b0 00 15 	addi r16,r5,21
    6274:	ba 20 08 00 	mv r1,r17
    6278:	ba 00 10 00 	mv r2,r16
    627c:	34 03 00 08 	mvi r3,8
    6280:	f8 00 31 2f 	calli 1273c <memcmp>
    6284:	5c 20 00 48 	bne r1,r0,63a4 <bmcDataSetComparison+0x1a0>
    6288:	2d 83 00 1e 	lhu r3,(r12+30)
    628c:	2d a5 00 1e 	lhu r5,(r13+30)
    6290:	34 61 00 01 	addi r1,r3,1
    6294:	48 a1 00 6d 	bg r5,r1,6448 <bmcDataSetComparison+0x244>
    6298:	34 a1 00 01 	addi r1,r5,1
    629c:	34 0b ff ff 	mvi r11,-1
    62a0:	48 61 00 6a 	bg r3,r1,6448 <bmcDataSetComparison+0x244>
    62a4:	50 65 00 15 	bgeu r3,r5,62f8 <bmcDataSetComparison+0xf4>
    62a8:	36 4c 00 14 	addi r12,r18,20
    62ac:	36 6d 00 d4 	addi r13,r19,212
    62b0:	b9 80 08 00 	mv r1,r12
    62b4:	b9 a0 10 00 	mv r2,r13
    62b8:	34 03 00 08 	mvi r3,8
    62bc:	f8 00 31 20 	calli 1273c <memcmp>
    62c0:	34 0b 00 00 	mvi r11,0
    62c4:	44 20 00 61 	be r1,r0,6448 <bmcDataSetComparison+0x244>
    62c8:	b9 80 08 00 	mv r1,r12
    62cc:	b9 a0 10 00 	mv r2,r13
    62d0:	34 03 00 08 	mvi r3,8
    62d4:	f8 00 31 1a 	calli 1273c <memcmp>
    62d8:	34 0b 00 01 	mvi r11,1
    62dc:	48 20 00 5b 	bg r1,r0,6448 <bmcDataSetComparison+0x244>
    62e0:	b9 80 08 00 	mv r1,r12
    62e4:	b9 a0 10 00 	mv r2,r13
    62e8:	34 03 00 08 	mvi r3,8
    62ec:	f8 00 31 14 	calli 1273c <memcmp>
    62f0:	00 2b 00 1f 	srui r11,r1,31
    62f4:	e0 00 00 21 	bi 6378 <bmcDataSetComparison+0x174>
    62f8:	36 8c 00 14 	addi r12,r20,20
    62fc:	50 a3 00 16 	bgeu r5,r3,6354 <bmcDataSetComparison+0x150>
    6300:	36 6d 00 d4 	addi r13,r19,212
    6304:	b9 80 08 00 	mv r1,r12
    6308:	b9 a0 10 00 	mv r2,r13
    630c:	34 03 00 08 	mvi r3,8
    6310:	f8 00 31 0b 	calli 1273c <memcmp>
    6314:	34 0b 00 00 	mvi r11,0
    6318:	44 20 00 4c 	be r1,r0,6448 <bmcDataSetComparison+0x244>
    631c:	b9 80 08 00 	mv r1,r12
    6320:	b9 a0 10 00 	mv r2,r13
    6324:	34 03 00 08 	mvi r3,8
    6328:	f8 00 31 05 	calli 1273c <memcmp>
    632c:	34 0b ff ff 	mvi r11,-1
    6330:	48 20 00 46 	bg r1,r0,6448 <bmcDataSetComparison+0x244>
    6334:	b9 80 08 00 	mv r1,r12
    6338:	b9 a0 10 00 	mv r2,r13
    633c:	34 03 00 08 	mvi r3,8
    6340:	f8 00 30 ff 	calli 1273c <memcmp>
    6344:	a4 20 08 00 	not r1,r1
    6348:	14 2b 00 1f 	sri r11,r1,31
    634c:	21 6b 00 02 	andi r11,r11,0x2
    6350:	e0 00 00 13 	bi 639c <bmcDataSetComparison+0x198>
    6354:	36 4b 00 14 	addi r11,r18,20
    6358:	b9 60 08 00 	mv r1,r11
    635c:	b9 80 10 00 	mv r2,r12
    6360:	34 03 00 08 	mvi r3,8
    6364:	f8 00 30 f6 	calli 1273c <memcmp>
    6368:	5c 20 00 06 	bne r1,r0,6380 <bmcDataSetComparison+0x17c>
    636c:	34 0b ff fe 	mvi r11,-2
    6370:	55 cf 00 36 	bgu r14,r15,6448 <bmcDataSetComparison+0x244>
    6374:	f5 ee 58 00 	cmpgu r11,r15,r14
    6378:	3d 6b 00 01 	sli r11,r11,1
    637c:	e0 00 00 33 	bi 6448 <bmcDataSetComparison+0x244>
    6380:	b9 60 08 00 	mv r1,r11
    6384:	b9 80 10 00 	mv r2,r12
    6388:	34 03 00 08 	mvi r3,8
    638c:	f8 00 30 ec 	calli 1273c <memcmp>
    6390:	a4 20 08 00 	not r1,r1
    6394:	14 2b 00 1f 	sri r11,r1,31
    6398:	21 6b 00 04 	andi r11,r11,0x4
    639c:	35 6b ff fe 	addi r11,r11,-2
    63a0:	e0 00 00 2a 	bi 6448 <bmcDataSetComparison+0x244>
    63a4:	41 a2 00 0e 	lbu r2,(r13+14)
    63a8:	41 81 00 0e 	lbu r1,(r12+14)
    63ac:	5c 41 00 23 	bne r2,r1,6438 <bmcDataSetComparison+0x234>
    63b0:	41 a2 00 10 	lbu r2,(r13+16)
    63b4:	41 81 00 10 	lbu r1,(r12+16)
    63b8:	5c 41 00 1d 	bne r2,r1,642c <bmcDataSetComparison+0x228>
    63bc:	41 a2 00 11 	lbu r2,(r13+17)
    63c0:	41 81 00 11 	lbu r1,(r12+17)
    63c4:	5c 41 00 17 	bne r2,r1,6420 <bmcDataSetComparison+0x21c>
    63c8:	2d a2 00 12 	lhu r2,(r13+18)
    63cc:	2d 81 00 12 	lhu r1,(r12+18)
    63d0:	5c 41 00 0b 	bne r2,r1,63fc <bmcDataSetComparison+0x1f8>
    63d4:	41 a2 00 14 	lbu r2,(r13+20)
    63d8:	41 81 00 14 	lbu r1,(r12+20)
    63dc:	5c 41 00 05 	bne r2,r1,63f0 <bmcDataSetComparison+0x1ec>
    63e0:	ba 20 08 00 	mv r1,r17
    63e4:	ba 00 10 00 	mv r2,r16
    63e8:	34 03 00 08 	mvi r3,8
    63ec:	e0 00 00 07 	bi 6408 <bmcDataSetComparison+0x204>
    63f0:	35 a1 00 14 	addi r1,r13,20
    63f4:	35 82 00 14 	addi r2,r12,20
    63f8:	e0 00 00 03 	bi 6404 <bmcDataSetComparison+0x200>
    63fc:	35 a1 00 12 	addi r1,r13,18
    6400:	35 82 00 12 	addi r2,r12,18
    6404:	34 03 00 01 	mvi r3,1
    6408:	f8 00 30 cd 	calli 1273c <memcmp>
    640c:	3c 21 00 10 	sli r1,r1,16
    6410:	34 0b ff ff 	mvi r11,-1
    6414:	14 21 00 10 	sri r1,r1,16
    6418:	48 01 00 0c 	bg r0,r1,6448 <bmcDataSetComparison+0x244>
    641c:	e0 00 00 0a 	bi 6444 <bmcDataSetComparison+0x240>
    6420:	35 a1 00 11 	addi r1,r13,17
    6424:	35 82 00 11 	addi r2,r12,17
    6428:	e3 ff ff f7 	bi 6404 <bmcDataSetComparison+0x200>
    642c:	35 a1 00 10 	addi r1,r13,16
    6430:	35 82 00 10 	addi r2,r12,16
    6434:	e3 ff ff f4 	bi 6404 <bmcDataSetComparison+0x200>
    6438:	35 a1 00 0e 	addi r1,r13,14
    643c:	35 82 00 0e 	addi r2,r12,14
    6440:	e3 ff ff f1 	bi 6404 <bmcDataSetComparison+0x200>
    6444:	7c 2b 00 00 	cmpnei r11,r1,0
    6448:	b9 60 08 00 	mv r1,r11
    644c:	2b 9d 00 04 	lw ra,(sp+4)
    6450:	2b 8b 00 2c 	lw r11,(sp+44)
    6454:	2b 8c 00 28 	lw r12,(sp+40)
    6458:	2b 8d 00 24 	lw r13,(sp+36)
    645c:	2b 8e 00 20 	lw r14,(sp+32)
    6460:	2b 8f 00 1c 	lw r15,(sp+28)
    6464:	2b 90 00 18 	lw r16,(sp+24)
    6468:	2b 91 00 14 	lw r17,(sp+20)
    646c:	2b 92 00 10 	lw r18,(sp+16)
    6470:	2b 93 00 0c 	lw r19,(sp+12)
    6474:	2b 94 00 08 	lw r20,(sp+8)
    6478:	37 9c 00 2c 	addi sp,sp,44
    647c:	c3 a0 00 00 	ret

00006480 <bmcStateDecision>:
    6480:	37 9c ff e4 	addi sp,sp,-28
    6484:	5b 8b 00 1c 	sw (sp+28),r11
    6488:	5b 8c 00 18 	sw (sp+24),r12
    648c:	5b 8d 00 14 	sw (sp+20),r13
    6490:	5b 8e 00 10 	sw (sp+16),r14
    6494:	5b 8f 00 0c 	sw (sp+12),r15
    6498:	5b 90 00 08 	sw (sp+8),r16
    649c:	5b 9d 00 04 	sw (sp+4),ra
    64a0:	20 70 ff ff 	andi r16,r3,0xffff
    64a4:	40 a3 0b 62 	lbu r3,(r5+2914)
    64a8:	34 04 00 02 	mvi r4,2
    64ac:	b8 20 68 00 	mv r13,r1
    64b0:	b8 40 60 00 	mv r12,r2
    64b4:	b8 a0 58 00 	mv r11,r5
    64b8:	44 64 00 34 	be r3,r4,6588 <bmcStateDecision+0x108>
    64bc:	34 01 00 01 	mvi r1,1
    64c0:	44 61 00 26 	be r3,r1,6558 <bmcStateDecision+0xd8>
    64c4:	2c a1 00 fc 	lhu r1,(r5+252)
    64c8:	5c 20 00 04 	bne r1,r0,64d8 <bmcStateDecision+0x58>
    64cc:	40 a1 00 de 	lbu r1,(r5+222)
    64d0:	34 07 00 03 	mvi r7,3
    64d4:	44 27 00 41 	be r1,r7,65d8 <bmcStateDecision+0x158>
    64d8:	35 6f 01 08 	addi r15,r11,264
    64dc:	35 6e 01 2c 	addi r14,r11,300
    64e0:	b9 e0 08 00 	mv r1,r15
    64e4:	b9 c0 10 00 	mv r2,r14
    64e8:	b9 60 18 00 	mv r3,r11
    64ec:	fb ff ff 10 	calli 612c <copyD0>
    64f0:	29 61 00 00 	lw r1,(r11+0)
    64f4:	2d 63 00 dc 	lhu r3,(r11+220)
    64f8:	10 22 00 06 	lb r2,(r1+6)
    64fc:	48 02 00 0e 	bg r0,r2,6534 <bmcStateDecision+0xb4>
    6500:	b9 e0 08 00 	mv r1,r15
    6504:	b9 c0 10 00 	mv r2,r14
    6508:	b9 a0 20 00 	mv r4,r13
    650c:	b9 80 28 00 	mv r5,r12
    6510:	ba 00 30 00 	mv r6,r16
    6514:	b9 60 38 00 	mv r7,r11
    6518:	fb ff ff 3b 	calli 6204 <bmcDataSetComparison>
    651c:	4c 20 00 02 	bge r1,r0,6524 <bmcStateDecision+0xa4>
    6520:	e0 00 00 0e 	bi 6558 <bmcStateDecision+0xd8>
    6524:	34 07 00 06 	mvi r7,6
    6528:	44 20 00 2c 	be r1,r0,65d8 <bmcStateDecision+0x158>
    652c:	31 60 0e fc 	sb (r11+3836),r0
    6530:	e0 00 00 2a 	bi 65d8 <bmcStateDecision+0x158>
    6534:	28 27 00 7c 	lw r7,(r1+124)
    6538:	b9 c0 10 00 	mv r2,r14
    653c:	b9 e0 08 00 	mv r1,r15
    6540:	2c e6 00 0c 	lhu r6,(r7+12)
    6544:	34 e4 00 34 	addi r4,r7,52
    6548:	34 e5 00 10 	addi r5,r7,16
    654c:	b9 60 38 00 	mv r7,r11
    6550:	fb ff ff 2d 	calli 6204 <bmcDataSetComparison>
    6554:	4c 20 00 04 	bge r1,r0,6564 <bmcStateDecision+0xe4>
    6558:	b9 60 08 00 	mv r1,r11
    655c:	fb ff fe 66 	calli 5ef4 <m1>
    6560:	e0 00 00 1d 	bi 65d4 <bmcStateDecision+0x154>
    6564:	34 07 00 06 	mvi r7,6
    6568:	44 20 00 1c 	be r1,r0,65d8 <bmcStateDecision+0x158>
    656c:	29 61 00 00 	lw r1,(r11+0)
    6570:	28 22 00 7c 	lw r2,(r1+124)
    6574:	2d 61 00 dc 	lhu r1,(r11+220)
    6578:	2c 43 00 0c 	lhu r3,(r2+12)
    657c:	5c 23 00 07 	bne r1,r3,6598 <bmcStateDecision+0x118>
    6580:	b9 a0 08 00 	mv r1,r13
    6584:	b9 80 10 00 	mv r2,r12
    6588:	b9 60 18 00 	mv r3,r11
    658c:	fb ff fe 6d 	calli 5f40 <s1>
    6590:	34 07 00 08 	mvi r7,8
    6594:	e0 00 00 11 	bi 65d8 <bmcStateDecision+0x158>
    6598:	34 41 00 34 	addi r1,r2,52
    659c:	b9 a0 20 00 	mv r4,r13
    65a0:	34 42 00 10 	addi r2,r2,16
    65a4:	b9 80 28 00 	mv r5,r12
    65a8:	ba 00 30 00 	mv r6,r16
    65ac:	b9 60 38 00 	mv r7,r11
    65b0:	fb ff ff 15 	calli 6204 <bmcDataSetComparison>
    65b4:	34 02 ff fe 	mvi r2,-2
    65b8:	5c 22 00 06 	bne r1,r2,65d0 <bmcStateDecision+0x150>
    65bc:	b9 a0 08 00 	mv r1,r13
    65c0:	b9 80 10 00 	mv r2,r12
    65c4:	b9 60 18 00 	mv r3,r11
    65c8:	fb ff fe b8 	calli 60a8 <s2>
    65cc:	e3 ff ff f1 	bi 6590 <bmcStateDecision+0x110>
    65d0:	31 60 0e fc 	sb (r11+3836),r0
    65d4:	34 07 00 05 	mvi r7,5
    65d8:	b8 e0 08 00 	mv r1,r7
    65dc:	2b 9d 00 04 	lw ra,(sp+4)
    65e0:	2b 8b 00 1c 	lw r11,(sp+28)
    65e4:	2b 8c 00 18 	lw r12,(sp+24)
    65e8:	2b 8d 00 14 	lw r13,(sp+20)
    65ec:	2b 8e 00 10 	lw r14,(sp+16)
    65f0:	2b 8f 00 0c 	lw r15,(sp+12)
    65f4:	2b 90 00 08 	lw r16,(sp+8)
    65f8:	37 9c 00 1c 	addi sp,sp,28
    65fc:	c3 a0 00 00 	ret

00006600 <bmc>:
    6600:	37 9c ff f8 	addi sp,sp,-8
    6604:	5b 8b 00 08 	sw (sp+8),r11
    6608:	5b 9d 00 04 	sw (sp+4),ra
    660c:	b8 40 20 00 	mv r4,r2
    6610:	28 62 00 00 	lw r2,(r3+0)
    6614:	b8 60 58 00 	mv r11,r3
    6618:	1c 42 00 76 	lh r2,(r2+118)
    661c:	4c 40 00 08 	bge r2,r0,663c <bmc+0x3c>
    6620:	40 63 00 de 	lbu r3,(r3+222)
    6624:	34 02 00 05 	mvi r2,5
    6628:	5c 62 00 05 	bne r3,r2,663c <bmc+0x3c>
    662c:	b9 60 08 00 	mv r1,r11
    6630:	fb ff fe 31 	calli 5ef4 <m1>
    6634:	41 61 00 de 	lbu r1,(r11+222)
    6638:	e0 00 00 09 	bi 665c <bmc+0x5c>
    663c:	1d 63 01 02 	lh r3,(r11+258)
    6640:	b9 60 28 00 	mv r5,r11
    6644:	08 63 00 58 	muli r3,r3,88
    6648:	b4 23 18 00 	add r3,r1,r3
    664c:	34 61 00 34 	addi r1,r3,52
    6650:	34 62 00 10 	addi r2,r3,16
    6654:	2c 63 00 0c 	lhu r3,(r3+12)
    6658:	fb ff ff 8a 	calli 6480 <bmcStateDecision>
    665c:	2b 9d 00 04 	lw ra,(sp+4)
    6660:	2b 8b 00 08 	lw r11,(sp+8)
    6664:	37 9c 00 08 	addi sp,sp,8
    6668:	c3 a0 00 00 	ret

0000666c <ErBest>:
    666c:	37 9c ff e4 	addi sp,sp,-28
    6670:	5b 8b 00 1c 	sw (sp+28),r11
    6674:	5b 8c 00 18 	sw (sp+24),r12
    6678:	5b 8d 00 14 	sw (sp+20),r13
    667c:	5b 8e 00 10 	sw (sp+16),r14
    6680:	5b 8f 00 0c 	sw (sp+12),r15
    6684:	5b 90 00 08 	sw (sp+8),r16
    6688:	5b 9d 00 04 	sw (sp+4),ra
    668c:	b8 20 80 00 	mv r16,r1
    6690:	2c 41 00 fc 	lhu r1,(r2+252)
    6694:	b8 40 58 00 	mv r11,r2
    6698:	44 20 00 06 	be r1,r0,66b0 <ErBest+0x44>
    669c:	36 0c 00 58 	addi r12,r16,88
    66a0:	34 0f 00 00 	mvi r15,0
    66a4:	34 0d 00 00 	mvi r13,0
    66a8:	34 0e 00 01 	mvi r14,1
    66ac:	e0 00 00 14 	bi 66fc <ErBest+0x90>
    66b0:	0c 40 01 02 	sh (r2+258),r0
    66b4:	34 01 00 ff 	mvi r1,255
    66b8:	e0 00 00 16 	bi 6710 <ErBest+0xa4>
    66bc:	09 a6 00 58 	muli r6,r13,88
    66c0:	2d 83 00 0c 	lhu r3,(r12+12)
    66c4:	35 81 00 34 	addi r1,r12,52
    66c8:	b6 06 30 00 	add r6,r16,r6
    66cc:	34 c4 00 34 	addi r4,r6,52
    66d0:	34 c5 00 10 	addi r5,r6,16
    66d4:	2c c6 00 0c 	lhu r6,(r6+12)
    66d8:	35 82 00 10 	addi r2,r12,16
    66dc:	b9 60 38 00 	mv r7,r11
    66e0:	fb ff fe c9 	calli 6204 <bmcDataSetComparison>
    66e4:	48 01 00 02 	bg r0,r1,66ec <ErBest+0x80>
    66e8:	e0 00 00 02 	bi 66f0 <ErBest+0x84>
    66ec:	b9 c0 68 00 	mv r13,r14
    66f0:	35 ce 00 01 	addi r14,r14,1
    66f4:	dd c0 70 00 	sexth r14,r14
    66f8:	35 8c 00 58 	addi r12,r12,88
    66fc:	2d 61 00 fc 	lhu r1,(r11+252)
    6700:	35 ef 00 01 	addi r15,r15,1
    6704:	48 2f ff ee 	bg r1,r15,66bc <ErBest+0x50>
    6708:	0d 6d 01 02 	sh (r11+258),r13
    670c:	21 a1 00 ff 	andi r1,r13,0xff
    6710:	2b 9d 00 04 	lw ra,(sp+4)
    6714:	2b 8b 00 1c 	lw r11,(sp+28)
    6718:	2b 8c 00 18 	lw r12,(sp+24)
    671c:	2b 8d 00 14 	lw r13,(sp+20)
    6720:	2b 8e 00 10 	lw r14,(sp+16)
    6724:	2b 8f 00 0c 	lw r15,(sp+12)
    6728:	2b 90 00 08 	lw r16,(sp+8)
    672c:	37 9c 00 1c 	addi sp,sp,28
    6730:	c3 a0 00 00 	ret

00006734 <EBest>:
    6734:	37 9c ff e4 	addi sp,sp,-28
    6738:	5b 8b 00 1c 	sw (sp+28),r11
    673c:	5b 8c 00 18 	sw (sp+24),r12
    6740:	5b 8d 00 14 	sw (sp+20),r13
    6744:	5b 8e 00 10 	sw (sp+16),r14
    6748:	5b 8f 00 0c 	sw (sp+12),r15
    674c:	5b 90 00 08 	sw (sp+8),r16
    6750:	5b 9d 00 04 	sw (sp+4),ra
    6754:	b8 20 58 00 	mv r11,r1
    6758:	28 21 00 00 	lw r1,(r1+0)
    675c:	b9 60 10 00 	mv r2,r11
    6760:	2c 23 00 04 	lhu r3,(r1+4)
    6764:	34 01 00 00 	mvi r1,0
    6768:	e0 00 00 05 	bi 677c <EBest+0x48>
    676c:	2c 44 00 fc 	lhu r4,(r2+252)
    6770:	34 21 00 01 	addi r1,r1,1
    6774:	34 42 0f 08 	addi r2,r2,3848
    6778:	5c 80 00 03 	bne r4,r0,6784 <EBest+0x50>
    677c:	dc 20 60 00 	sexth r12,r1
    6780:	48 61 ff fb 	bg r3,r1,676c <EBest+0x38>
    6784:	35 8e 00 01 	addi r14,r12,1
    6788:	dd c0 70 00 	sexth r14,r14
    678c:	09 cd 0f 08 	muli r13,r14,3848
    6790:	b9 c0 80 00 	mv r16,r14
    6794:	34 0f 00 00 	mvi r15,0
    6798:	b5 6d 68 00 	add r13,r11,r13
    679c:	35 ad 00 fc 	addi r13,r13,252
    67a0:	e0 00 00 1c 	bi 6810 <EBest+0xdc>
    67a4:	2d a1 00 00 	lhu r1,(r13+0)
    67a8:	44 20 00 16 	be r1,r0,6800 <EBest+0xcc>
    67ac:	09 81 0f 08 	muli r1,r12,3848
    67b0:	1d a3 00 06 	lh r3,(r13+6)
    67b4:	29 a2 ff fc 	lw r2,(r13+-4)
    67b8:	b5 61 08 00 	add r1,r11,r1
    67bc:	1c 26 01 02 	lh r6,(r1+258)
    67c0:	08 63 00 58 	muli r3,r3,88
    67c4:	28 21 00 f8 	lw r1,(r1+248)
    67c8:	08 c6 00 58 	muli r6,r6,88
    67cc:	b4 43 18 00 	add r3,r2,r3
    67d0:	34 62 00 10 	addi r2,r3,16
    67d4:	b4 26 30 00 	add r6,r1,r6
    67d8:	34 c4 00 34 	addi r4,r6,52
    67dc:	34 61 00 34 	addi r1,r3,52
    67e0:	34 c5 00 10 	addi r5,r6,16
    67e4:	2c 63 00 0c 	lhu r3,(r3+12)
    67e8:	2c c6 00 0c 	lhu r6,(r6+12)
    67ec:	b9 60 38 00 	mv r7,r11
    67f0:	fb ff fe 85 	calli 6204 <bmcDataSetComparison>
    67f4:	48 01 00 02 	bg r0,r1,67fc <EBest+0xc8>
    67f8:	e0 00 00 02 	bi 6800 <EBest+0xcc>
    67fc:	b9 c0 60 00 	mv r12,r14
    6800:	35 ce 00 01 	addi r14,r14,1
    6804:	dd c0 70 00 	sexth r14,r14
    6808:	35 ef 00 01 	addi r15,r15,1
    680c:	35 ad 0f 08 	addi r13,r13,3848
    6810:	29 61 00 00 	lw r1,(r11+0)
    6814:	b5 f0 10 00 	add r2,r15,r16
    6818:	2c 23 00 04 	lhu r3,(r1+4)
    681c:	48 62 ff e2 	bg r3,r2,67a4 <EBest+0x70>
    6820:	09 82 0f 08 	muli r2,r12,3848
    6824:	0c 2c 00 76 	sh (r1+118),r12
    6828:	b5 62 58 00 	add r11,r11,r2
    682c:	1d 62 01 02 	lh r2,(r11+258)
    6830:	29 63 00 f8 	lw r3,(r11+248)
    6834:	08 42 00 58 	muli r2,r2,88
    6838:	b4 62 10 00 	add r2,r3,r2
    683c:	58 22 00 7c 	sw (r1+124),r2
    6840:	21 81 00 ff 	andi r1,r12,0xff
    6844:	2b 9d 00 04 	lw ra,(sp+4)
    6848:	2b 8b 00 1c 	lw r11,(sp+28)
    684c:	2b 8c 00 18 	lw r12,(sp+24)
    6850:	2b 8d 00 14 	lw r13,(sp+20)
    6854:	2b 8e 00 10 	lw r14,(sp+16)
    6858:	2b 8f 00 0c 	lw r15,(sp+12)
    685c:	2b 90 00 08 	lw r16,(sp+8)
    6860:	37 9c 00 1c 	addi sp,sp,28
    6864:	c3 a0 00 00 	ret

00006868 <put_be16>:
    6868:	00 43 00 08 	srui r3,r2,8
    686c:	30 22 00 01 	sb (r1+1),r2
    6870:	30 23 00 00 	sb (r1+0),r3
    6874:	c3 a0 00 00 	ret

00006878 <put_be32>:
    6878:	00 43 00 18 	srui r3,r2,24
    687c:	30 22 00 03 	sb (r1+3),r2
    6880:	30 23 00 00 	sb (r1+0),r3
    6884:	00 43 00 10 	srui r3,r2,16
    6888:	30 23 00 01 	sb (r1+1),r3
    688c:	00 43 00 08 	srui r3,r2,8
    6890:	30 23 00 02 	sb (r1+2),r3
    6894:	c3 a0 00 00 	ret

00006898 <get_be32>:
    6898:	40 22 00 00 	lbu r2,(r1+0)
    689c:	40 23 00 03 	lbu r3,(r1+3)
    68a0:	3c 42 00 18 	sli r2,r2,24
    68a4:	b8 62 10 00 	or r2,r3,r2
    68a8:	40 23 00 01 	lbu r3,(r1+1)
    68ac:	40 21 00 02 	lbu r1,(r1+2)
    68b0:	3c 63 00 10 	sli r3,r3,16
    68b4:	3c 21 00 08 	sli r1,r1,8
    68b8:	b8 43 10 00 	or r2,r2,r3
    68bc:	b8 41 08 00 	or r1,r2,r1
    68c0:	c3 a0 00 00 	ret

000068c4 <get_be16>:
    68c4:	40 22 00 00 	lbu r2,(r1+0)
    68c8:	40 21 00 01 	lbu r1,(r1+1)
    68cc:	3c 42 00 08 	sli r2,r2,8
    68d0:	b8 41 08 00 	or r1,r2,r1
    68d4:	c3 a0 00 00 	ret

000068d8 <msgUnpackHeader>:
    68d8:	37 9c ff f4 	addi sp,sp,-12
    68dc:	5b 8b 00 0c 	sw (sp+12),r11
    68e0:	5b 8c 00 08 	sw (sp+8),r12
    68e4:	5b 9d 00 04 	sw (sp+4),ra
    68e8:	b8 20 58 00 	mv r11,r1
    68ec:	40 21 00 00 	lbu r1,(r1+0)
    68f0:	b8 40 60 00 	mv r12,r2
    68f4:	00 21 00 04 	srui r1,r1,4
    68f8:	30 41 00 00 	sb (r2+0),r1
    68fc:	41 61 00 00 	lbu r1,(r11+0)
    6900:	20 21 00 0f 	andi r1,r1,0xf
    6904:	30 41 00 01 	sb (r2+1),r1
    6908:	41 61 00 01 	lbu r1,(r11+1)
    690c:	20 21 00 0f 	andi r1,r1,0xf
    6910:	30 41 00 02 	sb (r2+2),r1
    6914:	35 61 00 02 	addi r1,r11,2
    6918:	fb ff ff eb 	calli 68c4 <get_be16>
    691c:	0d 81 00 04 	sh (r12+4),r1
    6920:	41 61 00 04 	lbu r1,(r11+4)
    6924:	35 62 00 06 	addi r2,r11,6
    6928:	34 03 00 02 	mvi r3,2
    692c:	31 81 00 06 	sb (r12+6),r1
    6930:	35 81 00 07 	addi r1,r12,7
    6934:	f8 00 2f a3 	calli 127c0 <memcpy>
    6938:	35 61 00 08 	addi r1,r11,8
    693c:	fb ff ff d7 	calli 6898 <get_be32>
    6940:	59 81 00 10 	sw (r12+16),r1
    6944:	35 61 00 0c 	addi r1,r11,12
    6948:	fb ff ff d4 	calli 6898 <get_be32>
    694c:	35 62 00 14 	addi r2,r11,20
    6950:	34 03 00 08 	mvi r3,8
    6954:	59 81 00 0c 	sw (r12+12),r1
    6958:	35 81 00 14 	addi r1,r12,20
    695c:	f8 00 2f 99 	calli 127c0 <memcpy>
    6960:	35 61 00 1c 	addi r1,r11,28
    6964:	fb ff ff d8 	calli 68c4 <get_be16>
    6968:	0d 81 00 1c 	sh (r12+28),r1
    696c:	35 61 00 1e 	addi r1,r11,30
    6970:	fb ff ff d5 	calli 68c4 <get_be16>
    6974:	0d 81 00 1e 	sh (r12+30),r1
    6978:	41 61 00 20 	lbu r1,(r11+32)
    697c:	31 81 00 20 	sb (r12+32),r1
    6980:	41 61 00 21 	lbu r1,(r11+33)
    6984:	31 81 00 21 	sb (r12+33),r1
    6988:	2b 9d 00 04 	lw ra,(sp+4)
    698c:	2b 8b 00 0c 	lw r11,(sp+12)
    6990:	2b 8c 00 08 	lw r12,(sp+8)
    6994:	37 9c 00 0c 	addi sp,sp,12
    6998:	c3 a0 00 00 	ret

0000699c <msgPackHeader>:
    699c:	37 9c ff f4 	addi sp,sp,-12
    69a0:	5b 8b 00 0c 	sw (sp+12),r11
    69a4:	5b 8c 00 08 	sw (sp+8),r12
    69a8:	5b 9d 00 04 	sw (sp+4),ra
    69ac:	30 20 00 00 	sb (r1+0),r0
    69b0:	b8 20 58 00 	mv r11,r1
    69b4:	40 41 00 f5 	lbu r1,(r2+245)
    69b8:	b8 40 60 00 	mv r12,r2
    69bc:	31 61 00 01 	sb (r11+1),r1
    69c0:	28 41 00 00 	lw r1,(r2+0)
    69c4:	40 21 00 0c 	lbu r1,(r1+12)
    69c8:	31 61 00 04 	sb (r11+4),r1
    69cc:	28 41 00 00 	lw r1,(r2+0)
    69d0:	28 21 00 00 	lw r1,(r1+0)
    69d4:	44 20 00 03 	be r1,r0,69e0 <msgPackHeader+0x44>
    69d8:	34 01 00 02 	mvi r1,2
    69dc:	31 61 00 06 	sb (r11+6),r1
    69e0:	35 61 00 08 	addi r1,r11,8
    69e4:	34 02 00 00 	mvi r2,0
    69e8:	34 03 00 08 	mvi r3,8
    69ec:	f8 00 2f ae 	calli 128a4 <memset>
    69f0:	35 82 00 d4 	addi r2,r12,212
    69f4:	34 03 00 08 	mvi r3,8
    69f8:	35 61 00 14 	addi r1,r11,20
    69fc:	f8 00 2f 71 	calli 127c0 <memcpy>
    6a00:	2d 82 00 dc 	lhu r2,(r12+220)
    6a04:	35 61 00 1c 	addi r1,r11,28
    6a08:	fb ff ff 98 	calli 6868 <put_be16>
    6a0c:	34 01 00 7f 	mvi r1,127
    6a10:	31 61 00 21 	sb (r11+33),r1
    6a14:	2b 9d 00 04 	lw ra,(sp+4)
    6a18:	2b 8b 00 0c 	lw r11,(sp+12)
    6a1c:	2b 8c 00 08 	lw r12,(sp+8)
    6a20:	37 9c 00 0c 	addi sp,sp,12
    6a24:	c3 a0 00 00 	ret

00006a28 <msgPackSync>:
    6a28:	37 9c ff f0 	addi sp,sp,-16
    6a2c:	5b 8b 00 10 	sw (sp+16),r11
    6a30:	5b 8c 00 0c 	sw (sp+12),r12
    6a34:	5b 8d 00 08 	sw (sp+8),r13
    6a38:	5b 9d 00 04 	sw (sp+4),ra
    6a3c:	b8 20 58 00 	mv r11,r1
    6a40:	40 21 00 00 	lbu r1,(r1+0)
    6a44:	b8 40 60 00 	mv r12,r2
    6a48:	34 02 00 2c 	mvi r2,44
    6a4c:	20 21 00 f0 	andi r1,r1,0xf0
    6a50:	31 61 00 00 	sb (r11+0),r1
    6a54:	35 61 00 02 	addi r1,r11,2
    6a58:	b8 60 68 00 	mv r13,r3
    6a5c:	fb ff ff 83 	calli 6868 <put_be16>
    6a60:	2d a1 0a cc 	lhu r1,(r13+2764)
    6a64:	31 60 00 20 	sb (r11+32),r0
    6a68:	34 03 00 08 	mvi r3,8
    6a6c:	0d 61 00 1e 	sh (r11+30),r1
    6a70:	41 a1 00 f2 	lbu r1,(r13+242)
    6a74:	34 02 00 00 	mvi r2,0
    6a78:	31 61 00 21 	sb (r11+33),r1
    6a7c:	35 61 00 08 	addi r1,r11,8
    6a80:	f8 00 2f 89 	calli 128a4 <memset>
    6a84:	2d 82 00 04 	lhu r2,(r12+4)
    6a88:	35 61 00 22 	addi r1,r11,34
    6a8c:	fb ff ff 77 	calli 6868 <put_be16>
    6a90:	29 82 00 00 	lw r2,(r12+0)
    6a94:	35 61 00 24 	addi r1,r11,36
    6a98:	fb ff ff 78 	calli 6878 <put_be32>
    6a9c:	29 82 00 08 	lw r2,(r12+8)
    6aa0:	35 61 00 28 	addi r1,r11,40
    6aa4:	fb ff ff 75 	calli 6878 <put_be32>
    6aa8:	2b 9d 00 04 	lw ra,(sp+4)
    6aac:	2b 8b 00 10 	lw r11,(sp+16)
    6ab0:	2b 8c 00 0c 	lw r12,(sp+12)
    6ab4:	2b 8d 00 08 	lw r13,(sp+8)
    6ab8:	37 9c 00 10 	addi sp,sp,16
    6abc:	c3 a0 00 00 	ret

00006ac0 <msgUnpackSync>:
    6ac0:	37 9c ff f4 	addi sp,sp,-12
    6ac4:	5b 8b 00 0c 	sw (sp+12),r11
    6ac8:	5b 8c 00 08 	sw (sp+8),r12
    6acc:	5b 9d 00 04 	sw (sp+4),ra
    6ad0:	b8 20 60 00 	mv r12,r1
    6ad4:	34 21 00 22 	addi r1,r1,34
    6ad8:	b8 40 58 00 	mv r11,r2
    6adc:	fb ff ff 7a 	calli 68c4 <get_be16>
    6ae0:	0d 61 00 04 	sh (r11+4),r1
    6ae4:	35 81 00 24 	addi r1,r12,36
    6ae8:	fb ff ff 6c 	calli 6898 <get_be32>
    6aec:	59 61 00 00 	sw (r11+0),r1
    6af0:	35 81 00 28 	addi r1,r12,40
    6af4:	fb ff ff 69 	calli 6898 <get_be32>
    6af8:	59 61 00 08 	sw (r11+8),r1
    6afc:	2b 9d 00 04 	lw ra,(sp+4)
    6b00:	2b 8b 00 0c 	lw r11,(sp+12)
    6b04:	2b 8c 00 08 	lw r12,(sp+8)
    6b08:	37 9c 00 0c 	addi sp,sp,12
    6b0c:	c3 a0 00 00 	ret

00006b10 <msgPackAnnounce>:
    6b10:	37 9c ff f4 	addi sp,sp,-12
    6b14:	5b 8b 00 0c 	sw (sp+12),r11
    6b18:	5b 8c 00 08 	sw (sp+8),r12
    6b1c:	5b 9d 00 04 	sw (sp+4),ra
    6b20:	b8 20 60 00 	mv r12,r1
    6b24:	40 21 00 00 	lbu r1,(r1+0)
    6b28:	b8 40 58 00 	mv r11,r2
    6b2c:	20 21 00 f0 	andi r1,r1,0xf0
    6b30:	38 21 00 0b 	ori r1,r1,0xb
    6b34:	31 81 00 00 	sb (r12+0),r1
    6b38:	40 41 0b 62 	lbu r1,(r2+2914)
    6b3c:	7c 22 00 02 	cmpnei r2,r1,2
    6b40:	7c 21 00 00 	cmpnei r1,r1,0
    6b44:	a0 41 10 00 	and r2,r2,r1
    6b48:	35 81 00 02 	addi r1,r12,2
    6b4c:	44 40 00 03 	be r2,r0,6b58 <msgPackAnnounce+0x48>
    6b50:	34 02 00 4e 	mvi r2,78
    6b54:	e0 00 00 02 	bi 6b5c <msgPackAnnounce+0x4c>
    6b58:	34 02 00 40 	mvi r2,64
    6b5c:	fb ff ff 43 	calli 6868 <put_be16>
    6b60:	2d 61 0a ce 	lhu r1,(r11+2766)
    6b64:	34 02 00 00 	mvi r2,0
    6b68:	34 03 00 0a 	mvi r3,10
    6b6c:	0d 81 00 1e 	sh (r12+30),r1
    6b70:	34 01 00 05 	mvi r1,5
    6b74:	31 81 00 20 	sb (r12+32),r1
    6b78:	41 61 00 f0 	lbu r1,(r11+240)
    6b7c:	31 81 00 21 	sb (r12+33),r1
    6b80:	35 81 00 22 	addi r1,r12,34
    6b84:	f8 00 2f 48 	calli 128a4 <memset>
    6b88:	29 61 00 00 	lw r1,(r11+0)
    6b8c:	34 03 00 08 	mvi r3,8
    6b90:	2c 22 00 5a 	lhu r2,(r1+90)
    6b94:	0d 82 00 2c 	sh (r12+44),r2
    6b98:	40 21 00 58 	lbu r1,(r1+88)
    6b9c:	31 81 00 2f 	sb (r12+47),r1
    6ba0:	29 61 00 00 	lw r1,(r11+0)
    6ba4:	40 21 00 06 	lbu r1,(r1+6)
    6ba8:	31 81 00 30 	sb (r12+48),r1
    6bac:	29 61 00 00 	lw r1,(r11+0)
    6bb0:	40 21 00 07 	lbu r1,(r1+7)
    6bb4:	31 81 00 31 	sb (r12+49),r1
    6bb8:	29 61 00 00 	lw r1,(r11+0)
    6bbc:	2c 22 00 08 	lhu r2,(r1+8)
    6bc0:	0d 82 00 32 	sh (r12+50),r2
    6bc4:	40 21 00 59 	lbu r1,(r1+89)
    6bc8:	31 81 00 34 	sb (r12+52),r1
    6bcc:	29 62 00 00 	lw r2,(r11+0)
    6bd0:	35 81 00 35 	addi r1,r12,53
    6bd4:	34 42 00 4c 	addi r2,r2,76
    6bd8:	f8 00 2e fa 	calli 127c0 <memcpy>
    6bdc:	29 61 00 00 	lw r1,(r11+0)
    6be0:	2c 21 00 0e 	lhu r1,(r1+14)
    6be4:	31 81 00 3d 	sb (r12+61),r1
    6be8:	29 61 00 00 	lw r1,(r11+0)
    6bec:	2c 21 00 0e 	lhu r1,(r1+14)
    6bf0:	00 21 00 08 	srui r1,r1,8
    6bf4:	31 81 00 3e 	sb (r12+62),r1
    6bf8:	29 61 00 00 	lw r1,(r11+0)
    6bfc:	40 21 00 74 	lbu r1,(r1+116)
    6c00:	31 81 00 3f 	sb (r12+63),r1
    6c04:	41 61 0b 62 	lbu r1,(r11+2914)
    6c08:	7c 22 00 02 	cmpnei r2,r1,2
    6c0c:	7c 21 00 00 	cmpnei r1,r1,0
    6c10:	a0 41 08 00 	and r1,r2,r1
    6c14:	44 20 00 15 	be r1,r0,6c68 <msgPackAnnounce+0x158>
    6c18:	34 01 00 03 	mvi r1,3
    6c1c:	0d 81 00 40 	sh (r12+64),r1
    6c20:	34 01 00 0a 	mvi r1,10
    6c24:	0d 81 00 42 	sh (r12+66),r1
    6c28:	34 01 08 00 	mvi r1,2048
    6c2c:	0d 81 00 44 	sh (r12+68),r1
    6c30:	34 01 30 de 	mvi r1,12510
    6c34:	0d 81 00 46 	sh (r12+70),r1
    6c38:	29 62 0b 7c 	lw r2,(r11+2940)
    6c3c:	34 01 ad 01 	mvi r1,-21247
    6c40:	0d 81 00 48 	sh (r12+72),r1
    6c44:	34 01 20 00 	mvi r1,8192
    6c48:	0d 81 00 4a 	sh (r12+74),r1
    6c4c:	41 61 0b 62 	lbu r1,(r11+2914)
    6c50:	44 40 00 02 	be r2,r0,6c58 <msgPackAnnounce+0x148>
    6c54:	38 21 00 04 	ori r1,r1,0x4
    6c58:	29 62 0b 78 	lw r2,(r11+2936)
    6c5c:	44 40 00 02 	be r2,r0,6c64 <msgPackAnnounce+0x154>
    6c60:	38 21 00 08 	ori r1,r1,0x8
    6c64:	0d 81 00 4c 	sh (r12+76),r1
    6c68:	2b 9d 00 04 	lw ra,(sp+4)
    6c6c:	2b 8b 00 0c 	lw r11,(sp+12)
    6c70:	2b 8c 00 08 	lw r12,(sp+8)
    6c74:	37 9c 00 0c 	addi sp,sp,12
    6c78:	c3 a0 00 00 	ret

00006c7c <msgUnpackAnnounce>:
    6c7c:	37 9c ff f4 	addi sp,sp,-12
    6c80:	5b 8b 00 0c 	sw (sp+12),r11
    6c84:	5b 8c 00 08 	sw (sp+8),r12
    6c88:	5b 9d 00 04 	sw (sp+4),ra
    6c8c:	b8 20 58 00 	mv r11,r1
    6c90:	2c 21 00 22 	lhu r1,(r1+34)
    6c94:	b8 40 60 00 	mv r12,r2
    6c98:	0c 41 00 04 	sh (r2+4),r1
    6c9c:	29 61 00 24 	lw r1,(r11+36)
    6ca0:	58 41 00 00 	sw (r2+0),r1
    6ca4:	29 61 00 28 	lw r1,(r11+40)
    6ca8:	58 41 00 08 	sw (r2+8),r1
    6cac:	2d 61 00 2c 	lhu r1,(r11+44)
    6cb0:	0c 41 00 0c 	sh (r2+12),r1
    6cb4:	41 61 00 2f 	lbu r1,(r11+47)
    6cb8:	30 41 00 0e 	sb (r2+14),r1
    6cbc:	41 61 00 30 	lbu r1,(r11+48)
    6cc0:	30 41 00 10 	sb (r2+16),r1
    6cc4:	41 61 00 31 	lbu r1,(r11+49)
    6cc8:	30 41 00 11 	sb (r2+17),r1
    6ccc:	35 61 00 32 	addi r1,r11,50
    6cd0:	fb ff fe fd 	calli 68c4 <get_be16>
    6cd4:	0d 81 00 12 	sh (r12+18),r1
    6cd8:	41 61 00 34 	lbu r1,(r11+52)
    6cdc:	35 62 00 35 	addi r2,r11,53
    6ce0:	34 03 00 08 	mvi r3,8
    6ce4:	31 81 00 14 	sb (r12+20),r1
    6ce8:	35 81 00 15 	addi r1,r12,21
    6cec:	f8 00 2e b5 	calli 127c0 <memcpy>
    6cf0:	41 61 00 3e 	lbu r1,(r11+62)
    6cf4:	41 62 00 3d 	lbu r2,(r11+61)
    6cf8:	3c 21 00 08 	sli r1,r1,8
    6cfc:	b8 22 08 00 	or r1,r1,r2
    6d00:	0d 81 00 1e 	sh (r12+30),r1
    6d04:	41 61 00 3f 	lbu r1,(r11+63)
    6d08:	31 81 00 20 	sb (r12+32),r1
    6d0c:	35 61 00 02 	addi r1,r11,2
    6d10:	fb ff fe ed 	calli 68c4 <get_be16>
    6d14:	34 02 00 40 	mvi r2,64
    6d18:	50 41 00 20 	bgeu r2,r1,6d98 <msgUnpackAnnounce+0x11c>
    6d1c:	35 61 00 40 	addi r1,r11,64
    6d20:	fb ff fe e9 	calli 68c4 <get_be16>
    6d24:	2d 65 00 44 	lhu r5,(r11+68)
    6d28:	2d 63 00 46 	lhu r3,(r11+70)
    6d2c:	78 07 00 01 	mvhi r7,0x1
    6d30:	3c a5 00 08 	sli r5,r5,8
    6d34:	00 66 00 08 	srui r6,r3,8
    6d38:	38 e7 34 38 	ori r7,r7,0x3438
    6d3c:	b8 a6 28 00 	or r5,r5,r6
    6d40:	28 e6 00 00 	lw r6,(r7+0)
    6d44:	64 21 00 03 	cmpei r1,r1,3
    6d48:	2d 62 00 48 	lhu r2,(r11+72)
    6d4c:	e4 a6 28 00 	cmpe r5,r5,r6
    6d50:	2d 64 00 4a 	lhu r4,(r11+74)
    6d54:	a0 25 08 00 	and r1,r1,r5
    6d58:	44 20 00 10 	be r1,r0,6d98 <msgUnpackAnnounce+0x11c>
    6d5c:	3c 63 00 08 	sli r3,r3,8
    6d60:	00 41 00 08 	srui r1,r2,8
    6d64:	20 63 ff ff 	andi r3,r3,0xffff
    6d68:	b8 61 18 00 	or r3,r3,r1
    6d6c:	20 42 00 ff 	andi r2,r2,0xff
    6d70:	38 01 de ad 	mvu r1,0xdead
    6d74:	e4 61 18 00 	cmpe r3,r3,r1
    6d78:	64 42 00 01 	cmpei r2,r2,1
    6d7c:	a0 62 10 00 	and r2,r3,r2
    6d80:	44 40 00 06 	be r2,r0,6d98 <msgUnpackAnnounce+0x11c>
    6d84:	34 01 20 00 	mvi r1,8192
    6d88:	5c 81 00 04 	bne r4,r1,6d98 <msgUnpackAnnounce+0x11c>
    6d8c:	35 61 00 4c 	addi r1,r11,76
    6d90:	fb ff fe cd 	calli 68c4 <get_be16>
    6d94:	31 81 00 21 	sb (r12+33),r1
    6d98:	2b 9d 00 04 	lw ra,(sp+4)
    6d9c:	2b 8b 00 0c 	lw r11,(sp+12)
    6da0:	2b 8c 00 08 	lw r12,(sp+8)
    6da4:	37 9c 00 0c 	addi sp,sp,12
    6da8:	c3 a0 00 00 	ret

00006dac <msgPackFollowUp>:
    6dac:	37 9c ff f4 	addi sp,sp,-12
    6db0:	5b 8b 00 0c 	sw (sp+12),r11
    6db4:	5b 8c 00 08 	sw (sp+8),r12
    6db8:	5b 9d 00 04 	sw (sp+4),ra
    6dbc:	b8 20 58 00 	mv r11,r1
    6dc0:	40 21 00 00 	lbu r1,(r1+0)
    6dc4:	b8 40 60 00 	mv r12,r2
    6dc8:	34 02 00 2c 	mvi r2,44
    6dcc:	20 21 00 f0 	andi r1,r1,0xf0
    6dd0:	38 21 00 08 	ori r1,r1,0x8
    6dd4:	31 61 00 00 	sb (r11+0),r1
    6dd8:	35 61 00 02 	addi r1,r11,2
    6ddc:	fb ff fe a3 	calli 6868 <put_be16>
    6de0:	2d 81 0a cc 	lhu r1,(r12+2764)
    6de4:	34 21 ff ff 	addi r1,r1,-1
    6de8:	0d 61 00 1e 	sh (r11+30),r1
    6dec:	34 01 00 02 	mvi r1,2
    6df0:	31 61 00 20 	sb (r11+32),r1
    6df4:	41 81 00 f2 	lbu r1,(r12+242)
    6df8:	31 61 00 21 	sb (r11+33),r1
    6dfc:	29 81 0d 38 	lw r1,(r12+3384)
    6e00:	29 82 0d 3c 	lw r2,(r12+3388)
    6e04:	0d 61 00 22 	sh (r11+34),r1
    6e08:	35 61 00 24 	addi r1,r11,36
    6e0c:	fb ff fe 9b 	calli 6878 <put_be32>
    6e10:	29 82 0d 40 	lw r2,(r12+3392)
    6e14:	35 61 00 28 	addi r1,r11,40
    6e18:	fb ff fe 98 	calli 6878 <put_be32>
    6e1c:	2b 9d 00 04 	lw ra,(sp+4)
    6e20:	2b 8b 00 0c 	lw r11,(sp+12)
    6e24:	2b 8c 00 08 	lw r12,(sp+8)
    6e28:	37 9c 00 0c 	addi sp,sp,12
    6e2c:	c3 a0 00 00 	ret

00006e30 <msgUnpackFollowUp>:
    6e30:	37 9c ff f4 	addi sp,sp,-12
    6e34:	5b 8b 00 0c 	sw (sp+12),r11
    6e38:	5b 8c 00 08 	sw (sp+8),r12
    6e3c:	5b 9d 00 04 	sw (sp+4),ra
    6e40:	b8 20 60 00 	mv r12,r1
    6e44:	34 21 00 22 	addi r1,r1,34
    6e48:	b8 40 58 00 	mv r11,r2
    6e4c:	fb ff fe 9e 	calli 68c4 <get_be16>
    6e50:	0d 61 00 04 	sh (r11+4),r1
    6e54:	35 81 00 24 	addi r1,r12,36
    6e58:	fb ff fe 90 	calli 6898 <get_be32>
    6e5c:	59 61 00 00 	sw (r11+0),r1
    6e60:	35 81 00 28 	addi r1,r12,40
    6e64:	fb ff fe 8d 	calli 6898 <get_be32>
    6e68:	59 61 00 08 	sw (r11+8),r1
    6e6c:	2b 9d 00 04 	lw ra,(sp+4)
    6e70:	2b 8b 00 0c 	lw r11,(sp+12)
    6e74:	2b 8c 00 08 	lw r12,(sp+8)
    6e78:	37 9c 00 0c 	addi sp,sp,12
    6e7c:	c3 a0 00 00 	ret

00006e80 <msgPackPDelayReq>:
    6e80:	37 9c ff f0 	addi sp,sp,-16
    6e84:	5b 8b 00 10 	sw (sp+16),r11
    6e88:	5b 8c 00 0c 	sw (sp+12),r12
    6e8c:	5b 8d 00 08 	sw (sp+8),r13
    6e90:	5b 9d 00 04 	sw (sp+4),ra
    6e94:	b8 20 58 00 	mv r11,r1
    6e98:	40 21 00 00 	lbu r1,(r1+0)
    6e9c:	b8 40 60 00 	mv r12,r2
    6ea0:	34 02 00 36 	mvi r2,54
    6ea4:	20 21 00 f0 	andi r1,r1,0xf0
    6ea8:	38 21 00 02 	ori r1,r1,0x2
    6eac:	31 61 00 00 	sb (r11+0),r1
    6eb0:	35 61 00 02 	addi r1,r11,2
    6eb4:	b8 60 68 00 	mv r13,r3
    6eb8:	fb ff fe 6c 	calli 6868 <put_be16>
    6ebc:	2d a1 0a c8 	lhu r1,(r13+2760)
    6ec0:	34 02 00 00 	mvi r2,0
    6ec4:	34 03 00 08 	mvi r3,8
    6ec8:	0d 61 00 1e 	sh (r11+30),r1
    6ecc:	34 01 00 05 	mvi r1,5
    6ed0:	31 61 00 20 	sb (r11+32),r1
    6ed4:	34 01 00 7f 	mvi r1,127
    6ed8:	31 61 00 21 	sb (r11+33),r1
    6edc:	35 61 00 08 	addi r1,r11,8
    6ee0:	f8 00 2e 71 	calli 128a4 <memset>
    6ee4:	2d 81 00 04 	lhu r1,(r12+4)
    6ee8:	34 02 00 00 	mvi r2,0
    6eec:	34 03 00 0a 	mvi r3,10
    6ef0:	0d 61 00 22 	sh (r11+34),r1
    6ef4:	29 81 00 00 	lw r1,(r12+0)
    6ef8:	59 61 00 24 	sw (r11+36),r1
    6efc:	29 81 00 08 	lw r1,(r12+8)
    6f00:	59 61 00 28 	sw (r11+40),r1
    6f04:	35 61 00 2c 	addi r1,r11,44
    6f08:	f8 00 2e 67 	calli 128a4 <memset>
    6f0c:	2b 9d 00 04 	lw ra,(sp+4)
    6f10:	2b 8b 00 10 	lw r11,(sp+16)
    6f14:	2b 8c 00 0c 	lw r12,(sp+12)
    6f18:	2b 8d 00 08 	lw r13,(sp+8)
    6f1c:	37 9c 00 10 	addi sp,sp,16
    6f20:	c3 a0 00 00 	ret

00006f24 <msgPackDelayReq>:
    6f24:	37 9c ff f0 	addi sp,sp,-16
    6f28:	5b 8b 00 10 	sw (sp+16),r11
    6f2c:	5b 8c 00 0c 	sw (sp+12),r12
    6f30:	5b 8d 00 08 	sw (sp+8),r13
    6f34:	5b 9d 00 04 	sw (sp+4),ra
    6f38:	b8 20 58 00 	mv r11,r1
    6f3c:	40 21 00 00 	lbu r1,(r1+0)
    6f40:	b8 40 60 00 	mv r12,r2
    6f44:	34 02 00 2c 	mvi r2,44
    6f48:	20 21 00 f0 	andi r1,r1,0xf0
    6f4c:	38 21 00 01 	ori r1,r1,0x1
    6f50:	31 61 00 00 	sb (r11+0),r1
    6f54:	35 61 00 02 	addi r1,r11,2
    6f58:	b8 60 68 00 	mv r13,r3
    6f5c:	fb ff fe 43 	calli 6868 <put_be16>
    6f60:	2d a1 0a ca 	lhu r1,(r13+2762)
    6f64:	34 03 00 08 	mvi r3,8
    6f68:	34 02 00 00 	mvi r2,0
    6f6c:	0d 61 00 1e 	sh (r11+30),r1
    6f70:	34 01 00 01 	mvi r1,1
    6f74:	31 61 00 20 	sb (r11+32),r1
    6f78:	34 01 00 7f 	mvi r1,127
    6f7c:	31 61 00 21 	sb (r11+33),r1
    6f80:	35 61 00 08 	addi r1,r11,8
    6f84:	f8 00 2e 48 	calli 128a4 <memset>
    6f88:	2d 82 00 04 	lhu r2,(r12+4)
    6f8c:	35 61 00 22 	addi r1,r11,34
    6f90:	fb ff fe 36 	calli 6868 <put_be16>
    6f94:	29 82 00 00 	lw r2,(r12+0)
    6f98:	35 61 00 24 	addi r1,r11,36
    6f9c:	fb ff fe 37 	calli 6878 <put_be32>
    6fa0:	29 82 00 08 	lw r2,(r12+8)
    6fa4:	35 61 00 28 	addi r1,r11,40
    6fa8:	fb ff fe 34 	calli 6878 <put_be32>
    6fac:	2b 9d 00 04 	lw ra,(sp+4)
    6fb0:	2b 8b 00 10 	lw r11,(sp+16)
    6fb4:	2b 8c 00 0c 	lw r12,(sp+12)
    6fb8:	2b 8d 00 08 	lw r13,(sp+8)
    6fbc:	37 9c 00 10 	addi sp,sp,16
    6fc0:	c3 a0 00 00 	ret

00006fc4 <msgPackDelayResp>:
    6fc4:	37 9c ff ec 	addi sp,sp,-20
    6fc8:	5b 8b 00 14 	sw (sp+20),r11
    6fcc:	5b 8c 00 10 	sw (sp+16),r12
    6fd0:	5b 8d 00 0c 	sw (sp+12),r13
    6fd4:	5b 8e 00 08 	sw (sp+8),r14
    6fd8:	5b 9d 00 04 	sw (sp+4),ra
    6fdc:	b8 20 58 00 	mv r11,r1
    6fe0:	40 21 00 00 	lbu r1,(r1+0)
    6fe4:	b8 40 60 00 	mv r12,r2
    6fe8:	34 02 00 36 	mvi r2,54
    6fec:	20 21 00 f0 	andi r1,r1,0xf0
    6ff0:	38 21 00 09 	ori r1,r1,0x9
    6ff4:	31 61 00 00 	sb (r11+0),r1
    6ff8:	35 61 00 02 	addi r1,r11,2
    6ffc:	b8 60 68 00 	mv r13,r3
    7000:	fb ff fe 1a 	calli 6868 <put_be16>
    7004:	41 81 00 06 	lbu r1,(r12+6)
    7008:	35 6e 00 08 	addi r14,r11,8
    700c:	34 03 00 08 	mvi r3,8
    7010:	31 61 00 04 	sb (r11+4),r1
    7014:	34 02 00 00 	mvi r2,0
    7018:	b9 c0 08 00 	mv r1,r14
    701c:	f8 00 2e 22 	calli 128a4 <memset>
    7020:	29 82 00 10 	lw r2,(r12+16)
    7024:	b9 c0 08 00 	mv r1,r14
    7028:	fb ff fe 14 	calli 6878 <put_be32>
    702c:	29 82 00 0c 	lw r2,(r12+12)
    7030:	35 61 00 0c 	addi r1,r11,12
    7034:	fb ff fe 11 	calli 6878 <put_be32>
    7038:	2d 81 00 1e 	lhu r1,(r12+30)
    703c:	0d 61 00 1e 	sh (r11+30),r1
    7040:	34 01 00 03 	mvi r1,3
    7044:	31 61 00 20 	sb (r11+32),r1
    7048:	41 a1 00 df 	lbu r1,(r13+223)
    704c:	31 61 00 21 	sb (r11+33),r1
    7050:	29 a1 0d b8 	lw r1,(r13+3512)
    7054:	29 a2 0d bc 	lw r2,(r13+3516)
    7058:	0d 61 00 22 	sh (r11+34),r1
    705c:	35 61 00 24 	addi r1,r11,36
    7060:	fb ff fe 06 	calli 6878 <put_be32>
    7064:	29 a2 0d c0 	lw r2,(r13+3520)
    7068:	35 61 00 28 	addi r1,r11,40
    706c:	fb ff fe 03 	calli 6878 <put_be32>
    7070:	35 82 00 14 	addi r2,r12,20
    7074:	34 03 00 08 	mvi r3,8
    7078:	35 61 00 2c 	addi r1,r11,44
    707c:	f8 00 2d d1 	calli 127c0 <memcpy>
    7080:	2d 82 00 1c 	lhu r2,(r12+28)
    7084:	35 61 00 34 	addi r1,r11,52
    7088:	fb ff fd f8 	calli 6868 <put_be16>
    708c:	2b 9d 00 04 	lw ra,(sp+4)
    7090:	2b 8b 00 14 	lw r11,(sp+20)
    7094:	2b 8c 00 10 	lw r12,(sp+16)
    7098:	2b 8d 00 0c 	lw r13,(sp+12)
    709c:	2b 8e 00 08 	lw r14,(sp+8)
    70a0:	37 9c 00 14 	addi sp,sp,20
    70a4:	c3 a0 00 00 	ret

000070a8 <msgPackPDelayResp>:
    70a8:	37 9c ff f0 	addi sp,sp,-16
    70ac:	5b 8b 00 10 	sw (sp+16),r11
    70b0:	5b 8c 00 0c 	sw (sp+12),r12
    70b4:	5b 8d 00 08 	sw (sp+8),r13
    70b8:	5b 9d 00 04 	sw (sp+4),ra
    70bc:	b8 20 58 00 	mv r11,r1
    70c0:	40 21 00 00 	lbu r1,(r1+0)
    70c4:	b8 40 60 00 	mv r12,r2
    70c8:	34 02 00 36 	mvi r2,54
    70cc:	20 21 00 f0 	andi r1,r1,0xf0
    70d0:	38 21 00 03 	ori r1,r1,0x3
    70d4:	31 61 00 00 	sb (r11+0),r1
    70d8:	35 61 00 02 	addi r1,r11,2
    70dc:	b8 80 68 00 	mv r13,r4
    70e0:	fb ff fd e2 	calli 6868 <put_be16>
    70e4:	41 81 00 06 	lbu r1,(r12+6)
    70e8:	34 03 00 08 	mvi r3,8
    70ec:	34 02 00 00 	mvi r2,0
    70f0:	31 61 00 04 	sb (r11+4),r1
    70f4:	35 61 00 08 	addi r1,r11,8
    70f8:	f8 00 2d eb 	calli 128a4 <memset>
    70fc:	2d 81 00 1e 	lhu r1,(r12+30)
    7100:	0d 61 00 1e 	sh (r11+30),r1
    7104:	34 01 00 05 	mvi r1,5
    7108:	31 61 00 20 	sb (r11+32),r1
    710c:	34 01 00 7f 	mvi r1,127
    7110:	31 61 00 21 	sb (r11+33),r1
    7114:	29 a1 0d b8 	lw r1,(r13+3512)
    7118:	29 a2 0d bc 	lw r2,(r13+3516)
    711c:	0d 61 00 22 	sh (r11+34),r1
    7120:	35 61 00 24 	addi r1,r11,36
    7124:	fb ff fd d5 	calli 6878 <put_be32>
    7128:	29 a2 0d c0 	lw r2,(r13+3520)
    712c:	35 61 00 28 	addi r1,r11,40
    7130:	fb ff fd d2 	calli 6878 <put_be32>
    7134:	35 82 00 14 	addi r2,r12,20
    7138:	34 03 00 08 	mvi r3,8
    713c:	35 61 00 2c 	addi r1,r11,44
    7140:	f8 00 2d a0 	calli 127c0 <memcpy>
    7144:	2d 82 00 1c 	lhu r2,(r12+28)
    7148:	35 61 00 34 	addi r1,r11,52
    714c:	fb ff fd c7 	calli 6868 <put_be16>
    7150:	2b 9d 00 04 	lw ra,(sp+4)
    7154:	2b 8b 00 10 	lw r11,(sp+16)
    7158:	2b 8c 00 0c 	lw r12,(sp+12)
    715c:	2b 8d 00 08 	lw r13,(sp+8)
    7160:	37 9c 00 10 	addi sp,sp,16
    7164:	c3 a0 00 00 	ret

00007168 <msgUnpackDelayReq>:
    7168:	37 9c ff f4 	addi sp,sp,-12
    716c:	5b 8b 00 0c 	sw (sp+12),r11
    7170:	5b 8c 00 08 	sw (sp+8),r12
    7174:	5b 9d 00 04 	sw (sp+4),ra
    7178:	b8 20 60 00 	mv r12,r1
    717c:	34 21 00 22 	addi r1,r1,34
    7180:	b8 40 58 00 	mv r11,r2
    7184:	fb ff fd d0 	calli 68c4 <get_be16>
    7188:	0d 61 00 04 	sh (r11+4),r1
    718c:	35 81 00 24 	addi r1,r12,36
    7190:	fb ff fd c2 	calli 6898 <get_be32>
    7194:	59 61 00 00 	sw (r11+0),r1
    7198:	35 81 00 28 	addi r1,r12,40
    719c:	fb ff fd bf 	calli 6898 <get_be32>
    71a0:	59 61 00 08 	sw (r11+8),r1
    71a4:	2b 9d 00 04 	lw ra,(sp+4)
    71a8:	2b 8b 00 0c 	lw r11,(sp+12)
    71ac:	2b 8c 00 08 	lw r12,(sp+8)
    71b0:	37 9c 00 0c 	addi sp,sp,12
    71b4:	c3 a0 00 00 	ret

000071b8 <msgUnpackPDelayReq>:
    71b8:	37 9c ff f4 	addi sp,sp,-12
    71bc:	5b 8b 00 0c 	sw (sp+12),r11
    71c0:	5b 8c 00 08 	sw (sp+8),r12
    71c4:	5b 9d 00 04 	sw (sp+4),ra
    71c8:	b8 20 58 00 	mv r11,r1
    71cc:	2c 21 00 22 	lhu r1,(r1+34)
    71d0:	b8 40 60 00 	mv r12,r2
    71d4:	0c 41 00 04 	sh (r2+4),r1
    71d8:	35 61 00 24 	addi r1,r11,36
    71dc:	fb ff fd af 	calli 6898 <get_be32>
    71e0:	59 81 00 00 	sw (r12+0),r1
    71e4:	35 61 00 28 	addi r1,r11,40
    71e8:	fb ff fd ac 	calli 6898 <get_be32>
    71ec:	59 81 00 08 	sw (r12+8),r1
    71f0:	2b 9d 00 04 	lw ra,(sp+4)
    71f4:	2b 8b 00 0c 	lw r11,(sp+12)
    71f8:	2b 8c 00 08 	lw r12,(sp+8)
    71fc:	37 9c 00 0c 	addi sp,sp,12
    7200:	c3 a0 00 00 	ret

00007204 <msgUnpackDelayResp>:
    7204:	37 9c ff f4 	addi sp,sp,-12
    7208:	5b 8b 00 0c 	sw (sp+12),r11
    720c:	5b 8c 00 08 	sw (sp+8),r12
    7210:	5b 9d 00 04 	sw (sp+4),ra
    7214:	b8 20 60 00 	mv r12,r1
    7218:	34 21 00 22 	addi r1,r1,34
    721c:	b8 40 58 00 	mv r11,r2
    7220:	fb ff fd a9 	calli 68c4 <get_be16>
    7224:	0d 61 00 04 	sh (r11+4),r1
    7228:	35 81 00 24 	addi r1,r12,36
    722c:	fb ff fd 9b 	calli 6898 <get_be32>
    7230:	59 61 00 00 	sw (r11+0),r1
    7234:	35 81 00 28 	addi r1,r12,40
    7238:	fb ff fd 98 	calli 6898 <get_be32>
    723c:	59 61 00 08 	sw (r11+8),r1
    7240:	35 82 00 2c 	addi r2,r12,44
    7244:	34 03 00 08 	mvi r3,8
    7248:	35 61 00 0c 	addi r1,r11,12
    724c:	f8 00 2d 5d 	calli 127c0 <memcpy>
    7250:	35 81 00 34 	addi r1,r12,52
    7254:	fb ff fd 9c 	calli 68c4 <get_be16>
    7258:	0d 61 00 14 	sh (r11+20),r1
    725c:	2b 9d 00 04 	lw ra,(sp+4)
    7260:	2b 8b 00 0c 	lw r11,(sp+12)
    7264:	2b 8c 00 08 	lw r12,(sp+8)
    7268:	37 9c 00 0c 	addi sp,sp,12
    726c:	c3 a0 00 00 	ret

00007270 <msgUnpackPDelayResp>:
    7270:	37 9c ff f4 	addi sp,sp,-12
    7274:	5b 8b 00 0c 	sw (sp+12),r11
    7278:	5b 8c 00 08 	sw (sp+8),r12
    727c:	5b 9d 00 04 	sw (sp+4),ra
    7280:	b8 20 58 00 	mv r11,r1
    7284:	2c 21 00 22 	lhu r1,(r1+34)
    7288:	b8 40 60 00 	mv r12,r2
    728c:	0c 41 00 04 	sh (r2+4),r1
    7290:	35 61 00 24 	addi r1,r11,36
    7294:	fb ff fd 81 	calli 6898 <get_be32>
    7298:	59 81 00 00 	sw (r12+0),r1
    729c:	35 61 00 28 	addi r1,r11,40
    72a0:	fb ff fd 7e 	calli 6898 <get_be32>
    72a4:	59 81 00 08 	sw (r12+8),r1
    72a8:	35 62 00 2c 	addi r2,r11,44
    72ac:	34 03 00 08 	mvi r3,8
    72b0:	35 81 00 0c 	addi r1,r12,12
    72b4:	f8 00 2d 43 	calli 127c0 <memcpy>
    72b8:	35 61 00 34 	addi r1,r11,52
    72bc:	fb ff fd 82 	calli 68c4 <get_be16>
    72c0:	0d 81 00 14 	sh (r12+20),r1
    72c4:	2b 9d 00 04 	lw ra,(sp+4)
    72c8:	2b 8b 00 0c 	lw r11,(sp+12)
    72cc:	2b 8c 00 08 	lw r12,(sp+8)
    72d0:	37 9c 00 0c 	addi sp,sp,12
    72d4:	c3 a0 00 00 	ret

000072d8 <msgPackPDelayRespFollowUp>:
    72d8:	37 9c ff f0 	addi sp,sp,-16
    72dc:	5b 8b 00 10 	sw (sp+16),r11
    72e0:	5b 8c 00 0c 	sw (sp+12),r12
    72e4:	5b 8d 00 08 	sw (sp+8),r13
    72e8:	5b 9d 00 04 	sw (sp+4),ra
    72ec:	b8 20 58 00 	mv r11,r1
    72f0:	40 21 00 00 	lbu r1,(r1+0)
    72f4:	b8 40 60 00 	mv r12,r2
    72f8:	34 02 00 36 	mvi r2,54
    72fc:	20 21 00 f0 	andi r1,r1,0xf0
    7300:	38 21 00 0a 	ori r1,r1,0xa
    7304:	31 61 00 00 	sb (r11+0),r1
    7308:	35 61 00 02 	addi r1,r11,2
    730c:	b8 80 68 00 	mv r13,r4
    7310:	fb ff fd 56 	calli 6868 <put_be16>
    7314:	2d a1 0a 02 	lhu r1,(r13+2562)
    7318:	0d 61 00 1e 	sh (r11+30),r1
    731c:	34 01 00 05 	mvi r1,5
    7320:	31 61 00 20 	sb (r11+32),r1
    7324:	34 01 00 7f 	mvi r1,127
    7328:	31 61 00 21 	sb (r11+33),r1
    732c:	29 81 00 10 	lw r1,(r12+16)
    7330:	59 61 00 08 	sw (r11+8),r1
    7334:	29 81 00 0c 	lw r1,(r12+12)
    7338:	59 61 00 0c 	sw (r11+12),r1
    733c:	29 a1 0d 98 	lw r1,(r13+3480)
    7340:	29 a2 0d 9c 	lw r2,(r13+3484)
    7344:	0d 61 00 22 	sh (r11+34),r1
    7348:	35 61 00 24 	addi r1,r11,36
    734c:	fb ff fd 4b 	calli 6878 <put_be32>
    7350:	29 a2 0d a0 	lw r2,(r13+3488)
    7354:	35 61 00 28 	addi r1,r11,40
    7358:	fb ff fd 48 	calli 6878 <put_be32>
    735c:	35 82 00 14 	addi r2,r12,20
    7360:	34 03 00 08 	mvi r3,8
    7364:	35 61 00 2c 	addi r1,r11,44
    7368:	f8 00 2d 16 	calli 127c0 <memcpy>
    736c:	2d 82 00 1c 	lhu r2,(r12+28)
    7370:	35 61 00 34 	addi r1,r11,52
    7374:	fb ff fd 3d 	calli 6868 <put_be16>
    7378:	2b 9d 00 04 	lw ra,(sp+4)
    737c:	2b 8b 00 10 	lw r11,(sp+16)
    7380:	2b 8c 00 0c 	lw r12,(sp+12)
    7384:	2b 8d 00 08 	lw r13,(sp+8)
    7388:	37 9c 00 10 	addi sp,sp,16
    738c:	c3 a0 00 00 	ret

00007390 <msgUnpackPDelayRespFollowUp>:
    7390:	37 9c ff f4 	addi sp,sp,-12
    7394:	5b 8b 00 0c 	sw (sp+12),r11
    7398:	5b 8c 00 08 	sw (sp+8),r12
    739c:	5b 9d 00 04 	sw (sp+4),ra
    73a0:	b8 20 58 00 	mv r11,r1
    73a4:	2c 21 00 22 	lhu r1,(r1+34)
    73a8:	b8 40 60 00 	mv r12,r2
    73ac:	0c 41 00 04 	sh (r2+4),r1
    73b0:	35 61 00 24 	addi r1,r11,36
    73b4:	fb ff fd 39 	calli 6898 <get_be32>
    73b8:	59 81 00 00 	sw (r12+0),r1
    73bc:	35 61 00 28 	addi r1,r11,40
    73c0:	fb ff fd 36 	calli 6898 <get_be32>
    73c4:	59 81 00 08 	sw (r12+8),r1
    73c8:	35 62 00 2c 	addi r2,r11,44
    73cc:	34 03 00 08 	mvi r3,8
    73d0:	35 81 00 0c 	addi r1,r12,12
    73d4:	f8 00 2c fb 	calli 127c0 <memcpy>
    73d8:	35 61 00 34 	addi r1,r11,52
    73dc:	fb ff fd 3a 	calli 68c4 <get_be16>
    73e0:	0d 81 00 14 	sh (r12+20),r1
    73e4:	2b 9d 00 04 	lw ra,(sp+4)
    73e8:	2b 8b 00 0c 	lw r11,(sp+12)
    73ec:	2b 8c 00 08 	lw r12,(sp+8)
    73f0:	37 9c 00 0c 	addi sp,sp,12
    73f4:	c3 a0 00 00 	ret

000073f8 <msgPackWRSignalingMsg>:
    73f8:	37 9c ff ec 	addi sp,sp,-20
    73fc:	5b 8b 00 14 	sw (sp+20),r11
    7400:	5b 8c 00 10 	sw (sp+16),r12
    7404:	5b 8d 00 0c 	sw (sp+12),r13
    7408:	5b 8e 00 08 	sw (sp+8),r14
    740c:	5b 9d 00 04 	sw (sp+4),ra
    7410:	b8 40 60 00 	mv r12,r2
    7414:	b8 20 58 00 	mv r11,r1
    7418:	41 81 0b 76 	lbu r1,(r12+2934)
    741c:	20 6d ff ff 	andi r13,r3,0xffff
    7420:	65 a2 20 00 	cmpei r2,r13,8192
    7424:	64 21 00 00 	cmpei r1,r1,0
    7428:	34 0e 00 00 	mvi r14,0
    742c:	b8 41 08 00 	or r1,r2,r1
    7430:	5c 20 00 41 	bne r1,r0,7534 <msgPackWRSignalingMsg+0x13c>
    7434:	41 61 00 00 	lbu r1,(r11+0)
    7438:	34 03 00 08 	mvi r3,8
    743c:	20 21 00 f0 	andi r1,r1,0xf0
    7440:	38 21 00 0c 	ori r1,r1,0xc
    7444:	31 61 00 00 	sb (r11+0),r1
    7448:	34 01 00 05 	mvi r1,5
    744c:	31 61 00 20 	sb (r11+32),r1
    7450:	29 82 00 00 	lw r2,(r12+0)
    7454:	35 61 00 22 	addi r1,r11,34
    7458:	34 42 00 34 	addi r2,r2,52
    745c:	f8 00 2c d9 	calli 127c0 <memcpy>
    7460:	29 82 00 00 	lw r2,(r12+0)
    7464:	35 61 00 2a 	addi r1,r11,42
    7468:	2c 42 00 3c 	lhu r2,(r2+60)
    746c:	fb ff fc ff 	calli 6868 <put_be16>
    7470:	34 01 00 03 	mvi r1,3
    7474:	0d 61 00 2c 	sh (r11+44),r1
    7478:	34 01 08 00 	mvi r1,2048
    747c:	0d 61 00 30 	sh (r11+48),r1
    7480:	34 01 30 de 	mvi r1,12510
    7484:	0d 61 00 32 	sh (r11+50),r1
    7488:	34 01 ad 01 	mvi r1,-21247
    748c:	0d 61 00 34 	sh (r11+52),r1
    7490:	0d 6d 00 36 	sh (r11+54),r13
    7494:	34 01 10 03 	mvi r1,4099
    7498:	45 a1 00 04 	be r13,r1,74a8 <msgPackWRSignalingMsg+0xb0>
    749c:	34 01 10 04 	mvi r1,4100
    74a0:	5d a1 00 1f 	bne r13,r1,751c <msgPackWRSignalingMsg+0x124>
    74a4:	e0 00 00 10 	bi 74e4 <msgPackWRSignalingMsg+0xec>
    74a8:	29 82 0b 7c 	lw r2,(r12+2940)
    74ac:	35 61 00 38 	addi r1,r11,56
    74b0:	44 40 00 04 	be r2,r0,74c0 <msgPackWRSignalingMsg+0xc8>
    74b4:	41 82 0b 74 	lbu r2,(r12+2932)
    74b8:	3c 42 00 08 	sli r2,r2,8
    74bc:	e0 00 00 04 	bi 74cc <msgPackWRSignalingMsg+0xd4>
    74c0:	41 82 0b 74 	lbu r2,(r12+2932)
    74c4:	3c 42 00 08 	sli r2,r2,8
    74c8:	38 42 00 01 	ori r2,r2,0x1
    74cc:	fb ff fc e7 	calli 6868 <put_be16>
    74d0:	29 82 0b 70 	lw r2,(r12+2928)
    74d4:	35 61 00 3a 	addi r1,r11,58
    74d8:	34 0c 00 14 	mvi r12,20
    74dc:	fb ff fc e7 	calli 6878 <put_be32>
    74e0:	e0 00 00 10 	bi 7520 <msgPackWRSignalingMsg+0x128>
    74e4:	29 82 0b 84 	lw r2,(r12+2948)
    74e8:	35 61 00 38 	addi r1,r11,56
    74ec:	fb ff fc e3 	calli 6878 <put_be32>
    74f0:	29 82 0b 80 	lw r2,(r12+2944)
    74f4:	35 61 00 3c 	addi r1,r11,60
    74f8:	fb ff fc e0 	calli 6878 <put_be32>
    74fc:	29 82 0b 8c 	lw r2,(r12+2956)
    7500:	35 61 00 40 	addi r1,r11,64
    7504:	fb ff fc dd 	calli 6878 <put_be32>
    7508:	29 82 0b 88 	lw r2,(r12+2952)
    750c:	35 61 00 44 	addi r1,r11,68
    7510:	34 0c 00 18 	mvi r12,24
    7514:	fb ff fc d9 	calli 6878 <put_be32>
    7518:	e0 00 00 02 	bi 7520 <msgPackWRSignalingMsg+0x128>
    751c:	34 0c 00 08 	mvi r12,8
    7520:	35 8e 00 30 	addi r14,r12,48
    7524:	35 61 00 02 	addi r1,r11,2
    7528:	b9 c0 10 00 	mv r2,r14
    752c:	fb ff fc cf 	calli 6868 <put_be16>
    7530:	0d 6c 00 2e 	sh (r11+46),r12
    7534:	b9 c0 08 00 	mv r1,r14
    7538:	2b 9d 00 04 	lw ra,(sp+4)
    753c:	2b 8b 00 14 	lw r11,(sp+20)
    7540:	2b 8c 00 10 	lw r12,(sp+16)
    7544:	2b 8d 00 0c 	lw r13,(sp+12)
    7548:	2b 8e 00 08 	lw r14,(sp+8)
    754c:	37 9c 00 14 	addi sp,sp,20
    7550:	c3 a0 00 00 	ret

00007554 <msgUnpackWRSignalingMsg>:
    7554:	37 9c ff ec 	addi sp,sp,-20
    7558:	5b 8b 00 14 	sw (sp+20),r11
    755c:	5b 8c 00 10 	sw (sp+16),r12
    7560:	5b 8d 00 0c 	sw (sp+12),r13
    7564:	5b 8e 00 08 	sw (sp+8),r14
    7568:	5b 9d 00 04 	sw (sp+4),ra
    756c:	b8 20 58 00 	mv r11,r1
    7570:	b8 40 68 00 	mv r13,r2
    7574:	b8 40 08 00 	mv r1,r2
    7578:	b8 60 70 00 	mv r14,r3
    757c:	35 62 00 22 	addi r2,r11,34
    7580:	34 03 00 08 	mvi r3,8
    7584:	b8 80 60 00 	mv r12,r4
    7588:	f8 00 2c 8e 	calli 127c0 <memcpy>
    758c:	35 61 00 2a 	addi r1,r11,42
    7590:	fb ff fc cd 	calli 68c4 <get_be16>
    7594:	0d a1 00 08 	sh (r13+8),r1
    7598:	35 61 00 2c 	addi r1,r11,44
    759c:	fb ff fc ca 	calli 68c4 <get_be16>
    75a0:	34 05 00 03 	mvi r5,3
    75a4:	2d 63 00 30 	lhu r3,(r11+48)
    75a8:	2d 64 00 32 	lhu r4,(r11+50)
    75ac:	2d 62 00 34 	lhu r2,(r11+52)
    75b0:	5c 25 00 31 	bne r1,r5,7674 <msgUnpackWRSignalingMsg+0x120>
    75b4:	00 81 00 08 	srui r1,r4,8
    75b8:	3c 63 00 08 	sli r3,r3,8
    75bc:	78 05 00 01 	mvhi r5,0x1
    75c0:	38 a5 34 38 	ori r5,r5,0x3438
    75c4:	b8 61 18 00 	or r3,r3,r1
    75c8:	28 a1 00 00 	lw r1,(r5+0)
    75cc:	5c 61 00 2a 	bne r3,r1,7674 <msgUnpackWRSignalingMsg+0x120>
    75d0:	3c 84 00 08 	sli r4,r4,8
    75d4:	00 41 00 08 	srui r1,r2,8
    75d8:	20 84 ff ff 	andi r4,r4,0xffff
    75dc:	b8 81 20 00 	or r4,r4,r1
    75e0:	38 01 de ad 	mvu r1,0xdead
    75e4:	5c 81 00 24 	bne r4,r1,7674 <msgUnpackWRSignalingMsg+0x120>
    75e8:	20 42 00 ff 	andi r2,r2,0xff
    75ec:	34 01 00 01 	mvi r1,1
    75f0:	5c 41 00 21 	bne r2,r1,7674 <msgUnpackWRSignalingMsg+0x120>
    75f4:	2d 61 00 36 	lhu r1,(r11+54)
    75f8:	34 23 ef fd 	addi r3,r1,-4099
    75fc:	0d c1 00 00 	sh (r14+0),r1
    7600:	20 63 ff ff 	andi r3,r3,0xffff
    7604:	54 62 00 1c 	bgu r3,r2,7674 <msgUnpackWRSignalingMsg+0x120>
    7608:	34 02 10 04 	mvi r2,4100
    760c:	35 6d 00 38 	addi r13,r11,56
    7610:	44 22 00 0d 	be r1,r2,7644 <msgUnpackWRSignalingMsg+0xf0>
    7614:	b9 a0 08 00 	mv r1,r13
    7618:	fb ff fc ab 	calli 68c4 <get_be16>
    761c:	20 21 00 ff 	andi r1,r1,0xff
    7620:	0d 81 0b aa 	sh (r12+2986),r1
    7624:	b9 a0 08 00 	mv r1,r13
    7628:	fb ff fc a7 	calli 68c4 <get_be16>
    762c:	00 21 00 08 	srui r1,r1,8
    7630:	31 81 0b b0 	sb (r12+2992),r1
    7634:	35 61 00 3a 	addi r1,r11,58
    7638:	fb ff fc 98 	calli 6898 <get_be32>
    763c:	59 81 0b ac 	sw (r12+2988),r1
    7640:	e0 00 00 0d 	bi 7674 <msgUnpackWRSignalingMsg+0x120>
    7644:	b9 a0 08 00 	mv r1,r13
    7648:	fb ff fc 94 	calli 6898 <get_be32>
    764c:	59 81 0b 94 	sw (r12+2964),r1
    7650:	35 61 00 3c 	addi r1,r11,60
    7654:	fb ff fc 91 	calli 6898 <get_be32>
    7658:	59 81 0b 90 	sw (r12+2960),r1
    765c:	35 61 00 40 	addi r1,r11,64
    7660:	fb ff fc 8e 	calli 6898 <get_be32>
    7664:	59 81 0b 9c 	sw (r12+2972),r1
    7668:	35 61 00 44 	addi r1,r11,68
    766c:	fb ff fc 8b 	calli 6898 <get_be32>
    7670:	59 81 0b 98 	sw (r12+2968),r1
    7674:	2b 9d 00 04 	lw ra,(sp+4)
    7678:	2b 8b 00 14 	lw r11,(sp+20)
    767c:	2b 8c 00 10 	lw r12,(sp+16)
    7680:	2b 8d 00 0c 	lw r13,(sp+12)
    7684:	2b 8e 00 08 	lw r14,(sp+8)
    7688:	37 9c 00 14 	addi sp,sp,20
    768c:	c3 a0 00 00 	ret

00007690 <lookupCommunicationTechnology>:
    7690:	34 01 00 01 	mvi r1,1
    7694:	c3 a0 00 00 	ret

00007698 <netStartup>:
    7698:	37 9c ff fc 	addi sp,sp,-4
    769c:	5b 9d 00 04 	sw (sp+4),ra
    76a0:	f8 00 21 24 	calli fb30 <ptpd_netif_init>
    76a4:	6c 21 00 00 	cmpgei r1,r1,0
    76a8:	2b 9d 00 04 	lw ra,(sp+4)
    76ac:	37 9c 00 04 	addi sp,sp,4
    76b0:	c3 a0 00 00 	ret

000076b4 <netInit>:
    76b4:	37 9c ff 94 	addi sp,sp,-108
    76b8:	5b 8b 00 1c 	sw (sp+28),r11
    76bc:	5b 8c 00 18 	sw (sp+24),r12
    76c0:	5b 8d 00 14 	sw (sp+20),r13
    76c4:	5b 8e 00 10 	sw (sp+16),r14
    76c8:	5b 8f 00 0c 	sw (sp+12),r15
    76cc:	5b 90 00 08 	sw (sp+8),r16
    76d0:	5b 9d 00 04 	sw (sp+4),ra
    76d4:	b8 40 60 00 	mv r12,r2
    76d8:	2c 62 00 dc 	lhu r2,(r3+220)
    76dc:	34 0f ff ff 	mvi r15,-1
    76e0:	b8 20 58 00 	mv r11,r1
    76e4:	34 42 ff ff 	addi r2,r2,-1
    76e8:	b8 60 70 00 	mv r14,r3
    76ec:	34 0d 00 00 	mvi r13,0
    76f0:	44 4f 00 59 	be r2,r15,7854 <netInit+0x1a0>
    76f4:	3c 43 00 04 	sli r3,r2,4
    76f8:	37 8d 00 20 	addi r13,sp,32
    76fc:	b5 83 08 00 	add r1,r12,r3
    7700:	40 21 00 0c 	lbu r1,(r1+12)
    7704:	44 20 00 05 	be r1,r0,7718 <netInit+0x64>
    7708:	35 82 00 0c 	addi r2,r12,12
    770c:	b9 a0 08 00 	mv r1,r13
    7710:	b4 43 10 00 	add r2,r2,r3
    7714:	e0 00 00 07 	bi 7730 <netInit+0x7c>
    7718:	b9 a0 08 00 	mv r1,r13
    771c:	f8 00 21 bc 	calli fe0c <ptpd_netif_get_ifName>
    7720:	5c 2f 00 05 	bne r1,r15,7734 <netInit+0x80>
    7724:	78 02 00 01 	mvhi r2,0x1
    7728:	b9 a0 08 00 	mv r1,r13
    772c:	38 42 30 3c 	ori r2,r2,0x303c
    7730:	f8 00 2c 9e 	calli 129a8 <strcpy>
    7734:	37 8f 00 20 	addi r15,sp,32
    7738:	b9 e0 10 00 	mv r2,r15
    773c:	34 03 00 10 	mvi r3,16
    7740:	35 61 00 08 	addi r1,r11,8
    7744:	f8 00 2c bd 	calli 12a38 <strncpy>
    7748:	34 01 00 01 	mvi r1,1
    774c:	5b 81 00 30 	sw (sp+48),r1
    7750:	37 90 00 34 	addi r16,sp,52
    7754:	34 01 88 f7 	mvi r1,-30473
    7758:	78 02 00 01 	mvhi r2,0x1
    775c:	0f 81 00 46 	sh (sp+70),r1
    7760:	38 42 34 cc 	ori r2,r2,0x34cc
    7764:	34 03 00 06 	mvi r3,6
    7768:	ba 00 08 00 	mv r1,r16
    776c:	f8 00 2c 15 	calli 127c0 <memcpy>
    7770:	34 01 00 01 	mvi r1,1
    7774:	34 02 00 00 	mvi r2,0
    7778:	b9 e0 18 00 	mv r3,r15
    777c:	f8 00 21 58 	calli fcdc <ptpd_netif_create_socket>
    7780:	59 61 00 00 	sw (r11+0),r1
    7784:	34 0d 00 00 	mvi r13,0
    7788:	44 20 00 33 	be r1,r0,7854 <netInit+0x1a0>
    778c:	78 02 00 01 	mvhi r2,0x1
    7790:	38 42 34 dc 	ori r2,r2,0x34dc
    7794:	34 03 00 06 	mvi r3,6
    7798:	ba 00 08 00 	mv r1,r16
    779c:	f8 00 2c 09 	calli 127c0 <memcpy>
    77a0:	34 01 00 01 	mvi r1,1
    77a4:	34 02 00 00 	mvi r2,0
    77a8:	b9 e0 18 00 	mv r3,r15
    77ac:	f8 00 21 4c 	calli fcdc <ptpd_netif_create_socket>
    77b0:	59 61 00 04 	sw (r11+4),r1
    77b4:	44 20 00 28 	be r1,r0,7854 <netInit+0x1a0>
    77b8:	41 82 00 2c 	lbu r2,(r12+44)
    77bc:	35 61 00 84 	addi r1,r11,132
    77c0:	44 40 00 04 	be r2,r0,77d0 <netInit+0x11c>
    77c4:	78 02 00 01 	mvhi r2,0x1
    77c8:	38 42 34 d4 	ori r2,r2,0x34d4
    77cc:	e0 00 00 03 	bi 77d8 <netInit+0x124>
    77d0:	78 02 00 01 	mvhi r2,0x1
    77d4:	38 42 34 e4 	ori r2,r2,0x34e4
    77d8:	34 03 00 06 	mvi r3,6
    77dc:	f8 00 2b f9 	calli 127c0 <memcpy>
    77e0:	78 02 00 01 	mvhi r2,0x1
    77e4:	38 42 34 cc 	ori r2,r2,0x34cc
    77e8:	34 03 00 06 	mvi r3,6
    77ec:	35 61 00 2c 	addi r1,r11,44
    77f0:	f8 00 2b f4 	calli 127c0 <memcpy>
    77f4:	78 02 00 01 	mvhi r2,0x1
    77f8:	34 03 00 06 	mvi r3,6
    77fc:	38 42 34 dc 	ori r2,r2,0x34dc
    7800:	35 61 00 58 	addi r1,r11,88
    7804:	f8 00 2b ef 	calli 127c0 <memcpy>
    7808:	34 01 88 f7 	mvi r1,-30473
    780c:	0d 61 00 96 	sh (r11+150),r1
    7810:	0d 61 00 3e 	sh (r11+62),r1
    7814:	0d 61 00 6a 	sh (r11+106),r1
    7818:	29 61 00 00 	lw r1,(r11+0)
    781c:	37 8d 00 4c 	addi r13,sp,76
    7820:	b9 a0 10 00 	mv r2,r13
    7824:	f8 00 20 ce 	calli fb5c <ptpd_netif_get_hw_addr>
    7828:	b9 a0 10 00 	mv r2,r13
    782c:	34 03 00 06 	mvi r3,6
    7830:	35 c1 0a f9 	addi r1,r14,2809
    7834:	f8 00 2b e3 	calli 127c0 <memcpy>
    7838:	b9 a0 10 00 	mv r2,r13
    783c:	35 61 00 b0 	addi r1,r11,176
    7840:	34 03 00 06 	mvi r3,6
    7844:	f8 00 2b df 	calli 127c0 <memcpy>
    7848:	41 81 00 81 	lbu r1,(r12+129)
    784c:	34 0d 00 01 	mvi r13,1
    7850:	31 c1 0b 62 	sb (r14+2914),r1
    7854:	b9 a0 08 00 	mv r1,r13
    7858:	2b 9d 00 04 	lw ra,(sp+4)
    785c:	2b 8b 00 1c 	lw r11,(sp+28)
    7860:	2b 8c 00 18 	lw r12,(sp+24)
    7864:	2b 8d 00 14 	lw r13,(sp+20)
    7868:	2b 8e 00 10 	lw r14,(sp+16)
    786c:	2b 8f 00 0c 	lw r15,(sp+12)
    7870:	2b 90 00 08 	lw r16,(sp+8)
    7874:	37 9c 00 6c 	addi sp,sp,108
    7878:	c3 a0 00 00 	ret

0000787c <autoDetectPortWrConfig>:
    787c:	37 9c ff a4 	addi sp,sp,-92
    7880:	5b 8b 00 08 	sw (sp+8),r11
    7884:	5b 9d 00 04 	sw (sp+4),ra
    7888:	b8 40 58 00 	mv r11,r2
    788c:	34 22 00 08 	addi r2,r1,8
    7890:	37 81 00 0c 	addi r1,sp,12
    7894:	f8 00 20 e3 	calli fc20 <halexp_get_port_state>
    7898:	2b 81 00 10 	lw r1,(sp+16)
    789c:	34 02 00 02 	mvi r2,2
    78a0:	44 22 00 0b 	be r1,r2,78cc <autoDetectPortWrConfig+0x50>
    78a4:	48 22 00 04 	bg r1,r2,78b4 <autoDetectPortWrConfig+0x38>
    78a8:	34 02 00 01 	mvi r2,1
    78ac:	5c 22 00 0d 	bne r1,r2,78e0 <autoDetectPortWrConfig+0x64>
    78b0:	e0 00 00 07 	bi 78cc <autoDetectPortWrConfig+0x50>
    78b4:	34 02 00 03 	mvi r2,3
    78b8:	44 22 00 08 	be r1,r2,78d8 <autoDetectPortWrConfig+0x5c>
    78bc:	34 03 00 04 	mvi r3,4
    78c0:	5c 23 00 08 	bne r1,r3,78e0 <autoDetectPortWrConfig+0x64>
    78c4:	31 62 0b 62 	sb (r11+2914),r2
    78c8:	e0 00 00 02 	bi 78d0 <autoDetectPortWrConfig+0x54>
    78cc:	31 61 0b 62 	sb (r11+2914),r1
    78d0:	34 01 00 01 	mvi r1,1
    78d4:	e0 00 00 05 	bi 78e8 <autoDetectPortWrConfig+0x6c>
    78d8:	31 60 0b 62 	sb (r11+2914),r0
    78dc:	e3 ff ff fd 	bi 78d0 <autoDetectPortWrConfig+0x54>
    78e0:	31 60 0b 62 	sb (r11+2914),r0
    78e4:	34 01 00 00 	mvi r1,0
    78e8:	2b 9d 00 04 	lw ra,(sp+4)
    78ec:	2b 8b 00 08 	lw r11,(sp+8)
    78f0:	37 9c 00 5c 	addi sp,sp,92
    78f4:	c3 a0 00 00 	ret

000078f8 <netSelect>:
    78f8:	37 9c ff fc 	addi sp,sp,-4
    78fc:	5b 9d 00 04 	sw (sp+4),ra
    7900:	28 41 00 00 	lw r1,(r2+0)
    7904:	f8 00 22 4b 	calli 10230 <ptpd_netif_select>
    7908:	2b 9d 00 04 	lw ra,(sp+4)
    790c:	37 9c 00 04 	addi sp,sp,4
    7910:	c3 a0 00 00 	ret

00007914 <netRecvMsg>:
    7914:	37 9c ff bc 	addi sp,sp,-68
    7918:	5b 8b 00 18 	sw (sp+24),r11
    791c:	5b 8c 00 14 	sw (sp+20),r12
    7920:	5b 8d 00 10 	sw (sp+16),r13
    7924:	5b 8e 00 0c 	sw (sp+12),r14
    7928:	5b 8f 00 08 	sw (sp+8),r15
    792c:	5b 9d 00 04 	sw (sp+4),ra
    7930:	b8 20 70 00 	mv r14,r1
    7934:	28 41 00 00 	lw r1,(r2+0)
    7938:	b8 60 68 00 	mv r13,r3
    793c:	37 8f 00 1c 	addi r15,sp,28
    7940:	b8 40 60 00 	mv r12,r2
    7944:	b9 c0 18 00 	mv r3,r14
    7948:	b9 e0 10 00 	mv r2,r15
    794c:	34 04 05 ee 	mvi r4,1518
    7950:	b9 a0 28 00 	mv r5,r13
    7954:	f8 00 21 a2 	calli ffdc <ptpd_netif_recvfrom>
    7958:	b8 20 58 00 	mv r11,r1
    795c:	48 20 00 09 	bg r1,r0,7980 <netRecvMsg+0x6c>
    7960:	29 81 00 04 	lw r1,(r12+4)
    7964:	b9 e0 10 00 	mv r2,r15
    7968:	b9 c0 18 00 	mv r3,r14
    796c:	34 04 05 ee 	mvi r4,1518
    7970:	b9 a0 28 00 	mv r5,r13
    7974:	f8 00 21 9a 	calli ffdc <ptpd_netif_recvfrom>
    7978:	b8 20 58 00 	mv r11,r1
    797c:	48 01 00 18 	bg r0,r1,79dc <netRecvMsg+0xc8>
    7980:	37 8d 00 36 	addi r13,sp,54
    7984:	b9 a0 08 00 	mv r1,r13
    7988:	35 82 00 b0 	addi r2,r12,176
    798c:	34 03 00 06 	mvi r3,6
    7990:	f8 00 2b 6b 	calli 1273c <memcmp>
    7994:	44 20 00 12 	be r1,r0,79dc <netRecvMsg+0xc8>
    7998:	b9 a0 08 00 	mv r1,r13
    799c:	35 82 00 2c 	addi r2,r12,44
    79a0:	34 03 00 06 	mvi r3,6
    79a4:	f8 00 2b 66 	calli 1273c <memcmp>
    79a8:	44 20 00 0d 	be r1,r0,79dc <netRecvMsg+0xc8>
    79ac:	b9 a0 08 00 	mv r1,r13
    79b0:	35 82 00 58 	addi r2,r12,88
    79b4:	34 03 00 06 	mvi r3,6
    79b8:	f8 00 2b 61 	calli 1273c <memcmp>
    79bc:	44 20 00 08 	be r1,r0,79dc <netRecvMsg+0xc8>
    79c0:	b9 a0 08 00 	mv r1,r13
    79c4:	35 82 00 84 	addi r2,r12,132
    79c8:	34 03 00 06 	mvi r3,6
    79cc:	f8 00 2b 5c 	calli 1273c <memcmp>
    79d0:	64 21 00 00 	cmpei r1,r1,0
    79d4:	c8 01 08 00 	sub r1,r0,r1
    79d8:	a1 61 58 00 	and r11,r11,r1
    79dc:	b9 60 08 00 	mv r1,r11
    79e0:	2b 9d 00 04 	lw ra,(sp+4)
    79e4:	2b 8b 00 18 	lw r11,(sp+24)
    79e8:	2b 8c 00 14 	lw r12,(sp+20)
    79ec:	2b 8d 00 10 	lw r13,(sp+16)
    79f0:	2b 8e 00 0c 	lw r14,(sp+12)
    79f4:	2b 8f 00 08 	lw r15,(sp+8)
    79f8:	37 9c 00 44 	addi sp,sp,68
    79fc:	c3 a0 00 00 	ret

00007a00 <netSendEvent>:
    7a00:	37 9c ff f4 	addi sp,sp,-12
    7a04:	5b 8b 00 0c 	sw (sp+12),r11
    7a08:	5b 8c 00 08 	sw (sp+8),r12
    7a0c:	5b 9d 00 04 	sw (sp+4),ra
    7a10:	b8 20 28 00 	mv r5,r1
    7a14:	28 61 00 00 	lw r1,(r3+0)
    7a18:	b8 80 58 00 	mv r11,r4
    7a1c:	20 44 ff ff 	andi r4,r2,0xffff
    7a20:	34 62 00 18 	addi r2,r3,24
    7a24:	b8 a0 18 00 	mv r3,r5
    7a28:	b9 60 28 00 	mv r5,r11
    7a2c:	f8 00 22 03 	calli 10238 <ptpd_netif_sendto>
    7a30:	78 02 00 01 	mvhi r2,0x1
    7a34:	38 42 59 38 	ori r2,r2,0x5938
    7a38:	b8 20 60 00 	mv r12,r1
    7a3c:	28 41 00 00 	lw r1,(r2+0)
    7a40:	44 20 00 09 	be r1,r0,7a64 <netSendEvent+0x64>
    7a44:	29 63 00 04 	lw r3,(r11+4)
    7a48:	29 64 00 08 	lw r4,(r11+8)
    7a4c:	29 65 00 0c 	lw r5,(r11+12)
    7a50:	29 66 00 1c 	lw r6,(r11+28)
    7a54:	78 02 00 01 	mvhi r2,0x1
    7a58:	34 01 00 00 	mvi r1,0
    7a5c:	38 42 34 3c 	ori r2,r2,0x343c
    7a60:	fb ff e3 88 	calli 880 <wrc_debug_printf>
    7a64:	b9 80 08 00 	mv r1,r12
    7a68:	2b 9d 00 04 	lw ra,(sp+4)
    7a6c:	2b 8b 00 0c 	lw r11,(sp+12)
    7a70:	2b 8c 00 08 	lw r12,(sp+8)
    7a74:	37 9c 00 0c 	addi sp,sp,12
    7a78:	c3 a0 00 00 	ret

00007a7c <netSendPeerEvent>:
    7a7c:	37 9c ff f4 	addi sp,sp,-12
    7a80:	5b 8b 00 0c 	sw (sp+12),r11
    7a84:	5b 8c 00 08 	sw (sp+8),r12
    7a88:	5b 9d 00 04 	sw (sp+4),ra
    7a8c:	b8 20 28 00 	mv r5,r1
    7a90:	28 61 00 00 	lw r1,(r3+0)
    7a94:	b8 80 58 00 	mv r11,r4
    7a98:	20 44 ff ff 	andi r4,r2,0xffff
    7a9c:	34 62 00 44 	addi r2,r3,68
    7aa0:	b8 a0 18 00 	mv r3,r5
    7aa4:	b9 60 28 00 	mv r5,r11
    7aa8:	f8 00 21 e4 	calli 10238 <ptpd_netif_sendto>
    7aac:	78 02 00 01 	mvhi r2,0x1
    7ab0:	38 42 59 38 	ori r2,r2,0x5938
    7ab4:	b8 20 60 00 	mv r12,r1
    7ab8:	28 41 00 00 	lw r1,(r2+0)
    7abc:	44 20 00 09 	be r1,r0,7ae0 <netSendPeerEvent+0x64>
    7ac0:	29 63 00 04 	lw r3,(r11+4)
    7ac4:	29 64 00 08 	lw r4,(r11+8)
    7ac8:	29 65 00 0c 	lw r5,(r11+12)
    7acc:	29 66 00 1c 	lw r6,(r11+28)
    7ad0:	78 02 00 01 	mvhi r2,0x1
    7ad4:	34 01 00 00 	mvi r1,0
    7ad8:	38 42 34 80 	ori r2,r2,0x3480
    7adc:	fb ff e3 69 	calli 880 <wrc_debug_printf>
    7ae0:	b9 80 08 00 	mv r1,r12
    7ae4:	2b 9d 00 04 	lw ra,(sp+4)
    7ae8:	2b 8b 00 0c 	lw r11,(sp+12)
    7aec:	2b 8c 00 08 	lw r12,(sp+8)
    7af0:	37 9c 00 0c 	addi sp,sp,12
    7af4:	c3 a0 00 00 	ret

00007af8 <netSendPeerGeneral>:
    7af8:	37 9c ff fc 	addi sp,sp,-4
    7afc:	5b 9d 00 04 	sw (sp+4),ra
    7b00:	b8 20 28 00 	mv r5,r1
    7b04:	28 61 00 00 	lw r1,(r3+0)
    7b08:	20 44 ff ff 	andi r4,r2,0xffff
    7b0c:	34 62 00 44 	addi r2,r3,68
    7b10:	b8 a0 18 00 	mv r3,r5
    7b14:	34 05 00 00 	mvi r5,0
    7b18:	f8 00 21 c8 	calli 10238 <ptpd_netif_sendto>
    7b1c:	2b 9d 00 04 	lw ra,(sp+4)
    7b20:	37 9c 00 04 	addi sp,sp,4
    7b24:	c3 a0 00 00 	ret

00007b28 <netSendGeneral>:
    7b28:	37 9c ff dc 	addi sp,sp,-36
    7b2c:	5b 9d 00 04 	sw (sp+4),ra
    7b30:	b8 20 28 00 	mv r5,r1
    7b34:	28 61 00 00 	lw r1,(r3+0)
    7b38:	20 44 ff ff 	andi r4,r2,0xffff
    7b3c:	34 62 00 18 	addi r2,r3,24
    7b40:	b8 a0 18 00 	mv r3,r5
    7b44:	37 85 00 08 	addi r5,sp,8
    7b48:	f8 00 21 bc 	calli 10238 <ptpd_netif_sendto>
    7b4c:	2b 9d 00 04 	lw ra,(sp+4)
    7b50:	37 9c 00 24 	addi sp,sp,36
    7b54:	c3 a0 00 00 	ret

00007b58 <netEnablePhaseTracking>:
    7b58:	37 9c ff fc 	addi sp,sp,-4
    7b5c:	5b 9d 00 04 	sw (sp+4),ra
    7b60:	34 21 00 08 	addi r1,r1,8
    7b64:	f8 00 22 d8 	calli 106c4 <ptpd_netif_enable_phase_tracking>
    7b68:	2b 9d 00 04 	lw ra,(sp+4)
    7b6c:	37 9c 00 04 	addi sp,sp,4
    7b70:	c3 a0 00 00 	ret

00007b74 <autoPortNumberDiscovery>:
    7b74:	37 9c ff e4 	addi sp,sp,-28
    7b78:	5b 8b 00 0c 	sw (sp+12),r11
    7b7c:	5b 8c 00 08 	sw (sp+8),r12
    7b80:	5b 9d 00 04 	sw (sp+4),ra
    7b84:	34 0b 00 00 	mvi r11,0
    7b88:	37 8c 00 10 	addi r12,sp,16
    7b8c:	b9 80 08 00 	mv r1,r12
    7b90:	b9 60 10 00 	mv r2,r11
    7b94:	f8 00 20 9e 	calli fe0c <ptpd_netif_get_ifName>
    7b98:	5c 20 00 03 	bne r1,r0,7ba4 <autoPortNumberDiscovery+0x30>
    7b9c:	35 6b 00 01 	addi r11,r11,1
    7ba0:	e3 ff ff fb 	bi 7b8c <autoPortNumberDiscovery+0x18>
    7ba4:	21 61 ff ff 	andi r1,r11,0xffff
    7ba8:	2b 9d 00 04 	lw ra,(sp+4)
    7bac:	2b 8b 00 0c 	lw r11,(sp+12)
    7bb0:	2b 8c 00 08 	lw r12,(sp+8)
    7bb4:	37 9c 00 1c 	addi sp,sp,28
    7bb8:	c3 a0 00 00 	ret

00007bbc <extsrcLocked>:
    7bbc:	37 9c ff fc 	addi sp,sp,-4
    7bc0:	5b 9d 00 04 	sw (sp+4),ra
    7bc4:	f8 00 22 af 	calli 10680 <ptpd_netif_extsrc_detection>
    7bc8:	64 21 00 00 	cmpei r1,r1,0
    7bcc:	2b 9d 00 04 	lw ra,(sp+4)
    7bd0:	37 9c 00 04 	addi sp,sp,4
    7bd4:	c3 a0 00 00 	ret

00007bd8 <initClock>:
    7bd8:	c3 a0 00 00 	ret

00007bdc <updateDelay>:
    7bdc:	c3 a0 00 00 	ret

00007be0 <updatePeerDelay>:
    7be0:	c3 a0 00 00 	ret

00007be4 <updateOffset>:
    7be4:	c3 a0 00 00 	ret

00007be8 <updateClock>:
    7be8:	c3 a0 00 00 	ret

00007bec <displayStats>:
    7bec:	c3 a0 00 00 	ret

00007bf0 <timerInit>:
    7bf0:	58 20 00 08 	sw (r1+8),r0
    7bf4:	c3 a0 00 00 	ret

00007bf8 <timerStart>:
    7bf8:	37 9c ff f4 	addi sp,sp,-12
    7bfc:	5b 8b 00 0c 	sw (sp+12),r11
    7c00:	5b 8c 00 08 	sw (sp+8),r12
    7c04:	5b 9d 00 04 	sw (sp+4),ra
    7c08:	b8 20 58 00 	mv r11,r1
    7c0c:	b8 40 60 00 	mv r12,r2
    7c10:	f8 00 1f 9e 	calli fa88 <ptpd_netif_get_msec_tics>
    7c14:	59 61 00 00 	sw (r11+0),r1
    7c18:	59 62 00 04 	sw (r11+4),r2
    7c1c:	59 6c 00 08 	sw (r11+8),r12
    7c20:	2b 9d 00 04 	lw ra,(sp+4)
    7c24:	2b 8b 00 0c 	lw r11,(sp+12)
    7c28:	2b 8c 00 08 	lw r12,(sp+8)
    7c2c:	37 9c 00 0c 	addi sp,sp,12
    7c30:	c3 a0 00 00 	ret

00007c34 <timerStop>:
    7c34:	58 20 00 08 	sw (r1+8),r0
    7c38:	c3 a0 00 00 	ret

00007c3c <timerExpired>:
    7c3c:	37 9c ff f8 	addi sp,sp,-8
    7c40:	5b 8b 00 08 	sw (sp+8),r11
    7c44:	5b 9d 00 04 	sw (sp+4),ra
    7c48:	b8 20 58 00 	mv r11,r1
    7c4c:	f8 00 1f 8f 	calli fa88 <ptpd_netif_get_msec_tics>
    7c50:	29 64 00 08 	lw r4,(r11+8)
    7c54:	29 65 00 04 	lw r5,(r11+4)
    7c58:	29 67 00 00 	lw r7,(r11+0)
    7c5c:	14 83 00 1f 	sri r3,r4,31
    7c60:	b4 85 28 00 	add r5,r4,r5
    7c64:	f4 85 30 00 	cmpgu r6,r4,r5
    7c68:	b4 67 18 00 	add r3,r3,r7
    7c6c:	b4 c3 18 00 	add r3,r6,r3
    7c70:	34 06 00 01 	mvi r6,1
    7c74:	48 61 00 04 	bg r3,r1,7c84 <timerExpired+0x48>
    7c78:	5c 61 00 04 	bne r3,r1,7c88 <timerExpired+0x4c>
    7c7c:	54 a2 00 02 	bgu r5,r2,7c84 <timerExpired+0x48>
    7c80:	e0 00 00 02 	bi 7c88 <timerExpired+0x4c>
    7c84:	34 06 00 00 	mvi r6,0
    7c88:	7c 84 00 00 	cmpnei r4,r4,0
    7c8c:	a0 86 30 00 	and r6,r4,r6
    7c90:	34 04 00 00 	mvi r4,0
    7c94:	44 c0 00 0a 	be r6,r0,7cbc <timerExpired+0x80>
    7c98:	59 63 00 00 	sw (r11+0),r3
    7c9c:	59 65 00 04 	sw (r11+4),r5
    7ca0:	54 23 00 04 	bgu r1,r3,7cb0 <timerExpired+0x74>
    7ca4:	5c 23 00 05 	bne r1,r3,7cb8 <timerExpired+0x7c>
    7ca8:	54 45 00 02 	bgu r2,r5,7cb0 <timerExpired+0x74>
    7cac:	e0 00 00 03 	bi 7cb8 <timerExpired+0x7c>
    7cb0:	59 61 00 00 	sw (r11+0),r1
    7cb4:	59 62 00 04 	sw (r11+4),r2
    7cb8:	34 04 00 01 	mvi r4,1
    7cbc:	b8 80 08 00 	mv r1,r4
    7cc0:	2b 9d 00 04 	lw ra,(sp+4)
    7cc4:	2b 8b 00 08 	lw r11,(sp+8)
    7cc8:	37 9c 00 08 	addi sp,sp,8
    7ccc:	c3 a0 00 00 	ret

00007cd0 <ts_hardwarize>:
    7cd0:	37 9c ff e4 	addi sp,sp,-28
    7cd4:	5b 8b 00 1c 	sw (sp+28),r11
    7cd8:	5b 8c 00 18 	sw (sp+24),r12
    7cdc:	5b 8d 00 14 	sw (sp+20),r13
    7ce0:	5b 8e 00 10 	sw (sp+16),r14
    7ce4:	5b 8f 00 0c 	sw (sp+12),r15
    7ce8:	5b 90 00 08 	sw (sp+8),r16
    7cec:	5b 9d 00 04 	sw (sp+4),ra
    7cf0:	b8 20 60 00 	mv r12,r1
    7cf4:	2b 81 00 40 	lw r1,(sp+64)
    7cf8:	2b 8b 00 28 	lw r11,(sp+40)
    7cfc:	34 02 03 e8 	mvi r2,1000
    7d00:	34 21 03 e7 	addi r1,r1,999
    7d04:	f8 00 29 e3 	calli 12490 <__divsi3>
    7d08:	2b 8d 00 24 	lw r13,(sp+36)
    7d0c:	2b 8e 00 20 	lw r14,(sp+32)
    7d10:	2b 8f 00 2c 	lw r15,(sp+44)
    7d14:	b8 20 80 00 	mv r16,r1
    7d18:	4c 0b 00 08 	bge r0,r11,7d38 <ts_hardwarize+0x68>
    7d1c:	b9 60 08 00 	mv r1,r11
    7d20:	ba 00 10 00 	mv r2,r16
    7d24:	f8 00 2a 08 	calli 12544 <__modsi3>
    7d28:	44 20 00 0e 	be r1,r0,7d60 <ts_hardwarize+0x90>
    7d2c:	c9 61 58 00 	sub r11,r11,r1
    7d30:	08 21 03 e8 	muli r1,r1,1000
    7d34:	b5 e1 78 00 	add r15,r15,r1
    7d38:	4d 60 00 0a 	bge r11,r0,7d60 <ts_hardwarize+0x90>
    7d3c:	78 02 00 01 	mvhi r2,0x1
    7d40:	38 42 34 18 	ori r2,r2,0x3418
    7d44:	28 41 00 00 	lw r1,(r2+0)
    7d48:	35 ce ff ff 	addi r14,r14,-1
    7d4c:	b5 61 58 00 	add r11,r11,r1
    7d50:	35 a1 ff ff 	addi r1,r13,-1
    7d54:	f5 a1 68 00 	cmpgu r13,r13,r1
    7d58:	b5 ae 70 00 	add r14,r13,r14
    7d5c:	b8 20 68 00 	mv r13,r1
    7d60:	34 01 ff ff 	mvi r1,-1
    7d64:	5d c1 00 09 	bne r14,r1,7d88 <ts_hardwarize+0xb8>
    7d68:	5d ae 00 08 	bne r13,r14,7d88 <ts_hardwarize+0xb8>
    7d6c:	4c 0b 00 07 	bge r0,r11,7d88 <ts_hardwarize+0xb8>
    7d70:	78 02 00 01 	mvhi r2,0x1
    7d74:	38 42 34 1c 	ori r2,r2,0x341c
    7d78:	28 41 00 00 	lw r1,(r2+0)
    7d7c:	34 0e 00 00 	mvi r14,0
    7d80:	34 0d 00 00 	mvi r13,0
    7d84:	b5 61 58 00 	add r11,r11,r1
    7d88:	4d 60 00 08 	bge r11,r0,7da8 <ts_hardwarize+0xd8>
    7d8c:	c8 10 08 00 	sub r1,r0,r16
    7d90:	48 2b 00 06 	bg r1,r11,7da8 <ts_hardwarize+0xd8>
    7d94:	b9 cd 08 00 	or r1,r14,r13
    7d98:	5c 20 00 04 	bne r1,r0,7da8 <ts_hardwarize+0xd8>
    7d9c:	b5 70 58 00 	add r11,r11,r16
    7da0:	0a 10 fc 18 	muli r16,r16,-1000
    7da4:	b5 f0 78 00 	add r15,r15,r16
    7da8:	2b 81 00 30 	lw r1,(sp+48)
    7dac:	59 8e 00 00 	sw (r12+0),r14
    7db0:	59 8d 00 04 	sw (r12+4),r13
    7db4:	59 81 00 10 	sw (r12+16),r1
    7db8:	2b 81 00 34 	lw r1,(sp+52)
    7dbc:	59 8b 00 08 	sw (r12+8),r11
    7dc0:	59 8f 00 0c 	sw (r12+12),r15
    7dc4:	59 81 00 14 	sw (r12+20),r1
    7dc8:	2b 81 00 38 	lw r1,(sp+56)
    7dcc:	59 81 00 18 	sw (r12+24),r1
    7dd0:	2b 81 00 3c 	lw r1,(sp+60)
    7dd4:	59 81 00 1c 	sw (r12+28),r1
    7dd8:	b9 80 08 00 	mv r1,r12
    7ddc:	2b 9d 00 04 	lw ra,(sp+4)
    7de0:	2b 8b 00 1c 	lw r11,(sp+28)
    7de4:	2b 8c 00 18 	lw r12,(sp+24)
    7de8:	2b 8d 00 14 	lw r13,(sp+20)
    7dec:	2b 8e 00 10 	lw r14,(sp+16)
    7df0:	2b 8f 00 0c 	lw r15,(sp+12)
    7df4:	2b 90 00 08 	lw r16,(sp+8)
    7df8:	37 9c 00 1c 	addi sp,sp,28
    7dfc:	c3 a0 00 00 	ret

00007e00 <wr_servo_enable_tracking>:
    7e00:	78 02 00 01 	mvhi r2,0x1
    7e04:	38 42 59 28 	ori r2,r2,0x5928
    7e08:	58 41 00 00 	sw (r2+0),r1
    7e0c:	c3 a0 00 00 	ret

00007e10 <wr_servo_reset>:
    7e10:	78 01 00 01 	mvhi r1,0x1
    7e14:	38 21 7c f8 	ori r1,r1,0x7cf8
    7e18:	58 20 00 00 	sw (r1+0),r0
    7e1c:	78 01 00 01 	mvhi r1,0x1
    7e20:	38 21 69 58 	ori r1,r1,0x6958
    7e24:	58 20 00 00 	sw (r1+0),r0
    7e28:	c3 a0 00 00 	ret

00007e2c <wr_servo_init>:
    7e2c:	37 9c ff f0 	addi sp,sp,-16
    7e30:	5b 8b 00 10 	sw (sp+16),r11
    7e34:	5b 8c 00 0c 	sw (sp+12),r12
    7e38:	5b 8d 00 08 	sw (sp+8),r13
    7e3c:	5b 9d 00 04 	sw (sp+4),ra
    7e40:	b8 20 58 00 	mv r11,r1
    7e44:	34 2d 00 0c 	addi r13,r1,12
    7e48:	34 02 00 00 	mvi r2,0
    7e4c:	b9 a0 08 00 	mv r1,r13
    7e50:	34 03 00 00 	mvi r3,0
    7e54:	35 64 0d 28 	addi r4,r11,3368
    7e58:	35 65 0d 2c 	addi r5,r11,3372
    7e5c:	f8 00 21 97 	calli 104b8 <ptpd_netif_read_calibration_data>
    7e60:	34 02 ff ff 	mvi r2,-1
    7e64:	5c 20 00 51 	bne r1,r0,7fa8 <wr_servo_init+0x17c>
    7e68:	f8 00 21 d9 	calli 105cc <ptpd_netif_enable_timing_output>
    7e6c:	b9 a0 10 00 	mv r2,r13
    7e70:	34 03 00 10 	mvi r3,16
    7e74:	35 61 0b c0 	addi r1,r11,3008
    7e78:	f8 00 2a f0 	calli 12a38 <strncpy>
    7e7c:	34 01 00 02 	mvi r1,2
    7e80:	59 61 0b d0 	sw (r11+3024),r1
    7e84:	29 61 0b 94 	lw r1,(r11+2964)
    7e88:	2d 62 0b 90 	lhu r2,(r11+2960)
    7e8c:	29 63 0b 8c 	lw r3,(r11+2956)
    7e90:	3c 21 00 10 	sli r1,r1,16
    7e94:	59 60 0c 48 	sw (r11+3144),r0
    7e98:	b8 22 08 00 	or r1,r1,r2
    7e9c:	59 61 0c 38 	sw (r11+3128),r1
    7ea0:	29 61 0b 9c 	lw r1,(r11+2972)
    7ea4:	2d 62 0b 98 	lhu r2,(r11+2968)
    7ea8:	3c 64 00 10 	sli r4,r3,16
    7eac:	3c 21 00 10 	sli r1,r1,16
    7eb0:	59 60 0d 30 	sw (r11+3376),r0
    7eb4:	b8 22 08 00 	or r1,r1,r2
    7eb8:	59 61 0c 3c 	sw (r11+3132),r1
    7ebc:	29 61 0b 84 	lw r1,(r11+2948)
    7ec0:	2d 62 0b 80 	lhu r2,(r11+2944)
    7ec4:	78 0c 00 01 	mvhi r12,0x1
    7ec8:	3c 21 00 10 	sli r1,r1,16
    7ecc:	39 8c 7c f8 	ori r12,r12,0x7cf8
    7ed0:	b8 22 08 00 	or r1,r1,r2
    7ed4:	29 62 0b 88 	lw r2,(r11+2952)
    7ed8:	59 61 0c 40 	sw (r11+3136),r1
    7edc:	00 41 00 10 	srui r1,r2,16
    7ee0:	b8 81 08 00 	or r1,r4,r1
    7ee4:	59 61 0c 44 	sw (r11+3140),r1
    7ee8:	78 01 00 01 	mvhi r1,0x1
    7eec:	38 21 34 f4 	ori r1,r1,0x34f4
    7ef0:	fb ff ef e6 	calli 3e88 <mprintf>
    7ef4:	29 64 0c 40 	lw r4,(r11+3136)
    7ef8:	29 65 0c 44 	lw r5,(r11+3140)
    7efc:	29 62 0c 38 	lw r2,(r11+3128)
    7f00:	29 63 0c 3c 	lw r3,(r11+3132)
    7f04:	78 01 00 01 	mvhi r1,0x1
    7f08:	38 21 35 08 	ori r1,r1,0x3508
    7f0c:	fb ff ef df 	calli 3e88 <mprintf>
    7f10:	29 61 0c 38 	lw r1,(r11+3128)
    7f14:	34 03 00 10 	mvi r3,16
    7f18:	14 22 00 1f 	sri r2,r1,31
    7f1c:	59 81 00 5c 	sw (r12+92),r1
    7f20:	29 61 0c 3c 	lw r1,(r11+3132)
    7f24:	59 82 00 58 	sw (r12+88),r2
    7f28:	59 81 00 64 	sw (r12+100),r1
    7f2c:	14 22 00 1f 	sri r2,r1,31
    7f30:	29 61 0c 40 	lw r1,(r11+3136)
    7f34:	59 82 00 60 	sw (r12+96),r2
    7f38:	59 81 00 6c 	sw (r12+108),r1
    7f3c:	14 22 00 1f 	sri r2,r1,31
    7f40:	29 61 0c 44 	lw r1,(r11+3140)
    7f44:	59 82 00 68 	sw (r12+104),r2
    7f48:	14 22 00 1f 	sri r2,r1,31
    7f4c:	59 81 00 74 	sw (r12+116),r1
    7f50:	78 01 00 01 	mvhi r1,0x1
    7f54:	59 82 00 70 	sw (r12+112),r2
    7f58:	38 21 7d 1c 	ori r1,r1,0x7d1c
    7f5c:	b9 a0 10 00 	mv r2,r13
    7f60:	f8 00 2a b6 	calli 12a38 <strncpy>
    7f64:	78 01 00 01 	mvhi r1,0x1
    7f68:	78 02 00 01 	mvhi r2,0x1
    7f6c:	38 42 35 4c 	ori r2,r2,0x354c
    7f70:	38 21 7c fc 	ori r1,r1,0x7cfc
    7f74:	34 03 00 20 	mvi r3,32
    7f78:	f8 00 2a b0 	calli 12a38 <strncpy>
    7f7c:	78 01 00 01 	mvhi r1,0x1
    7f80:	34 02 00 01 	mvi r2,1
    7f84:	38 21 69 58 	ori r1,r1,0x6958
    7f88:	58 22 00 00 	sw (r1+0),r2
    7f8c:	78 01 00 01 	mvhi r1,0x1
    7f90:	38 21 69 5c 	ori r1,r1,0x695c
    7f94:	59 82 00 00 	sw (r12+0),r2
    7f98:	59 80 00 a0 	sw (r12+160),r0
    7f9c:	59 80 00 a4 	sw (r12+164),r0
    7fa0:	58 20 00 00 	sw (r1+0),r0
    7fa4:	34 02 00 00 	mvi r2,0
    7fa8:	b8 40 08 00 	mv r1,r2
    7fac:	2b 9d 00 04 	lw ra,(sp+4)
    7fb0:	2b 8b 00 10 	lw r11,(sp+16)
    7fb4:	2b 8c 00 0c 	lw r12,(sp+12)
    7fb8:	2b 8d 00 08 	lw r13,(sp+8)
    7fbc:	37 9c 00 10 	addi sp,sp,16
    7fc0:	c3 a0 00 00 	ret

00007fc4 <timeint_to_wr>:
    7fc4:	37 9c ff f0 	addi sp,sp,-16
    7fc8:	14 46 00 1f 	sri r6,r2,31
    7fcc:	58 22 00 04 	sw (r1+4),r2
    7fd0:	58 26 00 00 	sw (r1+0),r6
    7fd4:	58 23 00 08 	sw (r1+8),r3
    7fd8:	58 24 00 0c 	sw (r1+12),r4
    7fdc:	37 9c 00 10 	addi sp,sp,16
    7fe0:	c3 a0 00 00 	ret

00007fe4 <wr_servo_man_adjust_phase>:
    7fe4:	78 02 00 01 	mvhi r2,0x1
    7fe8:	38 42 69 60 	ori r2,r2,0x6960
    7fec:	58 41 00 00 	sw (r2+0),r1
    7ff0:	c3 a0 00 00 	ret

00007ff4 <wr_servo_got_sync>:
    7ff4:	37 9c ff f0 	addi sp,sp,-16
    7ff8:	58 23 0c 68 	sw (r1+3176),r3
    7ffc:	2b 83 00 14 	lw r3,(sp+20)
    8000:	58 24 0c 6c 	sw (r1+3180),r4
    8004:	14 45 00 1f 	sri r5,r2,31
    8008:	14 64 00 1f 	sri r4,r3,31
    800c:	58 23 0c 84 	sw (r1+3204),r3
    8010:	2b 83 00 18 	lw r3,(sp+24)
    8014:	58 22 0c 64 	sw (r1+3172),r2
    8018:	34 02 00 01 	mvi r2,1
    801c:	58 23 0c 88 	sw (r1+3208),r3
    8020:	2b 83 00 1c 	lw r3,(sp+28)
    8024:	58 25 0c 60 	sw (r1+3168),r5
    8028:	58 22 0c 7c 	sw (r1+3196),r2
    802c:	58 23 0c 8c 	sw (r1+3212),r3
    8030:	2b 83 00 20 	lw r3,(sp+32)
    8034:	58 24 0c 80 	sw (r1+3200),r4
    8038:	58 23 0c 9c 	sw (r1+3228),r3
    803c:	78 01 00 01 	mvhi r1,0x1
    8040:	38 21 69 5c 	ori r1,r1,0x695c
    8044:	58 22 00 00 	sw (r1+0),r2
    8048:	34 01 00 00 	mvi r1,0
    804c:	37 9c 00 10 	addi sp,sp,16
    8050:	c3 a0 00 00 	ret

00008054 <wr_servo_got_delay>:
    8054:	37 9c ff f8 	addi sp,sp,-8
    8058:	5b 8b 00 08 	sw (sp+8),r11
    805c:	5b 9d 00 04 	sw (sp+4),ra
    8060:	b8 20 58 00 	mv r11,r1
    8064:	28 29 0d 58 	lw r9,(r1+3416)
    8068:	28 28 0d 5c 	lw r8,(r1+3420)
    806c:	28 27 0d 60 	lw r7,(r1+3424)
    8070:	28 26 0d 64 	lw r6,(r1+3428)
    8074:	28 25 0d 68 	lw r5,(r1+3432)
    8078:	28 24 0d 6c 	lw r4,(r1+3436)
    807c:	28 23 0d 70 	lw r3,(r1+3440)
    8080:	28 21 0d 74 	lw r1,(r1+3444)
    8084:	59 64 0c b4 	sw (r11+3252),r4
    8088:	29 64 09 d8 	lw r4,(r11+2520)
    808c:	59 61 0c bc 	sw (r11+3260),r1
    8090:	29 61 09 d4 	lw r1,(r11+2516)
    8094:	59 63 0c b8 	sw (r11+3256),r3
    8098:	59 64 0c c8 	sw (r11+3272),r4
    809c:	14 23 00 1f 	sri r3,r1,31
    80a0:	59 61 0c c4 	sw (r11+3268),r1
    80a4:	34 01 00 01 	mvi r1,1
    80a8:	59 61 0c dc 	sw (r11+3292),r1
    80ac:	14 41 00 1f 	sri r1,r2,31
    80b0:	59 63 0c c0 	sw (r11+3264),r3
    80b4:	59 69 0c a0 	sw (r11+3232),r9
    80b8:	59 68 0c a4 	sw (r11+3236),r8
    80bc:	59 67 0c a8 	sw (r11+3240),r7
    80c0:	59 66 0c ac 	sw (r11+3244),r6
    80c4:	59 65 0c b0 	sw (r11+3248),r5
    80c8:	34 03 00 00 	mvi r3,0
    80cc:	34 04 03 e8 	mvi r4,1000
    80d0:	f8 00 21 86 	calli 106e8 <__muldi3>
    80d4:	14 23 00 1f 	sri r3,r1,31
    80d8:	20 63 ff ff 	andi r3,r3,0xffff
    80dc:	b4 62 10 00 	add r2,r3,r2
    80e0:	f4 62 18 00 	cmpgu r3,r3,r2
    80e4:	00 42 00 10 	srui r2,r2,16
    80e8:	b4 61 08 00 	add r1,r3,r1
    80ec:	3c 21 00 10 	sli r1,r1,16
    80f0:	b8 22 10 00 	or r2,r1,r2
    80f4:	34 01 00 00 	mvi r1,0
    80f8:	59 62 0c cc 	sw (r11+3276),r2
    80fc:	2b 9d 00 04 	lw ra,(sp+4)
    8100:	2b 8b 00 08 	lw r11,(sp+8)
    8104:	37 9c 00 08 	addi sp,sp,8
    8108:	c3 a0 00 00 	ret

0000810c <wr_servo_got_delay_P2P>:
    810c:	37 9c ff f4 	addi sp,sp,-12
    8110:	5b 8b 00 0c 	sw (sp+12),r11
    8114:	5b 8c 00 08 	sw (sp+8),r12
    8118:	5b 9d 00 04 	sw (sp+4),ra
    811c:	b8 20 58 00 	mv r11,r1
    8120:	28 29 0d 78 	lw r9,(r1+3448)
    8124:	28 28 0d 7c 	lw r8,(r1+3452)
    8128:	28 27 0d 80 	lw r7,(r1+3456)
    812c:	28 26 0d 84 	lw r6,(r1+3460)
    8130:	28 25 0d 88 	lw r5,(r1+3464)
    8134:	28 24 0d 8c 	lw r4,(r1+3468)
    8138:	28 23 0d 90 	lw r3,(r1+3472)
    813c:	28 21 0d 94 	lw r1,(r1+3476)
    8140:	59 64 0c b4 	sw (r11+3252),r4
    8144:	29 64 09 78 	lw r4,(r11+2424)
    8148:	59 61 0c bc 	sw (r11+3260),r1
    814c:	29 61 09 74 	lw r1,(r11+2420)
    8150:	59 63 0c b8 	sw (r11+3256),r3
    8154:	34 0c 00 01 	mvi r12,1
    8158:	14 23 00 1f 	sri r3,r1,31
    815c:	59 61 0c c4 	sw (r11+3268),r1
    8160:	14 41 00 1f 	sri r1,r2,31
    8164:	59 63 0c c0 	sw (r11+3264),r3
    8168:	59 64 0c c8 	sw (r11+3272),r4
    816c:	59 69 0c a0 	sw (r11+3232),r9
    8170:	59 68 0c a4 	sw (r11+3236),r8
    8174:	59 67 0c a8 	sw (r11+3240),r7
    8178:	59 66 0c ac 	sw (r11+3244),r6
    817c:	59 65 0c b0 	sw (r11+3248),r5
    8180:	59 6c 0c dc 	sw (r11+3292),r12
    8184:	34 03 00 00 	mvi r3,0
    8188:	34 04 03 e8 	mvi r4,1000
    818c:	f8 00 21 57 	calli 106e8 <__muldi3>
    8190:	14 23 00 1f 	sri r3,r1,31
    8194:	29 64 09 a8 	lw r4,(r11+2472)
    8198:	20 63 ff ff 	andi r3,r3,0xffff
    819c:	b4 62 10 00 	add r2,r3,r2
    81a0:	f4 62 18 00 	cmpgu r3,r3,r2
    81a4:	00 42 00 10 	srui r2,r2,16
    81a8:	b4 61 08 00 	add r1,r3,r1
    81ac:	3c 21 00 10 	sli r1,r1,16
    81b0:	29 63 09 ac 	lw r3,(r11+2476)
    81b4:	b8 22 10 00 	or r2,r1,r2
    81b8:	29 61 09 a4 	lw r1,(r11+2468)
    81bc:	59 62 0c cc 	sw (r11+3276),r2
    81c0:	59 64 0c e8 	sw (r11+3304),r4
    81c4:	14 22 00 1f 	sri r2,r1,31
    81c8:	59 61 0c e4 	sw (r11+3300),r1
    81cc:	29 61 09 94 	lw r1,(r11+2452)
    81d0:	59 62 0c e0 	sw (r11+3296),r2
    81d4:	59 63 0c ec 	sw (r11+3308),r3
    81d8:	14 22 00 1f 	sri r2,r1,31
    81dc:	59 61 0d 04 	sw (r11+3332),r1
    81e0:	29 61 09 a0 	lw r1,(r11+2464)
    81e4:	29 64 09 98 	lw r4,(r11+2456)
    81e8:	29 63 09 9c 	lw r3,(r11+2460)
    81ec:	59 61 0d 1c 	sw (r11+3356),r1
    81f0:	34 01 00 00 	mvi r1,0
    81f4:	59 6c 0c fc 	sw (r11+3324),r12
    81f8:	59 62 0d 00 	sw (r11+3328),r2
    81fc:	59 64 0d 08 	sw (r11+3336),r4
    8200:	59 63 0d 0c 	sw (r11+3340),r3
    8204:	59 60 0d 94 	sw (r11+3476),r0
    8208:	59 60 09 a0 	sw (r11+2464),r0
    820c:	2b 9d 00 04 	lw ra,(sp+4)
    8210:	2b 8b 00 0c 	lw r11,(sp+12)
    8214:	2b 8c 00 08 	lw r12,(sp+8)
    8218:	37 9c 00 0c 	addi sp,sp,12
    821c:	c3 a0 00 00 	ret

00008220 <wr_servo_update>:
    8220:	37 9c ff 58 	addi sp,sp,-168
    8224:	5b 8b 00 68 	sw (sp+104),r11
    8228:	5b 8c 00 64 	sw (sp+100),r12
    822c:	5b 8d 00 60 	sw (sp+96),r13
    8230:	5b 8e 00 5c 	sw (sp+92),r14
    8234:	5b 8f 00 58 	sw (sp+88),r15
    8238:	5b 90 00 54 	sw (sp+84),r16
    823c:	5b 91 00 50 	sw (sp+80),r17
    8240:	5b 92 00 4c 	sw (sp+76),r18
    8244:	5b 93 00 48 	sw (sp+72),r19
    8248:	5b 94 00 44 	sw (sp+68),r20
    824c:	5b 95 00 40 	sw (sp+64),r21
    8250:	5b 96 00 3c 	sw (sp+60),r22
    8254:	5b 97 00 38 	sw (sp+56),r23
    8258:	5b 98 00 34 	sw (sp+52),r24
    825c:	5b 99 00 30 	sw (sp+48),r25
    8260:	5b 9b 00 2c 	sw (sp+44),fp
    8264:	5b 9d 00 28 	sw (sp+40),ra
    8268:	b8 20 58 00 	mv r11,r1
    826c:	78 01 00 01 	mvhi r1,0x1
    8270:	38 21 7c f8 	ori r1,r1,0x7cf8
    8274:	28 23 00 a4 	lw r3,(r1+164)
    8278:	28 24 00 a0 	lw r4,(r1+160)
    827c:	34 62 00 01 	addi r2,r3,1
    8280:	f4 62 18 00 	cmpgu r3,r3,r2
    8284:	58 22 00 a4 	sw (r1+164),r2
    8288:	b4 64 18 00 	add r3,r3,r4
    828c:	58 23 00 a0 	sw (r1+160),r3
    8290:	78 01 00 01 	mvhi r1,0x1
    8294:	38 21 69 5c 	ori r1,r1,0x695c
    8298:	78 02 00 01 	mvhi r2,0x1
    829c:	58 20 00 00 	sw (r1+0),r0
    82a0:	38 42 35 5c 	ori r2,r2,0x355c
    82a4:	34 01 00 01 	mvi r1,1
    82a8:	fb ff e1 76 	calli 880 <wrc_debug_printf>
    82ac:	29 63 0c 7c 	lw r3,(r11+3196)
    82b0:	29 64 0c 9c 	lw r4,(r11+3228)
    82b4:	29 65 0c bc 	lw r5,(r11+3260)
    82b8:	29 66 0c dc 	lw r6,(r11+3292)
    82bc:	29 67 0c fc 	lw r7,(r11+3324)
    82c0:	29 68 0d 1c 	lw r8,(r11+3356)
    82c4:	78 02 00 01 	mvhi r2,0x1
    82c8:	34 01 00 01 	mvi r1,1
    82cc:	38 42 35 7c 	ori r2,r2,0x357c
    82d0:	fb ff e1 6c 	calli 880 <wrc_debug_printf>
    82d4:	29 61 0c 7c 	lw r1,(r11+3196)
    82d8:	44 20 00 03 	be r1,r0,82e4 <wr_servo_update+0xc4>
    82dc:	29 61 0c 9c 	lw r1,(r11+3228)
    82e0:	5c 20 01 3f 	bne r1,r0,87dc <wr_servo_update+0x5bc>
    82e4:	29 61 0c fc 	lw r1,(r11+3324)
    82e8:	44 20 00 07 	be r1,r0,8304 <wr_servo_update+0xe4>
    82ec:	29 61 0d 1c 	lw r1,(r11+3356)
    82f0:	44 20 00 05 	be r1,r0,8304 <wr_servo_update+0xe4>
    82f4:	29 61 0c bc 	lw r1,(r11+3260)
    82f8:	44 20 00 03 	be r1,r0,8304 <wr_servo_update+0xe4>
    82fc:	29 61 0c dc 	lw r1,(r11+3292)
    8300:	5c 20 00 05 	bne r1,r0,8314 <wr_servo_update+0xf4>
    8304:	78 02 00 01 	mvhi r2,0x1
    8308:	34 01 00 01 	mvi r1,1
    830c:	38 42 35 a8 	ori r2,r2,0x35a8
    8310:	e0 00 01 3e 	bi 8808 <wr_servo_update+0x5e8>
    8314:	78 02 00 01 	mvhi r2,0x1
    8318:	34 01 00 01 	mvi r1,1
    831c:	38 42 35 cc 	ori r2,r2,0x35cc
    8320:	fb ff e1 58 	calli 880 <wrc_debug_printf>
    8324:	29 63 0c ac 	lw r3,(r11+3244)
    8328:	29 6d 0d 0c 	lw r13,(r11+3340)
    832c:	29 76 0d 00 	lw r22,(r11+3328)
    8330:	29 78 0d 04 	lw r24,(r11+3332)
    8334:	29 75 0d 08 	lw r21,(r11+3336)
    8338:	29 74 0c a0 	lw r20,(r11+3232)
    833c:	29 69 0c a4 	lw r9,(r11+3236)
    8340:	29 64 0c a8 	lw r4,(r11+3240)
    8344:	c9 a3 18 00 	sub r3,r13,r3
    8348:	34 01 00 00 	mvi r1,0
    834c:	e0 00 00 02 	bi 8354 <wr_servo_update+0x134>
    8350:	34 63 03 e8 	addi r3,r3,1000
    8354:	b8 20 28 00 	mv r5,r1
    8358:	34 21 ff ff 	addi r1,r1,-1
    835c:	48 03 ff fd 	bg r0,r3,8350 <wr_servo_update+0x130>
    8360:	78 06 00 01 	mvhi r6,0x1
    8364:	ca a4 20 00 	sub r4,r21,r4
    8368:	38 c6 34 18 	ori r6,r6,0x3418
    836c:	b4 85 20 00 	add r4,r4,r5
    8370:	34 02 00 00 	mvi r2,0
    8374:	34 01 00 00 	mvi r1,0
    8378:	28 c5 00 00 	lw r5,(r6+0)
    837c:	e0 00 00 02 	bi 8384 <wr_servo_update+0x164>
    8380:	b4 85 20 00 	add r4,r4,r5
    8384:	b8 20 38 00 	mv r7,r1
    8388:	34 21 ff ff 	addi r1,r1,-1
    838c:	f4 e1 30 00 	cmpgu r6,r7,r1
    8390:	b8 40 90 00 	mv r18,r2
    8394:	34 42 ff ff 	addi r2,r2,-1
    8398:	b4 c2 10 00 	add r2,r6,r2
    839c:	48 04 ff f9 	bg r0,r4,8380 <wr_servo_update+0x160>
    83a0:	29 6e 0c ec 	lw r14,(r11+3308)
    83a4:	29 65 0c cc 	lw r5,(r11+3276)
    83a8:	29 77 0c e0 	lw r23,(r11+3296)
    83ac:	29 71 0c e4 	lw r17,(r11+3300)
    83b0:	29 79 0c e8 	lw r25,(r11+3304)
    83b4:	29 73 0c c0 	lw r19,(r11+3264)
    83b8:	29 66 0c c4 	lw r6,(r11+3268)
    83bc:	29 62 0c c8 	lw r2,(r11+3272)
    83c0:	c9 c5 28 00 	sub r5,r14,r5
    83c4:	34 01 00 00 	mvi r1,0
    83c8:	e0 00 00 02 	bi 83d0 <wr_servo_update+0x1b0>
    83cc:	34 a5 03 e8 	addi r5,r5,1000
    83d0:	b8 20 40 00 	mv r8,r1
    83d4:	34 21 ff ff 	addi r1,r1,-1
    83d8:	48 05 ff fd 	bg r0,r5,83cc <wr_servo_update+0x1ac>
    83dc:	78 01 00 01 	mvhi r1,0x1
    83e0:	cb 22 10 00 	sub r2,r25,r2
    83e4:	38 21 34 18 	ori r1,r1,0x3418
    83e8:	b4 48 10 00 	add r2,r2,r8
    83ec:	34 0c 00 00 	mvi r12,0
    83f0:	34 08 00 00 	mvi r8,0
    83f4:	28 2a 00 00 	lw r10,(r1+0)
    83f8:	e0 00 00 02 	bi 8400 <wr_servo_update+0x1e0>
    83fc:	b4 4a 10 00 	add r2,r2,r10
    8400:	b9 00 08 00 	mv r1,r8
    8404:	35 08 ff ff 	addi r8,r8,-1
    8408:	f4 28 78 00 	cmpgu r15,r1,r8
    840c:	b9 80 80 00 	mv r16,r12
    8410:	35 8c ff ff 	addi r12,r12,-1
    8414:	b5 ec 60 00 	add r12,r15,r12
    8418:	48 02 ff f9 	bg r0,r2,83fc <wr_servo_update+0x1dc>
    841c:	c8 06 30 00 	sub r6,r0,r6
    8420:	7c ca 00 00 	cmpnei r10,r6,0
    8424:	c8 13 98 00 	sub r19,r0,r19
    8428:	ca 6a 98 00 	sub r19,r19,r10
    842c:	c8 11 50 00 	sub r10,r0,r17
    8430:	7d 48 00 00 	cmpnei r8,r10,0
    8434:	c8 17 60 00 	sub r12,r0,r23
    8438:	c9 88 40 00 	sub r8,r12,r8
    843c:	c8 65 18 00 	sub r3,r3,r5
    8440:	34 0f 00 00 	mvi r15,0
    8444:	e0 00 00 02 	bi 844c <wr_servo_update+0x22c>
    8448:	34 63 03 e8 	addi r3,r3,1000
    844c:	b9 e0 28 00 	mv r5,r15
    8450:	35 ef ff ff 	addi r15,r15,-1
    8454:	48 03 ff fd 	bg r0,r3,8448 <wr_servo_update+0x228>
    8458:	c8 82 60 00 	sub r12,r4,r2
    845c:	78 02 00 01 	mvhi r2,0x1
    8460:	38 42 34 18 	ori r2,r2,0x3418
    8464:	b5 85 60 00 	add r12,r12,r5
    8468:	34 0f 00 00 	mvi r15,0
    846c:	34 04 00 00 	mvi r4,0
    8470:	28 5b 00 00 	lw fp,(r2+0)
    8474:	e0 00 00 02 	bi 847c <wr_servo_update+0x25c>
    8478:	b5 9b 60 00 	add r12,r12,fp
    847c:	b8 80 10 00 	mv r2,r4
    8480:	34 84 ff ff 	addi r4,r4,-1
    8484:	f4 44 e8 00 	cmpgu ra,r2,r4
    8488:	b9 e0 28 00 	mv r5,r15
    848c:	35 ef ff ff 	addi r15,r15,-1
    8490:	b7 af 78 00 	add r15,ra,r15
    8494:	48 0c ff f9 	bg r0,r12,8478 <wr_servo_update+0x258>
    8498:	c9 49 48 00 	sub r9,r10,r9
    849c:	f5 2a 50 00 	cmpgu r10,r9,r10
    84a0:	c9 14 20 00 	sub r4,r8,r20
    84a4:	b5 38 40 00 	add r8,r9,r24
    84a8:	c8 8a 50 00 	sub r10,r4,r10
    84ac:	f5 28 48 00 	cmpgu r9,r9,r8
    84b0:	b5 56 50 00 	add r10,r10,r22
    84b4:	c9 06 30 00 	sub r6,r8,r6
    84b8:	b5 2a 48 00 	add r9,r9,r10
    84bc:	f4 c8 40 00 	cmpgu r8,r6,r8
    84c0:	b4 c7 20 00 	add r4,r6,r7
    84c4:	c9 33 48 00 	sub r9,r9,r19
    84c8:	c9 28 40 00 	sub r8,r9,r8
    84cc:	f4 c4 30 00 	cmpgu r6,r6,r4
    84d0:	b5 12 90 00 	add r18,r8,r18
    84d4:	c8 81 08 00 	sub r1,r4,r1
    84d8:	b4 d2 30 00 	add r6,r6,r18
    84dc:	f4 24 20 00 	cmpgu r4,r1,r4
    84e0:	c8 d0 80 00 	sub r16,r6,r16
    84e4:	29 73 0c 38 	lw r19,(r11+3128)
    84e8:	ca 04 20 00 	sub r4,r16,r4
    84ec:	29 72 0c 40 	lw r18,(r11+3136)
    84f0:	b4 85 28 00 	add r5,r4,r5
    84f4:	29 64 0c 3c 	lw r4,(r11+3132)
    84f8:	29 6f 0c 44 	lw r15,(r11+3140)
    84fc:	b4 22 10 00 	add r2,r1,r2
    8500:	b6 72 90 00 	add r18,r19,r18
    8504:	f4 22 08 00 	cmpgu r1,r1,r2
    8508:	b6 44 90 00 	add r18,r18,r4
    850c:	b6 4f 90 00 	add r18,r18,r15
    8510:	b4 25 08 00 	add r1,r1,r5
    8514:	16 44 00 1f 	sri r4,r18,31
    8518:	14 74 00 1f 	sri r20,r3,31
    851c:	78 05 00 01 	mvhi r5,0x1
    8520:	38 a5 34 ec 	ori r5,r5,0x34ec
    8524:	c8 72 90 00 	sub r18,r3,r18
    8528:	59 63 0c 04 	sw (r11+3076),r3
    852c:	ca 84 a0 00 	sub r20,r20,r4
    8530:	f6 43 18 00 	cmpgu r3,r18,r3
    8534:	28 a4 00 00 	lw r4,(r5+0)
    8538:	ca 83 a0 00 	sub r20,r20,r3
    853c:	59 6c 0c 00 	sw (r11+3072),r12
    8540:	34 03 00 e8 	mvi r3,232
    8544:	59 61 0b f8 	sw (r11+3064),r1
    8548:	59 62 0b fc 	sw (r11+3068),r2
    854c:	f8 00 20 67 	calli 106e8 <__muldi3>
    8550:	b6 42 80 00 	add r16,r18,r2
    8554:	f6 50 90 00 	cmpgu r18,r18,r16
    8558:	b6 81 08 00 	add r1,r20,r1
    855c:	b6 41 90 00 	add r18,r18,r1
    8560:	15 81 00 1f 	sri r1,r12,31
    8564:	b9 80 10 00 	mv r2,r12
    8568:	34 03 00 00 	mvi r3,0
    856c:	34 04 03 e8 	mvi r4,1000
    8570:	f8 00 20 5e 	calli 106e8 <__muldi3>
    8574:	15 e4 00 1f 	sri r4,r15,31
    8578:	16 63 00 1f 	sri r3,r19,31
    857c:	b5 f3 30 00 	add r6,r15,r19
    8580:	b4 83 18 00 	add r3,r4,r3
    8584:	78 04 00 01 	mvhi r4,0x1
    8588:	38 84 69 60 	ori r4,r4,0x6960
    858c:	28 84 00 00 	lw r4,(r4+0)
    8590:	b6 02 10 00 	add r2,r16,r2
    8594:	f5 e6 78 00 	cmpgu r15,r15,r6
    8598:	f6 02 80 00 	cmpgu r16,r16,r2
    859c:	b5 e3 78 00 	add r15,r15,r3
    85a0:	b6 41 08 00 	add r1,r18,r1
    85a4:	14 83 00 1f 	sri r3,r4,31
    85a8:	b6 01 08 00 	add r1,r16,r1
    85ac:	b5 e3 78 00 	add r15,r15,r3
    85b0:	00 50 00 01 	srui r16,r2,1
    85b4:	3c 23 00 1f 	sli r3,r1,31
    85b8:	b4 c4 20 00 	add r4,r6,r4
    85bc:	f4 c4 30 00 	cmpgu r6,r6,r4
    85c0:	b8 70 80 00 	or r16,r3,r16
    85c4:	b4 90 80 00 	add r16,r4,r16
    85c8:	14 23 00 01 	sri r3,r1,1
    85cc:	f4 90 20 00 	cmpgu r4,r4,r16
    85d0:	b4 cf 78 00 	add r15,r6,r15
    85d4:	b5 e3 78 00 	add r15,r15,r3
    85d8:	b4 8f 78 00 	add r15,r4,r15
    85dc:	29 64 0d 28 	lw r4,(r11+3368)
    85e0:	c9 cd 70 00 	sub r14,r14,r13
    85e4:	14 83 00 1f 	sri r3,r4,31
    85e8:	f8 00 20 40 	calli 106e8 <__muldi3>
    85ec:	14 2c 00 08 	sri r12,r1,8
    85f0:	14 21 00 1f 	sri r1,r1,31
    85f4:	b6 0c 60 00 	add r12,r16,r12
    85f8:	f6 0c 80 00 	cmpgu r16,r16,r12
    85fc:	b5 e1 08 00 	add r1,r15,r1
    8600:	b6 01 78 00 	add r15,r16,r1
    8604:	b9 e0 a0 00 	mv r20,r15
    8608:	b9 80 98 00 	mv r19,r12
    860c:	34 01 00 00 	mvi r1,0
    8610:	e0 00 00 02 	bi 8618 <wr_servo_update+0x3f8>
    8614:	35 ce 03 e8 	addi r14,r14,1000
    8618:	b8 20 10 00 	mv r2,r1
    861c:	34 21 ff ff 	addi r1,r1,-1
    8620:	48 0e ff fd 	bg r0,r14,8614 <wr_servo_update+0x3f4>
    8624:	78 06 00 01 	mvhi r6,0x1
    8628:	cb 35 68 00 	sub r13,r25,r21
    862c:	38 c6 34 18 	ori r6,r6,0x3418
    8630:	b5 a2 68 00 	add r13,r13,r2
    8634:	34 01 00 00 	mvi r1,0
    8638:	34 02 00 00 	mvi r2,0
    863c:	28 c3 00 00 	lw r3,(r6+0)
    8640:	e0 00 00 02 	bi 8648 <wr_servo_update+0x428>
    8644:	b5 a3 68 00 	add r13,r13,r3
    8648:	b8 20 80 00 	mv r16,r1
    864c:	34 21 ff ff 	addi r1,r1,-1
    8650:	f6 01 20 00 	cmpgu r4,r16,r1
    8654:	b8 40 90 00 	mv r18,r2
    8658:	34 42 ff ff 	addi r2,r2,-1
    865c:	b4 82 10 00 	add r2,r4,r2
    8660:	48 0d ff f9 	bg r0,r13,8644 <wr_servo_update+0x424>
    8664:	b9 e0 08 00 	mv r1,r15
    8668:	b9 80 10 00 	mv r2,r12
    866c:	34 03 00 00 	mvi r3,0
    8670:	34 04 03 e8 	mvi r4,1000
    8674:	f8 00 21 aa 	calli 10d1c <__moddi3>
    8678:	c9 82 30 00 	sub r6,r12,r2
    867c:	f4 cc 60 00 	cmpgu r12,r6,r12
    8680:	c9 e1 08 00 	sub r1,r15,r1
    8684:	b8 40 a8 00 	mv r21,r2
    8688:	c8 2c 08 00 	sub r1,r1,r12
    868c:	b8 c0 10 00 	mv r2,r6
    8690:	34 03 00 00 	mvi r3,0
    8694:	34 04 03 e8 	mvi r4,1000
    8698:	f8 00 20 2c 	calli 10748 <__divdi3>
    869c:	78 05 00 01 	mvhi r5,0x1
    86a0:	38 a5 34 18 	ori r5,r5,0x3418
    86a4:	28 a4 00 00 	lw r4,(r5+0)
    86a8:	34 03 00 00 	mvi r3,0
    86ac:	b8 40 78 00 	mv r15,r2
    86b0:	b8 20 c8 00 	mv r25,r1
    86b4:	f8 00 21 9a 	calli 10d1c <__moddi3>
    86b8:	78 06 00 01 	mvhi r6,0x1
    86bc:	c9 e2 38 00 	sub r7,r15,r2
    86c0:	38 c6 34 18 	ori r6,r6,0x3418
    86c4:	f4 ef 78 00 	cmpgu r15,r7,r15
    86c8:	28 c4 00 00 	lw r4,(r6+0)
    86cc:	cb 21 08 00 	sub r1,r25,r1
    86d0:	34 03 00 00 	mvi r3,0
    86d4:	b8 40 60 00 	mv r12,r2
    86d8:	c8 2f 08 00 	sub r1,r1,r15
    86dc:	b8 e0 10 00 	mv r2,r7
    86e0:	f8 00 20 1a 	calli 10748 <__divdi3>
    86e4:	b8 40 40 00 	mv r8,r2
    86e8:	b5 d5 18 00 	add r3,r14,r21
    86ec:	34 07 00 00 	mvi r7,0
    86f0:	34 04 03 e7 	mvi r4,999
    86f4:	e0 00 00 02 	bi 86fc <wr_servo_update+0x4dc>
    86f8:	34 63 fc 18 	addi r3,r3,-1000
    86fc:	b8 e0 10 00 	mv r2,r7
    8700:	b8 60 a8 00 	mv r21,r3
    8704:	34 e7 00 01 	addi r7,r7,1
    8708:	48 64 ff fc 	bg r3,r4,86f8 <wr_servo_update+0x4d8>
    870c:	b5 ac 68 00 	add r13,r13,r12
    8710:	b5 a2 30 00 	add r6,r13,r2
    8714:	78 02 00 01 	mvhi r2,0x1
    8718:	38 42 34 f0 	ori r2,r2,0x34f0
    871c:	28 47 00 00 	lw r7,(r2+0)
    8720:	78 02 00 01 	mvhi r2,0x1
    8724:	38 42 34 1c 	ori r2,r2,0x341c
    8728:	34 04 00 00 	mvi r4,0
    872c:	34 0f 00 00 	mvi r15,0
    8730:	28 45 00 00 	lw r5,(r2+0)
    8734:	e0 00 00 06 	bi 874c <wr_servo_update+0x52c>
    8738:	35 e2 00 01 	addi r2,r15,1
    873c:	f5 e2 78 00 	cmpgu r15,r15,r2
    8740:	b4 c5 30 00 	add r6,r6,r5
    8744:	b5 e4 20 00 	add r4,r15,r4
    8748:	b8 40 78 00 	mv r15,r2
    874c:	b8 c0 68 00 	mv r13,r6
    8750:	48 c7 ff fa 	bg r6,r7,8738 <wr_servo_update+0x518>
    8754:	ca 38 28 00 	sub r5,r17,r24
    8758:	f4 b1 88 00 	cmpgu r17,r5,r17
    875c:	b4 a8 10 00 	add r2,r5,r8
    8760:	ca f6 b0 00 	sub r22,r23,r22
    8764:	f4 a2 28 00 	cmpgu r5,r5,r2
    8768:	ca d1 88 00 	sub r17,r22,r17
    876c:	b6 21 08 00 	add r1,r17,r1
    8770:	b4 a1 08 00 	add r1,r5,r1
    8774:	b4 50 28 00 	add r5,r2,r16
    8778:	f4 45 10 00 	cmpgu r2,r2,r5
    877c:	b4 32 90 00 	add r18,r1,r18
    8780:	b4 52 10 00 	add r2,r2,r18
    8784:	b4 44 20 00 	add r4,r2,r4
    8788:	2b 82 00 9c 	lw r2,(sp+156)
    878c:	b4 af 78 00 	add r15,r5,r15
    8790:	f4 af 28 00 	cmpgu r5,r5,r15
    8794:	5b 82 00 14 	sw (sp+20),r2
    8798:	2b 82 00 a0 	lw r2,(sp+160)
    879c:	b4 a4 80 00 	add r16,r5,r4
    87a0:	29 61 0d 2c 	lw r1,(r11+3372)
    87a4:	5b 82 00 18 	sw (sp+24),r2
    87a8:	2b 82 00 a4 	lw r2,(sp+164)
    87ac:	5b 8f 00 90 	sw (sp+144),r15
    87b0:	5b 90 00 8c 	sw (sp+140),r16
    87b4:	5b 82 00 1c 	sw (sp+28),r2
    87b8:	2b 82 00 a8 	lw r2,(sp+168)
    87bc:	5b 86 00 94 	sw (sp+148),r6
    87c0:	5b 83 00 98 	sw (sp+152),r3
    87c4:	5b 90 00 04 	sw (sp+4),r16
    87c8:	5b 8f 00 08 	sw (sp+8),r15
    87cc:	5b 86 00 0c 	sw (sp+12),r6
    87d0:	5b 83 00 10 	sw (sp+16),r3
    87d4:	5b 82 00 20 	sw (sp+32),r2
    87d8:	e0 00 01 3f 	bi 8cd4 <wr_servo_update+0xab4>
    87dc:	29 61 0c fc 	lw r1,(r11+3324)
    87e0:	44 20 00 03 	be r1,r0,87ec <wr_servo_update+0x5cc>
    87e4:	29 61 0d 1c 	lw r1,(r11+3356)
    87e8:	5c 20 01 3f 	bne r1,r0,8ce4 <wr_servo_update+0xac4>
    87ec:	29 61 0c bc 	lw r1,(r11+3260)
    87f0:	44 20 00 03 	be r1,r0,87fc <wr_servo_update+0x5dc>
    87f4:	29 61 0c dc 	lw r1,(r11+3292)
    87f8:	5c 20 00 06 	bne r1,r0,8810 <wr_servo_update+0x5f0>
    87fc:	78 02 00 01 	mvhi r2,0x1
    8800:	34 01 00 01 	mvi r1,1
    8804:	38 42 35 f0 	ori r2,r2,0x35f0
    8808:	fb ff e0 1e 	calli 880 <wrc_debug_printf>
    880c:	e0 00 03 a4 	bi 969c <wr_servo_update+0x147c>
    8810:	78 01 00 01 	mvhi r1,0x1
    8814:	38 21 69 5c 	ori r1,r1,0x695c
    8818:	28 21 00 00 	lw r1,(r1+0)
    881c:	44 20 03 a0 	be r1,r0,969c <wr_servo_update+0x147c>
    8820:	29 6e 0c 6c 	lw r14,(r11+3180)
    8824:	29 63 0c cc 	lw r3,(r11+3276)
    8828:	29 74 0c c0 	lw r20,(r11+3264)
    882c:	29 68 0c c4 	lw r8,(r11+3268)
    8830:	29 64 0c c8 	lw r4,(r11+3272)
    8834:	29 77 0c 60 	lw r23,(r11+3168)
    8838:	29 71 0c 64 	lw r17,(r11+3172)
    883c:	29 79 0c 68 	lw r25,(r11+3176)
    8840:	c8 6e 18 00 	sub r3,r3,r14
    8844:	34 01 00 00 	mvi r1,0
    8848:	e0 00 00 02 	bi 8850 <wr_servo_update+0x630>
    884c:	34 63 03 e8 	addi r3,r3,1000
    8850:	b8 20 28 00 	mv r5,r1
    8854:	34 21 ff ff 	addi r1,r1,-1
    8858:	48 03 ff fd 	bg r0,r3,884c <wr_servo_update+0x62c>
    885c:	78 06 00 01 	mvhi r6,0x1
    8860:	c8 99 20 00 	sub r4,r4,r25
    8864:	38 c6 34 18 	ori r6,r6,0x3418
    8868:	b4 85 20 00 	add r4,r4,r5
    886c:	34 02 00 00 	mvi r2,0
    8870:	34 01 00 00 	mvi r1,0
    8874:	28 c5 00 00 	lw r5,(r6+0)
    8878:	e0 00 00 02 	bi 8880 <wr_servo_update+0x660>
    887c:	b4 85 20 00 	add r4,r4,r5
    8880:	b8 20 38 00 	mv r7,r1
    8884:	34 21 ff ff 	addi r1,r1,-1
    8888:	f4 e1 30 00 	cmpgu r6,r7,r1
    888c:	b8 40 90 00 	mv r18,r2
    8890:	34 42 ff ff 	addi r2,r2,-1
    8894:	b4 c2 10 00 	add r2,r6,r2
    8898:	48 04 ff f9 	bg r0,r4,887c <wr_servo_update+0x65c>
    889c:	29 6d 0c 8c 	lw r13,(r11+3212)
    88a0:	29 65 0c ac 	lw r5,(r11+3244)
    88a4:	29 7b 0c a0 	lw fp,(r11+3232)
    88a8:	29 6a 0c a4 	lw r10,(r11+3236)
    88ac:	29 62 0c a8 	lw r2,(r11+3240)
    88b0:	29 76 0c 80 	lw r22,(r11+3200)
    88b4:	29 78 0c 84 	lw r24,(r11+3204)
    88b8:	29 75 0c 88 	lw r21,(r11+3208)
    88bc:	c8 ad 28 00 	sub r5,r5,r13
    88c0:	34 01 00 00 	mvi r1,0
    88c4:	e0 00 00 02 	bi 88cc <wr_servo_update+0x6ac>
    88c8:	34 a5 03 e8 	addi r5,r5,1000
    88cc:	b8 20 30 00 	mv r6,r1
    88d0:	34 21 ff ff 	addi r1,r1,-1
    88d4:	48 05 ff fd 	bg r0,r5,88c8 <wr_servo_update+0x6a8>
    88d8:	78 01 00 01 	mvhi r1,0x1
    88dc:	c8 55 10 00 	sub r2,r2,r21
    88e0:	38 21 34 18 	ori r1,r1,0x3418
    88e4:	b4 46 10 00 	add r2,r2,r6
    88e8:	34 0c 00 00 	mvi r12,0
    88ec:	34 06 00 00 	mvi r6,0
    88f0:	28 29 00 00 	lw r9,(r1+0)
    88f4:	e0 00 00 02 	bi 88fc <wr_servo_update+0x6dc>
    88f8:	b4 49 10 00 	add r2,r2,r9
    88fc:	b8 c0 08 00 	mv r1,r6
    8900:	34 c6 ff ff 	addi r6,r6,-1
    8904:	f4 26 78 00 	cmpgu r15,r1,r6
    8908:	b9 80 80 00 	mv r16,r12
    890c:	35 8c ff ff 	addi r12,r12,-1
    8910:	b5 ec 60 00 	add r12,r15,r12
    8914:	48 02 ff f9 	bg r0,r2,88f8 <wr_servo_update+0x6d8>
    8918:	c8 18 30 00 	sub r6,r0,r24
    891c:	7c c9 00 00 	cmpnei r9,r6,0
    8920:	c8 16 98 00 	sub r19,r0,r22
    8924:	c8 0a 50 00 	sub r10,r0,r10
    8928:	ca 69 98 00 	sub r19,r19,r9
    892c:	7d 49 00 00 	cmpnei r9,r10,0
    8930:	c8 1b d8 00 	sub fp,r0,fp
    8934:	cb 69 d8 00 	sub fp,fp,r9
    8938:	c8 65 18 00 	sub r3,r3,r5
    893c:	34 0f 00 00 	mvi r15,0
    8940:	e0 00 00 02 	bi 8948 <wr_servo_update+0x728>
    8944:	34 63 03 e8 	addi r3,r3,1000
    8948:	b9 e0 28 00 	mv r5,r15
    894c:	35 ef ff ff 	addi r15,r15,-1
    8950:	48 03 ff fd 	bg r0,r3,8944 <wr_servo_update+0x724>
    8954:	c8 82 60 00 	sub r12,r4,r2
    8958:	78 02 00 01 	mvhi r2,0x1
    895c:	38 42 34 18 	ori r2,r2,0x3418
    8960:	b5 85 60 00 	add r12,r12,r5
    8964:	34 0f 00 00 	mvi r15,0
    8968:	34 04 00 00 	mvi r4,0
    896c:	28 49 00 00 	lw r9,(r2+0)
    8970:	e0 00 00 02 	bi 8978 <wr_servo_update+0x758>
    8974:	b5 89 60 00 	add r12,r12,r9
    8978:	b8 80 10 00 	mv r2,r4
    897c:	34 84 ff ff 	addi r4,r4,-1
    8980:	f4 44 e8 00 	cmpgu ra,r2,r4
    8984:	b9 e0 28 00 	mv r5,r15
    8988:	35 ef ff ff 	addi r15,r15,-1
    898c:	b7 af 78 00 	add r15,ra,r15
    8990:	48 0c ff f9 	bg r0,r12,8974 <wr_servo_update+0x754>
    8994:	c9 51 48 00 	sub r9,r10,r17
    8998:	f5 2a 50 00 	cmpgu r10,r9,r10
    899c:	b5 28 40 00 	add r8,r9,r8
    89a0:	cb 77 20 00 	sub r4,fp,r23
    89a4:	c8 8a 50 00 	sub r10,r4,r10
    89a8:	f5 28 48 00 	cmpgu r9,r9,r8
    89ac:	b5 54 50 00 	add r10,r10,r20
    89b0:	c9 06 30 00 	sub r6,r8,r6
    89b4:	b5 2a 48 00 	add r9,r9,r10
    89b8:	f4 c8 40 00 	cmpgu r8,r6,r8
    89bc:	b4 c7 20 00 	add r4,r6,r7
    89c0:	c9 33 48 00 	sub r9,r9,r19
    89c4:	c9 28 40 00 	sub r8,r9,r8
    89c8:	f4 c4 30 00 	cmpgu r6,r6,r4
    89cc:	b5 12 90 00 	add r18,r8,r18
    89d0:	c8 81 08 00 	sub r1,r4,r1
    89d4:	b4 d2 30 00 	add r6,r6,r18
    89d8:	f4 24 20 00 	cmpgu r4,r1,r4
    89dc:	c8 d0 80 00 	sub r16,r6,r16
    89e0:	29 73 0c 38 	lw r19,(r11+3128)
    89e4:	ca 04 20 00 	sub r4,r16,r4
    89e8:	29 72 0c 40 	lw r18,(r11+3136)
    89ec:	b4 85 28 00 	add r5,r4,r5
    89f0:	29 64 0c 3c 	lw r4,(r11+3132)
    89f4:	29 6f 0c 44 	lw r15,(r11+3140)
    89f8:	b4 22 10 00 	add r2,r1,r2
    89fc:	b6 72 90 00 	add r18,r19,r18
    8a00:	f4 22 08 00 	cmpgu r1,r1,r2
    8a04:	b6 44 90 00 	add r18,r18,r4
    8a08:	b6 4f 90 00 	add r18,r18,r15
    8a0c:	b4 25 08 00 	add r1,r1,r5
    8a10:	16 44 00 1f 	sri r4,r18,31
    8a14:	14 74 00 1f 	sri r20,r3,31
    8a18:	78 05 00 01 	mvhi r5,0x1
    8a1c:	38 a5 34 ec 	ori r5,r5,0x34ec
    8a20:	c8 72 90 00 	sub r18,r3,r18
    8a24:	59 63 0c 04 	sw (r11+3076),r3
    8a28:	ca 84 a0 00 	sub r20,r20,r4
    8a2c:	f6 43 18 00 	cmpgu r3,r18,r3
    8a30:	28 a4 00 00 	lw r4,(r5+0)
    8a34:	ca 83 a0 00 	sub r20,r20,r3
    8a38:	59 6c 0c 00 	sw (r11+3072),r12
    8a3c:	34 03 00 e8 	mvi r3,232
    8a40:	59 61 0b f8 	sw (r11+3064),r1
    8a44:	59 62 0b fc 	sw (r11+3068),r2
    8a48:	f8 00 1f 28 	calli 106e8 <__muldi3>
    8a4c:	b6 42 80 00 	add r16,r18,r2
    8a50:	f6 50 90 00 	cmpgu r18,r18,r16
    8a54:	b6 81 08 00 	add r1,r20,r1
    8a58:	b6 41 90 00 	add r18,r18,r1
    8a5c:	15 81 00 1f 	sri r1,r12,31
    8a60:	b9 80 10 00 	mv r2,r12
    8a64:	34 03 00 00 	mvi r3,0
    8a68:	34 04 03 e8 	mvi r4,1000
    8a6c:	f8 00 1f 1f 	calli 106e8 <__muldi3>
    8a70:	15 e4 00 1f 	sri r4,r15,31
    8a74:	16 63 00 1f 	sri r3,r19,31
    8a78:	b5 f3 30 00 	add r6,r15,r19
    8a7c:	b4 83 18 00 	add r3,r4,r3
    8a80:	78 04 00 01 	mvhi r4,0x1
    8a84:	38 84 69 60 	ori r4,r4,0x6960
    8a88:	28 84 00 00 	lw r4,(r4+0)
    8a8c:	b6 02 10 00 	add r2,r16,r2
    8a90:	f5 e6 78 00 	cmpgu r15,r15,r6
    8a94:	f6 02 80 00 	cmpgu r16,r16,r2
    8a98:	b5 e3 78 00 	add r15,r15,r3
    8a9c:	b6 41 08 00 	add r1,r18,r1
    8aa0:	14 83 00 1f 	sri r3,r4,31
    8aa4:	b6 01 08 00 	add r1,r16,r1
    8aa8:	b5 e3 78 00 	add r15,r15,r3
    8aac:	00 50 00 01 	srui r16,r2,1
    8ab0:	3c 23 00 1f 	sli r3,r1,31
    8ab4:	b4 c4 20 00 	add r4,r6,r4
    8ab8:	f4 c4 30 00 	cmpgu r6,r6,r4
    8abc:	b8 70 80 00 	or r16,r3,r16
    8ac0:	b4 90 80 00 	add r16,r4,r16
    8ac4:	14 23 00 01 	sri r3,r1,1
    8ac8:	f4 90 20 00 	cmpgu r4,r4,r16
    8acc:	b4 cf 78 00 	add r15,r6,r15
    8ad0:	b5 e3 78 00 	add r15,r15,r3
    8ad4:	b4 8f 78 00 	add r15,r4,r15
    8ad8:	29 64 0d 28 	lw r4,(r11+3368)
    8adc:	c9 cd 70 00 	sub r14,r14,r13
    8ae0:	14 83 00 1f 	sri r3,r4,31
    8ae4:	f8 00 1f 01 	calli 106e8 <__muldi3>
    8ae8:	14 2c 00 08 	sri r12,r1,8
    8aec:	14 21 00 1f 	sri r1,r1,31
    8af0:	b6 0c 60 00 	add r12,r16,r12
    8af4:	f6 0c 80 00 	cmpgu r16,r16,r12
    8af8:	b5 e1 08 00 	add r1,r15,r1
    8afc:	b6 01 78 00 	add r15,r16,r1
    8b00:	b9 e0 a0 00 	mv r20,r15
    8b04:	b9 80 98 00 	mv r19,r12
    8b08:	34 01 00 00 	mvi r1,0
    8b0c:	e0 00 00 02 	bi 8b14 <wr_servo_update+0x8f4>
    8b10:	35 ce 03 e8 	addi r14,r14,1000
    8b14:	b8 20 10 00 	mv r2,r1
    8b18:	34 21 ff ff 	addi r1,r1,-1
    8b1c:	48 0e ff fd 	bg r0,r14,8b10 <wr_servo_update+0x8f0>
    8b20:	78 06 00 01 	mvhi r6,0x1
    8b24:	cb 35 68 00 	sub r13,r25,r21
    8b28:	38 c6 34 18 	ori r6,r6,0x3418
    8b2c:	b5 a2 68 00 	add r13,r13,r2
    8b30:	34 01 00 00 	mvi r1,0
    8b34:	34 02 00 00 	mvi r2,0
    8b38:	28 c3 00 00 	lw r3,(r6+0)
    8b3c:	e0 00 00 02 	bi 8b44 <wr_servo_update+0x924>
    8b40:	b5 a3 68 00 	add r13,r13,r3
    8b44:	b8 20 80 00 	mv r16,r1
    8b48:	34 21 ff ff 	addi r1,r1,-1
    8b4c:	f6 01 20 00 	cmpgu r4,r16,r1
    8b50:	b8 40 90 00 	mv r18,r2
    8b54:	34 42 ff ff 	addi r2,r2,-1
    8b58:	b4 82 10 00 	add r2,r4,r2
    8b5c:	48 0d ff f9 	bg r0,r13,8b40 <wr_servo_update+0x920>
    8b60:	b9 e0 08 00 	mv r1,r15
    8b64:	b9 80 10 00 	mv r2,r12
    8b68:	34 03 00 00 	mvi r3,0
    8b6c:	34 04 03 e8 	mvi r4,1000
    8b70:	f8 00 20 6b 	calli 10d1c <__moddi3>
    8b74:	c9 82 30 00 	sub r6,r12,r2
    8b78:	f4 cc 60 00 	cmpgu r12,r6,r12
    8b7c:	c9 e1 08 00 	sub r1,r15,r1
    8b80:	b8 40 a8 00 	mv r21,r2
    8b84:	c8 2c 08 00 	sub r1,r1,r12
    8b88:	b8 c0 10 00 	mv r2,r6
    8b8c:	34 03 00 00 	mvi r3,0
    8b90:	34 04 03 e8 	mvi r4,1000
    8b94:	f8 00 1e ed 	calli 10748 <__divdi3>
    8b98:	78 05 00 01 	mvhi r5,0x1
    8b9c:	38 a5 34 18 	ori r5,r5,0x3418
    8ba0:	28 a4 00 00 	lw r4,(r5+0)
    8ba4:	34 03 00 00 	mvi r3,0
    8ba8:	b8 40 78 00 	mv r15,r2
    8bac:	b8 20 c8 00 	mv r25,r1
    8bb0:	f8 00 20 5b 	calli 10d1c <__moddi3>
    8bb4:	78 06 00 01 	mvhi r6,0x1
    8bb8:	c9 e2 38 00 	sub r7,r15,r2
    8bbc:	38 c6 34 18 	ori r6,r6,0x3418
    8bc0:	f4 ef 78 00 	cmpgu r15,r7,r15
    8bc4:	28 c4 00 00 	lw r4,(r6+0)
    8bc8:	cb 21 08 00 	sub r1,r25,r1
    8bcc:	34 03 00 00 	mvi r3,0
    8bd0:	b8 40 60 00 	mv r12,r2
    8bd4:	c8 2f 08 00 	sub r1,r1,r15
    8bd8:	b8 e0 10 00 	mv r2,r7
    8bdc:	f8 00 1e db 	calli 10748 <__divdi3>
    8be0:	b8 40 40 00 	mv r8,r2
    8be4:	b5 d5 18 00 	add r3,r14,r21
    8be8:	34 07 00 00 	mvi r7,0
    8bec:	34 04 03 e7 	mvi r4,999
    8bf0:	e0 00 00 02 	bi 8bf8 <wr_servo_update+0x9d8>
    8bf4:	34 63 fc 18 	addi r3,r3,-1000
    8bf8:	b8 e0 10 00 	mv r2,r7
    8bfc:	b8 60 a8 00 	mv r21,r3
    8c00:	34 e7 00 01 	addi r7,r7,1
    8c04:	48 64 ff fc 	bg r3,r4,8bf4 <wr_servo_update+0x9d4>
    8c08:	b5 ac 68 00 	add r13,r13,r12
    8c0c:	b5 a2 30 00 	add r6,r13,r2
    8c10:	78 02 00 01 	mvhi r2,0x1
    8c14:	38 42 34 f0 	ori r2,r2,0x34f0
    8c18:	28 47 00 00 	lw r7,(r2+0)
    8c1c:	78 02 00 01 	mvhi r2,0x1
    8c20:	38 42 34 1c 	ori r2,r2,0x341c
    8c24:	34 04 00 00 	mvi r4,0
    8c28:	34 0f 00 00 	mvi r15,0
    8c2c:	28 45 00 00 	lw r5,(r2+0)
    8c30:	e0 00 00 06 	bi 8c48 <wr_servo_update+0xa28>
    8c34:	35 e2 00 01 	addi r2,r15,1
    8c38:	f5 e2 78 00 	cmpgu r15,r15,r2
    8c3c:	b4 c5 30 00 	add r6,r6,r5
    8c40:	b5 e4 20 00 	add r4,r15,r4
    8c44:	b8 40 78 00 	mv r15,r2
    8c48:	b8 c0 68 00 	mv r13,r6
    8c4c:	48 c7 ff fa 	bg r6,r7,8c34 <wr_servo_update+0xa14>
    8c50:	ca 38 28 00 	sub r5,r17,r24
    8c54:	f4 b1 88 00 	cmpgu r17,r5,r17
    8c58:	b4 a8 10 00 	add r2,r5,r8
    8c5c:	ca f6 b0 00 	sub r22,r23,r22
    8c60:	f4 a2 28 00 	cmpgu r5,r5,r2
    8c64:	ca d1 88 00 	sub r17,r22,r17
    8c68:	b6 21 08 00 	add r1,r17,r1
    8c6c:	b4 a1 08 00 	add r1,r5,r1
    8c70:	b4 32 90 00 	add r18,r1,r18
    8c74:	2b 81 00 9c 	lw r1,(sp+156)
    8c78:	b4 50 28 00 	add r5,r2,r16
    8c7c:	f4 45 10 00 	cmpgu r2,r2,r5
    8c80:	5b 81 00 14 	sw (sp+20),r1
    8c84:	2b 81 00 a0 	lw r1,(sp+160)
    8c88:	b4 af 78 00 	add r15,r5,r15
    8c8c:	b4 52 10 00 	add r2,r2,r18
    8c90:	5b 81 00 18 	sw (sp+24),r1
    8c94:	2b 81 00 a4 	lw r1,(sp+164)
    8c98:	f4 af 28 00 	cmpgu r5,r5,r15
    8c9c:	b4 44 20 00 	add r4,r2,r4
    8ca0:	5b 81 00 1c 	sw (sp+28),r1
    8ca4:	2b 81 00 a8 	lw r1,(sp+168)
    8ca8:	b4 a4 80 00 	add r16,r5,r4
    8cac:	5b 8f 00 90 	sw (sp+144),r15
    8cb0:	5b 81 00 20 	sw (sp+32),r1
    8cb4:	29 61 0d 2c 	lw r1,(r11+3372)
    8cb8:	5b 90 00 8c 	sw (sp+140),r16
    8cbc:	5b 86 00 94 	sw (sp+148),r6
    8cc0:	5b 83 00 98 	sw (sp+152),r3
    8cc4:	5b 90 00 04 	sw (sp+4),r16
    8cc8:	5b 8f 00 08 	sw (sp+8),r15
    8ccc:	5b 86 00 0c 	sw (sp+12),r6
    8cd0:	5b 83 00 10 	sw (sp+16),r3
    8cd4:	5b 81 00 24 	sw (sp+36),r1
    8cd8:	37 81 00 6c 	addi r1,sp,108
    8cdc:	fb ff fb fd 	calli 7cd0 <ts_hardwarize>
    8ce0:	e0 00 01 3f 	bi 91dc <wr_servo_update+0xfbc>
    8ce4:	29 61 0c bc 	lw r1,(r11+3260)
    8ce8:	44 20 00 03 	be r1,r0,8cf4 <wr_servo_update+0xad4>
    8cec:	29 61 0c dc 	lw r1,(r11+3292)
    8cf0:	5c 20 00 05 	bne r1,r0,8d04 <wr_servo_update+0xae4>
    8cf4:	78 02 00 01 	mvhi r2,0x1
    8cf8:	34 01 00 01 	mvi r1,1
    8cfc:	38 42 36 10 	ori r2,r2,0x3610
    8d00:	e3 ff fe c2 	bi 8808 <wr_servo_update+0x5e8>
    8d04:	78 02 00 01 	mvhi r2,0x1
    8d08:	34 01 00 01 	mvi r1,1
    8d0c:	38 42 36 2c 	ori r2,r2,0x362c
    8d10:	fb ff de dc 	calli 880 <wrc_debug_printf>
    8d14:	29 63 0c ac 	lw r3,(r11+3244)
    8d18:	29 6d 0d 0c 	lw r13,(r11+3340)
    8d1c:	29 76 0d 00 	lw r22,(r11+3328)
    8d20:	29 78 0d 04 	lw r24,(r11+3332)
    8d24:	29 75 0d 08 	lw r21,(r11+3336)
    8d28:	29 74 0c a0 	lw r20,(r11+3232)
    8d2c:	29 69 0c a4 	lw r9,(r11+3236)
    8d30:	29 64 0c a8 	lw r4,(r11+3240)
    8d34:	c9 a3 18 00 	sub r3,r13,r3
    8d38:	34 01 00 00 	mvi r1,0
    8d3c:	e0 00 00 02 	bi 8d44 <wr_servo_update+0xb24>
    8d40:	34 63 03 e8 	addi r3,r3,1000
    8d44:	b8 20 28 00 	mv r5,r1
    8d48:	34 21 ff ff 	addi r1,r1,-1
    8d4c:	48 03 ff fd 	bg r0,r3,8d40 <wr_servo_update+0xb20>
    8d50:	78 06 00 01 	mvhi r6,0x1
    8d54:	ca a4 20 00 	sub r4,r21,r4
    8d58:	38 c6 34 18 	ori r6,r6,0x3418
    8d5c:	b4 85 20 00 	add r4,r4,r5
    8d60:	34 02 00 00 	mvi r2,0
    8d64:	34 01 00 00 	mvi r1,0
    8d68:	28 c5 00 00 	lw r5,(r6+0)
    8d6c:	e0 00 00 02 	bi 8d74 <wr_servo_update+0xb54>
    8d70:	b4 85 20 00 	add r4,r4,r5
    8d74:	b8 20 38 00 	mv r7,r1
    8d78:	34 21 ff ff 	addi r1,r1,-1
    8d7c:	f4 e1 30 00 	cmpgu r6,r7,r1
    8d80:	b8 40 90 00 	mv r18,r2
    8d84:	34 42 ff ff 	addi r2,r2,-1
    8d88:	b4 c2 10 00 	add r2,r6,r2
    8d8c:	48 04 ff f9 	bg r0,r4,8d70 <wr_servo_update+0xb50>
    8d90:	29 6e 0c ec 	lw r14,(r11+3308)
    8d94:	29 65 0c cc 	lw r5,(r11+3276)
    8d98:	29 77 0c e0 	lw r23,(r11+3296)
    8d9c:	29 71 0c e4 	lw r17,(r11+3300)
    8da0:	29 79 0c e8 	lw r25,(r11+3304)
    8da4:	29 73 0c c0 	lw r19,(r11+3264)
    8da8:	29 66 0c c4 	lw r6,(r11+3268)
    8dac:	29 62 0c c8 	lw r2,(r11+3272)
    8db0:	c9 c5 28 00 	sub r5,r14,r5
    8db4:	34 01 00 00 	mvi r1,0
    8db8:	e0 00 00 02 	bi 8dc0 <wr_servo_update+0xba0>
    8dbc:	34 a5 03 e8 	addi r5,r5,1000
    8dc0:	b8 20 40 00 	mv r8,r1
    8dc4:	34 21 ff ff 	addi r1,r1,-1
    8dc8:	48 05 ff fd 	bg r0,r5,8dbc <wr_servo_update+0xb9c>
    8dcc:	78 01 00 01 	mvhi r1,0x1
    8dd0:	cb 22 10 00 	sub r2,r25,r2
    8dd4:	38 21 34 18 	ori r1,r1,0x3418
    8dd8:	b4 48 10 00 	add r2,r2,r8
    8ddc:	34 0c 00 00 	mvi r12,0
    8de0:	34 08 00 00 	mvi r8,0
    8de4:	28 2a 00 00 	lw r10,(r1+0)
    8de8:	e0 00 00 02 	bi 8df0 <wr_servo_update+0xbd0>
    8dec:	b4 4a 10 00 	add r2,r2,r10
    8df0:	b9 00 08 00 	mv r1,r8
    8df4:	35 08 ff ff 	addi r8,r8,-1
    8df8:	f4 28 78 00 	cmpgu r15,r1,r8
    8dfc:	b9 80 80 00 	mv r16,r12
    8e00:	35 8c ff ff 	addi r12,r12,-1
    8e04:	b5 ec 60 00 	add r12,r15,r12
    8e08:	48 02 ff f9 	bg r0,r2,8dec <wr_servo_update+0xbcc>
    8e0c:	c8 06 30 00 	sub r6,r0,r6
    8e10:	7c ca 00 00 	cmpnei r10,r6,0
    8e14:	c8 13 98 00 	sub r19,r0,r19
    8e18:	ca 6a 98 00 	sub r19,r19,r10
    8e1c:	c8 11 50 00 	sub r10,r0,r17
    8e20:	7d 48 00 00 	cmpnei r8,r10,0
    8e24:	c8 17 60 00 	sub r12,r0,r23
    8e28:	c9 88 40 00 	sub r8,r12,r8
    8e2c:	c8 65 18 00 	sub r3,r3,r5
    8e30:	34 0f 00 00 	mvi r15,0
    8e34:	e0 00 00 02 	bi 8e3c <wr_servo_update+0xc1c>
    8e38:	34 63 03 e8 	addi r3,r3,1000
    8e3c:	b9 e0 28 00 	mv r5,r15
    8e40:	35 ef ff ff 	addi r15,r15,-1
    8e44:	48 03 ff fd 	bg r0,r3,8e38 <wr_servo_update+0xc18>
    8e48:	c8 82 60 00 	sub r12,r4,r2
    8e4c:	78 02 00 01 	mvhi r2,0x1
    8e50:	38 42 34 18 	ori r2,r2,0x3418
    8e54:	b5 85 60 00 	add r12,r12,r5
    8e58:	34 0f 00 00 	mvi r15,0
    8e5c:	34 04 00 00 	mvi r4,0
    8e60:	28 5b 00 00 	lw fp,(r2+0)
    8e64:	e0 00 00 02 	bi 8e6c <wr_servo_update+0xc4c>
    8e68:	b5 9b 60 00 	add r12,r12,fp
    8e6c:	b8 80 10 00 	mv r2,r4
    8e70:	34 84 ff ff 	addi r4,r4,-1
    8e74:	f4 44 e8 00 	cmpgu ra,r2,r4
    8e78:	b9 e0 28 00 	mv r5,r15
    8e7c:	35 ef ff ff 	addi r15,r15,-1
    8e80:	b7 af 78 00 	add r15,ra,r15
    8e84:	48 0c ff f9 	bg r0,r12,8e68 <wr_servo_update+0xc48>
    8e88:	c9 49 48 00 	sub r9,r10,r9
    8e8c:	f5 2a 50 00 	cmpgu r10,r9,r10
    8e90:	c9 14 20 00 	sub r4,r8,r20
    8e94:	b5 38 40 00 	add r8,r9,r24
    8e98:	c8 8a 50 00 	sub r10,r4,r10
    8e9c:	f5 28 48 00 	cmpgu r9,r9,r8
    8ea0:	b5 56 50 00 	add r10,r10,r22
    8ea4:	c9 06 30 00 	sub r6,r8,r6
    8ea8:	b5 2a 48 00 	add r9,r9,r10
    8eac:	f4 c8 40 00 	cmpgu r8,r6,r8
    8eb0:	b4 c7 20 00 	add r4,r6,r7
    8eb4:	c9 33 48 00 	sub r9,r9,r19
    8eb8:	c9 28 40 00 	sub r8,r9,r8
    8ebc:	f4 c4 30 00 	cmpgu r6,r6,r4
    8ec0:	b5 12 90 00 	add r18,r8,r18
    8ec4:	c8 81 08 00 	sub r1,r4,r1
    8ec8:	b4 d2 30 00 	add r6,r6,r18
    8ecc:	f4 24 20 00 	cmpgu r4,r1,r4
    8ed0:	c8 d0 80 00 	sub r16,r6,r16
    8ed4:	29 73 0c 38 	lw r19,(r11+3128)
    8ed8:	ca 04 20 00 	sub r4,r16,r4
    8edc:	29 72 0c 40 	lw r18,(r11+3136)
    8ee0:	b4 85 28 00 	add r5,r4,r5
    8ee4:	29 64 0c 3c 	lw r4,(r11+3132)
    8ee8:	29 6f 0c 44 	lw r15,(r11+3140)
    8eec:	b4 22 10 00 	add r2,r1,r2
    8ef0:	b6 72 90 00 	add r18,r19,r18
    8ef4:	f4 22 08 00 	cmpgu r1,r1,r2
    8ef8:	b6 44 90 00 	add r18,r18,r4
    8efc:	b6 4f 90 00 	add r18,r18,r15
    8f00:	b4 25 08 00 	add r1,r1,r5
    8f04:	16 44 00 1f 	sri r4,r18,31
    8f08:	14 74 00 1f 	sri r20,r3,31
    8f0c:	78 05 00 01 	mvhi r5,0x1
    8f10:	38 a5 34 ec 	ori r5,r5,0x34ec
    8f14:	c8 72 90 00 	sub r18,r3,r18
    8f18:	59 63 0c 04 	sw (r11+3076),r3
    8f1c:	ca 84 a0 00 	sub r20,r20,r4
    8f20:	f6 43 18 00 	cmpgu r3,r18,r3
    8f24:	28 a4 00 00 	lw r4,(r5+0)
    8f28:	ca 83 a0 00 	sub r20,r20,r3
    8f2c:	59 6c 0c 00 	sw (r11+3072),r12
    8f30:	34 03 00 e8 	mvi r3,232
    8f34:	59 61 0b f8 	sw (r11+3064),r1
    8f38:	59 62 0b fc 	sw (r11+3068),r2
    8f3c:	f8 00 1d eb 	calli 106e8 <__muldi3>
    8f40:	b6 42 80 00 	add r16,r18,r2
    8f44:	f6 50 90 00 	cmpgu r18,r18,r16
    8f48:	b6 81 08 00 	add r1,r20,r1
    8f4c:	b6 41 90 00 	add r18,r18,r1
    8f50:	15 81 00 1f 	sri r1,r12,31
    8f54:	b9 80 10 00 	mv r2,r12
    8f58:	34 03 00 00 	mvi r3,0
    8f5c:	34 04 03 e8 	mvi r4,1000
    8f60:	f8 00 1d e2 	calli 106e8 <__muldi3>
    8f64:	15 e4 00 1f 	sri r4,r15,31
    8f68:	16 63 00 1f 	sri r3,r19,31
    8f6c:	b5 f3 30 00 	add r6,r15,r19
    8f70:	b4 83 18 00 	add r3,r4,r3
    8f74:	78 04 00 01 	mvhi r4,0x1
    8f78:	38 84 69 60 	ori r4,r4,0x6960
    8f7c:	28 84 00 00 	lw r4,(r4+0)
    8f80:	b6 02 10 00 	add r2,r16,r2
    8f84:	f5 e6 78 00 	cmpgu r15,r15,r6
    8f88:	f6 02 80 00 	cmpgu r16,r16,r2
    8f8c:	b5 e3 78 00 	add r15,r15,r3
    8f90:	b6 41 08 00 	add r1,r18,r1
    8f94:	14 83 00 1f 	sri r3,r4,31
    8f98:	b6 01 08 00 	add r1,r16,r1
    8f9c:	b5 e3 78 00 	add r15,r15,r3
    8fa0:	00 50 00 01 	srui r16,r2,1
    8fa4:	3c 23 00 1f 	sli r3,r1,31
    8fa8:	b4 c4 20 00 	add r4,r6,r4
    8fac:	f4 c4 30 00 	cmpgu r6,r6,r4
    8fb0:	b8 70 80 00 	or r16,r3,r16
    8fb4:	b4 90 80 00 	add r16,r4,r16
    8fb8:	14 23 00 01 	sri r3,r1,1
    8fbc:	f4 90 20 00 	cmpgu r4,r4,r16
    8fc0:	b4 cf 78 00 	add r15,r6,r15
    8fc4:	b5 e3 78 00 	add r15,r15,r3
    8fc8:	b4 8f 78 00 	add r15,r4,r15
    8fcc:	29 64 0d 28 	lw r4,(r11+3368)
    8fd0:	c9 cd 70 00 	sub r14,r14,r13
    8fd4:	14 83 00 1f 	sri r3,r4,31
    8fd8:	f8 00 1d c4 	calli 106e8 <__muldi3>
    8fdc:	14 2c 00 08 	sri r12,r1,8
    8fe0:	14 21 00 1f 	sri r1,r1,31
    8fe4:	b6 0c 60 00 	add r12,r16,r12
    8fe8:	f6 0c 80 00 	cmpgu r16,r16,r12
    8fec:	b5 e1 08 00 	add r1,r15,r1
    8ff0:	b6 01 78 00 	add r15,r16,r1
    8ff4:	b9 e0 a0 00 	mv r20,r15
    8ff8:	b9 80 98 00 	mv r19,r12
    8ffc:	34 01 00 00 	mvi r1,0
    9000:	e0 00 00 02 	bi 9008 <wr_servo_update+0xde8>
    9004:	35 ce 03 e8 	addi r14,r14,1000
    9008:	b8 20 10 00 	mv r2,r1
    900c:	34 21 ff ff 	addi r1,r1,-1
    9010:	48 0e ff fd 	bg r0,r14,9004 <wr_servo_update+0xde4>
    9014:	78 06 00 01 	mvhi r6,0x1
    9018:	cb 35 68 00 	sub r13,r25,r21
    901c:	38 c6 34 18 	ori r6,r6,0x3418
    9020:	b5 a2 68 00 	add r13,r13,r2
    9024:	34 01 00 00 	mvi r1,0
    9028:	34 02 00 00 	mvi r2,0
    902c:	28 c3 00 00 	lw r3,(r6+0)
    9030:	e0 00 00 02 	bi 9038 <wr_servo_update+0xe18>
    9034:	b5 a3 68 00 	add r13,r13,r3
    9038:	b8 20 80 00 	mv r16,r1
    903c:	34 21 ff ff 	addi r1,r1,-1
    9040:	f6 01 20 00 	cmpgu r4,r16,r1
    9044:	b8 40 90 00 	mv r18,r2
    9048:	34 42 ff ff 	addi r2,r2,-1
    904c:	b4 82 10 00 	add r2,r4,r2
    9050:	48 0d ff f9 	bg r0,r13,9034 <wr_servo_update+0xe14>
    9054:	b9 e0 08 00 	mv r1,r15
    9058:	b9 80 10 00 	mv r2,r12
    905c:	34 03 00 00 	mvi r3,0
    9060:	34 04 03 e8 	mvi r4,1000
    9064:	f8 00 1f 2e 	calli 10d1c <__moddi3>
    9068:	c9 82 30 00 	sub r6,r12,r2
    906c:	f4 cc 60 00 	cmpgu r12,r6,r12
    9070:	c9 e1 08 00 	sub r1,r15,r1
    9074:	b8 40 a8 00 	mv r21,r2
    9078:	c8 2c 08 00 	sub r1,r1,r12
    907c:	b8 c0 10 00 	mv r2,r6
    9080:	34 03 00 00 	mvi r3,0
    9084:	34 04 03 e8 	mvi r4,1000
    9088:	f8 00 1d b0 	calli 10748 <__divdi3>
    908c:	78 05 00 01 	mvhi r5,0x1
    9090:	38 a5 34 18 	ori r5,r5,0x3418
    9094:	28 a4 00 00 	lw r4,(r5+0)
    9098:	34 03 00 00 	mvi r3,0
    909c:	b8 40 78 00 	mv r15,r2
    90a0:	b8 20 c8 00 	mv r25,r1
    90a4:	f8 00 1f 1e 	calli 10d1c <__moddi3>
    90a8:	78 06 00 01 	mvhi r6,0x1
    90ac:	c9 e2 38 00 	sub r7,r15,r2
    90b0:	38 c6 34 18 	ori r6,r6,0x3418
    90b4:	f4 ef 78 00 	cmpgu r15,r7,r15
    90b8:	28 c4 00 00 	lw r4,(r6+0)
    90bc:	cb 21 08 00 	sub r1,r25,r1
    90c0:	34 03 00 00 	mvi r3,0
    90c4:	b8 40 60 00 	mv r12,r2
    90c8:	c8 2f 08 00 	sub r1,r1,r15
    90cc:	b8 e0 10 00 	mv r2,r7
    90d0:	f8 00 1d 9e 	calli 10748 <__divdi3>
    90d4:	b8 40 40 00 	mv r8,r2
    90d8:	b5 d5 18 00 	add r3,r14,r21
    90dc:	34 07 00 00 	mvi r7,0
    90e0:	34 04 03 e7 	mvi r4,999
    90e4:	e0 00 00 02 	bi 90ec <wr_servo_update+0xecc>
    90e8:	34 63 fc 18 	addi r3,r3,-1000
    90ec:	b8 e0 10 00 	mv r2,r7
    90f0:	b8 60 a8 00 	mv r21,r3
    90f4:	34 e7 00 01 	addi r7,r7,1
    90f8:	48 64 ff fc 	bg r3,r4,90e8 <wr_servo_update+0xec8>
    90fc:	b5 ac 68 00 	add r13,r13,r12
    9100:	b5 a2 30 00 	add r6,r13,r2
    9104:	78 02 00 01 	mvhi r2,0x1
    9108:	38 42 34 f0 	ori r2,r2,0x34f0
    910c:	28 47 00 00 	lw r7,(r2+0)
    9110:	78 02 00 01 	mvhi r2,0x1
    9114:	38 42 34 1c 	ori r2,r2,0x341c
    9118:	34 04 00 00 	mvi r4,0
    911c:	34 0f 00 00 	mvi r15,0
    9120:	28 45 00 00 	lw r5,(r2+0)
    9124:	e0 00 00 06 	bi 913c <wr_servo_update+0xf1c>
    9128:	35 e2 00 01 	addi r2,r15,1
    912c:	f5 e2 78 00 	cmpgu r15,r15,r2
    9130:	b4 c5 30 00 	add r6,r6,r5
    9134:	b5 e4 20 00 	add r4,r15,r4
    9138:	b8 40 78 00 	mv r15,r2
    913c:	b8 c0 68 00 	mv r13,r6
    9140:	48 c7 ff fa 	bg r6,r7,9128 <wr_servo_update+0xf08>
    9144:	ca 38 28 00 	sub r5,r17,r24
    9148:	f4 b1 88 00 	cmpgu r17,r5,r17
    914c:	b4 a8 10 00 	add r2,r5,r8
    9150:	ca f6 b0 00 	sub r22,r23,r22
    9154:	f4 a2 28 00 	cmpgu r5,r5,r2
    9158:	ca d1 88 00 	sub r17,r22,r17
    915c:	b6 21 08 00 	add r1,r17,r1
    9160:	b4 a1 08 00 	add r1,r5,r1
    9164:	b4 32 90 00 	add r18,r1,r18
    9168:	2b 81 00 9c 	lw r1,(sp+156)
    916c:	b4 50 28 00 	add r5,r2,r16
    9170:	f4 45 10 00 	cmpgu r2,r2,r5
    9174:	5b 81 00 14 	sw (sp+20),r1
    9178:	2b 81 00 a0 	lw r1,(sp+160)
    917c:	b4 af 78 00 	add r15,r5,r15
    9180:	b4 52 10 00 	add r2,r2,r18
    9184:	5b 81 00 18 	sw (sp+24),r1
    9188:	2b 81 00 a4 	lw r1,(sp+164)
    918c:	f4 af 28 00 	cmpgu r5,r5,r15
    9190:	b4 44 20 00 	add r4,r2,r4
    9194:	5b 81 00 1c 	sw (sp+28),r1
    9198:	2b 81 00 a8 	lw r1,(sp+168)
    919c:	b4 a4 80 00 	add r16,r5,r4
    91a0:	5b 8f 00 90 	sw (sp+144),r15
    91a4:	5b 81 00 20 	sw (sp+32),r1
    91a8:	29 61 0d 2c 	lw r1,(r11+3372)
    91ac:	5b 90 00 8c 	sw (sp+140),r16
    91b0:	5b 86 00 94 	sw (sp+148),r6
    91b4:	5b 81 00 24 	sw (sp+36),r1
    91b8:	37 81 00 6c 	addi r1,sp,108
    91bc:	5b 83 00 98 	sw (sp+152),r3
    91c0:	5b 90 00 04 	sw (sp+4),r16
    91c4:	5b 8f 00 08 	sw (sp+8),r15
    91c8:	5b 86 00 0c 	sw (sp+12),r6
    91cc:	5b 83 00 10 	sw (sp+16),r3
    91d0:	fb ff fa c0 	calli 7cd0 <ts_hardwarize>
    91d4:	59 60 0c 9c 	sw (r11+3228),r0
    91d8:	59 60 0c 7c 	sw (r11+3196),r0
    91dc:	29 63 0c 64 	lw r3,(r11+3172)
    91e0:	29 64 0c 68 	lw r4,(r11+3176)
    91e4:	29 65 0c 6c 	lw r5,(r11+3180)
    91e8:	78 0c 00 01 	mvhi r12,0x1
    91ec:	39 8c 36 4c 	ori r12,r12,0x364c
    91f0:	78 02 00 01 	mvhi r2,0x1
    91f4:	b9 80 08 00 	mv r1,r12
    91f8:	38 42 36 5c 	ori r2,r2,0x365c
    91fc:	2b 96 00 78 	lw r22,(sp+120)
    9200:	2b 8e 00 74 	lw r14,(sp+116)
    9204:	2b 92 00 6c 	lw r18,(sp+108)
    9208:	2b 91 00 70 	lw r17,(sp+112)
    920c:	fb ff eb 1f 	calli 3e88 <mprintf>
    9210:	29 63 0c 84 	lw r3,(r11+3204)
    9214:	29 64 0c 88 	lw r4,(r11+3208)
    9218:	29 65 0c 8c 	lw r5,(r11+3212)
    921c:	78 02 00 01 	mvhi r2,0x1
    9220:	b9 80 08 00 	mv r1,r12
    9224:	38 42 36 64 	ori r2,r2,0x3664
    9228:	fb ff eb 18 	calli 3e88 <mprintf>
    922c:	29 63 0c a4 	lw r3,(r11+3236)
    9230:	29 64 0c a8 	lw r4,(r11+3240)
    9234:	29 65 0c ac 	lw r5,(r11+3244)
    9238:	78 02 00 01 	mvhi r2,0x1
    923c:	b9 80 08 00 	mv r1,r12
    9240:	38 42 36 6c 	ori r2,r2,0x366c
    9244:	fb ff eb 11 	calli 3e88 <mprintf>
    9248:	29 63 0c c4 	lw r3,(r11+3268)
    924c:	29 64 0c c8 	lw r4,(r11+3272)
    9250:	29 65 0c cc 	lw r5,(r11+3276)
    9254:	78 02 00 01 	mvhi r2,0x1
    9258:	b9 80 08 00 	mv r1,r12
    925c:	38 42 36 74 	ori r2,r2,0x3674
    9260:	fb ff eb 0a 	calli 3e88 <mprintf>
    9264:	29 63 0c e4 	lw r3,(r11+3300)
    9268:	29 64 0c e8 	lw r4,(r11+3304)
    926c:	29 65 0c ec 	lw r5,(r11+3308)
    9270:	78 02 00 01 	mvhi r2,0x1
    9274:	b9 80 08 00 	mv r1,r12
    9278:	38 42 36 7c 	ori r2,r2,0x367c
    927c:	fb ff eb 03 	calli 3e88 <mprintf>
    9280:	29 63 0d 04 	lw r3,(r11+3332)
    9284:	29 64 0d 08 	lw r4,(r11+3336)
    9288:	29 65 0d 0c 	lw r5,(r11+3340)
    928c:	78 02 00 01 	mvhi r2,0x1
    9290:	b9 80 08 00 	mv r1,r12
    9294:	38 42 36 84 	ori r2,r2,0x3684
    9298:	fb ff ea fc 	calli 3e88 <mprintf>
    929c:	29 63 0b fc 	lw r3,(r11+3068)
    92a0:	29 64 0c 00 	lw r4,(r11+3072)
    92a4:	29 65 0c 04 	lw r5,(r11+3076)
    92a8:	78 02 00 01 	mvhi r2,0x1
    92ac:	b9 80 08 00 	mv r1,r12
    92b0:	38 42 36 8c 	ori r2,r2,0x368c
    92b4:	fb ff ea f5 	calli 3e88 <mprintf>
    92b8:	78 05 00 01 	mvhi r5,0x1
    92bc:	38 a5 34 ec 	ori r5,r5,0x34ec
    92c0:	29 61 0b f8 	lw r1,(r11+3064)
    92c4:	29 62 0b fc 	lw r2,(r11+3068)
    92c8:	28 a4 00 00 	lw r4,(r5+0)
    92cc:	29 77 0c 04 	lw r23,(r11+3076)
    92d0:	34 03 00 e8 	mvi r3,232
    92d4:	f8 00 1d 05 	calli 106e8 <__muldi3>
    92d8:	b6 e2 60 00 	add r12,r23,r2
    92dc:	16 f8 00 1f 	sri r24,r23,31
    92e0:	29 62 0c 00 	lw r2,(r11+3072)
    92e4:	f6 ec b8 00 	cmpgu r23,r23,r12
    92e8:	b7 01 08 00 	add r1,r24,r1
    92ec:	b6 e1 c0 00 	add r24,r23,r1
    92f0:	14 41 00 1f 	sri r1,r2,31
    92f4:	34 03 00 00 	mvi r3,0
    92f8:	34 04 03 e8 	mvi r4,1000
    92fc:	f8 00 1c fb 	calli 106e8 <__muldi3>
    9300:	b5 82 b8 00 	add r23,r12,r2
    9304:	f5 97 60 00 	cmpgu r12,r12,r23
    9308:	78 06 00 01 	mvhi r6,0x1
    930c:	38 c6 34 ec 	ori r6,r6,0x34ec
    9310:	b7 01 08 00 	add r1,r24,r1
    9314:	28 c4 00 00 	lw r4,(r6+0)
    9318:	b5 81 c0 00 	add r24,r12,r1
    931c:	78 0c 00 01 	mvhi r12,0x1
    9320:	39 8c 7c f8 	ori r12,r12,0x7cf8
    9324:	59 98 00 48 	sw (r12+72),r24
    9328:	59 97 00 4c 	sw (r12+76),r23
    932c:	b9 e0 10 00 	mv r2,r15
    9330:	34 03 00 e8 	mvi r3,232
    9334:	ba 00 08 00 	mv r1,r16
    9338:	f8 00 1c ec 	calli 106e8 <__muldi3>
    933c:	b6 a2 78 00 	add r15,r21,r2
    9340:	16 b9 00 1f 	sri r25,r21,31
    9344:	f6 af a8 00 	cmpgu r21,r21,r15
    9348:	b7 21 08 00 	add r1,r25,r1
    934c:	b6 a1 a8 00 	add r21,r21,r1
    9350:	15 a1 00 1f 	sri r1,r13,31
    9354:	b9 a0 10 00 	mv r2,r13
    9358:	34 03 00 00 	mvi r3,0
    935c:	34 04 03 e8 	mvi r4,1000
    9360:	f8 00 1c e2 	calli 106e8 <__muldi3>
    9364:	b5 e2 10 00 	add r2,r15,r2
    9368:	f5 e2 78 00 	cmpgu r15,r15,r2
    936c:	3e 63 00 01 	sli r3,r19,1
    9370:	b6 a1 08 00 	add r1,r21,r1
    9374:	b5 e1 08 00 	add r1,r15,r1
    9378:	59 81 00 88 	sw (r12+136),r1
    937c:	f6 63 20 00 	cmpgu r4,r19,r3
    9380:	3e 81 00 01 	sli r1,r20,1
    9384:	c8 03 18 00 	sub r3,r0,r3
    9388:	b4 81 08 00 	add r1,r4,r1
    938c:	7c 64 00 00 	cmpnei r4,r3,0
    9390:	59 82 00 8c 	sw (r12+140),r2
    9394:	b4 77 10 00 	add r2,r3,r23
    9398:	f4 62 18 00 	cmpgu r3,r3,r2
    939c:	cb 04 c0 00 	sub r24,r24,r4
    93a0:	cb 01 c0 00 	sub r24,r24,r1
    93a4:	b4 78 20 00 	add r4,r3,r24
    93a8:	29 61 0c 3c 	lw r1,(r11+3132)
    93ac:	29 63 0c 40 	lw r3,(r11+3136)
    93b0:	29 65 0c 44 	lw r5,(r11+3140)
    93b4:	59 82 00 84 	sw (r12+132),r2
    93b8:	b4 61 18 00 	add r3,r3,r1
    93bc:	29 61 0c 38 	lw r1,(r11+3128)
    93c0:	14 66 00 1f 	sri r6,r3,31
    93c4:	59 84 00 80 	sw (r12+128),r4
    93c8:	b4 a1 08 00 	add r1,r5,r1
    93cc:	14 25 00 1f 	sri r5,r1,31
    93d0:	c8 61 08 00 	sub r1,r3,r1
    93d4:	f4 23 18 00 	cmpgu r3,r1,r3
    93d8:	c8 c5 28 00 	sub r5,r6,r5
    93dc:	b4 22 10 00 	add r2,r1,r2
    93e0:	c8 a3 18 00 	sub r3,r5,r3
    93e4:	f4 22 08 00 	cmpgu r1,r1,r2
    93e8:	b4 64 20 00 	add r4,r3,r4
    93ec:	b4 24 08 00 	add r1,r1,r4
    93f0:	59 81 00 78 	sw (r12+120),r1
    93f4:	78 01 00 01 	mvhi r1,0x1
    93f8:	38 21 59 28 	ori r1,r1,0x5928
    93fc:	28 21 00 00 	lw r1,(r1+0)
    9400:	59 94 00 50 	sw (r12+80),r20
    9404:	59 93 00 54 	sw (r12+84),r19
    9408:	59 82 00 7c 	sw (r12+124),r2
    940c:	59 81 00 44 	sw (r12+68),r1
    9410:	59 74 0c 50 	sw (r11+3152),r20
    9414:	59 73 0c 54 	sw (r11+3156),r19
    9418:	f8 00 19 9c 	calli fa88 <ptpd_netif_get_msec_tics>
    941c:	b8 20 68 00 	mv r13,r1
    9420:	b8 40 60 00 	mv r12,r2
    9424:	34 01 00 00 	mvi r1,0
    9428:	35 62 00 0c 	addi r2,r11,12
    942c:	34 03 00 00 	mvi r3,0
    9430:	f8 00 1a 98 	calli fe90 <ptpd_netif_locking_poll>
    9434:	34 0f 00 01 	mvi r15,1
    9438:	44 2f 00 04 	be r1,r15,9448 <wr_servo_update+0x1228>
    943c:	34 01 00 00 	mvi r1,0
    9440:	f8 00 1c 63 	calli 105cc <ptpd_netif_enable_timing_output>
    9444:	59 6f 0f 04 	sw (r11+3844),r15
    9448:	29 62 0b d0 	lw r2,(r11+3024)
    944c:	34 01 00 05 	mvi r1,5
    9450:	34 42 ff ff 	addi r2,r2,-1
    9454:	54 41 00 92 	bgu r2,r1,969c <wr_servo_update+0x147c>
    9458:	78 01 00 01 	mvhi r1,0x1
    945c:	3c 42 00 02 	sli r2,r2,2
    9460:	38 21 36 d4 	ori r1,r1,0x36d4
    9464:	b4 22 08 00 	add r1,r1,r2
    9468:	28 21 00 00 	lw r1,(r1+0)
    946c:	c0 20 00 00 	b r1
    9470:	f8 00 1c 5e 	calli 105e8 <ptpd_netif_adjust_in_progress>
    9474:	5c 20 00 03 	bne r1,r0,9480 <wr_servo_update+0x1260>
    9478:	29 61 0b d4 	lw r1,(r11+3028)
    947c:	e0 00 00 5a 	bi 95e4 <wr_servo_update+0x13c4>
    9480:	78 01 00 01 	mvhi r1,0x1
    9484:	38 21 36 98 	ori r1,r1,0x3698
    9488:	fb ff ea 80 	calli 3e88 <mprintf>
    948c:	e0 00 00 84 	bi 969c <wr_servo_update+0x147c>
    9490:	34 01 00 00 	mvi r1,0
    9494:	f8 00 1c 4e 	calli 105cc <ptpd_netif_enable_timing_output>
    9498:	ba 51 08 00 	or r1,r18,r17
    949c:	44 20 00 0d 	be r1,r0,94d0 <wr_servo_update+0x12b0>
    94a0:	78 01 00 01 	mvhi r1,0x1
    94a4:	78 02 00 01 	mvhi r2,0x1
    94a8:	38 42 36 a4 	ori r2,r2,0x36a4
    94ac:	38 21 7c fc 	ori r1,r1,0x7cfc
    94b0:	f8 00 25 3e 	calli 129a8 <strcpy>
    94b4:	ba 40 08 00 	mv r1,r18
    94b8:	ba 20 10 00 	mv r2,r17
    94bc:	34 03 00 00 	mvi r3,0
    94c0:	f8 00 1c 52 	calli 10608 <ptpd_netif_adjust_counters>
    94c4:	34 01 00 00 	mvi r1,0
    94c8:	f8 00 1c 65 	calli 1065c <ptpd_netif_adjust_phase>
    94cc:	e0 00 00 0e 	bi 9504 <wr_servo_update+0x12e4>
    94d0:	34 01 00 01 	mvi r1,1
    94d4:	e0 00 00 44 	bi 95e4 <wr_servo_update+0x13c4>
    94d8:	78 01 00 01 	mvhi r1,0x1
    94dc:	78 02 00 01 	mvhi r2,0x1
    94e0:	38 21 7c fc 	ori r1,r1,0x7cfc
    94e4:	38 42 36 b0 	ori r2,r2,0x36b0
    94e8:	f8 00 25 30 	calli 129a8 <strcpy>
    94ec:	34 01 00 03 	mvi r1,3
    94f0:	45 c0 00 3d 	be r14,r0,95e4 <wr_servo_update+0x13c4>
    94f4:	34 01 00 00 	mvi r1,0
    94f8:	34 02 00 00 	mvi r2,0
    94fc:	b9 c0 18 00 	mv r3,r14
    9500:	f8 00 1c 42 	calli 10608 <ptpd_netif_adjust_counters>
    9504:	34 01 00 01 	mvi r1,1
    9508:	e0 00 00 60 	bi 9688 <wr_servo_update+0x1468>
    950c:	78 01 00 01 	mvhi r1,0x1
    9510:	78 02 00 01 	mvhi r2,0x1
    9514:	09 ce 03 e8 	muli r14,r14,1000
    9518:	38 42 36 bc 	ori r2,r2,0x36bc
    951c:	38 21 7c fc 	ori r1,r1,0x7cfc
    9520:	f8 00 25 22 	calli 129a8 <strcpy>
    9524:	b5 d6 08 00 	add r1,r14,r22
    9528:	59 61 0c 48 	sw (r11+3144),r1
    952c:	f8 00 1c 4c 	calli 1065c <ptpd_netif_adjust_phase>
    9530:	34 01 00 06 	mvi r1,6
    9534:	59 61 0b d4 	sw (r11+3028),r1
    9538:	34 01 00 05 	mvi r1,5
    953c:	59 61 0b d0 	sw (r11+3024),r1
    9540:	29 61 0c 50 	lw r1,(r11+3152)
    9544:	59 6d 0d 20 	sw (r11+3360),r13
    9548:	59 6c 0d 24 	sw (r11+3364),r12
    954c:	59 61 0c 58 	sw (r11+3160),r1
    9550:	29 61 0c 54 	lw r1,(r11+3156)
    9554:	59 61 0c 5c 	sw (r11+3164),r1
    9558:	e0 00 00 51 	bi 969c <wr_servo_update+0x147c>
    955c:	78 05 00 01 	mvhi r5,0x1
    9560:	38 a5 34 ec 	ori r5,r5,0x34ec
    9564:	28 a4 00 00 	lw r4,(r5+0)
    9568:	ba 20 10 00 	mv r2,r17
    956c:	34 03 00 e8 	mvi r3,232
    9570:	ba 40 08 00 	mv r1,r18
    9574:	f8 00 1c 5d 	calli 106e8 <__muldi3>
    9578:	15 c1 00 1f 	sri r1,r14,31
    957c:	b6 c2 b0 00 	add r22,r22,r2
    9580:	34 03 00 00 	mvi r3,0
    9584:	34 04 03 e8 	mvi r4,1000
    9588:	b9 c0 10 00 	mv r2,r14
    958c:	f8 00 1c 57 	calli 106e8 <__muldi3>
    9590:	b6 c2 08 00 	add r1,r22,r2
    9594:	ba 51 88 00 	or r17,r18,r17
    9598:	f8 00 24 65 	calli 1272c <abs>
    959c:	5e 20 00 02 	bne r17,r0,95a4 <wr_servo_update+0x1384>
    95a0:	45 d1 00 03 	be r14,r17,95ac <wr_servo_update+0x138c>
    95a4:	34 01 00 02 	mvi r1,2
    95a8:	e0 00 00 06 	bi 95c0 <wr_servo_update+0x13a0>
    95ac:	34 02 00 3b 	mvi r2,59
    95b0:	48 22 00 06 	bg r1,r2,95c8 <wr_servo_update+0x13a8>
    95b4:	34 01 00 01 	mvi r1,1
    95b8:	f8 00 1c 05 	calli 105cc <ptpd_netif_enable_timing_output>
    95bc:	34 01 00 04 	mvi r1,4
    95c0:	59 61 0b d0 	sw (r11+3024),r1
    95c4:	e0 00 00 04 	bi 95d4 <wr_servo_update+0x13b4>
    95c8:	29 61 0d 30 	lw r1,(r11+3376)
    95cc:	34 21 00 01 	addi r1,r1,1
    95d0:	59 61 0d 30 	sw (r11+3376),r1
    95d4:	29 62 0d 30 	lw r2,(r11+3376)
    95d8:	34 01 00 09 	mvi r1,9
    95dc:	4c 22 00 30 	bge r1,r2,969c <wr_servo_update+0x147c>
    95e0:	34 01 00 02 	mvi r1,2
    95e4:	59 61 0b d0 	sw (r11+3024),r1
    95e8:	e0 00 00 2d 	bi 969c <wr_servo_update+0x147c>
    95ec:	78 01 00 01 	mvhi r1,0x1
    95f0:	78 02 00 01 	mvhi r2,0x1
    95f4:	38 42 36 c8 	ori r2,r2,0x36c8
    95f8:	38 21 7c fc 	ori r1,r1,0x7cfc
    95fc:	f8 00 24 eb 	calli 129a8 <strcpy>
    9600:	29 64 0c 48 	lw r4,(r11+3144)
    9604:	78 03 00 01 	mvhi r3,0x1
    9608:	38 63 7c f8 	ori r3,r3,0x7cf8
    960c:	14 81 00 1f 	sri r1,r4,31
    9610:	58 64 00 94 	sw (r3+148),r4
    9614:	58 61 00 90 	sw (r3+144),r1
    9618:	29 62 0c 54 	lw r2,(r11+3156)
    961c:	29 61 0c 5c 	lw r1,(r11+3164)
    9620:	29 68 0c 50 	lw r8,(r11+3152)
    9624:	29 66 0c 58 	lw r6,(r11+3160)
    9628:	c8 41 28 00 	sub r5,r2,r1
    962c:	f4 a2 38 00 	cmpgu r7,r5,r2
    9630:	c9 06 30 00 	sub r6,r8,r6
    9634:	c8 c7 30 00 	sub r6,r6,r7
    9638:	58 66 00 98 	sw (r3+152),r6
    963c:	58 65 00 9c 	sw (r3+156),r5
    9640:	ba 51 88 00 	or r17,r18,r17
    9644:	5e 20 00 02 	bne r17,r0,964c <wr_servo_update+0x142c>
    9648:	45 d1 00 03 	be r14,r17,9654 <wr_servo_update+0x1434>
    964c:	34 03 00 02 	mvi r3,2
    9650:	59 63 0b d0 	sw (r11+3024),r3
    9654:	78 03 00 01 	mvhi r3,0x1
    9658:	38 63 59 28 	ori r3,r3,0x5928
    965c:	28 63 00 00 	lw r3,(r3+0)
    9660:	44 60 00 0f 	be r3,r0,969c <wr_servo_update+0x147c>
    9664:	b4 82 10 00 	add r2,r4,r2
    9668:	c8 41 08 00 	sub r1,r2,r1
    966c:	59 61 0c 48 	sw (r11+3144),r1
    9670:	f8 00 1b fb 	calli 1065c <ptpd_netif_adjust_phase>
    9674:	29 61 0c 50 	lw r1,(r11+3152)
    9678:	59 61 0c 58 	sw (r11+3160),r1
    967c:	29 61 0c 54 	lw r1,(r11+3156)
    9680:	59 61 0c 5c 	sw (r11+3164),r1
    9684:	34 01 00 04 	mvi r1,4
    9688:	59 61 0b d4 	sw (r11+3028),r1
    968c:	34 01 00 05 	mvi r1,5
    9690:	59 61 0b d0 	sw (r11+3024),r1
    9694:	59 6d 0d 20 	sw (r11+3360),r13
    9698:	59 6c 0d 24 	sw (r11+3364),r12
    969c:	34 01 00 00 	mvi r1,0
    96a0:	2b 9d 00 28 	lw ra,(sp+40)
    96a4:	2b 8b 00 68 	lw r11,(sp+104)
    96a8:	2b 8c 00 64 	lw r12,(sp+100)
    96ac:	2b 8d 00 60 	lw r13,(sp+96)
    96b0:	2b 8e 00 5c 	lw r14,(sp+92)
    96b4:	2b 8f 00 58 	lw r15,(sp+88)
    96b8:	2b 90 00 54 	lw r16,(sp+84)
    96bc:	2b 91 00 50 	lw r17,(sp+80)
    96c0:	2b 92 00 4c 	lw r18,(sp+76)
    96c4:	2b 93 00 48 	lw r19,(sp+72)
    96c8:	2b 94 00 44 	lw r20,(sp+68)
    96cc:	2b 95 00 40 	lw r21,(sp+64)
    96d0:	2b 96 00 3c 	lw r22,(sp+60)
    96d4:	2b 97 00 38 	lw r23,(sp+56)
    96d8:	2b 98 00 34 	lw r24,(sp+52)
    96dc:	2b 99 00 30 	lw r25,(sp+48)
    96e0:	2b 9b 00 2c 	lw fp,(sp+44)
    96e4:	37 9c 00 a8 	addi sp,sp,168
    96e8:	c3 a0 00 00 	ret

000096ec <toState>:
    96ec:	37 9c ff f0 	addi sp,sp,-16
    96f0:	5b 8b 00 10 	sw (sp+16),r11
    96f4:	5b 8c 00 0c 	sw (sp+12),r12
    96f8:	5b 8d 00 08 	sw (sp+8),r13
    96fc:	5b 9d 00 04 	sw (sp+4),ra
    9700:	b8 40 60 00 	mv r12,r2
    9704:	40 62 0b 75 	lbu r2,(r3+2933)
    9708:	20 2d 00 ff 	andi r13,r1,0xff
    970c:	34 01 00 09 	mvi r1,9
    9710:	b8 60 58 00 	mv r11,r3
    9714:	5c 41 02 8e 	bne r2,r1,a14c <toState+0xa60>
    9718:	34 02 00 01 	mvi r2,1
    971c:	58 62 0a f4 	sw (r3+2804),r2
    9720:	40 63 00 de 	lbu r3,(r3+222)
    9724:	34 01 00 05 	mvi r1,5
    9728:	44 61 00 0a 	be r3,r1,9750 <toState+0x64>
    972c:	54 61 00 04 	bgu r3,r1,973c <toState+0x50>
    9730:	34 01 00 03 	mvi r1,3
    9734:	5c 61 00 9d 	bne r3,r1,99a8 <toState+0x2bc>
    9738:	e0 00 00 7a 	bi 9920 <toState+0x234>
    973c:	34 01 00 06 	mvi r1,6
    9740:	44 61 00 55 	be r3,r1,9894 <toState+0x1a8>
    9744:	34 01 00 08 	mvi r1,8
    9748:	5c 61 00 98 	bne r3,r1,99a8 <toState+0x2bc>
    974c:	e0 00 00 27 	bi 97e8 <toState+0xfc>
    9750:	29 61 0b 78 	lw r1,(r11+2936)
    9754:	78 05 00 01 	mvhi r5,0x1
    9758:	2d 63 00 dc 	lhu r3,(r11+220)
    975c:	38 a5 36 f4 	ori r5,r5,0x36f4
    9760:	5c 22 00 03 	bne r1,r2,976c <toState+0x80>
    9764:	78 05 00 01 	mvhi r5,0x1
    9768:	38 a5 36 ec 	ori r5,r5,0x36ec
    976c:	41 62 0b 76 	lbu r2,(r11+2934)
    9770:	34 01 00 01 	mvi r1,1
    9774:	44 41 00 0d 	be r2,r1,97a8 <toState+0xbc>
    9778:	78 06 00 01 	mvhi r6,0x1
    977c:	38 c6 31 08 	ori r6,r6,0x3108
    9780:	34 04 00 02 	mvi r4,2
    9784:	b8 c0 38 00 	mv r7,r6
    9788:	5c 44 00 0c 	bne r2,r4,97b8 <toState+0xcc>
    978c:	41 62 0e fc 	lbu r2,(r11+3836)
    9790:	78 07 00 01 	mvhi r7,0x1
    9794:	38 e7 36 fc 	ori r7,r7,0x36fc
    9798:	5c 41 00 08 	bne r2,r1,97b8 <toState+0xcc>
    979c:	78 07 00 01 	mvhi r7,0x1
    97a0:	38 e7 37 04 	ori r7,r7,0x3704
    97a4:	e0 00 00 05 	bi 97b8 <toState+0xcc>
    97a8:	78 06 00 01 	mvhi r6,0x1
    97ac:	78 07 00 01 	mvhi r7,0x1
    97b0:	38 c6 37 0c 	ori r6,r6,0x370c
    97b4:	38 e7 31 08 	ori r7,r7,0x3108
    97b8:	78 02 00 01 	mvhi r2,0x1
    97bc:	78 04 00 01 	mvhi r4,0x1
    97c0:	38 42 37 2c 	ori r2,r2,0x372c
    97c4:	38 84 37 24 	ori r4,r4,0x3724
    97c8:	34 01 00 01 	mvi r1,1
    97cc:	fb ff dc 2d 	calli 880 <wrc_debug_printf>
    97d0:	35 61 0b 30 	addi r1,r11,2864
    97d4:	fb ff f9 18 	calli 7c34 <timerStop>
    97d8:	35 61 0b 50 	addi r1,r11,2896
    97dc:	fb ff f9 16 	calli 7c34 <timerStop>
    97e0:	35 61 0b 00 	addi r1,r11,2816
    97e4:	e0 00 00 70 	bi 99a4 <toState+0x2b8>
    97e8:	29 61 0b 78 	lw r1,(r11+2936)
    97ec:	78 05 00 01 	mvhi r5,0x1
    97f0:	2d 63 00 dc 	lhu r3,(r11+220)
    97f4:	38 a5 36 f4 	ori r5,r5,0x36f4
    97f8:	5c 22 00 03 	bne r1,r2,9804 <toState+0x118>
    97fc:	78 05 00 01 	mvhi r5,0x1
    9800:	38 a5 36 ec 	ori r5,r5,0x36ec
    9804:	41 62 0b 76 	lbu r2,(r11+2934)
    9808:	34 01 00 01 	mvi r1,1
    980c:	44 41 00 0d 	be r2,r1,9840 <toState+0x154>
    9810:	78 06 00 01 	mvhi r6,0x1
    9814:	38 c6 31 08 	ori r6,r6,0x3108
    9818:	34 04 00 02 	mvi r4,2
    981c:	b8 c0 38 00 	mv r7,r6
    9820:	5c 44 00 0c 	bne r2,r4,9850 <toState+0x164>
    9824:	41 62 0e fc 	lbu r2,(r11+3836)
    9828:	78 07 00 01 	mvhi r7,0x1
    982c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9830:	5c 41 00 08 	bne r2,r1,9850 <toState+0x164>
    9834:	78 07 00 01 	mvhi r7,0x1
    9838:	38 e7 37 04 	ori r7,r7,0x3704
    983c:	e0 00 00 05 	bi 9850 <toState+0x164>
    9840:	78 06 00 01 	mvhi r6,0x1
    9844:	78 07 00 01 	mvhi r7,0x1
    9848:	38 c6 37 0c 	ori r6,r6,0x370c
    984c:	38 e7 31 08 	ori r7,r7,0x3108
    9850:	78 02 00 01 	mvhi r2,0x1
    9854:	78 04 00 01 	mvhi r4,0x1
    9858:	34 01 00 01 	mvi r1,1
    985c:	38 42 37 64 	ori r2,r2,0x3764
    9860:	38 84 37 1c 	ori r4,r4,0x371c
    9864:	fb ff dc 07 	calli 880 <wrc_debug_printf>
    9868:	35 61 0b 40 	addi r1,r11,2880
    986c:	fb ff f8 f2 	calli 7c34 <timerStop>
    9870:	29 81 00 6c 	lw r1,(r12+108)
    9874:	44 20 00 03 	be r1,r0,9880 <toState+0x194>
    9878:	35 61 0b 20 	addi r1,r11,2848
    987c:	e0 00 00 02 	bi 9884 <toState+0x198>
    9880:	35 61 0b 00 	addi r1,r11,2816
    9884:	fb ff f8 ec 	calli 7c34 <timerStop>
    9888:	31 60 0b 76 	sb (r11+2934),r0
    988c:	59 60 0b 78 	sw (r11+2936),r0
    9890:	e0 00 00 46 	bi 99a8 <toState+0x2bc>
    9894:	29 61 0b 78 	lw r1,(r11+2936)
    9898:	78 05 00 01 	mvhi r5,0x1
    989c:	2d 63 00 dc 	lhu r3,(r11+220)
    98a0:	38 a5 36 f4 	ori r5,r5,0x36f4
    98a4:	5c 22 00 03 	bne r1,r2,98b0 <toState+0x1c4>
    98a8:	78 05 00 01 	mvhi r5,0x1
    98ac:	38 a5 36 ec 	ori r5,r5,0x36ec
    98b0:	41 62 0b 76 	lbu r2,(r11+2934)
    98b4:	34 01 00 01 	mvi r1,1
    98b8:	44 41 00 0d 	be r2,r1,98ec <toState+0x200>
    98bc:	78 06 00 01 	mvhi r6,0x1
    98c0:	38 c6 31 08 	ori r6,r6,0x3108
    98c4:	34 04 00 02 	mvi r4,2
    98c8:	b8 c0 38 00 	mv r7,r6
    98cc:	5c 44 00 0c 	bne r2,r4,98fc <toState+0x210>
    98d0:	41 62 0e fc 	lbu r2,(r11+3836)
    98d4:	78 07 00 01 	mvhi r7,0x1
    98d8:	38 e7 36 fc 	ori r7,r7,0x36fc
    98dc:	5c 41 00 08 	bne r2,r1,98fc <toState+0x210>
    98e0:	78 07 00 01 	mvhi r7,0x1
    98e4:	38 e7 37 04 	ori r7,r7,0x3704
    98e8:	e0 00 00 05 	bi 98fc <toState+0x210>
    98ec:	78 06 00 01 	mvhi r6,0x1
    98f0:	78 07 00 01 	mvhi r7,0x1
    98f4:	38 c6 37 0c 	ori r6,r6,0x370c
    98f8:	38 e7 31 08 	ori r7,r7,0x3108
    98fc:	78 02 00 01 	mvhi r2,0x1
    9900:	78 04 00 01 	mvhi r4,0x1
    9904:	34 01 00 01 	mvi r1,1
    9908:	38 42 37 9c 	ori r2,r2,0x379c
    990c:	38 84 37 14 	ori r4,r4,0x3714
    9910:	fb ff db dc 	calli 880 <wrc_debug_printf>
    9914:	35 61 0b 00 	addi r1,r11,2816
    9918:	fb ff f8 c7 	calli 7c34 <timerStop>
    991c:	e0 00 00 21 	bi 99a0 <toState+0x2b4>
    9920:	29 61 0b 78 	lw r1,(r11+2936)
    9924:	78 05 00 01 	mvhi r5,0x1
    9928:	2d 63 00 dc 	lhu r3,(r11+220)
    992c:	38 a5 36 f4 	ori r5,r5,0x36f4
    9930:	5c 22 00 03 	bne r1,r2,993c <toState+0x250>
    9934:	78 05 00 01 	mvhi r5,0x1
    9938:	38 a5 36 ec 	ori r5,r5,0x36ec
    993c:	41 62 0b 76 	lbu r2,(r11+2934)
    9940:	34 01 00 01 	mvi r1,1
    9944:	44 41 00 0d 	be r2,r1,9978 <toState+0x28c>
    9948:	78 06 00 01 	mvhi r6,0x1
    994c:	38 c6 31 08 	ori r6,r6,0x3108
    9950:	34 04 00 02 	mvi r4,2
    9954:	b8 c0 38 00 	mv r7,r6
    9958:	5c 44 00 0c 	bne r2,r4,9988 <toState+0x29c>
    995c:	41 62 0e fc 	lbu r2,(r11+3836)
    9960:	78 07 00 01 	mvhi r7,0x1
    9964:	38 e7 36 fc 	ori r7,r7,0x36fc
    9968:	5c 41 00 08 	bne r2,r1,9988 <toState+0x29c>
    996c:	78 07 00 01 	mvhi r7,0x1
    9970:	38 e7 37 04 	ori r7,r7,0x3704
    9974:	e0 00 00 05 	bi 9988 <toState+0x29c>
    9978:	78 06 00 01 	mvhi r6,0x1
    997c:	78 07 00 01 	mvhi r7,0x1
    9980:	38 c6 37 0c 	ori r6,r6,0x370c
    9984:	38 e7 31 08 	ori r7,r7,0x3108
    9988:	78 02 00 01 	mvhi r2,0x1
    998c:	78 04 00 01 	mvhi r4,0x1
    9990:	34 01 00 01 	mvi r1,1
    9994:	38 42 37 d8 	ori r2,r2,0x37d8
    9998:	38 84 37 14 	ori r4,r4,0x3714
    999c:	fb ff db b9 	calli 880 <wrc_debug_printf>
    99a0:	35 61 0b 40 	addi r1,r11,2880
    99a4:	fb ff f8 a4 	calli 7c34 <timerStop>
    99a8:	34 01 00 08 	mvi r1,8
    99ac:	55 a1 01 e3 	bgu r13,r1,a138 <toState+0xa4c>
    99b0:	78 02 00 01 	mvhi r2,0x1
    99b4:	3d ad 00 02 	sli r13,r13,2
    99b8:	38 42 54 7c 	ori r2,r2,0x547c
    99bc:	b4 4d 10 00 	add r2,r2,r13
    99c0:	28 41 00 00 	lw r1,(r2+0)
    99c4:	c0 20 00 00 	b r1
    99c8:	41 61 00 de 	lbu r1,(r11+222)
    99cc:	78 04 00 01 	mvhi r4,0x1
    99d0:	34 02 00 08 	mvi r2,8
    99d4:	2d 63 00 dc 	lhu r3,(r11+220)
    99d8:	38 84 37 1c 	ori r4,r4,0x371c
    99dc:	44 22 00 07 	be r1,r2,99f8 <toState+0x30c>
    99e0:	78 04 00 01 	mvhi r4,0x1
    99e4:	34 02 00 05 	mvi r2,5
    99e8:	38 84 37 14 	ori r4,r4,0x3714
    99ec:	5c 22 00 03 	bne r1,r2,99f8 <toState+0x30c>
    99f0:	78 04 00 01 	mvhi r4,0x1
    99f4:	38 84 37 24 	ori r4,r4,0x3724
    99f8:	29 62 0b 78 	lw r2,(r11+2936)
    99fc:	78 05 00 01 	mvhi r5,0x1
    9a00:	34 01 00 01 	mvi r1,1
    9a04:	38 a5 36 f4 	ori r5,r5,0x36f4
    9a08:	5c 41 00 03 	bne r2,r1,9a14 <toState+0x328>
    9a0c:	78 05 00 01 	mvhi r5,0x1
    9a10:	38 a5 36 ec 	ori r5,r5,0x36ec
    9a14:	41 62 0b 76 	lbu r2,(r11+2934)
    9a18:	34 01 00 01 	mvi r1,1
    9a1c:	44 41 00 0d 	be r2,r1,9a50 <toState+0x364>
    9a20:	78 06 00 01 	mvhi r6,0x1
    9a24:	38 c6 31 08 	ori r6,r6,0x3108
    9a28:	34 08 00 02 	mvi r8,2
    9a2c:	b8 c0 38 00 	mv r7,r6
    9a30:	5c 48 00 0c 	bne r2,r8,9a60 <toState+0x374>
    9a34:	41 62 0e fc 	lbu r2,(r11+3836)
    9a38:	78 07 00 01 	mvhi r7,0x1
    9a3c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9a40:	5c 41 00 08 	bne r2,r1,9a60 <toState+0x374>
    9a44:	78 07 00 01 	mvhi r7,0x1
    9a48:	38 e7 37 04 	ori r7,r7,0x3704
    9a4c:	e0 00 00 05 	bi 9a60 <toState+0x374>
    9a50:	78 06 00 01 	mvhi r6,0x1
    9a54:	78 07 00 01 	mvhi r7,0x1
    9a58:	38 c6 37 0c 	ori r6,r6,0x370c
    9a5c:	38 e7 31 08 	ori r7,r7,0x3108
    9a60:	78 02 00 01 	mvhi r2,0x1
    9a64:	34 01 00 01 	mvi r1,1
    9a68:	38 42 38 14 	ori r2,r2,0x3814
    9a6c:	fb ff db 85 	calli 880 <wrc_debug_printf>
    9a70:	31 60 00 de 	sb (r11+222),r0
    9a74:	e0 00 01 b1 	bi a138 <toState+0xa4c>
    9a78:	41 61 00 de 	lbu r1,(r11+222)
    9a7c:	78 04 00 01 	mvhi r4,0x1
    9a80:	34 02 00 08 	mvi r2,8
    9a84:	2d 63 00 dc 	lhu r3,(r11+220)
    9a88:	38 84 37 1c 	ori r4,r4,0x371c
    9a8c:	44 22 00 07 	be r1,r2,9aa8 <toState+0x3bc>
    9a90:	78 04 00 01 	mvhi r4,0x1
    9a94:	34 02 00 05 	mvi r2,5
    9a98:	38 84 37 14 	ori r4,r4,0x3714
    9a9c:	5c 22 00 03 	bne r1,r2,9aa8 <toState+0x3bc>
    9aa0:	78 04 00 01 	mvhi r4,0x1
    9aa4:	38 84 37 24 	ori r4,r4,0x3724
    9aa8:	29 62 0b 78 	lw r2,(r11+2936)
    9aac:	78 05 00 01 	mvhi r5,0x1
    9ab0:	34 01 00 01 	mvi r1,1
    9ab4:	38 a5 36 f4 	ori r5,r5,0x36f4
    9ab8:	5c 41 00 03 	bne r2,r1,9ac4 <toState+0x3d8>
    9abc:	78 05 00 01 	mvhi r5,0x1
    9ac0:	38 a5 36 ec 	ori r5,r5,0x36ec
    9ac4:	41 62 0b 76 	lbu r2,(r11+2934)
    9ac8:	34 01 00 01 	mvi r1,1
    9acc:	44 41 00 0d 	be r2,r1,9b00 <toState+0x414>
    9ad0:	78 06 00 01 	mvhi r6,0x1
    9ad4:	38 c6 31 08 	ori r6,r6,0x3108
    9ad8:	34 08 00 02 	mvi r8,2
    9adc:	b8 c0 38 00 	mv r7,r6
    9ae0:	5c 48 00 0c 	bne r2,r8,9b10 <toState+0x424>
    9ae4:	41 62 0e fc 	lbu r2,(r11+3836)
    9ae8:	78 07 00 01 	mvhi r7,0x1
    9aec:	38 e7 36 fc 	ori r7,r7,0x36fc
    9af0:	5c 41 00 08 	bne r2,r1,9b10 <toState+0x424>
    9af4:	78 07 00 01 	mvhi r7,0x1
    9af8:	38 e7 37 04 	ori r7,r7,0x3704
    9afc:	e0 00 00 05 	bi 9b10 <toState+0x424>
    9b00:	78 06 00 01 	mvhi r6,0x1
    9b04:	78 07 00 01 	mvhi r7,0x1
    9b08:	38 c6 37 0c 	ori r6,r6,0x370c
    9b0c:	38 e7 31 08 	ori r7,r7,0x3108
    9b10:	78 02 00 01 	mvhi r2,0x1
    9b14:	34 01 00 01 	mvi r1,1
    9b18:	38 42 38 54 	ori r2,r2,0x3854
    9b1c:	fb ff db 59 	calli 880 <wrc_debug_printf>
    9b20:	34 01 00 01 	mvi r1,1
    9b24:	e0 00 01 84 	bi a134 <toState+0xa48>
    9b28:	41 61 00 de 	lbu r1,(r11+222)
    9b2c:	78 04 00 01 	mvhi r4,0x1
    9b30:	34 02 00 08 	mvi r2,8
    9b34:	2d 63 00 dc 	lhu r3,(r11+220)
    9b38:	38 84 37 1c 	ori r4,r4,0x371c
    9b3c:	44 22 00 07 	be r1,r2,9b58 <toState+0x46c>
    9b40:	78 04 00 01 	mvhi r4,0x1
    9b44:	34 02 00 05 	mvi r2,5
    9b48:	38 84 37 14 	ori r4,r4,0x3714
    9b4c:	5c 22 00 03 	bne r1,r2,9b58 <toState+0x46c>
    9b50:	78 04 00 01 	mvhi r4,0x1
    9b54:	38 84 37 24 	ori r4,r4,0x3724
    9b58:	29 62 0b 78 	lw r2,(r11+2936)
    9b5c:	78 05 00 01 	mvhi r5,0x1
    9b60:	34 01 00 01 	mvi r1,1
    9b64:	38 a5 36 f4 	ori r5,r5,0x36f4
    9b68:	5c 41 00 03 	bne r2,r1,9b74 <toState+0x488>
    9b6c:	78 05 00 01 	mvhi r5,0x1
    9b70:	38 a5 36 ec 	ori r5,r5,0x36ec
    9b74:	41 62 0b 76 	lbu r2,(r11+2934)
    9b78:	34 01 00 01 	mvi r1,1
    9b7c:	44 41 00 0d 	be r2,r1,9bb0 <toState+0x4c4>
    9b80:	78 06 00 01 	mvhi r6,0x1
    9b84:	38 c6 31 08 	ori r6,r6,0x3108
    9b88:	34 08 00 02 	mvi r8,2
    9b8c:	b8 c0 38 00 	mv r7,r6
    9b90:	5c 48 00 0c 	bne r2,r8,9bc0 <toState+0x4d4>
    9b94:	41 62 0e fc 	lbu r2,(r11+3836)
    9b98:	78 07 00 01 	mvhi r7,0x1
    9b9c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9ba0:	5c 41 00 08 	bne r2,r1,9bc0 <toState+0x4d4>
    9ba4:	78 07 00 01 	mvhi r7,0x1
    9ba8:	38 e7 37 04 	ori r7,r7,0x3704
    9bac:	e0 00 00 05 	bi 9bc0 <toState+0x4d4>
    9bb0:	78 06 00 01 	mvhi r6,0x1
    9bb4:	78 07 00 01 	mvhi r7,0x1
    9bb8:	38 c6 37 0c 	ori r6,r6,0x370c
    9bbc:	38 e7 31 08 	ori r7,r7,0x3108
    9bc0:	78 02 00 01 	mvhi r2,0x1
    9bc4:	34 01 00 01 	mvi r1,1
    9bc8:	38 42 38 90 	ori r2,r2,0x3890
    9bcc:	fb ff db 2d 	calli 880 <wrc_debug_printf>
    9bd0:	34 01 00 02 	mvi r1,2
    9bd4:	e0 00 01 58 	bi a134 <toState+0xa48>
    9bd8:	41 61 00 de 	lbu r1,(r11+222)
    9bdc:	78 04 00 01 	mvhi r4,0x1
    9be0:	34 02 00 08 	mvi r2,8
    9be4:	2d 63 00 dc 	lhu r3,(r11+220)
    9be8:	38 84 37 1c 	ori r4,r4,0x371c
    9bec:	44 22 00 07 	be r1,r2,9c08 <toState+0x51c>
    9bf0:	78 04 00 01 	mvhi r4,0x1
    9bf4:	34 02 00 05 	mvi r2,5
    9bf8:	38 84 37 14 	ori r4,r4,0x3714
    9bfc:	5c 22 00 03 	bne r1,r2,9c08 <toState+0x51c>
    9c00:	78 04 00 01 	mvhi r4,0x1
    9c04:	38 84 37 24 	ori r4,r4,0x3724
    9c08:	29 62 0b 78 	lw r2,(r11+2936)
    9c0c:	78 05 00 01 	mvhi r5,0x1
    9c10:	34 01 00 01 	mvi r1,1
    9c14:	38 a5 36 f4 	ori r5,r5,0x36f4
    9c18:	5c 41 00 03 	bne r2,r1,9c24 <toState+0x538>
    9c1c:	78 05 00 01 	mvhi r5,0x1
    9c20:	38 a5 36 ec 	ori r5,r5,0x36ec
    9c24:	41 62 0b 76 	lbu r2,(r11+2934)
    9c28:	34 01 00 01 	mvi r1,1
    9c2c:	44 41 00 0d 	be r2,r1,9c60 <toState+0x574>
    9c30:	78 06 00 01 	mvhi r6,0x1
    9c34:	38 c6 31 08 	ori r6,r6,0x3108
    9c38:	34 08 00 02 	mvi r8,2
    9c3c:	b8 c0 38 00 	mv r7,r6
    9c40:	5c 48 00 0c 	bne r2,r8,9c70 <toState+0x584>
    9c44:	41 62 0e fc 	lbu r2,(r11+3836)
    9c48:	78 07 00 01 	mvhi r7,0x1
    9c4c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9c50:	5c 41 00 08 	bne r2,r1,9c70 <toState+0x584>
    9c54:	78 07 00 01 	mvhi r7,0x1
    9c58:	38 e7 37 04 	ori r7,r7,0x3704
    9c5c:	e0 00 00 05 	bi 9c70 <toState+0x584>
    9c60:	78 06 00 01 	mvhi r6,0x1
    9c64:	78 07 00 01 	mvhi r7,0x1
    9c68:	38 c6 37 0c 	ori r6,r6,0x370c
    9c6c:	38 e7 31 08 	ori r7,r7,0x3108
    9c70:	78 02 00 01 	mvhi r2,0x1
    9c74:	34 01 00 01 	mvi r1,1
    9c78:	38 42 38 cc 	ori r2,r2,0x38cc
    9c7c:	fb ff db 01 	calli 880 <wrc_debug_printf>
    9c80:	41 63 00 f1 	lbu r3,(r11+241)
    9c84:	11 61 00 f0 	lb r1,(r11+240)
    9c88:	34 02 00 01 	mvi r2,1
    9c8c:	08 63 03 e8 	muli r3,r3,1000
    9c90:	bc 41 10 00 	sl r2,r2,r1
    9c94:	35 61 0b 40 	addi r1,r11,2880
    9c98:	88 62 10 00 	mul r2,r3,r2
    9c9c:	fb ff f7 d7 	calli 7bf8 <timerStart>
    9ca0:	34 01 00 03 	mvi r1,3
    9ca4:	e0 00 01 24 	bi a134 <toState+0xa48>
    9ca8:	41 61 00 de 	lbu r1,(r11+222)
    9cac:	78 04 00 01 	mvhi r4,0x1
    9cb0:	34 02 00 08 	mvi r2,8
    9cb4:	2d 63 00 dc 	lhu r3,(r11+220)
    9cb8:	38 84 37 1c 	ori r4,r4,0x371c
    9cbc:	44 22 00 07 	be r1,r2,9cd8 <toState+0x5ec>
    9cc0:	78 04 00 01 	mvhi r4,0x1
    9cc4:	34 02 00 05 	mvi r2,5
    9cc8:	38 84 37 14 	ori r4,r4,0x3714
    9ccc:	5c 22 00 03 	bne r1,r2,9cd8 <toState+0x5ec>
    9cd0:	78 04 00 01 	mvhi r4,0x1
    9cd4:	38 84 37 24 	ori r4,r4,0x3724
    9cd8:	29 62 0b 78 	lw r2,(r11+2936)
    9cdc:	78 05 00 01 	mvhi r5,0x1
    9ce0:	34 01 00 01 	mvi r1,1
    9ce4:	38 a5 36 f4 	ori r5,r5,0x36f4
    9ce8:	5c 41 00 03 	bne r2,r1,9cf4 <toState+0x608>
    9cec:	78 05 00 01 	mvhi r5,0x1
    9cf0:	38 a5 36 ec 	ori r5,r5,0x36ec
    9cf4:	41 62 0b 76 	lbu r2,(r11+2934)
    9cf8:	34 01 00 01 	mvi r1,1
    9cfc:	44 41 00 0d 	be r2,r1,9d30 <toState+0x644>
    9d00:	78 06 00 01 	mvhi r6,0x1
    9d04:	38 c6 31 08 	ori r6,r6,0x3108
    9d08:	34 08 00 02 	mvi r8,2
    9d0c:	b8 c0 38 00 	mv r7,r6
    9d10:	5c 48 00 0c 	bne r2,r8,9d40 <toState+0x654>
    9d14:	41 62 0e fc 	lbu r2,(r11+3836)
    9d18:	78 07 00 01 	mvhi r7,0x1
    9d1c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9d20:	5c 41 00 08 	bne r2,r1,9d40 <toState+0x654>
    9d24:	78 07 00 01 	mvhi r7,0x1
    9d28:	38 e7 37 04 	ori r7,r7,0x3704
    9d2c:	e0 00 00 05 	bi 9d40 <toState+0x654>
    9d30:	78 06 00 01 	mvhi r6,0x1
    9d34:	78 07 00 01 	mvhi r7,0x1
    9d38:	38 c6 37 0c 	ori r6,r6,0x370c
    9d3c:	38 e7 31 08 	ori r7,r7,0x3108
    9d40:	78 02 00 01 	mvhi r2,0x1
    9d44:	34 01 00 01 	mvi r1,1
    9d48:	38 42 39 0c 	ori r2,r2,0x390c
    9d4c:	fb ff da cd 	calli 880 <wrc_debug_printf>
    9d50:	11 62 00 f2 	lb r2,(r11+242)
    9d54:	34 0d 00 01 	mvi r13,1
    9d58:	35 61 0b 30 	addi r1,r11,2864
    9d5c:	bd a2 10 00 	sl r2,r13,r2
    9d60:	08 42 1f 40 	muli r2,r2,8000
    9d64:	fb ff f7 a5 	calli 7bf8 <timerStart>
    9d68:	11 62 00 f0 	lb r2,(r11+240)
    9d6c:	35 61 0b 50 	addi r1,r11,2896
    9d70:	bd a2 10 00 	sl r2,r13,r2
    9d74:	08 42 0b b8 	muli r2,r2,3000
    9d78:	fb ff f7 a0 	calli 7bf8 <timerStart>
    9d7c:	11 61 00 f4 	lb r1,(r11+244)
    9d80:	bd a1 68 00 	sl r13,r13,r1
    9d84:	35 61 0b 00 	addi r1,r11,2816
    9d88:	09 a2 07 d0 	muli r2,r13,2000
    9d8c:	fb ff f7 9b 	calli 7bf8 <timerStart>
    9d90:	34 01 00 05 	mvi r1,5
    9d94:	e0 00 00 e8 	bi a134 <toState+0xa48>
    9d98:	41 61 00 de 	lbu r1,(r11+222)
    9d9c:	78 04 00 01 	mvhi r4,0x1
    9da0:	34 02 00 08 	mvi r2,8
    9da4:	2d 63 00 dc 	lhu r3,(r11+220)
    9da8:	38 84 37 1c 	ori r4,r4,0x371c
    9dac:	44 22 00 07 	be r1,r2,9dc8 <toState+0x6dc>
    9db0:	78 04 00 01 	mvhi r4,0x1
    9db4:	34 02 00 05 	mvi r2,5
    9db8:	38 84 37 14 	ori r4,r4,0x3714
    9dbc:	5c 22 00 03 	bne r1,r2,9dc8 <toState+0x6dc>
    9dc0:	78 04 00 01 	mvhi r4,0x1
    9dc4:	38 84 37 24 	ori r4,r4,0x3724
    9dc8:	29 62 0b 78 	lw r2,(r11+2936)
    9dcc:	78 05 00 01 	mvhi r5,0x1
    9dd0:	34 01 00 01 	mvi r1,1
    9dd4:	38 a5 36 f4 	ori r5,r5,0x36f4
    9dd8:	5c 41 00 03 	bne r2,r1,9de4 <toState+0x6f8>
    9ddc:	78 05 00 01 	mvhi r5,0x1
    9de0:	38 a5 36 ec 	ori r5,r5,0x36ec
    9de4:	41 62 0b 76 	lbu r2,(r11+2934)
    9de8:	34 01 00 01 	mvi r1,1
    9dec:	44 41 00 0d 	be r2,r1,9e20 <toState+0x734>
    9df0:	78 06 00 01 	mvhi r6,0x1
    9df4:	38 c6 31 08 	ori r6,r6,0x3108
    9df8:	34 08 00 02 	mvi r8,2
    9dfc:	b8 c0 38 00 	mv r7,r6
    9e00:	5c 48 00 0c 	bne r2,r8,9e30 <toState+0x744>
    9e04:	41 62 0e fc 	lbu r2,(r11+3836)
    9e08:	78 07 00 01 	mvhi r7,0x1
    9e0c:	38 e7 36 fc 	ori r7,r7,0x36fc
    9e10:	5c 41 00 08 	bne r2,r1,9e30 <toState+0x744>
    9e14:	78 07 00 01 	mvhi r7,0x1
    9e18:	38 e7 37 04 	ori r7,r7,0x3704
    9e1c:	e0 00 00 05 	bi 9e30 <toState+0x744>
    9e20:	78 06 00 01 	mvhi r6,0x1
    9e24:	78 07 00 01 	mvhi r7,0x1
    9e28:	38 c6 37 0c 	ori r6,r6,0x370c
    9e2c:	38 e7 31 08 	ori r7,r7,0x3108
    9e30:	78 02 00 01 	mvhi r2,0x1
    9e34:	34 01 00 01 	mvi r1,1
    9e38:	38 42 39 48 	ori r2,r2,0x3948
    9e3c:	fb ff da 91 	calli 880 <wrc_debug_printf>
    9e40:	11 62 00 f4 	lb r2,(r11+244)
    9e44:	34 0d 00 01 	mvi r13,1
    9e48:	35 61 0b 00 	addi r1,r11,2816
    9e4c:	bd a2 10 00 	sl r2,r13,r2
    9e50:	08 42 03 e8 	muli r2,r2,1000
    9e54:	fb ff f7 69 	calli 7bf8 <timerStart>
    9e58:	41 62 00 f1 	lbu r2,(r11+241)
    9e5c:	11 61 00 f0 	lb r1,(r11+240)
    9e60:	08 42 03 e8 	muli r2,r2,1000
    9e64:	bd a1 68 00 	sl r13,r13,r1
    9e68:	35 61 0b 50 	addi r1,r11,2896
    9e6c:	88 4d 10 00 	mul r2,r2,r13
    9e70:	fb ff f7 62 	calli 7bf8 <timerStart>
    9e74:	34 01 00 06 	mvi r1,6
    9e78:	e0 00 00 af 	bi a134 <toState+0xa48>
    9e7c:	41 61 00 de 	lbu r1,(r11+222)
    9e80:	78 04 00 01 	mvhi r4,0x1
    9e84:	34 02 00 08 	mvi r2,8
    9e88:	2d 63 00 dc 	lhu r3,(r11+220)
    9e8c:	38 84 37 1c 	ori r4,r4,0x371c
    9e90:	44 22 00 07 	be r1,r2,9eac <toState+0x7c0>
    9e94:	78 04 00 01 	mvhi r4,0x1
    9e98:	34 02 00 05 	mvi r2,5
    9e9c:	38 84 37 14 	ori r4,r4,0x3714
    9ea0:	5c 22 00 03 	bne r1,r2,9eac <toState+0x7c0>
    9ea4:	78 04 00 01 	mvhi r4,0x1
    9ea8:	38 84 37 24 	ori r4,r4,0x3724
    9eac:	29 62 0b 78 	lw r2,(r11+2936)
    9eb0:	78 05 00 01 	mvhi r5,0x1
    9eb4:	34 01 00 01 	mvi r1,1
    9eb8:	38 a5 36 f4 	ori r5,r5,0x36f4
    9ebc:	5c 41 00 03 	bne r2,r1,9ec8 <toState+0x7dc>
    9ec0:	78 05 00 01 	mvhi r5,0x1
    9ec4:	38 a5 36 ec 	ori r5,r5,0x36ec
    9ec8:	41 62 0b 76 	lbu r2,(r11+2934)
    9ecc:	34 01 00 01 	mvi r1,1
    9ed0:	44 41 00 0d 	be r2,r1,9f04 <toState+0x818>
    9ed4:	78 06 00 01 	mvhi r6,0x1
    9ed8:	38 c6 31 08 	ori r6,r6,0x3108
    9edc:	34 08 00 02 	mvi r8,2
    9ee0:	b8 c0 38 00 	mv r7,r6
    9ee4:	5c 48 00 0c 	bne r2,r8,9f14 <toState+0x828>
    9ee8:	41 62 0e fc 	lbu r2,(r11+3836)
    9eec:	78 07 00 01 	mvhi r7,0x1
    9ef0:	38 e7 36 fc 	ori r7,r7,0x36fc
    9ef4:	5c 41 00 08 	bne r2,r1,9f14 <toState+0x828>
    9ef8:	78 07 00 01 	mvhi r7,0x1
    9efc:	38 e7 37 04 	ori r7,r7,0x3704
    9f00:	e0 00 00 05 	bi 9f14 <toState+0x828>
    9f04:	78 06 00 01 	mvhi r6,0x1
    9f08:	78 07 00 01 	mvhi r7,0x1
    9f0c:	38 c6 37 0c 	ori r6,r6,0x370c
    9f10:	38 e7 31 08 	ori r7,r7,0x3108
    9f14:	78 02 00 01 	mvhi r2,0x1
    9f18:	34 01 00 01 	mvi r1,1
    9f1c:	38 42 39 84 	ori r2,r2,0x3984
    9f20:	fb ff da 58 	calli 880 <wrc_debug_printf>
    9f24:	41 62 0b 76 	lbu r2,(r11+2934)
    9f28:	34 01 00 02 	mvi r1,2
    9f2c:	5c 41 00 37 	bne r2,r1,a008 <toState+0x91c>
    9f30:	41 62 0b 62 	lbu r2,(r11+2914)
    9f34:	34 01 00 01 	mvi r1,1
    9f38:	34 42 ff fe 	addi r2,r2,-2
    9f3c:	20 42 00 ff 	andi r2,r2,0xff
    9f40:	54 41 00 32 	bgu r2,r1,a008 <toState+0x91c>
    9f44:	41 61 0b 6d 	lbu r1,(r11+2925)
    9f48:	64 22 00 03 	cmpei r2,r1,3
    9f4c:	64 21 00 01 	cmpei r1,r1,1
    9f50:	b8 41 08 00 	or r1,r2,r1
    9f54:	44 20 00 2d 	be r1,r0,a008 <toState+0x91c>
    9f58:	29 61 0b a0 	lw r1,(r11+2976)
    9f5c:	44 20 00 03 	be r1,r0,9f68 <toState+0x87c>
    9f60:	29 61 0b 78 	lw r1,(r11+2936)
    9f64:	5c 20 00 73 	bne r1,r0,a130 <toState+0xa44>
    9f68:	34 01 00 00 	mvi r1,0
    9f6c:	b9 80 10 00 	mv r2,r12
    9f70:	b9 60 18 00 	mv r3,r11
    9f74:	f8 00 14 b8 	calli f254 <toWRState>
    9f78:	29 62 0b 78 	lw r2,(r11+2936)
    9f7c:	34 01 00 07 	mvi r1,7
    9f80:	31 61 00 de 	sb (r11+222),r1
    9f84:	78 05 00 01 	mvhi r5,0x1
    9f88:	34 01 00 01 	mvi r1,1
    9f8c:	2d 63 00 dc 	lhu r3,(r11+220)
    9f90:	38 a5 36 f4 	ori r5,r5,0x36f4
    9f94:	5c 41 00 03 	bne r2,r1,9fa0 <toState+0x8b4>
    9f98:	78 05 00 01 	mvhi r5,0x1
    9f9c:	38 a5 36 ec 	ori r5,r5,0x36ec
    9fa0:	41 62 0b 76 	lbu r2,(r11+2934)
    9fa4:	34 01 00 01 	mvi r1,1
    9fa8:	44 41 00 0d 	be r2,r1,9fdc <toState+0x8f0>
    9fac:	78 06 00 01 	mvhi r6,0x1
    9fb0:	38 c6 31 08 	ori r6,r6,0x3108
    9fb4:	34 04 00 02 	mvi r4,2
    9fb8:	b8 c0 38 00 	mv r7,r6
    9fbc:	5c 44 00 0c 	bne r2,r4,9fec <toState+0x900>
    9fc0:	41 62 0e fc 	lbu r2,(r11+3836)
    9fc4:	78 07 00 01 	mvhi r7,0x1
    9fc8:	38 e7 36 fc 	ori r7,r7,0x36fc
    9fcc:	5c 41 00 08 	bne r2,r1,9fec <toState+0x900>
    9fd0:	78 07 00 01 	mvhi r7,0x1
    9fd4:	38 e7 37 04 	ori r7,r7,0x3704
    9fd8:	e0 00 00 05 	bi 9fec <toState+0x900>
    9fdc:	78 06 00 01 	mvhi r6,0x1
    9fe0:	78 07 00 01 	mvhi r7,0x1
    9fe4:	38 c6 37 0c 	ori r6,r6,0x370c
    9fe8:	38 e7 31 08 	ori r7,r7,0x3108
    9fec:	78 02 00 01 	mvhi r2,0x1
    9ff0:	78 04 00 01 	mvhi r4,0x1
    9ff4:	34 01 00 01 	mvi r1,1
    9ff8:	38 42 39 c4 	ori r2,r2,0x39c4
    9ffc:	38 84 37 14 	ori r4,r4,0x3714
    a000:	fb ff da 20 	calli 880 <wrc_debug_printf>
    a004:	e0 00 00 4d 	bi a138 <toState+0xa4c>
    a008:	31 60 0b 76 	sb (r11+2934),r0
    a00c:	e0 00 00 49 	bi a130 <toState+0xa44>
    a010:	41 61 00 de 	lbu r1,(r11+222)
    a014:	78 04 00 01 	mvhi r4,0x1
    a018:	34 02 00 08 	mvi r2,8
    a01c:	2d 63 00 dc 	lhu r3,(r11+220)
    a020:	38 84 37 1c 	ori r4,r4,0x371c
    a024:	44 22 00 07 	be r1,r2,a040 <toState+0x954>
    a028:	78 04 00 01 	mvhi r4,0x1
    a02c:	34 02 00 05 	mvi r2,5
    a030:	38 84 37 14 	ori r4,r4,0x3714
    a034:	5c 22 00 03 	bne r1,r2,a040 <toState+0x954>
    a038:	78 04 00 01 	mvhi r4,0x1
    a03c:	38 84 37 24 	ori r4,r4,0x3724
    a040:	29 62 0b 78 	lw r2,(r11+2936)
    a044:	78 05 00 01 	mvhi r5,0x1
    a048:	34 01 00 01 	mvi r1,1
    a04c:	38 a5 36 f4 	ori r5,r5,0x36f4
    a050:	5c 41 00 03 	bne r2,r1,a05c <toState+0x970>
    a054:	78 05 00 01 	mvhi r5,0x1
    a058:	38 a5 36 ec 	ori r5,r5,0x36ec
    a05c:	41 62 0b 76 	lbu r2,(r11+2934)
    a060:	34 01 00 01 	mvi r1,1
    a064:	44 41 00 0d 	be r2,r1,a098 <toState+0x9ac>
    a068:	78 06 00 01 	mvhi r6,0x1
    a06c:	38 c6 31 08 	ori r6,r6,0x3108
    a070:	34 08 00 02 	mvi r8,2
    a074:	b8 c0 38 00 	mv r7,r6
    a078:	5c 48 00 0c 	bne r2,r8,a0a8 <toState+0x9bc>
    a07c:	41 62 0e fc 	lbu r2,(r11+3836)
    a080:	78 07 00 01 	mvhi r7,0x1
    a084:	38 e7 36 fc 	ori r7,r7,0x36fc
    a088:	5c 41 00 08 	bne r2,r1,a0a8 <toState+0x9bc>
    a08c:	78 07 00 01 	mvhi r7,0x1
    a090:	38 e7 37 04 	ori r7,r7,0x3704
    a094:	e0 00 00 05 	bi a0a8 <toState+0x9bc>
    a098:	78 06 00 01 	mvhi r6,0x1
    a09c:	78 07 00 01 	mvhi r7,0x1
    a0a0:	38 c6 37 0c 	ori r6,r6,0x370c
    a0a4:	38 e7 31 08 	ori r7,r7,0x3108
    a0a8:	78 02 00 01 	mvhi r2,0x1
    a0ac:	38 42 3a 10 	ori r2,r2,0x3a10
    a0b0:	34 01 00 01 	mvi r1,1
    a0b4:	fb ff d9 f3 	calli 880 <wrc_debug_printf>
    a0b8:	b9 60 08 00 	mv r1,r11
    a0bc:	fb ff f7 5c 	calli 7e2c <wr_servo_init>
    a0c0:	41 63 00 f1 	lbu r3,(r11+241)
    a0c4:	11 62 00 f0 	lb r2,(r11+240)
    a0c8:	34 0d 00 01 	mvi r13,1
    a0cc:	08 63 03 e8 	muli r3,r3,1000
    a0d0:	bd a2 10 00 	sl r2,r13,r2
    a0d4:	35 61 0b 40 	addi r1,r11,2880
    a0d8:	88 62 10 00 	mul r2,r3,r2
    a0dc:	59 60 0a d8 	sw (r11+2776),r0
    a0e0:	59 60 09 84 	sw (r11+2436),r0
    a0e4:	59 60 09 88 	sw (r11+2440),r0
    a0e8:	59 60 09 74 	sw (r11+2420),r0
    a0ec:	59 60 09 78 	sw (r11+2424),r0
    a0f0:	59 60 09 a4 	sw (r11+2468),r0
    a0f4:	59 60 09 a8 	sw (r11+2472),r0
    a0f8:	59 60 09 94 	sw (r11+2452),r0
    a0fc:	59 60 09 98 	sw (r11+2456),r0
    a100:	fb ff f6 be 	calli 7bf8 <timerStart>
    a104:	29 81 00 6c 	lw r1,(r12+108)
    a108:	44 20 00 05 	be r1,r0,a11c <toState+0xa30>
    a10c:	11 61 00 df 	lb r1,(r11+223)
    a110:	bd a1 68 00 	sl r13,r13,r1
    a114:	35 61 0b 20 	addi r1,r11,2848
    a118:	e0 00 00 04 	bi a128 <toState+0xa3c>
    a11c:	11 61 00 f4 	lb r1,(r11+244)
    a120:	bd a1 68 00 	sl r13,r13,r1
    a124:	35 61 0b 00 	addi r1,r11,2816
    a128:	09 a2 03 e8 	muli r2,r13,1000
    a12c:	fb ff f6 b3 	calli 7bf8 <timerStart>
    a130:	34 01 00 08 	mvi r1,8
    a134:	31 61 00 de 	sb (r11+222),r1
    a138:	29 81 00 24 	lw r1,(r12+36)
    a13c:	44 20 00 04 	be r1,r0,a14c <toState+0xa60>
    a140:	b9 80 08 00 	mv r1,r12
    a144:	b9 60 10 00 	mv r2,r11
    a148:	fb ff f6 a9 	calli 7bec <displayStats>
    a14c:	2b 9d 00 04 	lw ra,(sp+4)
    a150:	2b 8b 00 10 	lw r11,(sp+16)
    a154:	2b 8c 00 0c 	lw r12,(sp+12)
    a158:	2b 8d 00 08 	lw r13,(sp+8)
    a15c:	37 9c 00 10 	addi sp,sp,16
    a160:	c3 a0 00 00 	ret

0000a164 <doInit>:
    a164:	37 9c ff f4 	addi sp,sp,-12
    a168:	5b 8b 00 0c 	sw (sp+12),r11
    a16c:	5b 8c 00 08 	sw (sp+8),r12
    a170:	5b 9d 00 04 	sw (sp+4),ra
    a174:	b8 20 60 00 	mv r12,r1
    a178:	b8 40 58 00 	mv r11,r2
    a17c:	fb ff ee ce 	calli 5cb4 <initDataPort>
    a180:	41 62 0b 62 	lbu r2,(r11+2914)
    a184:	34 01 00 04 	mvi r1,4
    a188:	5c 41 00 05 	bne r2,r1,a19c <doInit+0x38>
    a18c:	35 61 00 04 	addi r1,r11,4
    a190:	b9 60 10 00 	mv r2,r11
    a194:	fb ff f5 ba 	calli 787c <autoDetectPortWrConfig>
    a198:	e0 00 00 2b 	bi a244 <doInit+0xe0>
    a19c:	41 61 00 de 	lbu r1,(r11+222)
    a1a0:	78 04 00 01 	mvhi r4,0x1
    a1a4:	34 02 00 08 	mvi r2,8
    a1a8:	2d 63 00 dc 	lhu r3,(r11+220)
    a1ac:	38 84 37 1c 	ori r4,r4,0x371c
    a1b0:	44 22 00 07 	be r1,r2,a1cc <doInit+0x68>
    a1b4:	78 04 00 01 	mvhi r4,0x1
    a1b8:	34 02 00 05 	mvi r2,5
    a1bc:	38 84 37 14 	ori r4,r4,0x3714
    a1c0:	5c 22 00 03 	bne r1,r2,a1cc <doInit+0x68>
    a1c4:	78 04 00 01 	mvhi r4,0x1
    a1c8:	38 84 37 24 	ori r4,r4,0x3724
    a1cc:	29 62 0b 78 	lw r2,(r11+2936)
    a1d0:	78 05 00 01 	mvhi r5,0x1
    a1d4:	34 01 00 01 	mvi r1,1
    a1d8:	38 a5 36 f4 	ori r5,r5,0x36f4
    a1dc:	5c 41 00 03 	bne r2,r1,a1e8 <doInit+0x84>
    a1e0:	78 05 00 01 	mvhi r5,0x1
    a1e4:	38 a5 36 ec 	ori r5,r5,0x36ec
    a1e8:	41 62 0b 76 	lbu r2,(r11+2934)
    a1ec:	34 01 00 01 	mvi r1,1
    a1f0:	44 41 00 0d 	be r2,r1,a224 <doInit+0xc0>
    a1f4:	78 06 00 01 	mvhi r6,0x1
    a1f8:	38 c6 31 08 	ori r6,r6,0x3108
    a1fc:	34 08 00 02 	mvi r8,2
    a200:	b8 c0 38 00 	mv r7,r6
    a204:	5c 48 00 0c 	bne r2,r8,a234 <doInit+0xd0>
    a208:	41 68 0e fc 	lbu r8,(r11+3836)
    a20c:	78 07 00 01 	mvhi r7,0x1
    a210:	38 e7 36 fc 	ori r7,r7,0x36fc
    a214:	5d 01 00 08 	bne r8,r1,a234 <doInit+0xd0>
    a218:	78 07 00 01 	mvhi r7,0x1
    a21c:	38 e7 37 04 	ori r7,r7,0x3704
    a220:	e0 00 00 05 	bi a234 <doInit+0xd0>
    a224:	78 06 00 01 	mvhi r6,0x1
    a228:	78 07 00 01 	mvhi r7,0x1
    a22c:	38 c6 37 0c 	ori r6,r6,0x370c
    a230:	38 e7 31 08 	ori r7,r7,0x3108
    a234:	78 02 00 01 	mvhi r2,0x1
    a238:	34 01 00 01 	mvi r1,1
    a23c:	38 42 3a 48 	ori r2,r2,0x3a48
    a240:	fb ff d9 90 	calli 880 <wrc_debug_printf>
    a244:	78 02 00 01 	mvhi r2,0x1
    a248:	35 61 0b 30 	addi r1,r11,2864
    a24c:	38 42 3a 90 	ori r2,r2,0x3a90
    a250:	fb ff f6 68 	calli 7bf0 <timerInit>
    a254:	78 02 00 01 	mvhi r2,0x1
    a258:	35 61 0b 20 	addi r1,r11,2848
    a25c:	38 42 3a 98 	ori r2,r2,0x3a98
    a260:	fb ff f6 64 	calli 7bf0 <timerInit>
    a264:	78 02 00 01 	mvhi r2,0x1
    a268:	35 61 0b 00 	addi r1,r11,2816
    a26c:	38 42 3a a4 	ori r2,r2,0x3aa4
    a270:	fb ff f6 60 	calli 7bf0 <timerInit>
    a274:	78 02 00 01 	mvhi r2,0x1
    a278:	35 61 0b 40 	addi r1,r11,2880
    a27c:	38 42 3a b0 	ori r2,r2,0x3ab0
    a280:	fb ff f6 5c 	calli 7bf0 <timerInit>
    a284:	78 02 00 01 	mvhi r2,0x1
    a288:	35 61 0b 50 	addi r1,r11,2896
    a28c:	38 42 3a bc 	ori r2,r2,0x3abc
    a290:	fb ff f6 58 	calli 7bf0 <timerInit>
    a294:	b9 60 10 00 	mv r2,r11
    a298:	b9 80 08 00 	mv r1,r12
    a29c:	fb ff f6 4f 	calli 7bd8 <initClock>
    a2a0:	b9 60 08 00 	mv r1,r11
    a2a4:	fb ff ef 14 	calli 5ef4 <m1>
    a2a8:	35 61 01 50 	addi r1,r11,336
    a2ac:	b9 60 10 00 	mv r2,r11
    a2b0:	fb ff f1 bb 	calli 699c <msgPackHeader>
    a2b4:	34 01 00 03 	mvi r1,3
    a2b8:	b9 80 10 00 	mv r2,r12
    a2bc:	b9 60 18 00 	mv r3,r11
    a2c0:	fb ff fd 0b 	calli 96ec <toState>
    a2c4:	34 01 00 01 	mvi r1,1
    a2c8:	2b 9d 00 04 	lw ra,(sp+4)
    a2cc:	2b 8b 00 0c 	lw r11,(sp+12)
    a2d0:	2b 8c 00 08 	lw r12,(sp+8)
    a2d4:	37 9c 00 0c 	addi sp,sp,12
    a2d8:	c3 a0 00 00 	ret

0000a2dc <msgIsFromCurrentParent>:
    a2dc:	37 9c ff f4 	addi sp,sp,-12
    a2e0:	5b 8b 00 0c 	sw (sp+12),r11
    a2e4:	5b 8c 00 08 	sw (sp+8),r12
    a2e8:	5b 9d 00 04 	sw (sp+4),ra
    a2ec:	b8 20 60 00 	mv r12,r1
    a2f0:	28 41 00 00 	lw r1,(r2+0)
    a2f4:	34 03 00 08 	mvi r3,8
    a2f8:	b8 40 58 00 	mv r11,r2
    a2fc:	34 21 00 34 	addi r1,r1,52
    a300:	35 82 00 14 	addi r2,r12,20
    a304:	f8 00 21 0e 	calli 1273c <memcmp>
    a308:	34 03 00 00 	mvi r3,0
    a30c:	5c 20 00 05 	bne r1,r0,a320 <msgIsFromCurrentParent+0x44>
    a310:	29 61 00 00 	lw r1,(r11+0)
    a314:	2c 23 00 3c 	lhu r3,(r1+60)
    a318:	2d 81 00 1c 	lhu r1,(r12+28)
    a31c:	e4 61 18 00 	cmpe r3,r3,r1
    a320:	b8 60 08 00 	mv r1,r3
    a324:	2b 9d 00 04 	lw ra,(sp+4)
    a328:	2b 8b 00 0c 	lw r11,(sp+12)
    a32c:	2b 8c 00 08 	lw r12,(sp+8)
    a330:	37 9c 00 0c 	addi sp,sp,12
    a334:	c3 a0 00 00 	ret

0000a338 <handleSync>:
    a338:	37 9c ff c4 	addi sp,sp,-60
    a33c:	5b 8b 00 1c 	sw (sp+28),r11
    a340:	5b 8c 00 18 	sw (sp+24),r12
    a344:	5b 8d 00 14 	sw (sp+20),r13
    a348:	5b 8e 00 10 	sw (sp+16),r14
    a34c:	5b 8f 00 0c 	sw (sp+12),r15
    a350:	5b 9d 00 08 	sw (sp+8),ra
    a354:	b8 20 60 00 	mv r12,r1
    a358:	34 01 00 2b 	mvi r1,43
    a35c:	b8 a0 68 00 	mv r13,r5
    a360:	b8 c0 70 00 	mv r14,r6
    a364:	b8 e0 58 00 	mv r11,r7
    a368:	48 61 00 06 	bg r3,r1,a380 <handleSync+0x48>
    a36c:	34 01 00 01 	mvi r1,1
    a370:	b8 c0 10 00 	mv r2,r6
    a374:	b8 e0 18 00 	mv r3,r7
    a378:	fb ff fc dd 	calli 96ec <toState>
    a37c:	e0 00 00 6b 	bi a528 <handleSync+0x1f0>
    a380:	40 e1 00 de 	lbu r1,(r7+222)
    a384:	34 02 00 07 	mvi r2,7
    a388:	44 22 00 04 	be r1,r2,a398 <handleSync+0x60>
    a38c:	34 02 00 08 	mvi r2,8
    a390:	5c 22 00 66 	bne r1,r2,a528 <handleSync+0x1f0>
    a394:	e0 00 00 03 	bi a3a0 <handleSync+0x68>
    a398:	40 e1 0b 76 	lbu r1,(r7+2934)
    a39c:	5c 20 00 63 	bne r1,r0,a528 <handleSync+0x1f0>
    a3a0:	5d a0 00 62 	bne r13,r0,a528 <handleSync+0x1f0>
    a3a4:	b9 80 08 00 	mv r1,r12
    a3a8:	b9 60 10 00 	mv r2,r11
    a3ac:	fb ff ff cc 	calli a2dc <msgIsFromCurrentParent>
    a3b0:	44 2d 00 5e 	be r1,r13,a528 <handleSync+0x1f0>
    a3b4:	29 61 0d bc 	lw r1,(r11+3516)
    a3b8:	37 8d 00 20 	addi r13,sp,32
    a3bc:	59 61 09 b4 	sw (r11+2484),r1
    a3c0:	29 61 0d c0 	lw r1,(r11+3520)
    a3c4:	59 61 09 b8 	sw (r11+2488),r1
    a3c8:	29 61 0d c4 	lw r1,(r11+3524)
    a3cc:	59 61 09 bc 	sw (r11+2492),r1
    a3d0:	29 61 0d d4 	lw r1,(r11+3540)
    a3d4:	59 61 09 c0 	sw (r11+2496),r1
    a3d8:	41 81 00 07 	lbu r1,(r12+7)
    a3dc:	20 21 00 02 	andi r1,r1,0x2
    a3e0:	44 20 00 39 	be r1,r0,a4c4 <handleSync+0x18c>
    a3e4:	34 01 00 01 	mvi r1,1
    a3e8:	59 61 0a d8 	sw (r11+2776),r1
    a3ec:	2d 81 00 1e 	lhu r1,(r12+30)
    a3f0:	29 82 00 10 	lw r2,(r12+16)
    a3f4:	b9 a0 18 00 	mv r3,r13
    a3f8:	0d 61 0a d2 	sh (r11+2770),r1
    a3fc:	29 81 00 0c 	lw r1,(r12+12)
    a400:	fb ff ed 82 	calli 5a08 <integer64_to_internalTime>
    a404:	2b 88 00 20 	lw r8,(sp+32)
    a408:	2b 81 00 24 	lw r1,(sp+36)
    a40c:	41 62 00 de 	lbu r2,(r11+222)
    a410:	78 04 00 01 	mvhi r4,0x1
    a414:	59 68 0a b4 	sw (r11+2740),r8
    a418:	59 61 0a b8 	sw (r11+2744),r1
    a41c:	34 05 00 08 	mvi r5,8
    a420:	2d 63 00 dc 	lhu r3,(r11+220)
    a424:	38 84 37 1c 	ori r4,r4,0x371c
    a428:	44 45 00 07 	be r2,r5,a444 <handleSync+0x10c>
    a42c:	78 04 00 01 	mvhi r4,0x1
    a430:	34 05 00 05 	mvi r5,5
    a434:	38 84 37 14 	ori r4,r4,0x3714
    a438:	5c 45 00 03 	bne r2,r5,a444 <handleSync+0x10c>
    a43c:	78 04 00 01 	mvhi r4,0x1
    a440:	38 84 37 24 	ori r4,r4,0x3724
    a444:	29 66 0b 78 	lw r6,(r11+2936)
    a448:	78 05 00 01 	mvhi r5,0x1
    a44c:	34 02 00 01 	mvi r2,1
    a450:	38 a5 36 f4 	ori r5,r5,0x36f4
    a454:	5c c2 00 03 	bne r6,r2,a460 <handleSync+0x128>
    a458:	78 05 00 01 	mvhi r5,0x1
    a45c:	38 a5 36 ec 	ori r5,r5,0x36ec
    a460:	41 69 0b 76 	lbu r9,(r11+2934)
    a464:	34 02 00 01 	mvi r2,1
    a468:	45 22 00 0d 	be r9,r2,a49c <handleSync+0x164>
    a46c:	78 06 00 01 	mvhi r6,0x1
    a470:	38 c6 31 08 	ori r6,r6,0x3108
    a474:	34 0a 00 02 	mvi r10,2
    a478:	b8 c0 38 00 	mv r7,r6
    a47c:	5d 2a 00 0c 	bne r9,r10,a4ac <handleSync+0x174>
    a480:	41 6a 0e fc 	lbu r10,(r11+3836)
    a484:	78 07 00 01 	mvhi r7,0x1
    a488:	38 e7 36 fc 	ori r7,r7,0x36fc
    a48c:	5d 42 00 08 	bne r10,r2,a4ac <handleSync+0x174>
    a490:	78 07 00 01 	mvhi r7,0x1
    a494:	38 e7 37 04 	ori r7,r7,0x3704
    a498:	e0 00 00 05 	bi a4ac <handleSync+0x174>
    a49c:	78 06 00 01 	mvhi r6,0x1
    a4a0:	78 07 00 01 	mvhi r7,0x1
    a4a4:	38 c6 37 0c 	ori r6,r6,0x370c
    a4a8:	38 e7 31 08 	ori r7,r7,0x3108
    a4ac:	78 02 00 01 	mvhi r2,0x1
    a4b0:	5b 81 00 04 	sw (sp+4),r1
    a4b4:	38 42 3a c8 	ori r2,r2,0x3ac8
    a4b8:	34 01 00 01 	mvi r1,1
    a4bc:	fb ff d8 f1 	calli 880 <wrc_debug_printf>
    a4c0:	e0 00 00 1a 	bi a528 <handleSync+0x1f0>
    a4c4:	35 6f 01 2c 	addi r15,r11,300
    a4c8:	35 61 05 50 	addi r1,r11,1360
    a4cc:	b9 e0 10 00 	mv r2,r15
    a4d0:	fb ff f1 7c 	calli 6ac0 <msgUnpackSync>
    a4d4:	29 62 01 18 	lw r2,(r11+280)
    a4d8:	29 61 01 14 	lw r1,(r11+276)
    a4dc:	b9 a0 18 00 	mv r3,r13
    a4e0:	37 8c 00 30 	addi r12,sp,48
    a4e4:	fb ff ed 49 	calli 5a08 <integer64_to_internalTime>
    a4e8:	b9 a0 08 00 	mv r1,r13
    a4ec:	f8 00 15 60 	calli fa6c <timeInternal_display>
    a4f0:	b9 80 08 00 	mv r1,r12
    a4f4:	b9 e0 10 00 	mv r2,r15
    a4f8:	59 60 0a d8 	sw (r11+2776),r0
    a4fc:	fb ff ed 0f 	calli 5938 <toInternalTime>
    a500:	b9 80 08 00 	mv r1,r12
    a504:	35 62 09 b4 	addi r2,r11,2484
    a508:	35 63 0a e0 	addi r3,r11,2784
    a50c:	b9 c0 20 00 	mv r4,r14
    a510:	b9 60 28 00 	mv r5,r11
    a514:	b9 a0 30 00 	mv r6,r13
    a518:	fb ff f5 b3 	calli 7be4 <updateOffset>
    a51c:	b9 c0 08 00 	mv r1,r14
    a520:	b9 60 10 00 	mv r2,r11
    a524:	fb ff f5 b1 	calli 7be8 <updateClock>
    a528:	2b 9d 00 08 	lw ra,(sp+8)
    a52c:	2b 8b 00 1c 	lw r11,(sp+28)
    a530:	2b 8c 00 18 	lw r12,(sp+24)
    a534:	2b 8d 00 14 	lw r13,(sp+20)
    a538:	2b 8e 00 10 	lw r14,(sp+16)
    a53c:	2b 8f 00 0c 	lw r15,(sp+12)
    a540:	37 9c 00 3c 	addi sp,sp,60
    a544:	c3 a0 00 00 	ret

0000a548 <handleFollowUp>:
    a548:	37 9c ff c4 	addi sp,sp,-60
    a54c:	5b 8b 00 1c 	sw (sp+28),r11
    a550:	5b 8c 00 18 	sw (sp+24),r12
    a554:	5b 9d 00 14 	sw (sp+20),ra
    a558:	b8 20 60 00 	mv r12,r1
    a55c:	34 01 00 2b 	mvi r1,43
    a560:	b8 a0 10 00 	mv r2,r5
    a564:	b8 c0 58 00 	mv r11,r6
    a568:	48 61 00 05 	bg r3,r1,a57c <handleFollowUp+0x34>
    a56c:	34 01 00 01 	mvi r1,1
    a570:	b8 c0 18 00 	mv r3,r6
    a574:	fb ff fc 5e 	calli 96ec <toState>
    a578:	e0 00 00 bf 	bi a874 <handleFollowUp+0x32c>
    a57c:	5c 80 00 be 	bne r4,r0,a874 <handleFollowUp+0x32c>
    a580:	40 c1 00 de 	lbu r1,(r6+222)
    a584:	34 02 00 07 	mvi r2,7
    a588:	44 22 00 04 	be r1,r2,a598 <handleFollowUp+0x50>
    a58c:	34 02 00 08 	mvi r2,8
    a590:	5c 22 00 b9 	bne r1,r2,a874 <handleFollowUp+0x32c>
    a594:	e0 00 00 03 	bi a5a0 <handleFollowUp+0x58>
    a598:	40 c1 0b 76 	lbu r1,(r6+2934)
    a59c:	5c 20 00 b6 	bne r1,r0,a874 <handleFollowUp+0x32c>
    a5a0:	b9 80 08 00 	mv r1,r12
    a5a4:	b9 60 10 00 	mv r2,r11
    a5a8:	fb ff ff 4d 	calli a2dc <msgIsFromCurrentParent>
    a5ac:	44 20 00 88 	be r1,r0,a7cc <handleFollowUp+0x284>
    a5b0:	29 61 0a d8 	lw r1,(r11+2776)
    a5b4:	44 20 00 5c 	be r1,r0,a724 <handleFollowUp+0x1dc>
    a5b8:	2d 62 0a d2 	lhu r2,(r11+2770)
    a5bc:	2d 81 00 1e 	lhu r1,(r12+30)
    a5c0:	5c 41 00 2f 	bne r2,r1,a67c <handleFollowUp+0x134>
    a5c4:	35 6c 01 2c 	addi r12,r11,300
    a5c8:	b9 80 10 00 	mv r2,r12
    a5cc:	35 61 05 50 	addi r1,r11,1360
    a5d0:	fb ff f2 18 	calli 6e30 <msgUnpackFollowUp>
    a5d4:	b9 80 10 00 	mv r2,r12
    a5d8:	37 81 00 30 	addi r1,sp,48
    a5dc:	59 60 0a d8 	sw (r11+2776),r0
    a5e0:	fb ff ec d6 	calli 5938 <toInternalTime>
    a5e4:	29 61 01 14 	lw r1,(r11+276)
    a5e8:	29 62 01 18 	lw r2,(r11+280)
    a5ec:	37 8c 00 20 	addi r12,sp,32
    a5f0:	b9 80 18 00 	mv r3,r12
    a5f4:	5b 80 00 38 	sw (sp+56),r0
    a5f8:	fb ff ed 04 	calli 5a08 <integer64_to_internalTime>
    a5fc:	b9 80 08 00 	mv r1,r12
    a600:	b9 80 10 00 	mv r2,r12
    a604:	35 63 0a b4 	addi r3,r11,2740
    a608:	fb ff ed 8f 	calli 5c44 <addTime>
    a60c:	29 64 09 b4 	lw r4,(r11+2484)
    a610:	29 63 09 b8 	lw r3,(r11+2488)
    a614:	29 62 09 bc 	lw r2,(r11+2492)
    a618:	29 61 09 c0 	lw r1,(r11+2496)
    a61c:	5b 84 00 04 	sw (sp+4),r4
    a620:	5b 83 00 08 	sw (sp+8),r3
    a624:	5b 82 00 0c 	sw (sp+12),r2
    a628:	2b 83 00 34 	lw r3,(sp+52)
    a62c:	2b 82 00 30 	lw r2,(sp+48)
    a630:	2b 84 00 38 	lw r4,(sp+56)
    a634:	2b 85 00 3c 	lw r5,(sp+60)
    a638:	5b 81 00 10 	sw (sp+16),r1
    a63c:	b9 60 08 00 	mv r1,r11
    a640:	fb ff f6 6d 	calli 7ff4 <wr_servo_got_sync>
    a644:	34 01 00 01 	mvi r1,1
    a648:	59 61 09 c0 	sw (r11+2496),r1
    a64c:	78 01 00 01 	mvhi r1,0x1
    a650:	38 21 59 38 	ori r1,r1,0x5938
    a654:	28 21 00 00 	lw r1,(r1+0)
    a658:	44 20 00 87 	be r1,r0,a874 <handleFollowUp+0x32c>
    a65c:	2b 83 00 30 	lw r3,(sp+48)
    a660:	2b 84 00 34 	lw r4,(sp+52)
    a664:	2b 85 00 38 	lw r5,(sp+56)
    a668:	78 02 00 01 	mvhi r2,0x1
    a66c:	34 01 00 00 	mvi r1,0
    a670:	38 42 3b 18 	ori r2,r2,0x3b18
    a674:	fb ff d8 83 	calli 880 <wrc_debug_printf>
    a678:	e0 00 00 7f 	bi a874 <handleFollowUp+0x32c>
    a67c:	41 61 00 de 	lbu r1,(r11+222)
    a680:	78 04 00 01 	mvhi r4,0x1
    a684:	34 02 00 08 	mvi r2,8
    a688:	2d 63 00 dc 	lhu r3,(r11+220)
    a68c:	38 84 37 1c 	ori r4,r4,0x371c
    a690:	44 22 00 07 	be r1,r2,a6ac <handleFollowUp+0x164>
    a694:	78 04 00 01 	mvhi r4,0x1
    a698:	34 02 00 05 	mvi r2,5
    a69c:	38 84 37 14 	ori r4,r4,0x3714
    a6a0:	5c 22 00 03 	bne r1,r2,a6ac <handleFollowUp+0x164>
    a6a4:	78 04 00 01 	mvhi r4,0x1
    a6a8:	38 84 37 24 	ori r4,r4,0x3724
    a6ac:	29 62 0b 78 	lw r2,(r11+2936)
    a6b0:	78 05 00 01 	mvhi r5,0x1
    a6b4:	34 01 00 01 	mvi r1,1
    a6b8:	38 a5 36 f4 	ori r5,r5,0x36f4
    a6bc:	5c 41 00 03 	bne r2,r1,a6c8 <handleFollowUp+0x180>
    a6c0:	78 05 00 01 	mvhi r5,0x1
    a6c4:	38 a5 36 ec 	ori r5,r5,0x36ec
    a6c8:	41 61 0b 76 	lbu r1,(r11+2934)
    a6cc:	34 02 00 01 	mvi r2,1
    a6d0:	44 22 00 0d 	be r1,r2,a704 <handleFollowUp+0x1bc>
    a6d4:	78 06 00 01 	mvhi r6,0x1
    a6d8:	38 c6 31 08 	ori r6,r6,0x3108
    a6dc:	34 08 00 02 	mvi r8,2
    a6e0:	b8 c0 38 00 	mv r7,r6
    a6e4:	5c 28 00 0c 	bne r1,r8,a714 <handleFollowUp+0x1cc>
    a6e8:	41 68 0e fc 	lbu r8,(r11+3836)
    a6ec:	78 07 00 01 	mvhi r7,0x1
    a6f0:	38 e7 36 fc 	ori r7,r7,0x36fc
    a6f4:	5d 02 00 08 	bne r8,r2,a714 <handleFollowUp+0x1cc>
    a6f8:	78 07 00 01 	mvhi r7,0x1
    a6fc:	38 e7 37 04 	ori r7,r7,0x3704
    a700:	e0 00 00 05 	bi a714 <handleFollowUp+0x1cc>
    a704:	78 06 00 01 	mvhi r6,0x1
    a708:	78 07 00 01 	mvhi r7,0x1
    a70c:	38 c6 37 0c 	ori r6,r6,0x370c
    a710:	38 e7 31 08 	ori r7,r7,0x3108
    a714:	78 02 00 01 	mvhi r2,0x1
    a718:	34 01 00 01 	mvi r1,1
    a71c:	38 42 3b 50 	ori r2,r2,0x3b50
    a720:	e0 00 00 54 	bi a870 <handleFollowUp+0x328>
    a724:	41 61 00 de 	lbu r1,(r11+222)
    a728:	78 04 00 01 	mvhi r4,0x1
    a72c:	34 02 00 08 	mvi r2,8
    a730:	2d 63 00 dc 	lhu r3,(r11+220)
    a734:	38 84 37 1c 	ori r4,r4,0x371c
    a738:	44 22 00 07 	be r1,r2,a754 <handleFollowUp+0x20c>
    a73c:	78 04 00 01 	mvhi r4,0x1
    a740:	34 02 00 05 	mvi r2,5
    a744:	38 84 37 14 	ori r4,r4,0x3714
    a748:	5c 22 00 03 	bne r1,r2,a754 <handleFollowUp+0x20c>
    a74c:	78 04 00 01 	mvhi r4,0x1
    a750:	38 84 37 24 	ori r4,r4,0x3724
    a754:	29 62 0b 78 	lw r2,(r11+2936)
    a758:	78 05 00 01 	mvhi r5,0x1
    a75c:	34 01 00 01 	mvi r1,1
    a760:	38 a5 36 f4 	ori r5,r5,0x36f4
    a764:	5c 41 00 03 	bne r2,r1,a770 <handleFollowUp+0x228>
    a768:	78 05 00 01 	mvhi r5,0x1
    a76c:	38 a5 36 ec 	ori r5,r5,0x36ec
    a770:	41 61 0b 76 	lbu r1,(r11+2934)
    a774:	34 02 00 01 	mvi r2,1
    a778:	44 22 00 0d 	be r1,r2,a7ac <handleFollowUp+0x264>
    a77c:	78 06 00 01 	mvhi r6,0x1
    a780:	38 c6 31 08 	ori r6,r6,0x3108
    a784:	34 08 00 02 	mvi r8,2
    a788:	b8 c0 38 00 	mv r7,r6
    a78c:	5c 28 00 0c 	bne r1,r8,a7bc <handleFollowUp+0x274>
    a790:	41 68 0e fc 	lbu r8,(r11+3836)
    a794:	78 07 00 01 	mvhi r7,0x1
    a798:	38 e7 36 fc 	ori r7,r7,0x36fc
    a79c:	5d 02 00 08 	bne r8,r2,a7bc <handleFollowUp+0x274>
    a7a0:	78 07 00 01 	mvhi r7,0x1
    a7a4:	38 e7 37 04 	ori r7,r7,0x3704
    a7a8:	e0 00 00 05 	bi a7bc <handleFollowUp+0x274>
    a7ac:	78 06 00 01 	mvhi r6,0x1
    a7b0:	78 07 00 01 	mvhi r7,0x1
    a7b4:	38 c6 37 0c 	ori r6,r6,0x370c
    a7b8:	38 e7 31 08 	ori r7,r7,0x3108
    a7bc:	78 02 00 01 	mvhi r2,0x1
    a7c0:	34 01 00 01 	mvi r1,1
    a7c4:	38 42 3b b4 	ori r2,r2,0x3bb4
    a7c8:	e0 00 00 2a 	bi a870 <handleFollowUp+0x328>
    a7cc:	41 61 00 de 	lbu r1,(r11+222)
    a7d0:	78 04 00 01 	mvhi r4,0x1
    a7d4:	34 02 00 08 	mvi r2,8
    a7d8:	2d 63 00 dc 	lhu r3,(r11+220)
    a7dc:	38 84 37 1c 	ori r4,r4,0x371c
    a7e0:	44 22 00 07 	be r1,r2,a7fc <handleFollowUp+0x2b4>
    a7e4:	78 04 00 01 	mvhi r4,0x1
    a7e8:	34 02 00 05 	mvi r2,5
    a7ec:	38 84 37 14 	ori r4,r4,0x3714
    a7f0:	5c 22 00 03 	bne r1,r2,a7fc <handleFollowUp+0x2b4>
    a7f4:	78 04 00 01 	mvhi r4,0x1
    a7f8:	38 84 37 24 	ori r4,r4,0x3724
    a7fc:	29 62 0b 78 	lw r2,(r11+2936)
    a800:	78 05 00 01 	mvhi r5,0x1
    a804:	34 01 00 01 	mvi r1,1
    a808:	38 a5 36 f4 	ori r5,r5,0x36f4
    a80c:	5c 41 00 03 	bne r2,r1,a818 <handleFollowUp+0x2d0>
    a810:	78 05 00 01 	mvhi r5,0x1
    a814:	38 a5 36 ec 	ori r5,r5,0x36ec
    a818:	41 61 0b 76 	lbu r1,(r11+2934)
    a81c:	34 02 00 01 	mvi r2,1
    a820:	44 22 00 0d 	be r1,r2,a854 <handleFollowUp+0x30c>
    a824:	78 06 00 01 	mvhi r6,0x1
    a828:	38 c6 31 08 	ori r6,r6,0x3108
    a82c:	34 08 00 02 	mvi r8,2
    a830:	b8 c0 38 00 	mv r7,r6
    a834:	5c 28 00 0c 	bne r1,r8,a864 <handleFollowUp+0x31c>
    a838:	41 68 0e fc 	lbu r8,(r11+3836)
    a83c:	78 07 00 01 	mvhi r7,0x1
    a840:	38 e7 36 fc 	ori r7,r7,0x36fc
    a844:	5d 02 00 08 	bne r8,r2,a864 <handleFollowUp+0x31c>
    a848:	78 07 00 01 	mvhi r7,0x1
    a84c:	38 e7 37 04 	ori r7,r7,0x3704
    a850:	e0 00 00 05 	bi a864 <handleFollowUp+0x31c>
    a854:	78 06 00 01 	mvhi r6,0x1
    a858:	78 07 00 01 	mvhi r7,0x1
    a85c:	38 c6 37 0c 	ori r6,r6,0x370c
    a860:	38 e7 31 08 	ori r7,r7,0x3108
    a864:	78 02 00 01 	mvhi r2,0x1
    a868:	34 01 00 01 	mvi r1,1
    a86c:	38 42 3c 10 	ori r2,r2,0x3c10
    a870:	fb ff d8 04 	calli 880 <wrc_debug_printf>
    a874:	2b 9d 00 14 	lw ra,(sp+20)
    a878:	2b 8b 00 1c 	lw r11,(sp+28)
    a87c:	2b 8c 00 18 	lw r12,(sp+24)
    a880:	37 9c 00 3c 	addi sp,sp,60
    a884:	c3 a0 00 00 	ret

0000a888 <handleDelayResp>:
    a888:	37 9c ff c0 	addi sp,sp,-64
    a88c:	5b 8b 00 20 	sw (sp+32),r11
    a890:	5b 8c 00 1c 	sw (sp+28),r12
    a894:	5b 8d 00 18 	sw (sp+24),r13
    a898:	5b 9d 00 14 	sw (sp+20),ra
    a89c:	b8 20 60 00 	mv r12,r1
    a8a0:	28 a1 00 6c 	lw r1,(r5+108)
    a8a4:	b8 a0 10 00 	mv r2,r5
    a8a8:	b8 c0 58 00 	mv r11,r6
    a8ac:	44 20 00 66 	be r1,r0,aa44 <handleDelayResp+0x1bc>
    a8b0:	34 01 00 35 	mvi r1,53
    a8b4:	48 61 00 05 	bg r3,r1,a8c8 <handleDelayResp+0x40>
    a8b8:	34 01 00 01 	mvi r1,1
    a8bc:	b8 c0 18 00 	mv r3,r6
    a8c0:	fb ff fb 8b 	calli 96ec <toState>
    a8c4:	e0 00 00 60 	bi aa44 <handleDelayResp+0x1bc>
    a8c8:	40 cd 00 de 	lbu r13,(r6+222)
    a8cc:	34 01 00 08 	mvi r1,8
    a8d0:	5d a1 00 5d 	bne r13,r1,aa44 <handleDelayResp+0x1bc>
    a8d4:	34 c1 05 50 	addi r1,r6,1360
    a8d8:	34 c2 01 2c 	addi r2,r6,300
    a8dc:	fb ff f2 4a 	calli 7204 <msgUnpackDelayResp>
    a8e0:	41 61 00 de 	lbu r1,(r11+222)
    a8e4:	78 04 00 01 	mvhi r4,0x1
    a8e8:	2d 63 00 dc 	lhu r3,(r11+220)
    a8ec:	38 84 37 1c 	ori r4,r4,0x371c
    a8f0:	44 2d 00 07 	be r1,r13,a90c <handleDelayResp+0x84>
    a8f4:	78 04 00 01 	mvhi r4,0x1
    a8f8:	34 02 00 05 	mvi r2,5
    a8fc:	38 84 37 14 	ori r4,r4,0x3714
    a900:	5c 22 00 03 	bne r1,r2,a90c <handleDelayResp+0x84>
    a904:	78 04 00 01 	mvhi r4,0x1
    a908:	38 84 37 24 	ori r4,r4,0x3724
    a90c:	29 62 0b 78 	lw r2,(r11+2936)
    a910:	78 05 00 01 	mvhi r5,0x1
    a914:	34 01 00 01 	mvi r1,1
    a918:	38 a5 36 f4 	ori r5,r5,0x36f4
    a91c:	5c 41 00 03 	bne r2,r1,a928 <handleDelayResp+0xa0>
    a920:	78 05 00 01 	mvhi r5,0x1
    a924:	38 a5 36 ec 	ori r5,r5,0x36ec
    a928:	41 62 0b 76 	lbu r2,(r11+2934)
    a92c:	34 01 00 01 	mvi r1,1
    a930:	44 41 00 0d 	be r2,r1,a964 <handleDelayResp+0xdc>
    a934:	78 06 00 01 	mvhi r6,0x1
    a938:	38 c6 31 08 	ori r6,r6,0x3108
    a93c:	34 08 00 02 	mvi r8,2
    a940:	b8 c0 38 00 	mv r7,r6
    a944:	5c 48 00 0c 	bne r2,r8,a974 <handleDelayResp+0xec>
    a948:	41 68 0e fc 	lbu r8,(r11+3836)
    a94c:	78 07 00 01 	mvhi r7,0x1
    a950:	38 e7 36 fc 	ori r7,r7,0x36fc
    a954:	5d 01 00 08 	bne r8,r1,a974 <handleDelayResp+0xec>
    a958:	78 07 00 01 	mvhi r7,0x1
    a95c:	38 e7 37 04 	ori r7,r7,0x3704
    a960:	e0 00 00 05 	bi a974 <handleDelayResp+0xec>
    a964:	78 06 00 01 	mvhi r6,0x1
    a968:	78 07 00 01 	mvhi r7,0x1
    a96c:	38 c6 37 0c 	ori r6,r6,0x370c
    a970:	38 e7 31 08 	ori r7,r7,0x3108
    a974:	29 61 01 2c 	lw r1,(r11+300)
    a978:	2d 68 01 30 	lhu r8,(r11+304)
    a97c:	78 02 00 01 	mvhi r2,0x1
    a980:	5b 81 00 08 	sw (sp+8),r1
    a984:	29 61 01 34 	lw r1,(r11+308)
    a988:	38 42 3c 70 	ori r2,r2,0x3c70
    a98c:	5b 80 00 04 	sw (sp+4),r0
    a990:	5b 81 00 10 	sw (sp+16),r1
    a994:	34 01 00 01 	mvi r1,1
    a998:	5b 80 00 0c 	sw (sp+12),r0
    a99c:	fb ff d7 b9 	calli 880 <wrc_debug_printf>
    a9a0:	b9 60 10 00 	mv r2,r11
    a9a4:	b9 80 08 00 	mv r1,r12
    a9a8:	fb ff fe 4d 	calli a2dc <msgIsFromCurrentParent>
    a9ac:	b8 20 68 00 	mv r13,r1
    a9b0:	35 62 01 38 	addi r2,r11,312
    a9b4:	35 61 00 d4 	addi r1,r11,212
    a9b8:	34 03 00 08 	mvi r3,8
    a9bc:	f8 00 1f 60 	calli 1273c <memcmp>
    a9c0:	5c 20 00 21 	bne r1,r0,aa44 <handleDelayResp+0x1bc>
    a9c4:	2d 62 0a ca 	lhu r2,(r11+2762)
    a9c8:	2d 81 00 1e 	lhu r1,(r12+30)
    a9cc:	34 42 ff ff 	addi r2,r2,-1
    a9d0:	5c 41 00 1d 	bne r2,r1,aa44 <handleDelayResp+0x1bc>
    a9d4:	2d 63 00 dc 	lhu r3,(r11+220)
    a9d8:	2d 62 01 40 	lhu r2,(r11+320)
    a9dc:	7d a1 00 00 	cmpnei r1,r13,0
    a9e0:	e4 62 10 00 	cmpe r2,r3,r2
    a9e4:	a0 22 08 00 	and r1,r1,r2
    a9e8:	44 20 00 17 	be r1,r0,aa44 <handleDelayResp+0x1bc>
    a9ec:	37 81 00 34 	addi r1,sp,52
    a9f0:	35 62 01 2c 	addi r2,r11,300
    a9f4:	fb ff eb d1 	calli 5938 <toInternalTime>
    a9f8:	2b 81 00 34 	lw r1,(sp+52)
    a9fc:	29 82 00 10 	lw r2,(r12+16)
    aa00:	37 83 00 24 	addi r3,sp,36
    aa04:	59 61 09 d4 	sw (r11+2516),r1
    aa08:	2b 81 00 38 	lw r1,(sp+56)
    aa0c:	59 61 09 d8 	sw (r11+2520),r1
    aa10:	2b 81 00 3c 	lw r1,(sp+60)
    aa14:	59 61 09 dc 	sw (r11+2524),r1
    aa18:	2b 81 00 40 	lw r1,(sp+64)
    aa1c:	59 61 09 e0 	sw (r11+2528),r1
    aa20:	29 81 00 0c 	lw r1,(r12+12)
    aa24:	fb ff eb f9 	calli 5a08 <integer64_to_internalTime>
    aa28:	29 82 00 0c 	lw r2,(r12+12)
    aa2c:	b9 60 08 00 	mv r1,r11
    aa30:	fb ff f5 89 	calli 8054 <wr_servo_got_delay>
    aa34:	b9 60 08 00 	mv r1,r11
    aa38:	fb ff f5 fa 	calli 8220 <wr_servo_update>
    aa3c:	41 81 00 21 	lbu r1,(r12+33)
    aa40:	31 61 00 df 	sb (r11+223),r1
    aa44:	2b 9d 00 14 	lw ra,(sp+20)
    aa48:	2b 8b 00 20 	lw r11,(sp+32)
    aa4c:	2b 8c 00 1c 	lw r12,(sp+28)
    aa50:	2b 8d 00 18 	lw r13,(sp+24)
    aa54:	37 9c 00 40 	addi sp,sp,64
    aa58:	c3 a0 00 00 	ret

0000aa5c <handlePDelayRespFollowUp>:
    aa5c:	37 9c ff b8 	addi sp,sp,-72
    aa60:	5b 8b 00 28 	sw (sp+40),r11
    aa64:	5b 8c 00 24 	sw (sp+36),r12
    aa68:	5b 8d 00 20 	sw (sp+32),r13
    aa6c:	5b 8e 00 1c 	sw (sp+28),r14
    aa70:	5b 8f 00 18 	sw (sp+24),r15
    aa74:	5b 9d 00 14 	sw (sp+20),ra
    aa78:	b8 20 68 00 	mv r13,r1
    aa7c:	28 a1 00 6c 	lw r1,(r5+108)
    aa80:	b8 a0 60 00 	mv r12,r5
    aa84:	b8 c0 58 00 	mv r11,r6
    aa88:	5c 20 00 98 	bne r1,r0,ace8 <handlePDelayRespFollowUp+0x28c>
    aa8c:	34 01 00 35 	mvi r1,53
    aa90:	48 61 00 06 	bg r3,r1,aaa8 <handlePDelayRespFollowUp+0x4c>
    aa94:	34 01 00 01 	mvi r1,1
    aa98:	b8 a0 10 00 	mv r2,r5
    aa9c:	b8 c0 18 00 	mv r3,r6
    aaa0:	fb ff fb 13 	calli 96ec <toState>
    aaa4:	e0 00 00 91 	bi ace8 <handlePDelayRespFollowUp+0x28c>
    aaa8:	40 ce 00 de 	lbu r14,(r6+222)
    aaac:	34 0f 00 05 	mvi r15,5
    aab0:	45 cf 00 44 	be r14,r15,abc0 <handlePDelayRespFollowUp+0x164>
    aab4:	34 01 00 08 	mvi r1,8
    aab8:	5d c1 00 8c 	bne r14,r1,ace8 <handlePDelayRespFollowUp+0x28c>
    aabc:	2c c1 0a c8 	lhu r1,(r6+2760)
    aac0:	2d a2 00 1e 	lhu r2,(r13+30)
    aac4:	34 21 ff ff 	addi r1,r1,-1
    aac8:	5c 41 00 3e 	bne r2,r1,abc0 <handlePDelayRespFollowUp+0x164>
    aacc:	34 cc 01 2c 	addi r12,r6,300
    aad0:	34 c1 05 50 	addi r1,r6,1360
    aad4:	b9 80 10 00 	mv r2,r12
    aad8:	fb ff f2 2e 	calli 7390 <msgUnpackPDelayRespFollowUp>
    aadc:	37 81 00 3c 	addi r1,sp,60
    aae0:	b9 80 10 00 	mv r2,r12
    aae4:	fb ff eb 95 	calli 5938 <toInternalTime>
    aae8:	2b 81 00 3c 	lw r1,(sp+60)
    aaec:	29 62 01 18 	lw r2,(r11+280)
    aaf0:	37 83 00 2c 	addi r3,sp,44
    aaf4:	59 61 09 a4 	sw (r11+2468),r1
    aaf8:	2b 81 00 40 	lw r1,(sp+64)
    aafc:	59 61 09 a8 	sw (r11+2472),r1
    ab00:	29 61 01 14 	lw r1,(r11+276)
    ab04:	fb ff eb c1 	calli 5a08 <integer64_to_internalTime>
    ab08:	29 a2 00 0c 	lw r2,(r13+12)
    ab0c:	b9 60 08 00 	mv r1,r11
    ab10:	fb ff f5 7f 	calli 810c <wr_servo_got_delay_P2P>
    ab14:	b9 60 08 00 	mv r1,r11
    ab18:	fb ff f5 c2 	calli 8220 <wr_servo_update>
    ab1c:	41 61 00 de 	lbu r1,(r11+222)
    ab20:	78 04 00 01 	mvhi r4,0x1
    ab24:	2d 63 00 dc 	lhu r3,(r11+220)
    ab28:	38 84 37 1c 	ori r4,r4,0x371c
    ab2c:	44 2e 00 06 	be r1,r14,ab44 <handlePDelayRespFollowUp+0xe8>
    ab30:	78 04 00 01 	mvhi r4,0x1
    ab34:	38 84 37 14 	ori r4,r4,0x3714
    ab38:	5c 2f 00 03 	bne r1,r15,ab44 <handlePDelayRespFollowUp+0xe8>
    ab3c:	78 04 00 01 	mvhi r4,0x1
    ab40:	38 84 37 24 	ori r4,r4,0x3724
    ab44:	29 62 0b 78 	lw r2,(r11+2936)
    ab48:	78 05 00 01 	mvhi r5,0x1
    ab4c:	34 01 00 01 	mvi r1,1
    ab50:	38 a5 36 f4 	ori r5,r5,0x36f4
    ab54:	5c 41 00 03 	bne r2,r1,ab60 <handlePDelayRespFollowUp+0x104>
    ab58:	78 05 00 01 	mvhi r5,0x1
    ab5c:	38 a5 36 ec 	ori r5,r5,0x36ec
    ab60:	41 61 0b 76 	lbu r1,(r11+2934)
    ab64:	34 02 00 01 	mvi r2,1
    ab68:	44 22 00 0d 	be r1,r2,ab9c <handlePDelayRespFollowUp+0x140>
    ab6c:	78 06 00 01 	mvhi r6,0x1
    ab70:	38 c6 31 08 	ori r6,r6,0x3108
    ab74:	34 08 00 02 	mvi r8,2
    ab78:	b8 c0 38 00 	mv r7,r6
    ab7c:	5c 28 00 0c 	bne r1,r8,abac <handlePDelayRespFollowUp+0x150>
    ab80:	41 68 0e fc 	lbu r8,(r11+3836)
    ab84:	78 07 00 01 	mvhi r7,0x1
    ab88:	38 e7 36 fc 	ori r7,r7,0x36fc
    ab8c:	5d 02 00 08 	bne r8,r2,abac <handlePDelayRespFollowUp+0x150>
    ab90:	78 07 00 01 	mvhi r7,0x1
    ab94:	38 e7 37 04 	ori r7,r7,0x3704
    ab98:	e0 00 00 05 	bi abac <handlePDelayRespFollowUp+0x150>
    ab9c:	78 06 00 01 	mvhi r6,0x1
    aba0:	78 07 00 01 	mvhi r7,0x1
    aba4:	38 c6 37 0c 	ori r6,r6,0x370c
    aba8:	38 e7 31 08 	ori r7,r7,0x3108
    abac:	78 02 00 01 	mvhi r2,0x1
    abb0:	34 01 00 01 	mvi r1,1
    abb4:	38 42 3c dc 	ori r2,r2,0x3cdc
    abb8:	fb ff d7 32 	calli 880 <wrc_debug_printf>
    abbc:	e0 00 00 4b 	bi ace8 <handlePDelayRespFollowUp+0x28c>
    abc0:	2d 61 0a c8 	lhu r1,(r11+2760)
    abc4:	2d a2 00 1e 	lhu r2,(r13+30)
    abc8:	34 21 ff ff 	addi r1,r1,-1
    abcc:	5c 41 00 47 	bne r2,r1,ace8 <handlePDelayRespFollowUp+0x28c>
    abd0:	35 61 05 50 	addi r1,r11,1360
    abd4:	35 62 01 2c 	addi r2,r11,300
    abd8:	fb ff f1 ee 	calli 7390 <msgUnpackPDelayRespFollowUp>
    abdc:	41 61 00 de 	lbu r1,(r11+222)
    abe0:	78 04 00 01 	mvhi r4,0x1
    abe4:	34 02 00 08 	mvi r2,8
    abe8:	2d 63 00 dc 	lhu r3,(r11+220)
    abec:	38 84 37 1c 	ori r4,r4,0x371c
    abf0:	44 22 00 07 	be r1,r2,ac0c <handlePDelayRespFollowUp+0x1b0>
    abf4:	78 04 00 01 	mvhi r4,0x1
    abf8:	34 02 00 05 	mvi r2,5
    abfc:	38 84 37 14 	ori r4,r4,0x3714
    ac00:	5c 22 00 03 	bne r1,r2,ac0c <handlePDelayRespFollowUp+0x1b0>
    ac04:	78 04 00 01 	mvhi r4,0x1
    ac08:	38 84 37 24 	ori r4,r4,0x3724
    ac0c:	29 62 0b 78 	lw r2,(r11+2936)
    ac10:	78 05 00 01 	mvhi r5,0x1
    ac14:	34 01 00 01 	mvi r1,1
    ac18:	38 a5 36 f4 	ori r5,r5,0x36f4
    ac1c:	5c 41 00 03 	bne r2,r1,ac28 <handlePDelayRespFollowUp+0x1cc>
    ac20:	78 05 00 01 	mvhi r5,0x1
    ac24:	38 a5 36 ec 	ori r5,r5,0x36ec
    ac28:	41 61 0b 76 	lbu r1,(r11+2934)
    ac2c:	34 02 00 01 	mvi r2,1
    ac30:	44 22 00 0d 	be r1,r2,ac64 <handlePDelayRespFollowUp+0x208>
    ac34:	78 06 00 01 	mvhi r6,0x1
    ac38:	38 c6 31 08 	ori r6,r6,0x3108
    ac3c:	34 08 00 02 	mvi r8,2
    ac40:	b8 c0 38 00 	mv r7,r6
    ac44:	5c 28 00 0c 	bne r1,r8,ac74 <handlePDelayRespFollowUp+0x218>
    ac48:	41 68 0e fc 	lbu r8,(r11+3836)
    ac4c:	78 07 00 01 	mvhi r7,0x1
    ac50:	38 e7 36 fc 	ori r7,r7,0x36fc
    ac54:	5d 02 00 08 	bne r8,r2,ac74 <handlePDelayRespFollowUp+0x218>
    ac58:	78 07 00 01 	mvhi r7,0x1
    ac5c:	38 e7 37 04 	ori r7,r7,0x3704
    ac60:	e0 00 00 05 	bi ac74 <handlePDelayRespFollowUp+0x218>
    ac64:	78 06 00 01 	mvhi r6,0x1
    ac68:	78 07 00 01 	mvhi r7,0x1
    ac6c:	38 c6 37 0c 	ori r6,r6,0x370c
    ac70:	38 e7 31 08 	ori r7,r7,0x3108
    ac74:	29 61 01 2c 	lw r1,(r11+300)
    ac78:	2d 68 01 30 	lhu r8,(r11+304)
    ac7c:	78 02 00 01 	mvhi r2,0x1
    ac80:	5b 81 00 08 	sw (sp+8),r1
    ac84:	29 61 01 34 	lw r1,(r11+308)
    ac88:	38 42 3d 30 	ori r2,r2,0x3d30
    ac8c:	5b 80 00 04 	sw (sp+4),r0
    ac90:	5b 81 00 10 	sw (sp+16),r1
    ac94:	34 01 00 01 	mvi r1,1
    ac98:	5b 80 00 0c 	sw (sp+12),r0
    ac9c:	fb ff d6 f9 	calli 880 <wrc_debug_printf>
    aca0:	37 81 00 3c 	addi r1,sp,60
    aca4:	35 62 01 2c 	addi r2,r11,300
    aca8:	fb ff eb 24 	calli 5938 <toInternalTime>
    acac:	2b 81 00 3c 	lw r1,(sp+60)
    acb0:	29 62 01 18 	lw r2,(r11+280)
    acb4:	37 8d 00 2c 	addi r13,sp,44
    acb8:	59 61 09 a4 	sw (r11+2468),r1
    acbc:	2b 81 00 40 	lw r1,(sp+64)
    acc0:	b9 a0 18 00 	mv r3,r13
    acc4:	59 61 09 a8 	sw (r11+2472),r1
    acc8:	29 61 01 14 	lw r1,(r11+276)
    accc:	fb ff eb 4f 	calli 5a08 <integer64_to_internalTime>
    acd0:	35 61 0a e8 	addi r1,r11,2792
    acd4:	b9 80 10 00 	mv r2,r12
    acd8:	b9 60 18 00 	mv r3,r11
    acdc:	b9 a0 20 00 	mv r4,r13
    ace0:	34 05 00 01 	mvi r5,1
    ace4:	fb ff f3 bf 	calli 7be0 <updatePeerDelay>
    ace8:	2b 9d 00 14 	lw ra,(sp+20)
    acec:	2b 8b 00 28 	lw r11,(sp+40)
    acf0:	2b 8c 00 24 	lw r12,(sp+36)
    acf4:	2b 8d 00 20 	lw r13,(sp+32)
    acf8:	2b 8e 00 1c 	lw r14,(sp+28)
    acfc:	2b 8f 00 18 	lw r15,(sp+24)
    ad00:	37 9c 00 48 	addi sp,sp,72
    ad04:	c3 a0 00 00 	ret

0000ad08 <handleManagement>:
    ad08:	c3 a0 00 00 	ret

0000ad0c <handleSignaling>:
    ad0c:	37 9c ff cc 	addi sp,sp,-52
    ad10:	5b 8b 00 1c 	sw (sp+28),r11
    ad14:	5b 8c 00 18 	sw (sp+24),r12
    ad18:	5b 9d 00 14 	sw (sp+20),ra
    ad1c:	b8 a0 60 00 	mv r12,r5
    ad20:	b8 c0 58 00 	mv r11,r6
    ad24:	5c 80 01 54 	bne r4,r0,b274 <handleSignaling+0x568>
    ad28:	34 c3 0b bc 	addi r3,r6,3004
    ad2c:	34 c1 05 50 	addi r1,r6,1360
    ad30:	b8 c0 20 00 	mv r4,r6
    ad34:	37 82 00 28 	addi r2,sp,40
    ad38:	fb ff f2 07 	calli 7554 <msgUnpackWRSignalingMsg>
    ad3c:	2d 63 0b bc 	lhu r3,(r11+3004)
    ad40:	34 06 00 05 	mvi r6,5
    ad44:	34 63 f0 00 	addi r3,r3,-4096
    ad48:	20 63 ff ff 	andi r3,r3,0xffff
    ad4c:	54 66 01 0f 	bgu r3,r6,b188 <handleSignaling+0x47c>
    ad50:	3c 63 00 02 	sli r3,r3,2
    ad54:	78 01 00 01 	mvhi r1,0x1
    ad58:	38 21 54 a0 	ori r1,r1,0x54a0
    ad5c:	b4 23 08 00 	add r1,r1,r3
    ad60:	28 22 00 00 	lw r2,(r1+0)
    ad64:	2d 63 00 dc 	lhu r3,(r11+220)
    ad68:	41 61 00 de 	lbu r1,(r11+222)
    ad6c:	c0 40 00 00 	b r2
    ad70:	78 04 00 01 	mvhi r4,0x1
    ad74:	34 02 00 08 	mvi r2,8
    ad78:	38 84 37 1c 	ori r4,r4,0x371c
    ad7c:	44 22 00 07 	be r1,r2,ad98 <handleSignaling+0x8c>
    ad80:	78 04 00 01 	mvhi r4,0x1
    ad84:	34 02 00 05 	mvi r2,5
    ad88:	38 84 37 14 	ori r4,r4,0x3714
    ad8c:	5c 22 00 03 	bne r1,r2,ad98 <handleSignaling+0x8c>
    ad90:	78 04 00 01 	mvhi r4,0x1
    ad94:	38 84 37 24 	ori r4,r4,0x3724
    ad98:	29 62 0b 78 	lw r2,(r11+2936)
    ad9c:	78 05 00 01 	mvhi r5,0x1
    ada0:	34 01 00 01 	mvi r1,1
    ada4:	38 a5 36 f4 	ori r5,r5,0x36f4
    ada8:	5c 41 00 03 	bne r2,r1,adb4 <handleSignaling+0xa8>
    adac:	78 05 00 01 	mvhi r5,0x1
    adb0:	38 a5 36 ec 	ori r5,r5,0x36ec
    adb4:	41 61 0b 76 	lbu r1,(r11+2934)
    adb8:	34 08 00 01 	mvi r8,1
    adbc:	44 28 00 0d 	be r1,r8,adf0 <handleSignaling+0xe4>
    adc0:	78 06 00 01 	mvhi r6,0x1
    adc4:	38 c6 31 08 	ori r6,r6,0x3108
    adc8:	34 02 00 02 	mvi r2,2
    adcc:	b8 c0 38 00 	mv r7,r6
    add0:	5c 22 00 0c 	bne r1,r2,ae00 <handleSignaling+0xf4>
    add4:	41 62 0e fc 	lbu r2,(r11+3836)
    add8:	78 07 00 01 	mvhi r7,0x1
    addc:	38 e7 36 fc 	ori r7,r7,0x36fc
    ade0:	5c 48 00 08 	bne r2,r8,ae00 <handleSignaling+0xf4>
    ade4:	78 07 00 01 	mvhi r7,0x1
    ade8:	38 e7 37 04 	ori r7,r7,0x3704
    adec:	e0 00 00 05 	bi ae00 <handleSignaling+0xf4>
    adf0:	78 06 00 01 	mvhi r6,0x1
    adf4:	78 07 00 01 	mvhi r7,0x1
    adf8:	38 c6 37 0c 	ori r6,r6,0x370c
    adfc:	38 e7 31 08 	ori r7,r7,0x3108
    ae00:	29 61 0b ac 	lw r1,(r11+2988)
    ae04:	78 09 00 01 	mvhi r9,0x1
    ae08:	2d 68 0b aa 	lhu r8,(r11+2986)
    ae0c:	b9 20 10 00 	mv r2,r9
    ae10:	5b 81 00 08 	sw (sp+8),r1
    ae14:	38 42 3d bc 	ori r2,r2,0x3dbc
    ae18:	34 01 00 01 	mvi r1,1
    ae1c:	5b 80 00 04 	sw (sp+4),r0
    ae20:	fb ff d6 98 	calli 880 <wrc_debug_printf>
    ae24:	e0 00 01 03 	bi b230 <handleSignaling+0x524>
    ae28:	78 04 00 01 	mvhi r4,0x1
    ae2c:	34 02 00 08 	mvi r2,8
    ae30:	38 84 37 1c 	ori r4,r4,0x371c
    ae34:	44 22 00 07 	be r1,r2,ae50 <handleSignaling+0x144>
    ae38:	78 04 00 01 	mvhi r4,0x1
    ae3c:	34 02 00 05 	mvi r2,5
    ae40:	38 84 37 14 	ori r4,r4,0x3714
    ae44:	5c 22 00 03 	bne r1,r2,ae50 <handleSignaling+0x144>
    ae48:	78 04 00 01 	mvhi r4,0x1
    ae4c:	38 84 37 24 	ori r4,r4,0x3724
    ae50:	29 62 0b 78 	lw r2,(r11+2936)
    ae54:	78 05 00 01 	mvhi r5,0x1
    ae58:	34 01 00 01 	mvi r1,1
    ae5c:	38 a5 36 f4 	ori r5,r5,0x36f4
    ae60:	5c 41 00 03 	bne r2,r1,ae6c <handleSignaling+0x160>
    ae64:	78 05 00 01 	mvhi r5,0x1
    ae68:	38 a5 36 ec 	ori r5,r5,0x36ec
    ae6c:	41 61 0b 76 	lbu r1,(r11+2934)
    ae70:	34 08 00 01 	mvi r8,1
    ae74:	44 28 00 0d 	be r1,r8,aea8 <handleSignaling+0x19c>
    ae78:	78 06 00 01 	mvhi r6,0x1
    ae7c:	38 c6 31 08 	ori r6,r6,0x3108
    ae80:	34 02 00 02 	mvi r2,2
    ae84:	b8 c0 38 00 	mv r7,r6
    ae88:	5c 22 00 0c 	bne r1,r2,aeb8 <handleSignaling+0x1ac>
    ae8c:	41 62 0e fc 	lbu r2,(r11+3836)
    ae90:	78 07 00 01 	mvhi r7,0x1
    ae94:	38 e7 36 fc 	ori r7,r7,0x36fc
    ae98:	5c 48 00 08 	bne r2,r8,aeb8 <handleSignaling+0x1ac>
    ae9c:	78 07 00 01 	mvhi r7,0x1
    aea0:	38 e7 37 04 	ori r7,r7,0x3704
    aea4:	e0 00 00 05 	bi aeb8 <handleSignaling+0x1ac>
    aea8:	78 06 00 01 	mvhi r6,0x1
    aeac:	78 07 00 01 	mvhi r7,0x1
    aeb0:	38 c6 37 0c 	ori r6,r6,0x370c
    aeb4:	38 e7 31 08 	ori r7,r7,0x3108
    aeb8:	29 62 0b 94 	lw r2,(r11+2964)
    aebc:	29 61 0b 90 	lw r1,(r11+2960)
    aec0:	78 08 00 01 	mvhi r8,0x1
    aec4:	5b 82 00 04 	sw (sp+4),r2
    aec8:	29 62 0b 9c 	lw r2,(r11+2972)
    aecc:	5b 81 00 08 	sw (sp+8),r1
    aed0:	29 61 0b 98 	lw r1,(r11+2968)
    aed4:	5b 82 00 20 	sw (sp+32),r2
    aed8:	5b 82 00 0c 	sw (sp+12),r2
    aedc:	b9 00 10 00 	mv r2,r8
    aee0:	5b 81 00 24 	sw (sp+36),r1
    aee4:	5b 81 00 10 	sw (sp+16),r1
    aee8:	38 42 3e 40 	ori r2,r2,0x3e40
    aeec:	34 01 00 01 	mvi r1,1
    aef0:	fb ff d6 64 	calli 880 <wrc_debug_printf>
    aef4:	e0 00 00 cf 	bi b230 <handleSignaling+0x524>
    aef8:	78 04 00 01 	mvhi r4,0x1
    aefc:	34 02 00 08 	mvi r2,8
    af00:	38 84 37 1c 	ori r4,r4,0x371c
    af04:	44 22 00 07 	be r1,r2,af20 <handleSignaling+0x214>
    af08:	78 04 00 01 	mvhi r4,0x1
    af0c:	34 02 00 05 	mvi r2,5
    af10:	38 84 37 14 	ori r4,r4,0x3714
    af14:	5c 22 00 03 	bne r1,r2,af20 <handleSignaling+0x214>
    af18:	78 04 00 01 	mvhi r4,0x1
    af1c:	38 84 37 24 	ori r4,r4,0x3724
    af20:	29 62 0b 78 	lw r2,(r11+2936)
    af24:	78 05 00 01 	mvhi r5,0x1
    af28:	34 01 00 01 	mvi r1,1
    af2c:	38 a5 36 f4 	ori r5,r5,0x36f4
    af30:	5c 41 00 03 	bne r2,r1,af3c <handleSignaling+0x230>
    af34:	78 05 00 01 	mvhi r5,0x1
    af38:	38 a5 36 ec 	ori r5,r5,0x36ec
    af3c:	41 61 0b 76 	lbu r1,(r11+2934)
    af40:	34 08 00 01 	mvi r8,1
    af44:	44 28 00 0d 	be r1,r8,af78 <handleSignaling+0x26c>
    af48:	78 06 00 01 	mvhi r6,0x1
    af4c:	38 c6 31 08 	ori r6,r6,0x3108
    af50:	34 02 00 02 	mvi r2,2
    af54:	b8 c0 38 00 	mv r7,r6
    af58:	5c 22 00 0c 	bne r1,r2,af88 <handleSignaling+0x27c>
    af5c:	41 62 0e fc 	lbu r2,(r11+3836)
    af60:	78 07 00 01 	mvhi r7,0x1
    af64:	38 e7 36 fc 	ori r7,r7,0x36fc
    af68:	5c 48 00 08 	bne r2,r8,af88 <handleSignaling+0x27c>
    af6c:	78 07 00 01 	mvhi r7,0x1
    af70:	38 e7 37 04 	ori r7,r7,0x3704
    af74:	e0 00 00 05 	bi af88 <handleSignaling+0x27c>
    af78:	78 06 00 01 	mvhi r6,0x1
    af7c:	78 07 00 01 	mvhi r7,0x1
    af80:	38 c6 37 0c 	ori r6,r6,0x370c
    af84:	38 e7 31 08 	ori r7,r7,0x3108
    af88:	78 08 00 01 	mvhi r8,0x1
    af8c:	b9 00 10 00 	mv r2,r8
    af90:	34 01 00 01 	mvi r1,1
    af94:	38 42 3e b0 	ori r2,r2,0x3eb0
    af98:	e0 00 00 a5 	bi b22c <handleSignaling+0x520>
    af9c:	78 04 00 01 	mvhi r4,0x1
    afa0:	34 02 00 08 	mvi r2,8
    afa4:	38 84 37 1c 	ori r4,r4,0x371c
    afa8:	44 22 00 07 	be r1,r2,afc4 <handleSignaling+0x2b8>
    afac:	78 04 00 01 	mvhi r4,0x1
    afb0:	34 02 00 05 	mvi r2,5
    afb4:	38 84 37 14 	ori r4,r4,0x3714
    afb8:	5c 22 00 03 	bne r1,r2,afc4 <handleSignaling+0x2b8>
    afbc:	78 04 00 01 	mvhi r4,0x1
    afc0:	38 84 37 24 	ori r4,r4,0x3724
    afc4:	29 62 0b 78 	lw r2,(r11+2936)
    afc8:	78 05 00 01 	mvhi r5,0x1
    afcc:	34 01 00 01 	mvi r1,1
    afd0:	38 a5 36 f4 	ori r5,r5,0x36f4
    afd4:	5c 41 00 03 	bne r2,r1,afe0 <handleSignaling+0x2d4>
    afd8:	78 05 00 01 	mvhi r5,0x1
    afdc:	38 a5 36 ec 	ori r5,r5,0x36ec
    afe0:	41 61 0b 76 	lbu r1,(r11+2934)
    afe4:	34 08 00 01 	mvi r8,1
    afe8:	44 28 00 0d 	be r1,r8,b01c <handleSignaling+0x310>
    afec:	78 06 00 01 	mvhi r6,0x1
    aff0:	38 c6 31 08 	ori r6,r6,0x3108
    aff4:	34 02 00 02 	mvi r2,2
    aff8:	b8 c0 38 00 	mv r7,r6
    affc:	5c 22 00 0c 	bne r1,r2,b02c <handleSignaling+0x320>
    b000:	41 62 0e fc 	lbu r2,(r11+3836)
    b004:	78 07 00 01 	mvhi r7,0x1
    b008:	38 e7 36 fc 	ori r7,r7,0x36fc
    b00c:	5c 48 00 08 	bne r2,r8,b02c <handleSignaling+0x320>
    b010:	78 07 00 01 	mvhi r7,0x1
    b014:	38 e7 37 04 	ori r7,r7,0x3704
    b018:	e0 00 00 05 	bi b02c <handleSignaling+0x320>
    b01c:	78 06 00 01 	mvhi r6,0x1
    b020:	78 07 00 01 	mvhi r7,0x1
    b024:	38 c6 37 0c 	ori r6,r6,0x370c
    b028:	38 e7 31 08 	ori r7,r7,0x3108
    b02c:	78 08 00 01 	mvhi r8,0x1
    b030:	b9 00 10 00 	mv r2,r8
    b034:	34 01 00 01 	mvi r1,1
    b038:	38 42 3f 00 	ori r2,r2,0x3f00
    b03c:	e0 00 00 7c 	bi b22c <handleSignaling+0x520>
    b040:	78 04 00 01 	mvhi r4,0x1
    b044:	34 02 00 08 	mvi r2,8
    b048:	38 84 37 1c 	ori r4,r4,0x371c
    b04c:	44 22 00 07 	be r1,r2,b068 <handleSignaling+0x35c>
    b050:	78 04 00 01 	mvhi r4,0x1
    b054:	34 02 00 05 	mvi r2,5
    b058:	38 84 37 14 	ori r4,r4,0x3714
    b05c:	5c 22 00 03 	bne r1,r2,b068 <handleSignaling+0x35c>
    b060:	78 04 00 01 	mvhi r4,0x1
    b064:	38 84 37 24 	ori r4,r4,0x3724
    b068:	29 62 0b 78 	lw r2,(r11+2936)
    b06c:	78 05 00 01 	mvhi r5,0x1
    b070:	34 01 00 01 	mvi r1,1
    b074:	38 a5 36 f4 	ori r5,r5,0x36f4
    b078:	5c 41 00 03 	bne r2,r1,b084 <handleSignaling+0x378>
    b07c:	78 05 00 01 	mvhi r5,0x1
    b080:	38 a5 36 ec 	ori r5,r5,0x36ec
    b084:	41 61 0b 76 	lbu r1,(r11+2934)
    b088:	34 08 00 01 	mvi r8,1
    b08c:	44 28 00 0d 	be r1,r8,b0c0 <handleSignaling+0x3b4>
    b090:	78 06 00 01 	mvhi r6,0x1
    b094:	38 c6 31 08 	ori r6,r6,0x3108
    b098:	34 02 00 02 	mvi r2,2
    b09c:	b8 c0 38 00 	mv r7,r6
    b0a0:	5c 22 00 0c 	bne r1,r2,b0d0 <handleSignaling+0x3c4>
    b0a4:	41 62 0e fc 	lbu r2,(r11+3836)
    b0a8:	78 07 00 01 	mvhi r7,0x1
    b0ac:	38 e7 36 fc 	ori r7,r7,0x36fc
    b0b0:	5c 48 00 08 	bne r2,r8,b0d0 <handleSignaling+0x3c4>
    b0b4:	78 07 00 01 	mvhi r7,0x1
    b0b8:	38 e7 37 04 	ori r7,r7,0x3704
    b0bc:	e0 00 00 05 	bi b0d0 <handleSignaling+0x3c4>
    b0c0:	78 06 00 01 	mvhi r6,0x1
    b0c4:	78 07 00 01 	mvhi r7,0x1
    b0c8:	38 c6 37 0c 	ori r6,r6,0x370c
    b0cc:	38 e7 31 08 	ori r7,r7,0x3108
    b0d0:	78 08 00 01 	mvhi r8,0x1
    b0d4:	b9 00 10 00 	mv r2,r8
    b0d8:	34 01 00 01 	mvi r1,1
    b0dc:	38 42 3f 48 	ori r2,r2,0x3f48
    b0e0:	e0 00 00 53 	bi b22c <handleSignaling+0x520>
    b0e4:	78 04 00 01 	mvhi r4,0x1
    b0e8:	34 02 00 08 	mvi r2,8
    b0ec:	38 84 37 1c 	ori r4,r4,0x371c
    b0f0:	44 22 00 07 	be r1,r2,b10c <handleSignaling+0x400>
    b0f4:	78 04 00 01 	mvhi r4,0x1
    b0f8:	34 02 00 05 	mvi r2,5
    b0fc:	38 84 37 14 	ori r4,r4,0x3714
    b100:	5c 22 00 03 	bne r1,r2,b10c <handleSignaling+0x400>
    b104:	78 04 00 01 	mvhi r4,0x1
    b108:	38 84 37 24 	ori r4,r4,0x3724
    b10c:	29 62 0b 78 	lw r2,(r11+2936)
    b110:	78 05 00 01 	mvhi r5,0x1
    b114:	34 01 00 01 	mvi r1,1
    b118:	38 a5 36 f4 	ori r5,r5,0x36f4
    b11c:	5c 41 00 03 	bne r2,r1,b128 <handleSignaling+0x41c>
    b120:	78 05 00 01 	mvhi r5,0x1
    b124:	38 a5 36 ec 	ori r5,r5,0x36ec
    b128:	41 61 0b 76 	lbu r1,(r11+2934)
    b12c:	34 08 00 01 	mvi r8,1
    b130:	44 28 00 0d 	be r1,r8,b164 <handleSignaling+0x458>
    b134:	78 06 00 01 	mvhi r6,0x1
    b138:	38 c6 31 08 	ori r6,r6,0x3108
    b13c:	34 02 00 02 	mvi r2,2
    b140:	b8 c0 38 00 	mv r7,r6
    b144:	5c 22 00 0c 	bne r1,r2,b174 <handleSignaling+0x468>
    b148:	41 62 0e fc 	lbu r2,(r11+3836)
    b14c:	78 07 00 01 	mvhi r7,0x1
    b150:	38 e7 36 fc 	ori r7,r7,0x36fc
    b154:	5c 48 00 08 	bne r2,r8,b174 <handleSignaling+0x468>
    b158:	78 07 00 01 	mvhi r7,0x1
    b15c:	38 e7 37 04 	ori r7,r7,0x3704
    b160:	e0 00 00 05 	bi b174 <handleSignaling+0x468>
    b164:	78 06 00 01 	mvhi r6,0x1
    b168:	78 07 00 01 	mvhi r7,0x1
    b16c:	38 c6 37 0c 	ori r6,r6,0x370c
    b170:	38 e7 31 08 	ori r7,r7,0x3108
    b174:	78 08 00 01 	mvhi r8,0x1
    b178:	b9 00 10 00 	mv r2,r8
    b17c:	34 01 00 01 	mvi r1,1
    b180:	38 42 3f 90 	ori r2,r2,0x3f90
    b184:	e0 00 00 2a 	bi b22c <handleSignaling+0x520>
    b188:	41 61 00 de 	lbu r1,(r11+222)
    b18c:	78 04 00 01 	mvhi r4,0x1
    b190:	34 02 00 08 	mvi r2,8
    b194:	2d 63 00 dc 	lhu r3,(r11+220)
    b198:	38 84 37 1c 	ori r4,r4,0x371c
    b19c:	44 22 00 06 	be r1,r2,b1b4 <handleSignaling+0x4a8>
    b1a0:	78 04 00 01 	mvhi r4,0x1
    b1a4:	38 84 37 14 	ori r4,r4,0x3714
    b1a8:	5c 26 00 03 	bne r1,r6,b1b4 <handleSignaling+0x4a8>
    b1ac:	78 04 00 01 	mvhi r4,0x1
    b1b0:	38 84 37 24 	ori r4,r4,0x3724
    b1b4:	29 62 0b 78 	lw r2,(r11+2936)
    b1b8:	78 05 00 01 	mvhi r5,0x1
    b1bc:	34 01 00 01 	mvi r1,1
    b1c0:	38 a5 36 f4 	ori r5,r5,0x36f4
    b1c4:	5c 41 00 03 	bne r2,r1,b1d0 <handleSignaling+0x4c4>
    b1c8:	78 05 00 01 	mvhi r5,0x1
    b1cc:	38 a5 36 ec 	ori r5,r5,0x36ec
    b1d0:	41 61 0b 76 	lbu r1,(r11+2934)
    b1d4:	34 08 00 01 	mvi r8,1
    b1d8:	44 28 00 0d 	be r1,r8,b20c <handleSignaling+0x500>
    b1dc:	78 06 00 01 	mvhi r6,0x1
    b1e0:	38 c6 31 08 	ori r6,r6,0x3108
    b1e4:	34 02 00 02 	mvi r2,2
    b1e8:	b8 c0 38 00 	mv r7,r6
    b1ec:	5c 22 00 0c 	bne r1,r2,b21c <handleSignaling+0x510>
    b1f0:	41 62 0e fc 	lbu r2,(r11+3836)
    b1f4:	78 07 00 01 	mvhi r7,0x1
    b1f8:	38 e7 36 fc 	ori r7,r7,0x36fc
    b1fc:	5c 48 00 08 	bne r2,r8,b21c <handleSignaling+0x510>
    b200:	78 07 00 01 	mvhi r7,0x1
    b204:	38 e7 37 04 	ori r7,r7,0x3704
    b208:	e0 00 00 05 	bi b21c <handleSignaling+0x510>
    b20c:	78 06 00 01 	mvhi r6,0x1
    b210:	78 07 00 01 	mvhi r7,0x1
    b214:	38 c6 37 0c 	ori r6,r6,0x370c
    b218:	38 e7 31 08 	ori r7,r7,0x3108
    b21c:	78 08 00 01 	mvhi r8,0x1
    b220:	b9 00 10 00 	mv r2,r8
    b224:	34 01 00 01 	mvi r1,1
    b228:	38 42 3f dc 	ori r2,r2,0x3fdc
    b22c:	fb ff d5 95 	calli 880 <wrc_debug_printf>
    b230:	41 62 00 de 	lbu r2,(r11+222)
    b234:	34 01 00 05 	mvi r1,5
    b238:	5c 41 00 0f 	bne r2,r1,b274 <handleSignaling+0x568>
    b23c:	2d 62 0b bc 	lhu r2,(r11+3004)
    b240:	34 01 10 00 	mvi r1,4096
    b244:	5c 41 00 0c 	bne r2,r1,b274 <handleSignaling+0x568>
    b248:	41 61 0b 62 	lbu r1,(r11+2914)
    b24c:	64 22 00 03 	cmpei r2,r1,3
    b250:	64 21 00 01 	cmpei r1,r1,1
    b254:	b8 41 08 00 	or r1,r2,r1
    b258:	44 20 00 07 	be r1,r0,b274 <handleSignaling+0x568>
    b25c:	34 01 00 01 	mvi r1,1
    b260:	31 61 0b 76 	sb (r11+2934),r1
    b264:	b9 80 10 00 	mv r2,r12
    b268:	34 01 00 02 	mvi r1,2
    b26c:	b9 60 18 00 	mv r3,r11
    b270:	f8 00 0f f9 	calli f254 <toWRState>
    b274:	2b 9d 00 14 	lw ra,(sp+20)
    b278:	2b 8b 00 1c 	lw r11,(sp+28)
    b27c:	2b 8c 00 18 	lw r12,(sp+24)
    b280:	37 9c 00 34 	addi sp,sp,52
    b284:	c3 a0 00 00 	ret

0000b288 <issueAnnounce>:
    b288:	37 9c ff f0 	addi sp,sp,-16
    b28c:	5b 8b 00 10 	sw (sp+16),r11
    b290:	5b 8c 00 0c 	sw (sp+12),r12
    b294:	5b 8d 00 08 	sw (sp+8),r13
    b298:	5b 9d 00 04 	sw (sp+4),ra
    b29c:	34 4c 01 50 	addi r12,r2,336
    b2a0:	b8 20 68 00 	mv r13,r1
    b2a4:	b9 80 08 00 	mv r1,r12
    b2a8:	b8 40 58 00 	mv r11,r2
    b2ac:	fb ff ee 19 	calli 6b10 <msgPackAnnounce>
    b2b0:	41 63 0b 62 	lbu r3,(r11+2914)
    b2b4:	7c 61 00 02 	cmpnei r1,r3,2
    b2b8:	7c 63 00 00 	cmpnei r3,r3,0
    b2bc:	a0 23 18 00 	and r3,r1,r3
    b2c0:	64 63 00 00 	cmpei r3,r3,0
    b2c4:	34 01 ff f2 	mvi r1,-14
    b2c8:	c8 03 18 00 	sub r3,r0,r3
    b2cc:	a0 61 18 00 	and r3,r3,r1
    b2d0:	34 62 00 4e 	addi r2,r3,78
    b2d4:	b9 80 08 00 	mv r1,r12
    b2d8:	35 63 00 04 	addi r3,r11,4
    b2dc:	fb ff f2 13 	calli 7b28 <netSendGeneral>
    b2e0:	5c 20 00 30 	bne r1,r0,b3a0 <issueAnnounce+0x118>
    b2e4:	34 01 00 01 	mvi r1,1
    b2e8:	b9 a0 10 00 	mv r2,r13
    b2ec:	b9 60 18 00 	mv r3,r11
    b2f0:	fb ff f8 ff 	calli 96ec <toState>
    b2f4:	41 61 00 de 	lbu r1,(r11+222)
    b2f8:	78 04 00 01 	mvhi r4,0x1
    b2fc:	34 02 00 08 	mvi r2,8
    b300:	2d 63 00 dc 	lhu r3,(r11+220)
    b304:	38 84 37 1c 	ori r4,r4,0x371c
    b308:	44 22 00 07 	be r1,r2,b324 <issueAnnounce+0x9c>
    b30c:	78 04 00 01 	mvhi r4,0x1
    b310:	34 02 00 05 	mvi r2,5
    b314:	38 84 37 14 	ori r4,r4,0x3714
    b318:	5c 22 00 03 	bne r1,r2,b324 <issueAnnounce+0x9c>
    b31c:	78 04 00 01 	mvhi r4,0x1
    b320:	38 84 37 24 	ori r4,r4,0x3724
    b324:	29 62 0b 78 	lw r2,(r11+2936)
    b328:	78 05 00 01 	mvhi r5,0x1
    b32c:	34 01 00 01 	mvi r1,1
    b330:	38 a5 36 f4 	ori r5,r5,0x36f4
    b334:	5c 41 00 03 	bne r2,r1,b340 <issueAnnounce+0xb8>
    b338:	78 05 00 01 	mvhi r5,0x1
    b33c:	38 a5 36 ec 	ori r5,r5,0x36ec
    b340:	41 61 0b 76 	lbu r1,(r11+2934)
    b344:	34 02 00 01 	mvi r2,1
    b348:	44 22 00 0d 	be r1,r2,b37c <issueAnnounce+0xf4>
    b34c:	78 06 00 01 	mvhi r6,0x1
    b350:	38 c6 31 08 	ori r6,r6,0x3108
    b354:	34 08 00 02 	mvi r8,2
    b358:	b8 c0 38 00 	mv r7,r6
    b35c:	5c 28 00 0c 	bne r1,r8,b38c <issueAnnounce+0x104>
    b360:	41 68 0e fc 	lbu r8,(r11+3836)
    b364:	78 07 00 01 	mvhi r7,0x1
    b368:	38 e7 36 fc 	ori r7,r7,0x36fc
    b36c:	5d 02 00 08 	bne r8,r2,b38c <issueAnnounce+0x104>
    b370:	78 07 00 01 	mvhi r7,0x1
    b374:	38 e7 37 04 	ori r7,r7,0x3704
    b378:	e0 00 00 05 	bi b38c <issueAnnounce+0x104>
    b37c:	78 06 00 01 	mvhi r6,0x1
    b380:	78 07 00 01 	mvhi r7,0x1
    b384:	38 c6 37 0c 	ori r6,r6,0x370c
    b388:	38 e7 31 08 	ori r7,r7,0x3108
    b38c:	78 02 00 01 	mvhi r2,0x1
    b390:	34 01 00 01 	mvi r1,1
    b394:	38 42 40 24 	ori r2,r2,0x4024
    b398:	fb ff d5 3a 	calli 880 <wrc_debug_printf>
    b39c:	e0 00 00 47 	bi b4b8 <issueAnnounce+0x230>
    b3a0:	41 62 0b 76 	lbu r2,(r11+2934)
    b3a4:	2d 63 00 dc 	lhu r3,(r11+220)
    b3a8:	41 61 00 de 	lbu r1,(r11+222)
    b3ac:	44 40 00 28 	be r2,r0,b44c <issueAnnounce+0x1c4>
    b3b0:	78 04 00 01 	mvhi r4,0x1
    b3b4:	34 05 00 08 	mvi r5,8
    b3b8:	38 84 37 1c 	ori r4,r4,0x371c
    b3bc:	44 25 00 07 	be r1,r5,b3d8 <issueAnnounce+0x150>
    b3c0:	78 04 00 01 	mvhi r4,0x1
    b3c4:	34 05 00 05 	mvi r5,5
    b3c8:	38 84 37 14 	ori r4,r4,0x3714
    b3cc:	5c 25 00 03 	bne r1,r5,b3d8 <issueAnnounce+0x150>
    b3d0:	78 04 00 01 	mvhi r4,0x1
    b3d4:	38 84 37 24 	ori r4,r4,0x3724
    b3d8:	29 66 0b 78 	lw r6,(r11+2936)
    b3dc:	78 05 00 01 	mvhi r5,0x1
    b3e0:	34 01 00 01 	mvi r1,1
    b3e4:	38 a5 36 f4 	ori r5,r5,0x36f4
    b3e8:	5c c1 00 03 	bne r6,r1,b3f4 <issueAnnounce+0x16c>
    b3ec:	78 05 00 01 	mvhi r5,0x1
    b3f0:	38 a5 36 ec 	ori r5,r5,0x36ec
    b3f4:	34 08 00 01 	mvi r8,1
    b3f8:	44 48 00 0d 	be r2,r8,b42c <issueAnnounce+0x1a4>
    b3fc:	78 06 00 01 	mvhi r6,0x1
    b400:	38 c6 31 08 	ori r6,r6,0x3108
    b404:	34 01 00 02 	mvi r1,2
    b408:	b8 c0 38 00 	mv r7,r6
    b40c:	5c 41 00 0c 	bne r2,r1,b43c <issueAnnounce+0x1b4>
    b410:	41 62 0e fc 	lbu r2,(r11+3836)
    b414:	78 07 00 01 	mvhi r7,0x1
    b418:	38 e7 36 fc 	ori r7,r7,0x36fc
    b41c:	5c 48 00 08 	bne r2,r8,b43c <issueAnnounce+0x1b4>
    b420:	78 07 00 01 	mvhi r7,0x1
    b424:	38 e7 37 04 	ori r7,r7,0x3704
    b428:	e0 00 00 05 	bi b43c <issueAnnounce+0x1b4>
    b42c:	78 06 00 01 	mvhi r6,0x1
    b430:	78 07 00 01 	mvhi r7,0x1
    b434:	38 c6 37 0c 	ori r6,r6,0x370c
    b438:	38 e7 31 08 	ori r7,r7,0x3108
    b43c:	78 02 00 01 	mvhi r2,0x1
    b440:	34 01 00 01 	mvi r1,1
    b444:	38 42 40 6c 	ori r2,r2,0x406c
    b448:	e0 00 00 18 	bi b4a8 <issueAnnounce+0x220>
    b44c:	78 04 00 01 	mvhi r4,0x1
    b450:	34 02 00 08 	mvi r2,8
    b454:	38 84 37 1c 	ori r4,r4,0x371c
    b458:	44 22 00 07 	be r1,r2,b474 <issueAnnounce+0x1ec>
    b45c:	78 04 00 01 	mvhi r4,0x1
    b460:	34 02 00 05 	mvi r2,5
    b464:	38 84 37 14 	ori r4,r4,0x3714
    b468:	5c 22 00 03 	bne r1,r2,b474 <issueAnnounce+0x1ec>
    b46c:	78 04 00 01 	mvhi r4,0x1
    b470:	38 84 37 24 	ori r4,r4,0x3724
    b474:	29 62 0b 78 	lw r2,(r11+2936)
    b478:	78 05 00 01 	mvhi r5,0x1
    b47c:	34 01 00 01 	mvi r1,1
    b480:	38 a5 36 f4 	ori r5,r5,0x36f4
    b484:	5c 41 00 03 	bne r2,r1,b490 <issueAnnounce+0x208>
    b488:	78 05 00 01 	mvhi r5,0x1
    b48c:	38 a5 36 ec 	ori r5,r5,0x36ec
    b490:	78 06 00 01 	mvhi r6,0x1
    b494:	38 c6 31 08 	ori r6,r6,0x3108
    b498:	78 02 00 01 	mvhi r2,0x1
    b49c:	34 01 00 01 	mvi r1,1
    b4a0:	38 42 40 ac 	ori r2,r2,0x40ac
    b4a4:	b8 c0 38 00 	mv r7,r6
    b4a8:	fb ff d4 f6 	calli 880 <wrc_debug_printf>
    b4ac:	2d 61 0a ce 	lhu r1,(r11+2766)
    b4b0:	34 21 00 01 	addi r1,r1,1
    b4b4:	0d 61 0a ce 	sh (r11+2766),r1
    b4b8:	2b 9d 00 04 	lw ra,(sp+4)
    b4bc:	2b 8b 00 10 	lw r11,(sp+16)
    b4c0:	2b 8c 00 0c 	lw r12,(sp+12)
    b4c4:	2b 8d 00 08 	lw r13,(sp+8)
    b4c8:	37 9c 00 10 	addi sp,sp,16
    b4cc:	c3 a0 00 00 	ret

0000b4d0 <issueSync>:
    b4d0:	37 9c ff d8 	addi sp,sp,-40
    b4d4:	5b 8b 00 1c 	sw (sp+28),r11
    b4d8:	5b 8c 00 18 	sw (sp+24),r12
    b4dc:	5b 8d 00 14 	sw (sp+20),r13
    b4e0:	5b 8e 00 10 	sw (sp+16),r14
    b4e4:	5b 8f 00 0c 	sw (sp+12),r15
    b4e8:	5b 90 00 08 	sw (sp+8),r16
    b4ec:	5b 9d 00 04 	sw (sp+4),ra
    b4f0:	37 8d 00 20 	addi r13,sp,32
    b4f4:	b8 40 58 00 	mv r11,r2
    b4f8:	34 03 00 0c 	mvi r3,12
    b4fc:	34 02 00 00 	mvi r2,0
    b500:	b8 20 70 00 	mv r14,r1
    b504:	b9 a0 08 00 	mv r1,r13
    b508:	f8 00 1c e7 	calli 128a4 <memset>
    b50c:	35 6c 01 50 	addi r12,r11,336
    b510:	b9 80 08 00 	mv r1,r12
    b514:	b9 a0 10 00 	mv r2,r13
    b518:	b9 60 18 00 	mv r3,r11
    b51c:	fb ff ed 43 	calli 6a28 <msgPackSync>
    b520:	b9 80 08 00 	mv r1,r12
    b524:	34 02 00 2c 	mvi r2,44
    b528:	35 63 00 04 	addi r3,r11,4
    b52c:	35 64 0d 38 	addi r4,r11,3384
    b530:	fb ff f1 53 	calli 7a7c <netSendPeerEvent>
    b534:	b8 20 60 00 	mv r12,r1
    b538:	5c 20 00 36 	bne r1,r0,b610 <issueSync+0x140>
    b53c:	34 01 00 01 	mvi r1,1
    b540:	b9 c0 10 00 	mv r2,r14
    b544:	b9 60 18 00 	mv r3,r11
    b548:	fb ff f8 69 	calli 96ec <toState>
    b54c:	45 6c 00 2c 	be r11,r12,b5fc <issueSync+0x12c>
    b550:	41 61 00 de 	lbu r1,(r11+222)
    b554:	78 04 00 01 	mvhi r4,0x1
    b558:	34 02 00 08 	mvi r2,8
    b55c:	2d 63 00 dc 	lhu r3,(r11+220)
    b560:	38 84 37 1c 	ori r4,r4,0x371c
    b564:	44 22 00 07 	be r1,r2,b580 <issueSync+0xb0>
    b568:	78 04 00 01 	mvhi r4,0x1
    b56c:	34 02 00 05 	mvi r2,5
    b570:	38 84 37 14 	ori r4,r4,0x3714
    b574:	5c 22 00 03 	bne r1,r2,b580 <issueSync+0xb0>
    b578:	78 04 00 01 	mvhi r4,0x1
    b57c:	38 84 37 24 	ori r4,r4,0x3724
    b580:	29 62 0b 78 	lw r2,(r11+2936)
    b584:	78 05 00 01 	mvhi r5,0x1
    b588:	34 01 00 01 	mvi r1,1
    b58c:	38 a5 36 f4 	ori r5,r5,0x36f4
    b590:	5c 41 00 03 	bne r2,r1,b59c <issueSync+0xcc>
    b594:	78 05 00 01 	mvhi r5,0x1
    b598:	38 a5 36 ec 	ori r5,r5,0x36ec
    b59c:	41 61 0b 76 	lbu r1,(r11+2934)
    b5a0:	34 02 00 01 	mvi r2,1
    b5a4:	44 22 00 0d 	be r1,r2,b5d8 <issueSync+0x108>
    b5a8:	78 06 00 01 	mvhi r6,0x1
    b5ac:	38 c6 31 08 	ori r6,r6,0x3108
    b5b0:	34 08 00 02 	mvi r8,2
    b5b4:	b8 c0 38 00 	mv r7,r6
    b5b8:	5c 28 00 0c 	bne r1,r8,b5e8 <issueSync+0x118>
    b5bc:	41 68 0e fc 	lbu r8,(r11+3836)
    b5c0:	78 07 00 01 	mvhi r7,0x1
    b5c4:	38 e7 36 fc 	ori r7,r7,0x36fc
    b5c8:	5d 02 00 08 	bne r8,r2,b5e8 <issueSync+0x118>
    b5cc:	78 07 00 01 	mvhi r7,0x1
    b5d0:	38 e7 37 04 	ori r7,r7,0x3704
    b5d4:	e0 00 00 05 	bi b5e8 <issueSync+0x118>
    b5d8:	78 06 00 01 	mvhi r6,0x1
    b5dc:	78 07 00 01 	mvhi r7,0x1
    b5e0:	38 c6 37 0c 	ori r6,r6,0x370c
    b5e4:	38 e7 31 08 	ori r7,r7,0x3108
    b5e8:	78 02 00 01 	mvhi r2,0x1
    b5ec:	34 01 00 01 	mvi r1,1
    b5f0:	38 42 40 e8 	ori r2,r2,0x40e8
    b5f4:	fb ff d4 a3 	calli 880 <wrc_debug_printf>
    b5f8:	e0 00 00 52 	bi b740 <issueSync+0x270>
    b5fc:	78 02 00 01 	mvhi r2,0x1
    b600:	34 01 00 01 	mvi r1,1
    b604:	38 42 41 1c 	ori r2,r2,0x411c
    b608:	fb ff d4 9e 	calli 880 <wrc_debug_printf>
    b60c:	e0 00 00 4d 	bi b740 <issueSync+0x270>
    b610:	45 60 00 3b 	be r11,r0,b6fc <issueSync+0x22c>
    b614:	41 61 00 de 	lbu r1,(r11+222)
    b618:	78 0e 00 01 	mvhi r14,0x1
    b61c:	34 02 00 08 	mvi r2,8
    b620:	2d 70 00 dc 	lhu r16,(r11+220)
    b624:	39 ce 37 1c 	ori r14,r14,0x371c
    b628:	44 22 00 07 	be r1,r2,b644 <issueSync+0x174>
    b62c:	78 0e 00 01 	mvhi r14,0x1
    b630:	34 02 00 05 	mvi r2,5
    b634:	39 ce 37 14 	ori r14,r14,0x3714
    b638:	5c 22 00 03 	bne r1,r2,b644 <issueSync+0x174>
    b63c:	78 0e 00 01 	mvhi r14,0x1
    b640:	39 ce 37 24 	ori r14,r14,0x3724
    b644:	29 62 0b 78 	lw r2,(r11+2936)
    b648:	78 0f 00 01 	mvhi r15,0x1
    b64c:	34 01 00 01 	mvi r1,1
    b650:	39 ef 36 f4 	ori r15,r15,0x36f4
    b654:	5c 41 00 03 	bne r2,r1,b660 <issueSync+0x190>
    b658:	78 0f 00 01 	mvhi r15,0x1
    b65c:	39 ef 36 ec 	ori r15,r15,0x36ec
    b660:	41 61 0b 76 	lbu r1,(r11+2934)
    b664:	34 02 00 01 	mvi r2,1
    b668:	44 22 00 0d 	be r1,r2,b69c <issueSync+0x1cc>
    b66c:	78 0d 00 01 	mvhi r13,0x1
    b670:	39 ad 31 08 	ori r13,r13,0x3108
    b674:	34 03 00 02 	mvi r3,2
    b678:	b9 a0 60 00 	mv r12,r13
    b67c:	5c 23 00 0c 	bne r1,r3,b6ac <issueSync+0x1dc>
    b680:	41 63 0e fc 	lbu r3,(r11+3836)
    b684:	78 0c 00 01 	mvhi r12,0x1
    b688:	39 8c 36 fc 	ori r12,r12,0x36fc
    b68c:	5c 62 00 08 	bne r3,r2,b6ac <issueSync+0x1dc>
    b690:	78 0c 00 01 	mvhi r12,0x1
    b694:	39 8c 37 04 	ori r12,r12,0x3704
    b698:	e0 00 00 05 	bi b6ac <issueSync+0x1dc>
    b69c:	78 0d 00 01 	mvhi r13,0x1
    b6a0:	78 0c 00 01 	mvhi r12,0x1
    b6a4:	39 ad 37 0c 	ori r13,r13,0x370c
    b6a8:	39 8c 31 08 	ori r12,r12,0x3108
    b6ac:	29 62 0d 3c 	lw r2,(r11+3388)
    b6b0:	29 63 0d 40 	lw r3,(r11+3392)
    b6b4:	29 64 0d 44 	lw r4,(r11+3396)
    b6b8:	29 65 0d 48 	lw r5,(r11+3400)
    b6bc:	29 66 0d 4c 	lw r6,(r11+3404)
    b6c0:	29 67 0d 50 	lw r7,(r11+3408)
    b6c4:	29 68 0d 54 	lw r8,(r11+3412)
    b6c8:	29 61 0d 38 	lw r1,(r11+3384)
    b6cc:	f8 00 13 f8 	calli 106ac <format_wr_timestamp>
    b6d0:	78 02 00 01 	mvhi r2,0x1
    b6d4:	b8 20 40 00 	mv r8,r1
    b6d8:	38 42 41 38 	ori r2,r2,0x4138
    b6dc:	34 01 00 01 	mvi r1,1
    b6e0:	ba 00 18 00 	mv r3,r16
    b6e4:	b9 c0 20 00 	mv r4,r14
    b6e8:	b9 e0 28 00 	mv r5,r15
    b6ec:	b9 a0 30 00 	mv r6,r13
    b6f0:	b9 80 38 00 	mv r7,r12
    b6f4:	fb ff d4 63 	calli 880 <wrc_debug_printf>
    b6f8:	e0 00 00 0f 	bi b734 <issueSync+0x264>
    b6fc:	29 62 0d 3c 	lw r2,(r11+3388)
    b700:	29 63 0d 40 	lw r3,(r11+3392)
    b704:	29 61 0d 38 	lw r1,(r11+3384)
    b708:	29 64 0d 44 	lw r4,(r11+3396)
    b70c:	29 65 0d 48 	lw r5,(r11+3400)
    b710:	29 66 0d 4c 	lw r6,(r11+3404)
    b714:	29 67 0d 50 	lw r7,(r11+3408)
    b718:	29 68 0d 54 	lw r8,(r11+3412)
    b71c:	f8 00 13 e4 	calli 106ac <format_wr_timestamp>
    b720:	78 02 00 01 	mvhi r2,0x1
    b724:	b8 20 18 00 	mv r3,r1
    b728:	38 42 41 84 	ori r2,r2,0x4184
    b72c:	34 01 00 01 	mvi r1,1
    b730:	fb ff d4 54 	calli 880 <wrc_debug_printf>
    b734:	2d 61 0a cc 	lhu r1,(r11+2764)
    b738:	34 21 00 01 	addi r1,r1,1
    b73c:	0d 61 0a cc 	sh (r11+2764),r1
    b740:	2b 9d 00 04 	lw ra,(sp+4)
    b744:	2b 8b 00 1c 	lw r11,(sp+28)
    b748:	2b 8c 00 18 	lw r12,(sp+24)
    b74c:	2b 8d 00 14 	lw r13,(sp+20)
    b750:	2b 8e 00 10 	lw r14,(sp+16)
    b754:	2b 8f 00 0c 	lw r15,(sp+12)
    b758:	2b 90 00 08 	lw r16,(sp+8)
    b75c:	37 9c 00 28 	addi sp,sp,40
    b760:	c3 a0 00 00 	ret

0000b764 <issueFollowup>:
    b764:	37 9c ff e0 	addi sp,sp,-32
    b768:	5b 8b 00 20 	sw (sp+32),r11
    b76c:	5b 8c 00 1c 	sw (sp+28),r12
    b770:	5b 8d 00 18 	sw (sp+24),r13
    b774:	5b 9d 00 14 	sw (sp+20),ra
    b778:	34 4c 01 50 	addi r12,r2,336
    b77c:	b8 20 68 00 	mv r13,r1
    b780:	b9 80 08 00 	mv r1,r12
    b784:	b8 40 58 00 	mv r11,r2
    b788:	fb ff ed 89 	calli 6dac <msgPackFollowUp>
    b78c:	b9 80 08 00 	mv r1,r12
    b790:	34 02 00 2c 	mvi r2,44
    b794:	35 63 00 04 	addi r3,r11,4
    b798:	fb ff f0 d8 	calli 7af8 <netSendPeerGeneral>
    b79c:	b8 20 60 00 	mv r12,r1
    b7a0:	5c 20 00 36 	bne r1,r0,b878 <issueFollowup+0x114>
    b7a4:	34 01 00 01 	mvi r1,1
    b7a8:	b9 a0 10 00 	mv r2,r13
    b7ac:	b9 60 18 00 	mv r3,r11
    b7b0:	fb ff f7 cf 	calli 96ec <toState>
    b7b4:	45 6c 00 2c 	be r11,r12,b864 <issueFollowup+0x100>
    b7b8:	41 61 00 de 	lbu r1,(r11+222)
    b7bc:	78 04 00 01 	mvhi r4,0x1
    b7c0:	34 02 00 08 	mvi r2,8
    b7c4:	2d 63 00 dc 	lhu r3,(r11+220)
    b7c8:	38 84 37 1c 	ori r4,r4,0x371c
    b7cc:	44 22 00 07 	be r1,r2,b7e8 <issueFollowup+0x84>
    b7d0:	78 04 00 01 	mvhi r4,0x1
    b7d4:	34 02 00 05 	mvi r2,5
    b7d8:	38 84 37 14 	ori r4,r4,0x3714
    b7dc:	5c 22 00 03 	bne r1,r2,b7e8 <issueFollowup+0x84>
    b7e0:	78 04 00 01 	mvhi r4,0x1
    b7e4:	38 84 37 24 	ori r4,r4,0x3724
    b7e8:	29 62 0b 78 	lw r2,(r11+2936)
    b7ec:	78 05 00 01 	mvhi r5,0x1
    b7f0:	34 01 00 01 	mvi r1,1
    b7f4:	38 a5 36 f4 	ori r5,r5,0x36f4
    b7f8:	5c 41 00 03 	bne r2,r1,b804 <issueFollowup+0xa0>
    b7fc:	78 05 00 01 	mvhi r5,0x1
    b800:	38 a5 36 ec 	ori r5,r5,0x36ec
    b804:	41 61 0b 76 	lbu r1,(r11+2934)
    b808:	34 02 00 01 	mvi r2,1
    b80c:	44 22 00 0d 	be r1,r2,b840 <issueFollowup+0xdc>
    b810:	78 06 00 01 	mvhi r6,0x1
    b814:	38 c6 31 08 	ori r6,r6,0x3108
    b818:	34 08 00 02 	mvi r8,2
    b81c:	b8 c0 38 00 	mv r7,r6
    b820:	5c 28 00 0c 	bne r1,r8,b850 <issueFollowup+0xec>
    b824:	41 68 0e fc 	lbu r8,(r11+3836)
    b828:	78 07 00 01 	mvhi r7,0x1
    b82c:	38 e7 36 fc 	ori r7,r7,0x36fc
    b830:	5d 02 00 08 	bne r8,r2,b850 <issueFollowup+0xec>
    b834:	78 07 00 01 	mvhi r7,0x1
    b838:	38 e7 37 04 	ori r7,r7,0x3704
    b83c:	e0 00 00 05 	bi b850 <issueFollowup+0xec>
    b840:	78 06 00 01 	mvhi r6,0x1
    b844:	78 07 00 01 	mvhi r7,0x1
    b848:	38 c6 37 0c 	ori r6,r6,0x370c
    b84c:	38 e7 31 08 	ori r7,r7,0x3108
    b850:	78 02 00 01 	mvhi r2,0x1
    b854:	34 01 00 01 	mvi r1,1
    b858:	38 42 41 b8 	ori r2,r2,0x41b8
    b85c:	fb ff d4 09 	calli 880 <wrc_debug_printf>
    b860:	e0 00 00 42 	bi b968 <issueFollowup+0x204>
    b864:	78 02 00 01 	mvhi r2,0x1
    b868:	34 01 00 01 	mvi r1,1
    b86c:	38 42 41 f0 	ori r2,r2,0x41f0
    b870:	fb ff d4 04 	calli 880 <wrc_debug_printf>
    b874:	e0 00 00 3d 	bi b968 <issueFollowup+0x204>
    b878:	45 60 00 34 	be r11,r0,b948 <issueFollowup+0x1e4>
    b87c:	41 61 00 de 	lbu r1,(r11+222)
    b880:	78 04 00 01 	mvhi r4,0x1
    b884:	34 02 00 08 	mvi r2,8
    b888:	2d 63 00 dc 	lhu r3,(r11+220)
    b88c:	38 84 37 1c 	ori r4,r4,0x371c
    b890:	44 22 00 07 	be r1,r2,b8ac <issueFollowup+0x148>
    b894:	78 04 00 01 	mvhi r4,0x1
    b898:	34 02 00 05 	mvi r2,5
    b89c:	38 84 37 14 	ori r4,r4,0x3714
    b8a0:	5c 22 00 03 	bne r1,r2,b8ac <issueFollowup+0x148>
    b8a4:	78 04 00 01 	mvhi r4,0x1
    b8a8:	38 84 37 24 	ori r4,r4,0x3724
    b8ac:	29 62 0b 78 	lw r2,(r11+2936)
    b8b0:	78 05 00 01 	mvhi r5,0x1
    b8b4:	34 01 00 01 	mvi r1,1
    b8b8:	38 a5 36 f4 	ori r5,r5,0x36f4
    b8bc:	5c 41 00 03 	bne r2,r1,b8c8 <issueFollowup+0x164>
    b8c0:	78 05 00 01 	mvhi r5,0x1
    b8c4:	38 a5 36 ec 	ori r5,r5,0x36ec
    b8c8:	41 61 0b 76 	lbu r1,(r11+2934)
    b8cc:	34 02 00 01 	mvi r2,1
    b8d0:	44 22 00 0d 	be r1,r2,b904 <issueFollowup+0x1a0>
    b8d4:	78 06 00 01 	mvhi r6,0x1
    b8d8:	38 c6 31 08 	ori r6,r6,0x3108
    b8dc:	34 08 00 02 	mvi r8,2
    b8e0:	b8 c0 38 00 	mv r7,r6
    b8e4:	5c 28 00 0c 	bne r1,r8,b914 <issueFollowup+0x1b0>
    b8e8:	41 68 0e fc 	lbu r8,(r11+3836)
    b8ec:	78 07 00 01 	mvhi r7,0x1
    b8f0:	38 e7 36 fc 	ori r7,r7,0x36fc
    b8f4:	5d 02 00 08 	bne r8,r2,b914 <issueFollowup+0x1b0>
    b8f8:	78 07 00 01 	mvhi r7,0x1
    b8fc:	38 e7 37 04 	ori r7,r7,0x3704
    b900:	e0 00 00 05 	bi b914 <issueFollowup+0x1b0>
    b904:	78 06 00 01 	mvhi r6,0x1
    b908:	78 07 00 01 	mvhi r7,0x1
    b90c:	38 c6 37 0c 	ori r6,r6,0x370c
    b910:	38 e7 31 08 	ori r7,r7,0x3108
    b914:	29 61 0d 38 	lw r1,(r11+3384)
    b918:	78 02 00 01 	mvhi r2,0x1
    b91c:	38 42 42 10 	ori r2,r2,0x4210
    b920:	5b 81 00 04 	sw (sp+4),r1
    b924:	29 61 0d 3c 	lw r1,(r11+3388)
    b928:	5b 81 00 08 	sw (sp+8),r1
    b92c:	29 61 0d 40 	lw r1,(r11+3392)
    b930:	5b 81 00 10 	sw (sp+16),r1
    b934:	14 21 00 1f 	sri r1,r1,31
    b938:	5b 81 00 0c 	sw (sp+12),r1
    b93c:	34 01 00 01 	mvi r1,1
    b940:	fb ff d3 d0 	calli 880 <wrc_debug_printf>
    b944:	e0 00 00 09 	bi b968 <issueFollowup+0x204>
    b948:	29 66 0d 40 	lw r6,(r11+3392)
    b94c:	29 63 0d 38 	lw r3,(r11+3384)
    b950:	29 64 0d 3c 	lw r4,(r11+3388)
    b954:	78 02 00 01 	mvhi r2,0x1
    b958:	14 c5 00 1f 	sri r5,r6,31
    b95c:	34 01 00 01 	mvi r1,1
    b960:	38 42 42 7c 	ori r2,r2,0x427c
    b964:	fb ff d3 c7 	calli 880 <wrc_debug_printf>
    b968:	2b 9d 00 14 	lw ra,(sp+20)
    b96c:	2b 8b 00 20 	lw r11,(sp+32)
    b970:	2b 8c 00 1c 	lw r12,(sp+28)
    b974:	2b 8d 00 18 	lw r13,(sp+24)
    b978:	37 9c 00 20 	addi sp,sp,32
    b97c:	c3 a0 00 00 	ret

0000b980 <issueDelayReq>:
    b980:	37 9c ff d8 	addi sp,sp,-40
    b984:	5b 8b 00 1c 	sw (sp+28),r11
    b988:	5b 8c 00 18 	sw (sp+24),r12
    b98c:	5b 8d 00 14 	sw (sp+20),r13
    b990:	5b 8e 00 10 	sw (sp+16),r14
    b994:	5b 8f 00 0c 	sw (sp+12),r15
    b998:	5b 90 00 08 	sw (sp+8),r16
    b99c:	5b 9d 00 04 	sw (sp+4),ra
    b9a0:	37 8d 00 20 	addi r13,sp,32
    b9a4:	b8 40 58 00 	mv r11,r2
    b9a8:	34 03 00 0c 	mvi r3,12
    b9ac:	34 02 00 00 	mvi r2,0
    b9b0:	b8 20 70 00 	mv r14,r1
    b9b4:	b9 a0 08 00 	mv r1,r13
    b9b8:	f8 00 1b bb 	calli 128a4 <memset>
    b9bc:	35 6c 01 50 	addi r12,r11,336
    b9c0:	b9 80 08 00 	mv r1,r12
    b9c4:	b9 a0 10 00 	mv r2,r13
    b9c8:	b9 60 18 00 	mv r3,r11
    b9cc:	fb ff ed 56 	calli 6f24 <msgPackDelayReq>
    b9d0:	b9 80 08 00 	mv r1,r12
    b9d4:	34 02 00 2c 	mvi r2,44
    b9d8:	35 63 00 04 	addi r3,r11,4
    b9dc:	35 64 0d 58 	addi r4,r11,3416
    b9e0:	fb ff f0 08 	calli 7a00 <netSendEvent>
    b9e4:	b8 20 60 00 	mv r12,r1
    b9e8:	5c 20 00 36 	bne r1,r0,bac0 <issueDelayReq+0x140>
    b9ec:	34 01 00 01 	mvi r1,1
    b9f0:	b9 c0 10 00 	mv r2,r14
    b9f4:	b9 60 18 00 	mv r3,r11
    b9f8:	fb ff f7 3d 	calli 96ec <toState>
    b9fc:	45 6c 00 2c 	be r11,r12,baac <issueDelayReq+0x12c>
    ba00:	41 61 00 de 	lbu r1,(r11+222)
    ba04:	78 04 00 01 	mvhi r4,0x1
    ba08:	34 02 00 08 	mvi r2,8
    ba0c:	2d 63 00 dc 	lhu r3,(r11+220)
    ba10:	38 84 37 1c 	ori r4,r4,0x371c
    ba14:	44 22 00 07 	be r1,r2,ba30 <issueDelayReq+0xb0>
    ba18:	78 04 00 01 	mvhi r4,0x1
    ba1c:	34 02 00 05 	mvi r2,5
    ba20:	38 84 37 14 	ori r4,r4,0x3714
    ba24:	5c 22 00 03 	bne r1,r2,ba30 <issueDelayReq+0xb0>
    ba28:	78 04 00 01 	mvhi r4,0x1
    ba2c:	38 84 37 24 	ori r4,r4,0x3724
    ba30:	29 62 0b 78 	lw r2,(r11+2936)
    ba34:	78 05 00 01 	mvhi r5,0x1
    ba38:	34 01 00 01 	mvi r1,1
    ba3c:	38 a5 36 f4 	ori r5,r5,0x36f4
    ba40:	5c 41 00 03 	bne r2,r1,ba4c <issueDelayReq+0xcc>
    ba44:	78 05 00 01 	mvhi r5,0x1
    ba48:	38 a5 36 ec 	ori r5,r5,0x36ec
    ba4c:	41 61 0b 76 	lbu r1,(r11+2934)
    ba50:	34 02 00 01 	mvi r2,1
    ba54:	44 22 00 0d 	be r1,r2,ba88 <issueDelayReq+0x108>
    ba58:	78 06 00 01 	mvhi r6,0x1
    ba5c:	38 c6 31 08 	ori r6,r6,0x3108
    ba60:	34 08 00 02 	mvi r8,2
    ba64:	b8 c0 38 00 	mv r7,r6
    ba68:	5c 28 00 0c 	bne r1,r8,ba98 <issueDelayReq+0x118>
    ba6c:	41 68 0e fc 	lbu r8,(r11+3836)
    ba70:	78 07 00 01 	mvhi r7,0x1
    ba74:	38 e7 36 fc 	ori r7,r7,0x36fc
    ba78:	5d 02 00 08 	bne r8,r2,ba98 <issueDelayReq+0x118>
    ba7c:	78 07 00 01 	mvhi r7,0x1
    ba80:	38 e7 37 04 	ori r7,r7,0x3704
    ba84:	e0 00 00 05 	bi ba98 <issueDelayReq+0x118>
    ba88:	78 06 00 01 	mvhi r6,0x1
    ba8c:	78 07 00 01 	mvhi r7,0x1
    ba90:	38 c6 37 0c 	ori r6,r6,0x370c
    ba94:	38 e7 31 08 	ori r7,r7,0x3108
    ba98:	78 02 00 01 	mvhi r2,0x1
    ba9c:	34 01 00 01 	mvi r1,1
    baa0:	38 42 42 d0 	ori r2,r2,0x42d0
    baa4:	fb ff d3 77 	calli 880 <wrc_debug_printf>
    baa8:	e0 00 00 52 	bi bbf0 <issueDelayReq+0x270>
    baac:	78 02 00 01 	mvhi r2,0x1
    bab0:	34 01 00 01 	mvi r1,1
    bab4:	38 42 43 08 	ori r2,r2,0x4308
    bab8:	fb ff d3 72 	calli 880 <wrc_debug_printf>
    babc:	e0 00 00 4d 	bi bbf0 <issueDelayReq+0x270>
    bac0:	45 60 00 3b 	be r11,r0,bbac <issueDelayReq+0x22c>
    bac4:	41 61 00 de 	lbu r1,(r11+222)
    bac8:	78 0e 00 01 	mvhi r14,0x1
    bacc:	34 02 00 08 	mvi r2,8
    bad0:	2d 70 00 dc 	lhu r16,(r11+220)
    bad4:	39 ce 37 1c 	ori r14,r14,0x371c
    bad8:	44 22 00 07 	be r1,r2,baf4 <issueDelayReq+0x174>
    badc:	78 0e 00 01 	mvhi r14,0x1
    bae0:	34 02 00 05 	mvi r2,5
    bae4:	39 ce 37 14 	ori r14,r14,0x3714
    bae8:	5c 22 00 03 	bne r1,r2,baf4 <issueDelayReq+0x174>
    baec:	78 0e 00 01 	mvhi r14,0x1
    baf0:	39 ce 37 24 	ori r14,r14,0x3724
    baf4:	29 62 0b 78 	lw r2,(r11+2936)
    baf8:	78 0f 00 01 	mvhi r15,0x1
    bafc:	34 01 00 01 	mvi r1,1
    bb00:	39 ef 36 f4 	ori r15,r15,0x36f4
    bb04:	5c 41 00 03 	bne r2,r1,bb10 <issueDelayReq+0x190>
    bb08:	78 0f 00 01 	mvhi r15,0x1
    bb0c:	39 ef 36 ec 	ori r15,r15,0x36ec
    bb10:	41 61 0b 76 	lbu r1,(r11+2934)
    bb14:	34 02 00 01 	mvi r2,1
    bb18:	44 22 00 0d 	be r1,r2,bb4c <issueDelayReq+0x1cc>
    bb1c:	78 0d 00 01 	mvhi r13,0x1
    bb20:	39 ad 31 08 	ori r13,r13,0x3108
    bb24:	34 03 00 02 	mvi r3,2
    bb28:	b9 a0 60 00 	mv r12,r13
    bb2c:	5c 23 00 0c 	bne r1,r3,bb5c <issueDelayReq+0x1dc>
    bb30:	41 63 0e fc 	lbu r3,(r11+3836)
    bb34:	78 0c 00 01 	mvhi r12,0x1
    bb38:	39 8c 36 fc 	ori r12,r12,0x36fc
    bb3c:	5c 62 00 08 	bne r3,r2,bb5c <issueDelayReq+0x1dc>
    bb40:	78 0c 00 01 	mvhi r12,0x1
    bb44:	39 8c 37 04 	ori r12,r12,0x3704
    bb48:	e0 00 00 05 	bi bb5c <issueDelayReq+0x1dc>
    bb4c:	78 0d 00 01 	mvhi r13,0x1
    bb50:	78 0c 00 01 	mvhi r12,0x1
    bb54:	39 ad 37 0c 	ori r13,r13,0x370c
    bb58:	39 8c 31 08 	ori r12,r12,0x3108
    bb5c:	29 62 0d 5c 	lw r2,(r11+3420)
    bb60:	29 63 0d 60 	lw r3,(r11+3424)
    bb64:	29 64 0d 64 	lw r4,(r11+3428)
    bb68:	29 65 0d 68 	lw r5,(r11+3432)
    bb6c:	29 66 0d 6c 	lw r6,(r11+3436)
    bb70:	29 67 0d 70 	lw r7,(r11+3440)
    bb74:	29 68 0d 74 	lw r8,(r11+3444)
    bb78:	29 61 0d 58 	lw r1,(r11+3416)
    bb7c:	f8 00 12 cc 	calli 106ac <format_wr_timestamp>
    bb80:	78 02 00 01 	mvhi r2,0x1
    bb84:	b8 20 40 00 	mv r8,r1
    bb88:	38 42 43 28 	ori r2,r2,0x4328
    bb8c:	34 01 00 01 	mvi r1,1
    bb90:	ba 00 18 00 	mv r3,r16
    bb94:	b9 c0 20 00 	mv r4,r14
    bb98:	b9 e0 28 00 	mv r5,r15
    bb9c:	b9 a0 30 00 	mv r6,r13
    bba0:	b9 80 38 00 	mv r7,r12
    bba4:	fb ff d3 37 	calli 880 <wrc_debug_printf>
    bba8:	e0 00 00 0f 	bi bbe4 <issueDelayReq+0x264>
    bbac:	29 62 0d 5c 	lw r2,(r11+3420)
    bbb0:	29 63 0d 60 	lw r3,(r11+3424)
    bbb4:	29 61 0d 58 	lw r1,(r11+3416)
    bbb8:	29 64 0d 64 	lw r4,(r11+3428)
    bbbc:	29 65 0d 68 	lw r5,(r11+3432)
    bbc0:	29 66 0d 6c 	lw r6,(r11+3436)
    bbc4:	29 67 0d 70 	lw r7,(r11+3440)
    bbc8:	29 68 0d 74 	lw r8,(r11+3444)
    bbcc:	f8 00 12 b8 	calli 106ac <format_wr_timestamp>
    bbd0:	78 02 00 01 	mvhi r2,0x1
    bbd4:	b8 20 18 00 	mv r3,r1
    bbd8:	38 42 43 74 	ori r2,r2,0x4374
    bbdc:	34 01 00 01 	mvi r1,1
    bbe0:	fb ff d3 28 	calli 880 <wrc_debug_printf>
    bbe4:	2d 61 0a ca 	lhu r1,(r11+2762)
    bbe8:	34 21 00 01 	addi r1,r1,1
    bbec:	0d 61 0a ca 	sh (r11+2762),r1
    bbf0:	2b 9d 00 04 	lw ra,(sp+4)
    bbf4:	2b 8b 00 1c 	lw r11,(sp+28)
    bbf8:	2b 8c 00 18 	lw r12,(sp+24)
    bbfc:	2b 8d 00 14 	lw r13,(sp+20)
    bc00:	2b 8e 00 10 	lw r14,(sp+16)
    bc04:	2b 8f 00 0c 	lw r15,(sp+12)
    bc08:	2b 90 00 08 	lw r16,(sp+8)
    bc0c:	37 9c 00 28 	addi sp,sp,40
    bc10:	c3 a0 00 00 	ret

0000bc14 <issuePDelayReq>:
    bc14:	37 9c ff d8 	addi sp,sp,-40
    bc18:	5b 8b 00 1c 	sw (sp+28),r11
    bc1c:	5b 8c 00 18 	sw (sp+24),r12
    bc20:	5b 8d 00 14 	sw (sp+20),r13
    bc24:	5b 8e 00 10 	sw (sp+16),r14
    bc28:	5b 8f 00 0c 	sw (sp+12),r15
    bc2c:	5b 90 00 08 	sw (sp+8),r16
    bc30:	5b 9d 00 04 	sw (sp+4),ra
    bc34:	37 8d 00 20 	addi r13,sp,32
    bc38:	b8 40 58 00 	mv r11,r2
    bc3c:	34 03 00 0c 	mvi r3,12
    bc40:	34 02 00 00 	mvi r2,0
    bc44:	b8 20 70 00 	mv r14,r1
    bc48:	b9 a0 08 00 	mv r1,r13
    bc4c:	f8 00 1b 16 	calli 128a4 <memset>
    bc50:	35 6c 01 50 	addi r12,r11,336
    bc54:	b9 80 08 00 	mv r1,r12
    bc58:	b9 a0 10 00 	mv r2,r13
    bc5c:	b9 60 18 00 	mv r3,r11
    bc60:	fb ff ec 88 	calli 6e80 <msgPackPDelayReq>
    bc64:	b9 80 08 00 	mv r1,r12
    bc68:	34 02 00 36 	mvi r2,54
    bc6c:	35 63 00 04 	addi r3,r11,4
    bc70:	35 64 0d 78 	addi r4,r11,3448
    bc74:	fb ff ef 63 	calli 7a00 <netSendEvent>
    bc78:	b8 20 60 00 	mv r12,r1
    bc7c:	5c 20 00 36 	bne r1,r0,bd54 <issuePDelayReq+0x140>
    bc80:	34 01 00 01 	mvi r1,1
    bc84:	b9 c0 10 00 	mv r2,r14
    bc88:	b9 60 18 00 	mv r3,r11
    bc8c:	fb ff f6 98 	calli 96ec <toState>
    bc90:	45 6c 00 2c 	be r11,r12,bd40 <issuePDelayReq+0x12c>
    bc94:	41 61 00 de 	lbu r1,(r11+222)
    bc98:	78 04 00 01 	mvhi r4,0x1
    bc9c:	34 02 00 08 	mvi r2,8
    bca0:	2d 63 00 dc 	lhu r3,(r11+220)
    bca4:	38 84 37 1c 	ori r4,r4,0x371c
    bca8:	44 22 00 07 	be r1,r2,bcc4 <issuePDelayReq+0xb0>
    bcac:	78 04 00 01 	mvhi r4,0x1
    bcb0:	34 02 00 05 	mvi r2,5
    bcb4:	38 84 37 14 	ori r4,r4,0x3714
    bcb8:	5c 22 00 03 	bne r1,r2,bcc4 <issuePDelayReq+0xb0>
    bcbc:	78 04 00 01 	mvhi r4,0x1
    bcc0:	38 84 37 24 	ori r4,r4,0x3724
    bcc4:	29 62 0b 78 	lw r2,(r11+2936)
    bcc8:	78 05 00 01 	mvhi r5,0x1
    bccc:	34 01 00 01 	mvi r1,1
    bcd0:	38 a5 36 f4 	ori r5,r5,0x36f4
    bcd4:	5c 41 00 03 	bne r2,r1,bce0 <issuePDelayReq+0xcc>
    bcd8:	78 05 00 01 	mvhi r5,0x1
    bcdc:	38 a5 36 ec 	ori r5,r5,0x36ec
    bce0:	41 61 0b 76 	lbu r1,(r11+2934)
    bce4:	34 02 00 01 	mvi r2,1
    bce8:	44 22 00 0d 	be r1,r2,bd1c <issuePDelayReq+0x108>
    bcec:	78 06 00 01 	mvhi r6,0x1
    bcf0:	38 c6 31 08 	ori r6,r6,0x3108
    bcf4:	34 08 00 02 	mvi r8,2
    bcf8:	b8 c0 38 00 	mv r7,r6
    bcfc:	5c 28 00 0c 	bne r1,r8,bd2c <issuePDelayReq+0x118>
    bd00:	41 68 0e fc 	lbu r8,(r11+3836)
    bd04:	78 07 00 01 	mvhi r7,0x1
    bd08:	38 e7 36 fc 	ori r7,r7,0x36fc
    bd0c:	5d 02 00 08 	bne r8,r2,bd2c <issuePDelayReq+0x118>
    bd10:	78 07 00 01 	mvhi r7,0x1
    bd14:	38 e7 37 04 	ori r7,r7,0x3704
    bd18:	e0 00 00 05 	bi bd2c <issuePDelayReq+0x118>
    bd1c:	78 06 00 01 	mvhi r6,0x1
    bd20:	78 07 00 01 	mvhi r7,0x1
    bd24:	38 c6 37 0c 	ori r6,r6,0x370c
    bd28:	38 e7 31 08 	ori r7,r7,0x3108
    bd2c:	78 02 00 01 	mvhi r2,0x1
    bd30:	34 01 00 01 	mvi r1,1
    bd34:	38 42 43 a8 	ori r2,r2,0x43a8
    bd38:	fb ff d2 d2 	calli 880 <wrc_debug_printf>
    bd3c:	e0 00 00 52 	bi be84 <issuePDelayReq+0x270>
    bd40:	78 02 00 01 	mvhi r2,0x1
    bd44:	34 01 00 01 	mvi r1,1
    bd48:	38 42 43 e0 	ori r2,r2,0x43e0
    bd4c:	fb ff d2 cd 	calli 880 <wrc_debug_printf>
    bd50:	e0 00 00 4d 	bi be84 <issuePDelayReq+0x270>
    bd54:	45 60 00 3b 	be r11,r0,be40 <issuePDelayReq+0x22c>
    bd58:	41 61 00 de 	lbu r1,(r11+222)
    bd5c:	78 0e 00 01 	mvhi r14,0x1
    bd60:	34 02 00 08 	mvi r2,8
    bd64:	2d 70 00 dc 	lhu r16,(r11+220)
    bd68:	39 ce 37 1c 	ori r14,r14,0x371c
    bd6c:	44 22 00 07 	be r1,r2,bd88 <issuePDelayReq+0x174>
    bd70:	78 0e 00 01 	mvhi r14,0x1
    bd74:	34 02 00 05 	mvi r2,5
    bd78:	39 ce 37 14 	ori r14,r14,0x3714
    bd7c:	5c 22 00 03 	bne r1,r2,bd88 <issuePDelayReq+0x174>
    bd80:	78 0e 00 01 	mvhi r14,0x1
    bd84:	39 ce 37 24 	ori r14,r14,0x3724
    bd88:	29 62 0b 78 	lw r2,(r11+2936)
    bd8c:	78 0f 00 01 	mvhi r15,0x1
    bd90:	34 01 00 01 	mvi r1,1
    bd94:	39 ef 36 f4 	ori r15,r15,0x36f4
    bd98:	5c 41 00 03 	bne r2,r1,bda4 <issuePDelayReq+0x190>
    bd9c:	78 0f 00 01 	mvhi r15,0x1
    bda0:	39 ef 36 ec 	ori r15,r15,0x36ec
    bda4:	41 61 0b 76 	lbu r1,(r11+2934)
    bda8:	34 02 00 01 	mvi r2,1
    bdac:	44 22 00 0d 	be r1,r2,bde0 <issuePDelayReq+0x1cc>
    bdb0:	78 0d 00 01 	mvhi r13,0x1
    bdb4:	39 ad 31 08 	ori r13,r13,0x3108
    bdb8:	34 03 00 02 	mvi r3,2
    bdbc:	b9 a0 60 00 	mv r12,r13
    bdc0:	5c 23 00 0c 	bne r1,r3,bdf0 <issuePDelayReq+0x1dc>
    bdc4:	41 63 0e fc 	lbu r3,(r11+3836)
    bdc8:	78 0c 00 01 	mvhi r12,0x1
    bdcc:	39 8c 36 fc 	ori r12,r12,0x36fc
    bdd0:	5c 62 00 08 	bne r3,r2,bdf0 <issuePDelayReq+0x1dc>
    bdd4:	78 0c 00 01 	mvhi r12,0x1
    bdd8:	39 8c 37 04 	ori r12,r12,0x3704
    bddc:	e0 00 00 05 	bi bdf0 <issuePDelayReq+0x1dc>
    bde0:	78 0d 00 01 	mvhi r13,0x1
    bde4:	78 0c 00 01 	mvhi r12,0x1
    bde8:	39 ad 37 0c 	ori r13,r13,0x370c
    bdec:	39 8c 31 08 	ori r12,r12,0x3108
    bdf0:	29 62 0d 7c 	lw r2,(r11+3452)
    bdf4:	29 63 0d 80 	lw r3,(r11+3456)
    bdf8:	29 64 0d 84 	lw r4,(r11+3460)
    bdfc:	29 65 0d 88 	lw r5,(r11+3464)
    be00:	29 66 0d 8c 	lw r6,(r11+3468)
    be04:	29 67 0d 90 	lw r7,(r11+3472)
    be08:	29 68 0d 94 	lw r8,(r11+3476)
    be0c:	29 61 0d 78 	lw r1,(r11+3448)
    be10:	f8 00 12 27 	calli 106ac <format_wr_timestamp>
    be14:	78 02 00 01 	mvhi r2,0x1
    be18:	b8 20 40 00 	mv r8,r1
    be1c:	38 42 44 04 	ori r2,r2,0x4404
    be20:	34 01 00 01 	mvi r1,1
    be24:	ba 00 18 00 	mv r3,r16
    be28:	b9 c0 20 00 	mv r4,r14
    be2c:	b9 e0 28 00 	mv r5,r15
    be30:	b9 a0 30 00 	mv r6,r13
    be34:	b9 80 38 00 	mv r7,r12
    be38:	fb ff d2 92 	calli 880 <wrc_debug_printf>
    be3c:	e0 00 00 0f 	bi be78 <issuePDelayReq+0x264>
    be40:	29 62 0d 7c 	lw r2,(r11+3452)
    be44:	29 63 0d 80 	lw r3,(r11+3456)
    be48:	29 61 0d 78 	lw r1,(r11+3448)
    be4c:	29 64 0d 84 	lw r4,(r11+3460)
    be50:	29 65 0d 88 	lw r5,(r11+3464)
    be54:	29 66 0d 8c 	lw r6,(r11+3468)
    be58:	29 67 0d 90 	lw r7,(r11+3472)
    be5c:	29 68 0d 94 	lw r8,(r11+3476)
    be60:	f8 00 12 13 	calli 106ac <format_wr_timestamp>
    be64:	78 02 00 01 	mvhi r2,0x1
    be68:	b8 20 18 00 	mv r3,r1
    be6c:	38 42 44 48 	ori r2,r2,0x4448
    be70:	34 01 00 01 	mvi r1,1
    be74:	fb ff d2 83 	calli 880 <wrc_debug_printf>
    be78:	2d 61 0a c8 	lhu r1,(r11+2760)
    be7c:	34 21 00 01 	addi r1,r1,1
    be80:	0d 61 0a c8 	sh (r11+2760),r1
    be84:	2b 9d 00 04 	lw ra,(sp+4)
    be88:	2b 8b 00 1c 	lw r11,(sp+28)
    be8c:	2b 8c 00 18 	lw r12,(sp+24)
    be90:	2b 8d 00 14 	lw r13,(sp+20)
    be94:	2b 8e 00 10 	lw r14,(sp+16)
    be98:	2b 8f 00 0c 	lw r15,(sp+12)
    be9c:	2b 90 00 08 	lw r16,(sp+8)
    bea0:	37 9c 00 28 	addi sp,sp,40
    bea4:	c3 a0 00 00 	ret

0000bea8 <issuePDelayResp>:
    bea8:	37 9c ff dc 	addi sp,sp,-36
    beac:	5b 8b 00 18 	sw (sp+24),r11
    beb0:	5b 8c 00 14 	sw (sp+20),r12
    beb4:	5b 8d 00 10 	sw (sp+16),r13
    beb8:	5b 8e 00 0c 	sw (sp+12),r14
    bebc:	5b 8f 00 08 	sw (sp+8),r15
    bec0:	5b 9d 00 04 	sw (sp+4),ra
    bec4:	37 8d 00 1c 	addi r13,sp,28
    bec8:	b8 80 58 00 	mv r11,r4
    becc:	b8 40 78 00 	mv r15,r2
    bed0:	b9 a0 10 00 	mv r2,r13
    bed4:	35 6c 01 50 	addi r12,r11,336
    bed8:	b8 60 70 00 	mv r14,r3
    bedc:	fb ff e6 8f 	calli 5918 <fromInternalTime>
    bee0:	b9 80 08 00 	mv r1,r12
    bee4:	b9 e0 10 00 	mv r2,r15
    bee8:	b9 a0 18 00 	mv r3,r13
    beec:	b9 60 20 00 	mv r4,r11
    bef0:	fb ff ec 6e 	calli 70a8 <msgPackPDelayResp>
    bef4:	b9 80 08 00 	mv r1,r12
    bef8:	34 02 00 36 	mvi r2,54
    befc:	35 63 00 04 	addi r3,r11,4
    bf00:	35 64 0d 98 	addi r4,r11,3480
    bf04:	fb ff ee bf 	calli 7a00 <netSendEvent>
    bf08:	b8 20 60 00 	mv r12,r1
    bf0c:	5c 20 00 36 	bne r1,r0,bfe4 <issuePDelayResp+0x13c>
    bf10:	34 01 00 01 	mvi r1,1
    bf14:	b9 c0 10 00 	mv r2,r14
    bf18:	b9 60 18 00 	mv r3,r11
    bf1c:	fb ff f5 f4 	calli 96ec <toState>
    bf20:	45 6c 00 2c 	be r11,r12,bfd0 <issuePDelayResp+0x128>
    bf24:	41 61 00 de 	lbu r1,(r11+222)
    bf28:	78 04 00 01 	mvhi r4,0x1
    bf2c:	34 02 00 08 	mvi r2,8
    bf30:	2d 63 00 dc 	lhu r3,(r11+220)
    bf34:	38 84 37 1c 	ori r4,r4,0x371c
    bf38:	44 22 00 07 	be r1,r2,bf54 <issuePDelayResp+0xac>
    bf3c:	78 04 00 01 	mvhi r4,0x1
    bf40:	34 02 00 05 	mvi r2,5
    bf44:	38 84 37 14 	ori r4,r4,0x3714
    bf48:	5c 22 00 03 	bne r1,r2,bf54 <issuePDelayResp+0xac>
    bf4c:	78 04 00 01 	mvhi r4,0x1
    bf50:	38 84 37 24 	ori r4,r4,0x3724
    bf54:	29 62 0b 78 	lw r2,(r11+2936)
    bf58:	78 05 00 01 	mvhi r5,0x1
    bf5c:	34 01 00 01 	mvi r1,1
    bf60:	38 a5 36 f4 	ori r5,r5,0x36f4
    bf64:	5c 41 00 03 	bne r2,r1,bf70 <issuePDelayResp+0xc8>
    bf68:	78 05 00 01 	mvhi r5,0x1
    bf6c:	38 a5 36 ec 	ori r5,r5,0x36ec
    bf70:	41 61 0b 76 	lbu r1,(r11+2934)
    bf74:	34 02 00 01 	mvi r2,1
    bf78:	44 22 00 0d 	be r1,r2,bfac <issuePDelayResp+0x104>
    bf7c:	78 06 00 01 	mvhi r6,0x1
    bf80:	38 c6 31 08 	ori r6,r6,0x3108
    bf84:	34 08 00 02 	mvi r8,2
    bf88:	b8 c0 38 00 	mv r7,r6
    bf8c:	5c 28 00 0c 	bne r1,r8,bfbc <issuePDelayResp+0x114>
    bf90:	41 68 0e fc 	lbu r8,(r11+3836)
    bf94:	78 07 00 01 	mvhi r7,0x1
    bf98:	38 e7 36 fc 	ori r7,r7,0x36fc
    bf9c:	5d 02 00 08 	bne r8,r2,bfbc <issuePDelayResp+0x114>
    bfa0:	78 07 00 01 	mvhi r7,0x1
    bfa4:	38 e7 37 04 	ori r7,r7,0x3704
    bfa8:	e0 00 00 05 	bi bfbc <issuePDelayResp+0x114>
    bfac:	78 06 00 01 	mvhi r6,0x1
    bfb0:	78 07 00 01 	mvhi r7,0x1
    bfb4:	38 c6 37 0c 	ori r6,r6,0x370c
    bfb8:	38 e7 31 08 	ori r7,r7,0x3108
    bfbc:	78 02 00 01 	mvhi r2,0x1
    bfc0:	34 01 00 01 	mvi r1,1
    bfc4:	38 42 44 78 	ori r2,r2,0x4478
    bfc8:	fb ff d2 2e 	calli 880 <wrc_debug_printf>
    bfcc:	e0 00 00 3b 	bi c0b8 <issuePDelayResp+0x210>
    bfd0:	78 02 00 01 	mvhi r2,0x1
    bfd4:	34 01 00 01 	mvi r1,1
    bfd8:	38 42 44 b4 	ori r2,r2,0x44b4
    bfdc:	fb ff d2 29 	calli 880 <wrc_debug_printf>
    bfe0:	e0 00 00 36 	bi c0b8 <issuePDelayResp+0x210>
    bfe4:	45 60 00 2d 	be r11,r0,c098 <issuePDelayResp+0x1f0>
    bfe8:	41 61 00 de 	lbu r1,(r11+222)
    bfec:	78 04 00 01 	mvhi r4,0x1
    bff0:	34 02 00 08 	mvi r2,8
    bff4:	2d 63 00 dc 	lhu r3,(r11+220)
    bff8:	38 84 37 1c 	ori r4,r4,0x371c
    bffc:	44 22 00 07 	be r1,r2,c018 <issuePDelayResp+0x170>
    c000:	78 04 00 01 	mvhi r4,0x1
    c004:	34 02 00 05 	mvi r2,5
    c008:	38 84 37 14 	ori r4,r4,0x3714
    c00c:	5c 22 00 03 	bne r1,r2,c018 <issuePDelayResp+0x170>
    c010:	78 04 00 01 	mvhi r4,0x1
    c014:	38 84 37 24 	ori r4,r4,0x3724
    c018:	29 62 0b 78 	lw r2,(r11+2936)
    c01c:	78 05 00 01 	mvhi r5,0x1
    c020:	34 01 00 01 	mvi r1,1
    c024:	38 a5 36 f4 	ori r5,r5,0x36f4
    c028:	5c 41 00 03 	bne r2,r1,c034 <issuePDelayResp+0x18c>
    c02c:	78 05 00 01 	mvhi r5,0x1
    c030:	38 a5 36 ec 	ori r5,r5,0x36ec
    c034:	41 61 0b 76 	lbu r1,(r11+2934)
    c038:	34 02 00 01 	mvi r2,1
    c03c:	44 22 00 0d 	be r1,r2,c070 <issuePDelayResp+0x1c8>
    c040:	78 06 00 01 	mvhi r6,0x1
    c044:	38 c6 31 08 	ori r6,r6,0x3108
    c048:	34 08 00 02 	mvi r8,2
    c04c:	b8 c0 38 00 	mv r7,r6
    c050:	5c 28 00 0c 	bne r1,r8,c080 <issuePDelayResp+0x1d8>
    c054:	41 68 0e fc 	lbu r8,(r11+3836)
    c058:	78 07 00 01 	mvhi r7,0x1
    c05c:	38 e7 36 fc 	ori r7,r7,0x36fc
    c060:	5d 02 00 08 	bne r8,r2,c080 <issuePDelayResp+0x1d8>
    c064:	78 07 00 01 	mvhi r7,0x1
    c068:	38 e7 37 04 	ori r7,r7,0x3704
    c06c:	e0 00 00 05 	bi c080 <issuePDelayResp+0x1d8>
    c070:	78 06 00 01 	mvhi r6,0x1
    c074:	78 07 00 01 	mvhi r7,0x1
    c078:	38 c6 37 0c 	ori r6,r6,0x370c
    c07c:	38 e7 31 08 	ori r7,r7,0x3108
    c080:	29 68 0d b4 	lw r8,(r11+3508)
    c084:	78 02 00 01 	mvhi r2,0x1
    c088:	34 01 00 01 	mvi r1,1
    c08c:	38 42 44 d8 	ori r2,r2,0x44d8
    c090:	fb ff d1 fc 	calli 880 <wrc_debug_printf>
    c094:	e0 00 00 06 	bi c0ac <issuePDelayResp+0x204>
    c098:	29 63 0d b4 	lw r3,(r11+3508)
    c09c:	78 02 00 01 	mvhi r2,0x1
    c0a0:	34 01 00 01 	mvi r1,1
    c0a4:	38 42 45 20 	ori r2,r2,0x4520
    c0a8:	fb ff d1 f6 	calli 880 <wrc_debug_printf>
    c0ac:	2d 61 0a d4 	lhu r1,(r11+2772)
    c0b0:	34 21 00 01 	addi r1,r1,1
    c0b4:	0d 61 0a d4 	sh (r11+2772),r1
    c0b8:	2b 9d 00 04 	lw ra,(sp+4)
    c0bc:	2b 8b 00 18 	lw r11,(sp+24)
    c0c0:	2b 8c 00 14 	lw r12,(sp+20)
    c0c4:	2b 8d 00 10 	lw r13,(sp+16)
    c0c8:	2b 8e 00 0c 	lw r14,(sp+12)
    c0cc:	2b 8f 00 08 	lw r15,(sp+8)
    c0d0:	37 9c 00 24 	addi sp,sp,36
    c0d4:	c3 a0 00 00 	ret

0000c0d8 <issueDelayResp>:
    c0d8:	37 9c ff e0 	addi sp,sp,-32
    c0dc:	5b 8b 00 20 	sw (sp+32),r11
    c0e0:	5b 8c 00 1c 	sw (sp+28),r12
    c0e4:	5b 8d 00 18 	sw (sp+24),r13
    c0e8:	5b 9d 00 14 	sw (sp+20),ra
    c0ec:	34 6c 01 50 	addi r12,r3,336
    c0f0:	b8 20 20 00 	mv r4,r1
    c0f4:	b8 40 68 00 	mv r13,r2
    c0f8:	b9 80 08 00 	mv r1,r12
    c0fc:	b8 80 10 00 	mv r2,r4
    c100:	b8 60 58 00 	mv r11,r3
    c104:	fb ff eb b0 	calli 6fc4 <msgPackDelayResp>
    c108:	b9 80 08 00 	mv r1,r12
    c10c:	34 02 00 36 	mvi r2,54
    c110:	35 63 00 04 	addi r3,r11,4
    c114:	fb ff ee 85 	calli 7b28 <netSendGeneral>
    c118:	b8 20 60 00 	mv r12,r1
    c11c:	5c 20 00 36 	bne r1,r0,c1f4 <issueDelayResp+0x11c>
    c120:	34 01 00 01 	mvi r1,1
    c124:	b9 a0 10 00 	mv r2,r13
    c128:	b9 60 18 00 	mv r3,r11
    c12c:	fb ff f5 70 	calli 96ec <toState>
    c130:	45 6c 00 2c 	be r11,r12,c1e0 <issueDelayResp+0x108>
    c134:	41 61 00 de 	lbu r1,(r11+222)
    c138:	78 04 00 01 	mvhi r4,0x1
    c13c:	34 02 00 08 	mvi r2,8
    c140:	2d 63 00 dc 	lhu r3,(r11+220)
    c144:	38 84 37 1c 	ori r4,r4,0x371c
    c148:	44 22 00 07 	be r1,r2,c164 <issueDelayResp+0x8c>
    c14c:	78 04 00 01 	mvhi r4,0x1
    c150:	34 02 00 05 	mvi r2,5
    c154:	38 84 37 14 	ori r4,r4,0x3714
    c158:	5c 22 00 03 	bne r1,r2,c164 <issueDelayResp+0x8c>
    c15c:	78 04 00 01 	mvhi r4,0x1
    c160:	38 84 37 24 	ori r4,r4,0x3724
    c164:	29 62 0b 78 	lw r2,(r11+2936)
    c168:	78 05 00 01 	mvhi r5,0x1
    c16c:	34 01 00 01 	mvi r1,1
    c170:	38 a5 36 f4 	ori r5,r5,0x36f4
    c174:	5c 41 00 03 	bne r2,r1,c180 <issueDelayResp+0xa8>
    c178:	78 05 00 01 	mvhi r5,0x1
    c17c:	38 a5 36 ec 	ori r5,r5,0x36ec
    c180:	41 61 0b 76 	lbu r1,(r11+2934)
    c184:	34 02 00 01 	mvi r2,1
    c188:	44 22 00 0d 	be r1,r2,c1bc <issueDelayResp+0xe4>
    c18c:	78 06 00 01 	mvhi r6,0x1
    c190:	38 c6 31 08 	ori r6,r6,0x3108
    c194:	34 08 00 02 	mvi r8,2
    c198:	b8 c0 38 00 	mv r7,r6
    c19c:	5c 28 00 0c 	bne r1,r8,c1cc <issueDelayResp+0xf4>
    c1a0:	41 68 0e fc 	lbu r8,(r11+3836)
    c1a4:	78 07 00 01 	mvhi r7,0x1
    c1a8:	38 e7 36 fc 	ori r7,r7,0x36fc
    c1ac:	5d 02 00 08 	bne r8,r2,c1cc <issueDelayResp+0xf4>
    c1b0:	78 07 00 01 	mvhi r7,0x1
    c1b4:	38 e7 37 04 	ori r7,r7,0x3704
    c1b8:	e0 00 00 05 	bi c1cc <issueDelayResp+0xf4>
    c1bc:	78 06 00 01 	mvhi r6,0x1
    c1c0:	78 07 00 01 	mvhi r7,0x1
    c1c4:	38 c6 37 0c 	ori r6,r6,0x370c
    c1c8:	38 e7 31 08 	ori r7,r7,0x3108
    c1cc:	78 02 00 01 	mvhi r2,0x1
    c1d0:	34 01 00 01 	mvi r1,1
    c1d4:	38 42 45 54 	ori r2,r2,0x4554
    c1d8:	fb ff d1 aa 	calli 880 <wrc_debug_printf>
    c1dc:	e0 00 00 42 	bi c2e4 <issueDelayResp+0x20c>
    c1e0:	78 02 00 01 	mvhi r2,0x1
    c1e4:	34 01 00 01 	mvi r1,1
    c1e8:	38 42 45 8c 	ori r2,r2,0x458c
    c1ec:	fb ff d1 a5 	calli 880 <wrc_debug_printf>
    c1f0:	e0 00 00 3d 	bi c2e4 <issueDelayResp+0x20c>
    c1f4:	45 60 00 34 	be r11,r0,c2c4 <issueDelayResp+0x1ec>
    c1f8:	41 61 00 de 	lbu r1,(r11+222)
    c1fc:	78 04 00 01 	mvhi r4,0x1
    c200:	34 02 00 08 	mvi r2,8
    c204:	2d 63 00 dc 	lhu r3,(r11+220)
    c208:	38 84 37 1c 	ori r4,r4,0x371c
    c20c:	44 22 00 07 	be r1,r2,c228 <issueDelayResp+0x150>
    c210:	78 04 00 01 	mvhi r4,0x1
    c214:	34 02 00 05 	mvi r2,5
    c218:	38 84 37 14 	ori r4,r4,0x3714
    c21c:	5c 22 00 03 	bne r1,r2,c228 <issueDelayResp+0x150>
    c220:	78 04 00 01 	mvhi r4,0x1
    c224:	38 84 37 24 	ori r4,r4,0x3724
    c228:	29 62 0b 78 	lw r2,(r11+2936)
    c22c:	78 05 00 01 	mvhi r5,0x1
    c230:	34 01 00 01 	mvi r1,1
    c234:	38 a5 36 f4 	ori r5,r5,0x36f4
    c238:	5c 41 00 03 	bne r2,r1,c244 <issueDelayResp+0x16c>
    c23c:	78 05 00 01 	mvhi r5,0x1
    c240:	38 a5 36 ec 	ori r5,r5,0x36ec
    c244:	41 61 0b 76 	lbu r1,(r11+2934)
    c248:	34 02 00 01 	mvi r2,1
    c24c:	44 22 00 0d 	be r1,r2,c280 <issueDelayResp+0x1a8>
    c250:	78 06 00 01 	mvhi r6,0x1
    c254:	38 c6 31 08 	ori r6,r6,0x3108
    c258:	34 08 00 02 	mvi r8,2
    c25c:	b8 c0 38 00 	mv r7,r6
    c260:	5c 28 00 0c 	bne r1,r8,c290 <issueDelayResp+0x1b8>
    c264:	41 68 0e fc 	lbu r8,(r11+3836)
    c268:	78 07 00 01 	mvhi r7,0x1
    c26c:	38 e7 36 fc 	ori r7,r7,0x36fc
    c270:	5d 02 00 08 	bne r8,r2,c290 <issueDelayResp+0x1b8>
    c274:	78 07 00 01 	mvhi r7,0x1
    c278:	38 e7 37 04 	ori r7,r7,0x3704
    c27c:	e0 00 00 05 	bi c290 <issueDelayResp+0x1b8>
    c280:	78 06 00 01 	mvhi r6,0x1
    c284:	78 07 00 01 	mvhi r7,0x1
    c288:	38 c6 37 0c 	ori r6,r6,0x370c
    c28c:	38 e7 31 08 	ori r7,r7,0x3108
    c290:	29 61 09 d4 	lw r1,(r11+2516)
    c294:	78 02 00 01 	mvhi r2,0x1
    c298:	38 42 45 b0 	ori r2,r2,0x45b0
    c29c:	5b 81 00 08 	sw (sp+8),r1
    c2a0:	14 21 00 1f 	sri r1,r1,31
    c2a4:	5b 81 00 04 	sw (sp+4),r1
    c2a8:	29 61 09 d8 	lw r1,(r11+2520)
    c2ac:	5b 81 00 10 	sw (sp+16),r1
    c2b0:	14 21 00 1f 	sri r1,r1,31
    c2b4:	5b 81 00 0c 	sw (sp+12),r1
    c2b8:	34 01 00 01 	mvi r1,1
    c2bc:	fb ff d1 71 	calli 880 <wrc_debug_printf>
    c2c0:	e0 00 00 09 	bi c2e4 <issueDelayResp+0x20c>
    c2c4:	29 64 09 d4 	lw r4,(r11+2516)
    c2c8:	29 66 09 d8 	lw r6,(r11+2520)
    c2cc:	78 02 00 01 	mvhi r2,0x1
    c2d0:	14 83 00 1f 	sri r3,r4,31
    c2d4:	14 c5 00 1f 	sri r5,r6,31
    c2d8:	34 01 00 01 	mvi r1,1
    c2dc:	38 42 46 28 	ori r2,r2,0x4628
    c2e0:	fb ff d1 68 	calli 880 <wrc_debug_printf>
    c2e4:	2b 9d 00 14 	lw ra,(sp+20)
    c2e8:	2b 8b 00 20 	lw r11,(sp+32)
    c2ec:	2b 8c 00 1c 	lw r12,(sp+28)
    c2f0:	2b 8d 00 18 	lw r13,(sp+24)
    c2f4:	37 9c 00 20 	addi sp,sp,32
    c2f8:	c3 a0 00 00 	ret

0000c2fc <handleDelayReq>:
    c2fc:	37 9c ff f0 	addi sp,sp,-16
    c300:	5b 8b 00 10 	sw (sp+16),r11
    c304:	5b 8c 00 0c 	sw (sp+12),r12
    c308:	5b 8d 00 08 	sw (sp+8),r13
    c30c:	5b 9d 00 04 	sw (sp+4),ra
    c310:	28 a1 00 6c 	lw r1,(r5+108)
    c314:	b8 a0 60 00 	mv r12,r5
    c318:	b8 c0 58 00 	mv r11,r6
    c31c:	44 20 00 3f 	be r1,r0,c418 <handleDelayReq+0x11c>
    c320:	34 01 00 2b 	mvi r1,43
    c324:	48 61 00 06 	bg r3,r1,c33c <handleDelayReq+0x40>
    c328:	34 01 00 01 	mvi r1,1
    c32c:	b8 a0 10 00 	mv r2,r5
    c330:	b8 c0 18 00 	mv r3,r6
    c334:	fb ff f4 ee 	calli 96ec <toState>
    c338:	e0 00 00 38 	bi c418 <handleDelayReq+0x11c>
    c33c:	40 c2 00 de 	lbu r2,(r6+222)
    c340:	34 01 00 05 	mvi r1,5
    c344:	5c 41 00 35 	bne r2,r1,c418 <handleDelayReq+0x11c>
    c348:	28 c2 0b 78 	lw r2,(r6+2936)
    c34c:	78 05 00 01 	mvhi r5,0x1
    c350:	34 01 00 01 	mvi r1,1
    c354:	2c c3 00 dc 	lhu r3,(r6+220)
    c358:	38 a5 36 f4 	ori r5,r5,0x36f4
    c35c:	5c 41 00 03 	bne r2,r1,c368 <handleDelayReq+0x6c>
    c360:	78 05 00 01 	mvhi r5,0x1
    c364:	38 a5 36 ec 	ori r5,r5,0x36ec
    c368:	41 62 0b 76 	lbu r2,(r11+2934)
    c36c:	34 01 00 01 	mvi r1,1
    c370:	44 41 00 0d 	be r2,r1,c3a4 <handleDelayReq+0xa8>
    c374:	78 06 00 01 	mvhi r6,0x1
    c378:	38 c6 31 08 	ori r6,r6,0x3108
    c37c:	34 04 00 02 	mvi r4,2
    c380:	b8 c0 38 00 	mv r7,r6
    c384:	5c 44 00 0c 	bne r2,r4,c3b4 <handleDelayReq+0xb8>
    c388:	41 64 0e fc 	lbu r4,(r11+3836)
    c38c:	78 07 00 01 	mvhi r7,0x1
    c390:	38 e7 36 fc 	ori r7,r7,0x36fc
    c394:	5c 81 00 08 	bne r4,r1,c3b4 <handleDelayReq+0xb8>
    c398:	78 07 00 01 	mvhi r7,0x1
    c39c:	38 e7 37 04 	ori r7,r7,0x3704
    c3a0:	e0 00 00 05 	bi c3b4 <handleDelayReq+0xb8>
    c3a4:	78 06 00 01 	mvhi r6,0x1
    c3a8:	78 07 00 01 	mvhi r7,0x1
    c3ac:	38 c6 37 0c 	ori r6,r6,0x370c
    c3b0:	38 e7 31 08 	ori r7,r7,0x3108
    c3b4:	78 02 00 01 	mvhi r2,0x1
    c3b8:	78 04 00 01 	mvhi r4,0x1
    c3bc:	38 84 37 24 	ori r4,r4,0x3724
    c3c0:	34 01 00 01 	mvi r1,1
    c3c4:	38 42 46 88 	ori r2,r2,0x4688
    c3c8:	fb ff d1 2e 	calli 880 <wrc_debug_printf>
    c3cc:	35 6d 0a 2c 	addi r13,r11,2604
    c3d0:	35 61 05 50 	addi r1,r11,1360
    c3d4:	b9 a0 10 00 	mv r2,r13
    c3d8:	fb ff e9 40 	calli 68d8 <msgUnpackHeader>
    c3dc:	29 63 0d c4 	lw r3,(r11+3524)
    c3e0:	59 60 0a 3c 	sw (r11+2620),r0
    c3e4:	34 04 03 e8 	mvi r4,1000
    c3e8:	14 61 00 1f 	sri r1,r3,31
    c3ec:	00 62 00 10 	srui r2,r3,16
    c3f0:	3c 21 00 10 	sli r1,r1,16
    c3f4:	b8 41 08 00 	or r1,r2,r1
    c3f8:	3c 62 00 10 	sli r2,r3,16
    c3fc:	34 03 00 00 	mvi r3,0
    c400:	f8 00 10 d2 	calli 10748 <__divdi3>
    c404:	59 62 0a 38 	sw (r11+2616),r2
    c408:	b9 a0 08 00 	mv r1,r13
    c40c:	b9 80 10 00 	mv r2,r12
    c410:	b9 60 18 00 	mv r3,r11
    c414:	fb ff ff 31 	calli c0d8 <issueDelayResp>
    c418:	2b 9d 00 04 	lw ra,(sp+4)
    c41c:	2b 8b 00 10 	lw r11,(sp+16)
    c420:	2b 8c 00 0c 	lw r12,(sp+12)
    c424:	2b 8d 00 08 	lw r13,(sp+8)
    c428:	37 9c 00 10 	addi sp,sp,16
    c42c:	c3 a0 00 00 	ret

0000c430 <issuePDelayRespFollowUp>:
    c430:	37 9c ff dc 	addi sp,sp,-36
    c434:	5b 8b 00 18 	sw (sp+24),r11
    c438:	5b 8c 00 14 	sw (sp+20),r12
    c43c:	5b 8d 00 10 	sw (sp+16),r13
    c440:	5b 8e 00 0c 	sw (sp+12),r14
    c444:	5b 8f 00 08 	sw (sp+8),r15
    c448:	5b 9d 00 04 	sw (sp+4),ra
    c44c:	37 8d 00 1c 	addi r13,sp,28
    c450:	b8 80 58 00 	mv r11,r4
    c454:	b8 40 78 00 	mv r15,r2
    c458:	b9 a0 10 00 	mv r2,r13
    c45c:	35 6c 01 50 	addi r12,r11,336
    c460:	b8 60 70 00 	mv r14,r3
    c464:	fb ff e5 2d 	calli 5918 <fromInternalTime>
    c468:	b9 80 08 00 	mv r1,r12
    c46c:	b9 e0 10 00 	mv r2,r15
    c470:	b9 a0 18 00 	mv r3,r13
    c474:	b9 60 20 00 	mv r4,r11
    c478:	fb ff eb 98 	calli 72d8 <msgPackPDelayRespFollowUp>
    c47c:	b9 80 08 00 	mv r1,r12
    c480:	34 02 00 36 	mvi r2,54
    c484:	35 63 00 04 	addi r3,r11,4
    c488:	fb ff ed a8 	calli 7b28 <netSendGeneral>
    c48c:	b8 20 60 00 	mv r12,r1
    c490:	5c 20 00 34 	bne r1,r0,c560 <issuePDelayRespFollowUp+0x130>
    c494:	34 01 00 01 	mvi r1,1
    c498:	b9 c0 10 00 	mv r2,r14
    c49c:	b9 60 18 00 	mv r3,r11
    c4a0:	fb ff f4 93 	calli 96ec <toState>
    c4a4:	45 6c 00 2b 	be r11,r12,c550 <issuePDelayRespFollowUp+0x120>
    c4a8:	41 61 00 de 	lbu r1,(r11+222)
    c4ac:	78 04 00 01 	mvhi r4,0x1
    c4b0:	34 02 00 08 	mvi r2,8
    c4b4:	2d 63 00 dc 	lhu r3,(r11+220)
    c4b8:	38 84 37 1c 	ori r4,r4,0x371c
    c4bc:	44 22 00 07 	be r1,r2,c4d8 <issuePDelayRespFollowUp+0xa8>
    c4c0:	78 04 00 01 	mvhi r4,0x1
    c4c4:	34 02 00 05 	mvi r2,5
    c4c8:	38 84 37 14 	ori r4,r4,0x3714
    c4cc:	5c 22 00 03 	bne r1,r2,c4d8 <issuePDelayRespFollowUp+0xa8>
    c4d0:	78 04 00 01 	mvhi r4,0x1
    c4d4:	38 84 37 24 	ori r4,r4,0x3724
    c4d8:	29 62 0b 78 	lw r2,(r11+2936)
    c4dc:	78 05 00 01 	mvhi r5,0x1
    c4e0:	34 01 00 01 	mvi r1,1
    c4e4:	38 a5 36 f4 	ori r5,r5,0x36f4
    c4e8:	5c 41 00 03 	bne r2,r1,c4f4 <issuePDelayRespFollowUp+0xc4>
    c4ec:	78 05 00 01 	mvhi r5,0x1
    c4f0:	38 a5 36 ec 	ori r5,r5,0x36ec
    c4f4:	41 61 0b 76 	lbu r1,(r11+2934)
    c4f8:	34 02 00 01 	mvi r2,1
    c4fc:	44 22 00 0d 	be r1,r2,c530 <issuePDelayRespFollowUp+0x100>
    c500:	78 06 00 01 	mvhi r6,0x1
    c504:	38 c6 31 08 	ori r6,r6,0x3108
    c508:	34 08 00 02 	mvi r8,2
    c50c:	b8 c0 38 00 	mv r7,r6
    c510:	5c 28 00 0c 	bne r1,r8,c540 <issuePDelayRespFollowUp+0x110>
    c514:	41 68 0e fc 	lbu r8,(r11+3836)
    c518:	78 07 00 01 	mvhi r7,0x1
    c51c:	38 e7 36 fc 	ori r7,r7,0x36fc
    c520:	5d 02 00 08 	bne r8,r2,c540 <issuePDelayRespFollowUp+0x110>
    c524:	78 07 00 01 	mvhi r7,0x1
    c528:	38 e7 37 04 	ori r7,r7,0x3704
    c52c:	e0 00 00 05 	bi c540 <issuePDelayRespFollowUp+0x110>
    c530:	78 06 00 01 	mvhi r6,0x1
    c534:	78 07 00 01 	mvhi r7,0x1
    c538:	38 c6 37 0c 	ori r6,r6,0x370c
    c53c:	38 e7 31 08 	ori r7,r7,0x3108
    c540:	78 02 00 01 	mvhi r2,0x1
    c544:	34 01 00 01 	mvi r1,1
    c548:	38 42 46 c4 	ori r2,r2,0x46c4
    c54c:	e0 00 00 2f 	bi c608 <issuePDelayRespFollowUp+0x1d8>
    c550:	78 02 00 01 	mvhi r2,0x1
    c554:	34 01 00 01 	mvi r1,1
    c558:	38 42 47 08 	ori r2,r2,0x4708
    c55c:	e0 00 00 36 	bi c634 <issuePDelayRespFollowUp+0x204>
    c560:	45 60 00 32 	be r11,r0,c628 <issuePDelayRespFollowUp+0x1f8>
    c564:	41 61 00 de 	lbu r1,(r11+222)
    c568:	78 04 00 01 	mvhi r4,0x1
    c56c:	34 02 00 08 	mvi r2,8
    c570:	2d 63 00 dc 	lhu r3,(r11+220)
    c574:	38 84 37 1c 	ori r4,r4,0x371c
    c578:	44 22 00 07 	be r1,r2,c594 <issuePDelayRespFollowUp+0x164>
    c57c:	78 04 00 01 	mvhi r4,0x1
    c580:	34 02 00 05 	mvi r2,5
    c584:	38 84 37 14 	ori r4,r4,0x3714
    c588:	5c 22 00 03 	bne r1,r2,c594 <issuePDelayRespFollowUp+0x164>
    c58c:	78 04 00 01 	mvhi r4,0x1
    c590:	38 84 37 24 	ori r4,r4,0x3724
    c594:	29 62 0b 78 	lw r2,(r11+2936)
    c598:	78 05 00 01 	mvhi r5,0x1
    c59c:	34 01 00 01 	mvi r1,1
    c5a0:	38 a5 36 f4 	ori r5,r5,0x36f4
    c5a4:	5c 41 00 03 	bne r2,r1,c5b0 <issuePDelayRespFollowUp+0x180>
    c5a8:	78 05 00 01 	mvhi r5,0x1
    c5ac:	38 a5 36 ec 	ori r5,r5,0x36ec
    c5b0:	41 61 0b 76 	lbu r1,(r11+2934)
    c5b4:	34 02 00 01 	mvi r2,1
    c5b8:	44 22 00 0d 	be r1,r2,c5ec <issuePDelayRespFollowUp+0x1bc>
    c5bc:	78 06 00 01 	mvhi r6,0x1
    c5c0:	38 c6 31 08 	ori r6,r6,0x3108
    c5c4:	34 08 00 02 	mvi r8,2
    c5c8:	b8 c0 38 00 	mv r7,r6
    c5cc:	5c 28 00 0c 	bne r1,r8,c5fc <issuePDelayRespFollowUp+0x1cc>
    c5d0:	41 68 0e fc 	lbu r8,(r11+3836)
    c5d4:	78 07 00 01 	mvhi r7,0x1
    c5d8:	38 e7 36 fc 	ori r7,r7,0x36fc
    c5dc:	5d 02 00 08 	bne r8,r2,c5fc <issuePDelayRespFollowUp+0x1cc>
    c5e0:	78 07 00 01 	mvhi r7,0x1
    c5e4:	38 e7 37 04 	ori r7,r7,0x3704
    c5e8:	e0 00 00 05 	bi c5fc <issuePDelayRespFollowUp+0x1cc>
    c5ec:	78 06 00 01 	mvhi r6,0x1
    c5f0:	78 07 00 01 	mvhi r7,0x1
    c5f4:	38 c6 37 0c 	ori r6,r6,0x370c
    c5f8:	38 e7 31 08 	ori r7,r7,0x3108
    c5fc:	78 02 00 01 	mvhi r2,0x1
    c600:	34 01 00 01 	mvi r1,1
    c604:	38 42 47 34 	ori r2,r2,0x4734
    c608:	fb ff d0 9e 	calli 880 <wrc_debug_printf>
    c60c:	41 61 00 de 	lbu r1,(r11+222)
    c610:	78 04 00 01 	mvhi r4,0x1
    c614:	34 02 00 08 	mvi r2,8
    c618:	2d 63 00 dc 	lhu r3,(r11+220)
    c61c:	38 84 37 1c 	ori r4,r4,0x371c
    c620:	5c 22 00 0b 	bne r1,r2,c64c <issuePDelayRespFollowUp+0x21c>
    c624:	e0 00 00 10 	bi c664 <issuePDelayRespFollowUp+0x234>
    c628:	78 02 00 01 	mvhi r2,0x1
    c62c:	34 01 00 01 	mvi r1,1
    c630:	38 42 47 7c 	ori r2,r2,0x477c
    c634:	fb ff d0 93 	calli 880 <wrc_debug_printf>
    c638:	78 02 00 01 	mvhi r2,0x1
    c63c:	34 01 00 01 	mvi r1,1
    c640:	38 42 47 f0 	ori r2,r2,0x47f0
    c644:	fb ff d0 8f 	calli 880 <wrc_debug_printf>
    c648:	e0 00 00 25 	bi c6dc <issuePDelayRespFollowUp+0x2ac>
    c64c:	78 04 00 01 	mvhi r4,0x1
    c650:	34 02 00 05 	mvi r2,5
    c654:	38 84 37 14 	ori r4,r4,0x3714
    c658:	5c 22 00 03 	bne r1,r2,c664 <issuePDelayRespFollowUp+0x234>
    c65c:	78 04 00 01 	mvhi r4,0x1
    c660:	38 84 37 24 	ori r4,r4,0x3724
    c664:	29 62 0b 78 	lw r2,(r11+2936)
    c668:	78 05 00 01 	mvhi r5,0x1
    c66c:	34 01 00 01 	mvi r1,1
    c670:	38 a5 36 f4 	ori r5,r5,0x36f4
    c674:	5c 41 00 03 	bne r2,r1,c680 <issuePDelayRespFollowUp+0x250>
    c678:	78 05 00 01 	mvhi r5,0x1
    c67c:	38 a5 36 ec 	ori r5,r5,0x36ec
    c680:	41 61 0b 76 	lbu r1,(r11+2934)
    c684:	34 02 00 01 	mvi r2,1
    c688:	44 22 00 0d 	be r1,r2,c6bc <issuePDelayRespFollowUp+0x28c>
    c68c:	78 06 00 01 	mvhi r6,0x1
    c690:	38 c6 31 08 	ori r6,r6,0x3108
    c694:	34 08 00 02 	mvi r8,2
    c698:	b8 c0 38 00 	mv r7,r6
    c69c:	5c 28 00 0c 	bne r1,r8,c6cc <issuePDelayRespFollowUp+0x29c>
    c6a0:	41 68 0e fc 	lbu r8,(r11+3836)
    c6a4:	78 07 00 01 	mvhi r7,0x1
    c6a8:	38 e7 36 fc 	ori r7,r7,0x36fc
    c6ac:	5d 02 00 08 	bne r8,r2,c6cc <issuePDelayRespFollowUp+0x29c>
    c6b0:	78 07 00 01 	mvhi r7,0x1
    c6b4:	38 e7 37 04 	ori r7,r7,0x3704
    c6b8:	e0 00 00 05 	bi c6cc <issuePDelayRespFollowUp+0x29c>
    c6bc:	78 06 00 01 	mvhi r6,0x1
    c6c0:	78 07 00 01 	mvhi r7,0x1
    c6c4:	38 c6 37 0c 	ori r6,r6,0x370c
    c6c8:	38 e7 31 08 	ori r7,r7,0x3108
    c6cc:	78 02 00 01 	mvhi r2,0x1
    c6d0:	34 01 00 01 	mvi r1,1
    c6d4:	38 42 47 ac 	ori r2,r2,0x47ac
    c6d8:	fb ff d0 6a 	calli 880 <wrc_debug_printf>
    c6dc:	2b 9d 00 04 	lw ra,(sp+4)
    c6e0:	2b 8b 00 18 	lw r11,(sp+24)
    c6e4:	2b 8c 00 14 	lw r12,(sp+20)
    c6e8:	2b 8d 00 10 	lw r13,(sp+16)
    c6ec:	2b 8e 00 0c 	lw r14,(sp+12)
    c6f0:	2b 8f 00 08 	lw r15,(sp+8)
    c6f4:	37 9c 00 24 	addi sp,sp,36
    c6f8:	c3 a0 00 00 	ret

0000c6fc <handlePDelayResp>:
    c6fc:	37 9c ff e0 	addi sp,sp,-32
    c700:	5b 8b 00 10 	sw (sp+16),r11
    c704:	5b 8c 00 0c 	sw (sp+12),r12
    c708:	5b 8d 00 08 	sw (sp+8),r13
    c70c:	5b 9d 00 04 	sw (sp+4),ra
    c710:	28 c1 00 70 	lw r1,(r6+112)
    c714:	b8 60 68 00 	mv r13,r3
    c718:	b8 c0 60 00 	mv r12,r6
    c71c:	b8 e0 58 00 	mv r11,r7
    c720:	44 20 00 2d 	be r1,r0,c7d4 <handlePDelayResp+0xd8>
    c724:	34 01 00 35 	mvi r1,53
    c728:	48 81 00 06 	bg r4,r1,c740 <handlePDelayResp+0x44>
    c72c:	34 01 00 01 	mvi r1,1
    c730:	b8 c0 10 00 	mv r2,r6
    c734:	b8 e0 18 00 	mv r3,r7
    c738:	fb ff f3 ed 	calli 96ec <toState>
    c73c:	e0 00 00 26 	bi c7d4 <handlePDelayResp+0xd8>
    c740:	40 e2 00 de 	lbu r2,(r7+222)
    c744:	34 01 00 08 	mvi r1,8
    c748:	5c 41 00 23 	bne r2,r1,c7d4 <handlePDelayResp+0xd8>
    c74c:	44 a0 00 0b 	be r5,r0,c778 <handlePDelayResp+0x7c>
    c750:	b8 60 08 00 	mv r1,r3
    c754:	b8 60 10 00 	mv r2,r3
    c758:	34 c3 00 54 	addi r3,r6,84
    c75c:	fb ff e5 3a 	calli 5c44 <addTime>
    c760:	b9 a0 08 00 	mv r1,r13
    c764:	35 62 09 e4 	addi r2,r11,2532
    c768:	b9 80 18 00 	mv r3,r12
    c76c:	b9 60 20 00 	mv r4,r11
    c770:	fb ff ff 30 	calli c430 <issuePDelayRespFollowUp>
    c774:	e0 00 00 18 	bi c7d4 <handlePDelayResp+0xd8>
    c778:	34 ec 01 2c 	addi r12,r7,300
    c77c:	34 e1 05 50 	addi r1,r7,1360
    c780:	b9 80 10 00 	mv r2,r12
    c784:	fb ff ea bb 	calli 7270 <msgUnpackPDelayResp>
    c788:	37 81 00 14 	addi r1,sp,20
    c78c:	b9 80 10 00 	mv r2,r12
    c790:	fb ff e4 6a 	calli 5938 <toInternalTime>
    c794:	2b 81 00 14 	lw r1,(sp+20)
    c798:	59 61 09 74 	sw (r11+2420),r1
    c79c:	2b 81 00 18 	lw r1,(sp+24)
    c7a0:	59 61 09 78 	sw (r11+2424),r1
    c7a4:	2b 81 00 1c 	lw r1,(sp+28)
    c7a8:	59 61 09 7c 	sw (r11+2428),r1
    c7ac:	2b 81 00 20 	lw r1,(sp+32)
    c7b0:	59 61 09 80 	sw (r11+2432),r1
    c7b4:	29 61 0d bc 	lw r1,(r11+3516)
    c7b8:	59 61 09 94 	sw (r11+2452),r1
    c7bc:	29 61 0d c0 	lw r1,(r11+3520)
    c7c0:	59 61 09 98 	sw (r11+2456),r1
    c7c4:	29 61 0d c4 	lw r1,(r11+3524)
    c7c8:	59 61 09 9c 	sw (r11+2460),r1
    c7cc:	29 61 0d d4 	lw r1,(r11+3540)
    c7d0:	59 61 09 a0 	sw (r11+2464),r1
    c7d4:	2b 9d 00 04 	lw ra,(sp+4)
    c7d8:	2b 8b 00 10 	lw r11,(sp+16)
    c7dc:	2b 8c 00 0c 	lw r12,(sp+12)
    c7e0:	2b 8d 00 08 	lw r13,(sp+8)
    c7e4:	37 9c 00 20 	addi sp,sp,32
    c7e8:	c3 a0 00 00 	ret

0000c7ec <handlePDelayReq>:
    c7ec:	37 9c ff f0 	addi sp,sp,-16
    c7f0:	5b 8b 00 10 	sw (sp+16),r11
    c7f4:	5b 8c 00 0c 	sw (sp+12),r12
    c7f8:	5b 8d 00 08 	sw (sp+8),r13
    c7fc:	5b 9d 00 04 	sw (sp+4),ra
    c800:	28 c1 00 70 	lw r1,(r6+112)
    c804:	b8 80 68 00 	mv r13,r4
    c808:	b8 c0 60 00 	mv r12,r6
    c80c:	b8 e0 58 00 	mv r11,r7
    c810:	44 20 00 8a 	be r1,r0,ca38 <handlePDelayReq+0x24c>
    c814:	34 01 00 35 	mvi r1,53
    c818:	48 61 00 06 	bg r3,r1,c830 <handlePDelayReq+0x44>
    c81c:	34 01 00 01 	mvi r1,1
    c820:	b8 c0 10 00 	mv r2,r6
    c824:	b8 e0 18 00 	mv r3,r7
    c828:	fb ff f3 b1 	calli 96ec <toState>
    c82c:	e0 00 00 83 	bi ca38 <handlePDelayReq+0x24c>
    c830:	40 e1 00 de 	lbu r1,(r7+222)
    c834:	34 02 00 06 	mvi r2,6
    c838:	44 22 00 52 	be r1,r2,c980 <handlePDelayReq+0x194>
    c83c:	34 02 00 08 	mvi r2,8
    c840:	44 22 00 03 	be r1,r2,c84c <handlePDelayReq+0x60>
    c844:	34 02 00 05 	mvi r2,5
    c848:	5c 22 00 7c 	bne r1,r2,ca38 <handlePDelayReq+0x24c>
    c84c:	78 04 00 01 	mvhi r4,0x1
    c850:	34 02 00 08 	mvi r2,8
    c854:	2d 63 00 dc 	lhu r3,(r11+220)
    c858:	38 84 37 1c 	ori r4,r4,0x371c
    c85c:	44 22 00 07 	be r1,r2,c878 <handlePDelayReq+0x8c>
    c860:	78 04 00 01 	mvhi r4,0x1
    c864:	34 02 00 05 	mvi r2,5
    c868:	38 84 37 14 	ori r4,r4,0x3714
    c86c:	5c 22 00 03 	bne r1,r2,c878 <handlePDelayReq+0x8c>
    c870:	78 04 00 01 	mvhi r4,0x1
    c874:	38 84 37 24 	ori r4,r4,0x3724
    c878:	29 62 0b 78 	lw r2,(r11+2936)
    c87c:	78 05 00 01 	mvhi r5,0x1
    c880:	34 01 00 01 	mvi r1,1
    c884:	38 a5 36 f4 	ori r5,r5,0x36f4
    c888:	5c 41 00 03 	bne r2,r1,c894 <handlePDelayReq+0xa8>
    c88c:	78 05 00 01 	mvhi r5,0x1
    c890:	38 a5 36 ec 	ori r5,r5,0x36ec
    c894:	41 61 0b 76 	lbu r1,(r11+2934)
    c898:	34 02 00 01 	mvi r2,1
    c89c:	44 22 00 0d 	be r1,r2,c8d0 <handlePDelayReq+0xe4>
    c8a0:	78 06 00 01 	mvhi r6,0x1
    c8a4:	38 c6 31 08 	ori r6,r6,0x3108
    c8a8:	34 08 00 02 	mvi r8,2
    c8ac:	b8 c0 38 00 	mv r7,r6
    c8b0:	5c 28 00 0c 	bne r1,r8,c8e0 <handlePDelayReq+0xf4>
    c8b4:	41 68 0e fc 	lbu r8,(r11+3836)
    c8b8:	78 07 00 01 	mvhi r7,0x1
    c8bc:	38 e7 36 fc 	ori r7,r7,0x36fc
    c8c0:	5d 02 00 08 	bne r8,r2,c8e0 <handlePDelayReq+0xf4>
    c8c4:	78 07 00 01 	mvhi r7,0x1
    c8c8:	38 e7 37 04 	ori r7,r7,0x3704
    c8cc:	e0 00 00 05 	bi c8e0 <handlePDelayReq+0xf4>
    c8d0:	78 06 00 01 	mvhi r6,0x1
    c8d4:	78 07 00 01 	mvhi r7,0x1
    c8d8:	38 c6 37 0c 	ori r6,r6,0x370c
    c8dc:	38 e7 31 08 	ori r7,r7,0x3108
    c8e0:	78 02 00 01 	mvhi r2,0x1
    c8e4:	34 01 00 01 	mvi r1,1
    c8e8:	38 42 48 20 	ori r2,r2,0x4820
    c8ec:	fb ff cf e5 	calli 880 <wrc_debug_printf>
    c8f0:	78 01 00 01 	mvhi r1,0x1
    c8f4:	38 21 59 38 	ori r1,r1,0x5938
    c8f8:	28 21 00 00 	lw r1,(r1+0)
    c8fc:	44 20 00 08 	be r1,r0,c91c <handlePDelayReq+0x130>
    c900:	29 63 0d bc 	lw r3,(r11+3516)
    c904:	29 64 0d c0 	lw r4,(r11+3520)
    c908:	29 65 0d c4 	lw r5,(r11+3524)
    c90c:	78 02 00 01 	mvhi r2,0x1
    c910:	34 01 00 00 	mvi r1,0
    c914:	38 42 48 5c 	ori r2,r2,0x485c
    c918:	fb ff cf da 	calli 880 <wrc_debug_printf>
    c91c:	35 61 05 50 	addi r1,r11,1360
    c920:	35 62 09 e4 	addi r2,r11,2532
    c924:	fb ff e7 ed 	calli 68d8 <msgUnpackHeader>
    c928:	29 62 0d c4 	lw r2,(r11+3524)
    c92c:	59 60 09 f4 	sw (r11+2548),r0
    c930:	34 04 03 e8 	mvi r4,1000
    c934:	14 41 00 1f 	sri r1,r2,31
    c938:	00 43 00 10 	srui r3,r2,16
    c93c:	3c 21 00 10 	sli r1,r1,16
    c940:	3c 42 00 10 	sli r2,r2,16
    c944:	b8 61 08 00 	or r1,r3,r1
    c948:	34 03 00 00 	mvi r3,0
    c94c:	f8 00 0f 7f 	calli 10748 <__divdi3>
    c950:	59 62 09 f0 	sw (r11+2544),r2
    c954:	b9 a0 08 00 	mv r1,r13
    c958:	35 62 0a 08 	addi r2,r11,2568
    c95c:	b9 80 18 00 	mv r3,r12
    c960:	b9 60 20 00 	mv r4,r11
    c964:	fb ff fd 51 	calli bea8 <issuePDelayResp>
    c968:	b9 a0 08 00 	mv r1,r13
    c96c:	35 62 0a 50 	addi r2,r11,2640
    c970:	b9 80 18 00 	mv r3,r12
    c974:	b9 60 20 00 	mv r4,r11
    c978:	fb ff fe ae 	calli c430 <issuePDelayRespFollowUp>
    c97c:	e0 00 00 2f 	bi ca38 <handlePDelayReq+0x24c>
    c980:	44 a0 00 0a 	be r5,r0,c9a8 <handlePDelayReq+0x1bc>
    c984:	28 81 00 00 	lw r1,(r4+0)
    c988:	34 c3 00 54 	addi r3,r6,84
    c98c:	58 e1 09 84 	sw (r7+2436),r1
    c990:	28 81 00 04 	lw r1,(r4+4)
    c994:	58 e1 09 88 	sw (r7+2440),r1
    c998:	34 e1 09 84 	addi r1,r7,2436
    c99c:	b8 20 10 00 	mv r2,r1
    c9a0:	fb ff e4 a9 	calli 5c44 <addTime>
    c9a4:	e0 00 00 25 	bi ca38 <handlePDelayReq+0x24c>
    c9a8:	28 e2 0b 78 	lw r2,(r7+2936)
    c9ac:	78 05 00 01 	mvhi r5,0x1
    c9b0:	34 01 00 01 	mvi r1,1
    c9b4:	2c e3 00 dc 	lhu r3,(r7+220)
    c9b8:	38 a5 36 f4 	ori r5,r5,0x36f4
    c9bc:	5c 41 00 03 	bne r2,r1,c9c8 <handlePDelayReq+0x1dc>
    c9c0:	78 05 00 01 	mvhi r5,0x1
    c9c4:	38 a5 36 ec 	ori r5,r5,0x36ec
    c9c8:	41 61 0b 76 	lbu r1,(r11+2934)
    c9cc:	34 02 00 01 	mvi r2,1
    c9d0:	44 22 00 0d 	be r1,r2,ca04 <handlePDelayReq+0x218>
    c9d4:	78 06 00 01 	mvhi r6,0x1
    c9d8:	38 c6 31 08 	ori r6,r6,0x3108
    c9dc:	34 04 00 02 	mvi r4,2
    c9e0:	b8 c0 38 00 	mv r7,r6
    c9e4:	5c 24 00 0c 	bne r1,r4,ca14 <handlePDelayReq+0x228>
    c9e8:	41 64 0e fc 	lbu r4,(r11+3836)
    c9ec:	78 07 00 01 	mvhi r7,0x1
    c9f0:	38 e7 36 fc 	ori r7,r7,0x36fc
    c9f4:	5c 82 00 08 	bne r4,r2,ca14 <handlePDelayReq+0x228>
    c9f8:	78 07 00 01 	mvhi r7,0x1
    c9fc:	38 e7 37 04 	ori r7,r7,0x3704
    ca00:	e0 00 00 05 	bi ca14 <handlePDelayReq+0x228>
    ca04:	78 06 00 01 	mvhi r6,0x1
    ca08:	78 07 00 01 	mvhi r7,0x1
    ca0c:	38 c6 37 0c 	ori r6,r6,0x370c
    ca10:	38 e7 31 08 	ori r7,r7,0x3108
    ca14:	78 02 00 01 	mvhi r2,0x1
    ca18:	78 04 00 01 	mvhi r4,0x1
    ca1c:	34 01 00 01 	mvi r1,1
    ca20:	38 42 48 94 	ori r2,r2,0x4894
    ca24:	38 84 37 14 	ori r4,r4,0x3714
    ca28:	fb ff cf 96 	calli 880 <wrc_debug_printf>
    ca2c:	35 61 05 50 	addi r1,r11,1360
    ca30:	35 62 09 e4 	addi r2,r11,2532
    ca34:	fb ff e7 a9 	calli 68d8 <msgUnpackHeader>
    ca38:	2b 9d 00 04 	lw ra,(sp+4)
    ca3c:	2b 8b 00 10 	lw r11,(sp+16)
    ca40:	2b 8c 00 0c 	lw r12,(sp+12)
    ca44:	2b 8d 00 08 	lw r13,(sp+8)
    ca48:	37 9c 00 10 	addi sp,sp,16
    ca4c:	c3 a0 00 00 	ret

0000ca50 <issueWRSignalingMsg>:
    ca50:	37 9c ff f0 	addi sp,sp,-16
    ca54:	5b 8b 00 10 	sw (sp+16),r11
    ca58:	5b 8c 00 0c 	sw (sp+12),r12
    ca5c:	5b 8d 00 08 	sw (sp+8),r13
    ca60:	5b 9d 00 04 	sw (sp+4),ra
    ca64:	b8 60 58 00 	mv r11,r3
    ca68:	35 6c 01 50 	addi r12,r11,336
    ca6c:	20 23 ff ff 	andi r3,r1,0xffff
    ca70:	b8 40 68 00 	mv r13,r2
    ca74:	b9 80 08 00 	mv r1,r12
    ca78:	b9 60 10 00 	mv r2,r11
    ca7c:	fb ff ea 5f 	calli 73f8 <msgPackWRSignalingMsg>
    ca80:	b8 20 18 00 	mv r3,r1
    ca84:	b8 60 10 00 	mv r2,r3
    ca88:	b9 80 08 00 	mv r1,r12
    ca8c:	35 63 00 04 	addi r3,r11,4
    ca90:	fb ff ec 26 	calli 7b28 <netSendGeneral>
    ca94:	b8 20 60 00 	mv r12,r1
    ca98:	5c 20 00 35 	bne r1,r0,cb6c <issueWRSignalingMsg+0x11c>
    ca9c:	34 01 00 01 	mvi r1,1
    caa0:	b9 a0 10 00 	mv r2,r13
    caa4:	b9 60 18 00 	mv r3,r11
    caa8:	fb ff f3 11 	calli 96ec <toState>
    caac:	45 6c 00 2c 	be r11,r12,cb5c <issueWRSignalingMsg+0x10c>
    cab0:	41 61 00 de 	lbu r1,(r11+222)
    cab4:	78 04 00 01 	mvhi r4,0x1
    cab8:	34 02 00 08 	mvi r2,8
    cabc:	2d 63 00 dc 	lhu r3,(r11+220)
    cac0:	38 84 37 1c 	ori r4,r4,0x371c
    cac4:	44 22 00 07 	be r1,r2,cae0 <issueWRSignalingMsg+0x90>
    cac8:	78 04 00 01 	mvhi r4,0x1
    cacc:	34 02 00 05 	mvi r2,5
    cad0:	38 84 37 14 	ori r4,r4,0x3714
    cad4:	5c 22 00 03 	bne r1,r2,cae0 <issueWRSignalingMsg+0x90>
    cad8:	78 04 00 01 	mvhi r4,0x1
    cadc:	38 84 37 24 	ori r4,r4,0x3724
    cae0:	29 62 0b 78 	lw r2,(r11+2936)
    cae4:	78 05 00 01 	mvhi r5,0x1
    cae8:	34 01 00 01 	mvi r1,1
    caec:	38 a5 36 f4 	ori r5,r5,0x36f4
    caf0:	5c 41 00 03 	bne r2,r1,cafc <issueWRSignalingMsg+0xac>
    caf4:	78 05 00 01 	mvhi r5,0x1
    caf8:	38 a5 36 ec 	ori r5,r5,0x36ec
    cafc:	41 62 0b 76 	lbu r2,(r11+2934)
    cb00:	34 01 00 01 	mvi r1,1
    cb04:	44 41 00 0d 	be r2,r1,cb38 <issueWRSignalingMsg+0xe8>
    cb08:	78 06 00 01 	mvhi r6,0x1
    cb0c:	38 c6 31 08 	ori r6,r6,0x3108
    cb10:	34 08 00 02 	mvi r8,2
    cb14:	b8 c0 38 00 	mv r7,r6
    cb18:	5c 48 00 0c 	bne r2,r8,cb48 <issueWRSignalingMsg+0xf8>
    cb1c:	41 68 0e fc 	lbu r8,(r11+3836)
    cb20:	78 07 00 01 	mvhi r7,0x1
    cb24:	38 e7 36 fc 	ori r7,r7,0x36fc
    cb28:	5d 01 00 08 	bne r8,r1,cb48 <issueWRSignalingMsg+0xf8>
    cb2c:	78 07 00 01 	mvhi r7,0x1
    cb30:	38 e7 37 04 	ori r7,r7,0x3704
    cb34:	e0 00 00 05 	bi cb48 <issueWRSignalingMsg+0xf8>
    cb38:	78 06 00 01 	mvhi r6,0x1
    cb3c:	78 07 00 01 	mvhi r7,0x1
    cb40:	38 c6 37 0c 	ori r6,r6,0x370c
    cb44:	38 e7 31 08 	ori r7,r7,0x3108
    cb48:	78 02 00 01 	mvhi r2,0x1
    cb4c:	34 01 00 01 	mvi r1,1
    cb50:	38 42 48 cc 	ori r2,r2,0x48cc
    cb54:	fb ff cf 4b 	calli 880 <wrc_debug_printf>
    cb58:	e0 00 00 05 	bi cb6c <issueWRSignalingMsg+0x11c>
    cb5c:	78 02 00 01 	mvhi r2,0x1
    cb60:	34 01 00 01 	mvi r1,1
    cb64:	38 42 49 08 	ori r2,r2,0x4908
    cb68:	fb ff cf 46 	calli 880 <wrc_debug_printf>
    cb6c:	2b 9d 00 04 	lw ra,(sp+4)
    cb70:	2b 8b 00 10 	lw r11,(sp+16)
    cb74:	2b 8c 00 0c 	lw r12,(sp+12)
    cb78:	2b 8d 00 08 	lw r13,(sp+8)
    cb7c:	37 9c 00 10 	addi sp,sp,16
    cb80:	c3 a0 00 00 	ret

0000cb84 <addForeign>:
    cb84:	37 9c ff e0 	addi sp,sp,-32
    cb88:	5b 8b 00 20 	sw (sp+32),r11
    cb8c:	5b 8c 00 1c 	sw (sp+28),r12
    cb90:	5b 8d 00 18 	sw (sp+24),r13
    cb94:	5b 8e 00 14 	sw (sp+20),r14
    cb98:	5b 8f 00 10 	sw (sp+16),r15
    cb9c:	5b 90 00 0c 	sw (sp+12),r16
    cba0:	5b 91 00 08 	sw (sp+8),r17
    cba4:	5b 9d 00 04 	sw (sp+4),ra
    cba8:	b8 60 58 00 	mv r11,r3
    cbac:	b8 20 70 00 	mv r14,r1
    cbb0:	41 61 00 de 	lbu r1,(r11+222)
    cbb4:	b8 40 60 00 	mv r12,r2
    cbb8:	78 04 00 01 	mvhi r4,0x1
    cbbc:	34 02 00 08 	mvi r2,8
    cbc0:	1c 70 01 02 	lh r16,(r3+258)
    cbc4:	38 84 37 1c 	ori r4,r4,0x371c
    cbc8:	2c 63 00 dc 	lhu r3,(r3+220)
    cbcc:	44 22 00 07 	be r1,r2,cbe8 <addForeign+0x64>
    cbd0:	78 04 00 01 	mvhi r4,0x1
    cbd4:	34 02 00 05 	mvi r2,5
    cbd8:	38 84 37 14 	ori r4,r4,0x3714
    cbdc:	5c 22 00 03 	bne r1,r2,cbe8 <addForeign+0x64>
    cbe0:	78 04 00 01 	mvhi r4,0x1
    cbe4:	38 84 37 24 	ori r4,r4,0x3724
    cbe8:	29 62 0b 78 	lw r2,(r11+2936)
    cbec:	78 05 00 01 	mvhi r5,0x1
    cbf0:	34 01 00 01 	mvi r1,1
    cbf4:	38 a5 36 f4 	ori r5,r5,0x36f4
    cbf8:	5c 41 00 03 	bne r2,r1,cc04 <addForeign+0x80>
    cbfc:	78 05 00 01 	mvhi r5,0x1
    cc00:	38 a5 36 ec 	ori r5,r5,0x36ec
    cc04:	41 62 0b 76 	lbu r2,(r11+2934)
    cc08:	34 01 00 01 	mvi r1,1
    cc0c:	44 41 00 0d 	be r2,r1,cc40 <addForeign+0xbc>
    cc10:	78 06 00 01 	mvhi r6,0x1
    cc14:	38 c6 31 08 	ori r6,r6,0x3108
    cc18:	34 08 00 02 	mvi r8,2
    cc1c:	b8 c0 38 00 	mv r7,r6
    cc20:	5c 48 00 0c 	bne r2,r8,cc50 <addForeign+0xcc>
    cc24:	41 62 0e fc 	lbu r2,(r11+3836)
    cc28:	78 07 00 01 	mvhi r7,0x1
    cc2c:	38 e7 36 fc 	ori r7,r7,0x36fc
    cc30:	5c 41 00 08 	bne r2,r1,cc50 <addForeign+0xcc>
    cc34:	78 07 00 01 	mvhi r7,0x1
    cc38:	38 e7 37 04 	ori r7,r7,0x3704
    cc3c:	e0 00 00 05 	bi cc50 <addForeign+0xcc>
    cc40:	78 06 00 01 	mvhi r6,0x1
    cc44:	78 07 00 01 	mvhi r7,0x1
    cc48:	38 c6 37 0c 	ori r6,r6,0x370c
    cc4c:	38 e7 31 08 	ori r7,r7,0x3108
    cc50:	2d 68 00 fc 	lhu r8,(r11+252)
    cc54:	78 02 00 01 	mvhi r2,0x1
    cc58:	34 01 00 01 	mvi r1,1
    cc5c:	38 42 49 2c 	ori r2,r2,0x492c
    cc60:	fb ff cf 08 	calli 880 <wrc_debug_printf>
    cc64:	34 0f 00 00 	mvi r15,0
    cc68:	35 91 00 14 	addi r17,r12,20
    cc6c:	e0 00 00 79 	bi ce50 <addForeign+0x2cc>
    cc70:	0a 0d 00 58 	muli r13,r16,88
    cc74:	29 62 00 f8 	lw r2,(r11+248)
    cc78:	ba 20 08 00 	mv r1,r17
    cc7c:	34 03 00 08 	mvi r3,8
    cc80:	b4 4d 10 00 	add r2,r2,r13
    cc84:	f8 00 16 ae 	calli 1273c <memcmp>
    cc88:	5c 20 00 6d 	bne r1,r0,ce3c <addForeign+0x2b8>
    cc8c:	29 61 00 f8 	lw r1,(r11+248)
    cc90:	2d 82 00 1c 	lhu r2,(r12+28)
    cc94:	b4 2d 08 00 	add r1,r1,r13
    cc98:	2c 21 00 08 	lhu r1,(r1+8)
    cc9c:	5c 41 00 68 	bne r2,r1,ce3c <addForeign+0x2b8>
    cca0:	41 61 00 de 	lbu r1,(r11+222)
    cca4:	78 04 00 01 	mvhi r4,0x1
    cca8:	34 02 00 08 	mvi r2,8
    ccac:	2d 63 00 dc 	lhu r3,(r11+220)
    ccb0:	38 84 37 1c 	ori r4,r4,0x371c
    ccb4:	44 22 00 07 	be r1,r2,ccd0 <addForeign+0x14c>
    ccb8:	78 04 00 01 	mvhi r4,0x1
    ccbc:	34 02 00 05 	mvi r2,5
    ccc0:	38 84 37 14 	ori r4,r4,0x3714
    ccc4:	5c 22 00 03 	bne r1,r2,ccd0 <addForeign+0x14c>
    ccc8:	78 04 00 01 	mvhi r4,0x1
    cccc:	38 84 37 24 	ori r4,r4,0x3724
    ccd0:	29 62 0b 78 	lw r2,(r11+2936)
    ccd4:	78 05 00 01 	mvhi r5,0x1
    ccd8:	34 01 00 01 	mvi r1,1
    ccdc:	38 a5 36 f4 	ori r5,r5,0x36f4
    cce0:	5c 41 00 03 	bne r2,r1,ccec <addForeign+0x168>
    cce4:	78 05 00 01 	mvhi r5,0x1
    cce8:	38 a5 36 ec 	ori r5,r5,0x36ec
    ccec:	41 62 0b 76 	lbu r2,(r11+2934)
    ccf0:	34 01 00 01 	mvi r1,1
    ccf4:	44 41 00 0d 	be r2,r1,cd28 <addForeign+0x1a4>
    ccf8:	78 06 00 01 	mvhi r6,0x1
    ccfc:	38 c6 31 08 	ori r6,r6,0x3108
    cd00:	34 08 00 02 	mvi r8,2
    cd04:	b8 c0 38 00 	mv r7,r6
    cd08:	5c 48 00 0c 	bne r2,r8,cd38 <addForeign+0x1b4>
    cd0c:	41 62 0e fc 	lbu r2,(r11+3836)
    cd10:	78 07 00 01 	mvhi r7,0x1
    cd14:	38 e7 36 fc 	ori r7,r7,0x36fc
    cd18:	5c 41 00 08 	bne r2,r1,cd38 <addForeign+0x1b4>
    cd1c:	78 07 00 01 	mvhi r7,0x1
    cd20:	38 e7 37 04 	ori r7,r7,0x3704
    cd24:	e0 00 00 05 	bi cd38 <addForeign+0x1b4>
    cd28:	78 06 00 01 	mvhi r6,0x1
    cd2c:	78 07 00 01 	mvhi r7,0x1
    cd30:	38 c6 37 0c 	ori r6,r6,0x370c
    cd34:	38 e7 31 08 	ori r7,r7,0x3108
    cd38:	78 02 00 01 	mvhi r2,0x1
    cd3c:	34 01 00 01 	mvi r1,1
    cd40:	38 42 49 6c 	ori r2,r2,0x496c
    cd44:	fb ff ce cf 	calli 880 <wrc_debug_printf>
    cd48:	29 62 00 f8 	lw r2,(r11+248)
    cd4c:	b4 4d 10 00 	add r2,r2,r13
    cd50:	2c 41 00 0a 	lhu r1,(r2+10)
    cd54:	34 21 00 01 	addi r1,r1,1
    cd58:	0c 41 00 0a 	sh (r2+10),r1
    cd5c:	b9 c0 08 00 	mv r1,r14
    cd60:	34 42 00 34 	addi r2,r2,52
    cd64:	fb ff e6 dd 	calli 68d8 <msgUnpackHeader>
    cd68:	29 63 00 f8 	lw r3,(r11+248)
    cd6c:	b9 c0 08 00 	mv r1,r14
    cd70:	b4 6d 18 00 	add r3,r3,r13
    cd74:	34 62 00 10 	addi r2,r3,16
    cd78:	34 63 00 34 	addi r3,r3,52
    cd7c:	fb ff e7 c0 	calli 6c7c <msgUnpackAnnounce>
    cd80:	29 61 00 f8 	lw r1,(r11+248)
    cd84:	b4 2d 68 00 	add r13,r1,r13
    cd88:	41 a1 00 31 	lbu r1,(r13+49)
    cd8c:	44 20 00 da 	be r1,r0,d0f4 <addForeign+0x570>
    cd90:	41 61 00 de 	lbu r1,(r11+222)
    cd94:	78 04 00 01 	mvhi r4,0x1
    cd98:	34 02 00 08 	mvi r2,8
    cd9c:	2d 63 00 dc 	lhu r3,(r11+220)
    cda0:	38 84 37 1c 	ori r4,r4,0x371c
    cda4:	44 22 00 07 	be r1,r2,cdc0 <addForeign+0x23c>
    cda8:	78 04 00 01 	mvhi r4,0x1
    cdac:	34 02 00 05 	mvi r2,5
    cdb0:	38 84 37 14 	ori r4,r4,0x3714
    cdb4:	5c 22 00 03 	bne r1,r2,cdc0 <addForeign+0x23c>
    cdb8:	78 04 00 01 	mvhi r4,0x1
    cdbc:	38 84 37 24 	ori r4,r4,0x3724
    cdc0:	29 62 0b 78 	lw r2,(r11+2936)
    cdc4:	78 05 00 01 	mvhi r5,0x1
    cdc8:	34 01 00 01 	mvi r1,1
    cdcc:	38 a5 36 f4 	ori r5,r5,0x36f4
    cdd0:	5c 41 00 03 	bne r2,r1,cddc <addForeign+0x258>
    cdd4:	78 05 00 01 	mvhi r5,0x1
    cdd8:	38 a5 36 ec 	ori r5,r5,0x36ec
    cddc:	41 62 0b 76 	lbu r2,(r11+2934)
    cde0:	34 01 00 01 	mvi r1,1
    cde4:	44 41 00 0d 	be r2,r1,ce18 <addForeign+0x294>
    cde8:	78 06 00 01 	mvhi r6,0x1
    cdec:	38 c6 31 08 	ori r6,r6,0x3108
    cdf0:	34 08 00 02 	mvi r8,2
    cdf4:	b8 c0 38 00 	mv r7,r6
    cdf8:	5c 48 00 0c 	bne r2,r8,ce28 <addForeign+0x2a4>
    cdfc:	41 62 0e fc 	lbu r2,(r11+3836)
    ce00:	78 07 00 01 	mvhi r7,0x1
    ce04:	38 e7 36 fc 	ori r7,r7,0x36fc
    ce08:	5c 41 00 08 	bne r2,r1,ce28 <addForeign+0x2a4>
    ce0c:	78 07 00 01 	mvhi r7,0x1
    ce10:	38 e7 37 04 	ori r7,r7,0x3704
    ce14:	e0 00 00 05 	bi ce28 <addForeign+0x2a4>
    ce18:	78 06 00 01 	mvhi r6,0x1
    ce1c:	78 07 00 01 	mvhi r7,0x1
    ce20:	38 c6 37 0c 	ori r6,r6,0x370c
    ce24:	38 e7 31 08 	ori r7,r7,0x3108
    ce28:	78 02 00 01 	mvhi r2,0x1
    ce2c:	34 01 00 01 	mvi r1,1
    ce30:	38 42 49 b4 	ori r2,r2,0x49b4
    ce34:	fb ff ce 93 	calli 880 <wrc_debug_printf>
    ce38:	e0 00 00 af 	bi d0f4 <addForeign+0x570>
    ce3c:	2d 62 00 fc 	lhu r2,(r11+252)
    ce40:	36 01 00 01 	addi r1,r16,1
    ce44:	35 ef 00 01 	addi r15,r15,1
    ce48:	f8 00 15 bf 	calli 12544 <__modsi3>
    ce4c:	b8 20 80 00 	mv r16,r1
    ce50:	2d 62 00 fc 	lhu r2,(r11+252)
    ce54:	48 4f ff 87 	bg r2,r15,cc70 <addForeign+0xec>
    ce58:	e0 00 00 a4 	bi d0e8 <addForeign+0x564>
    ce5c:	34 42 00 01 	addi r2,r2,1
    ce60:	0d 62 00 fc 	sh (r11+252),r2
    ce64:	41 61 00 de 	lbu r1,(r11+222)
    ce68:	78 04 00 01 	mvhi r4,0x1
    ce6c:	34 02 00 08 	mvi r2,8
    ce70:	1d 6d 01 00 	lh r13,(r11+256)
    ce74:	2d 63 00 dc 	lhu r3,(r11+220)
    ce78:	38 84 37 1c 	ori r4,r4,0x371c
    ce7c:	44 22 00 07 	be r1,r2,ce98 <addForeign+0x314>
    ce80:	78 04 00 01 	mvhi r4,0x1
    ce84:	34 02 00 05 	mvi r2,5
    ce88:	38 84 37 14 	ori r4,r4,0x3714
    ce8c:	5c 22 00 03 	bne r1,r2,ce98 <addForeign+0x314>
    ce90:	78 04 00 01 	mvhi r4,0x1
    ce94:	38 84 37 24 	ori r4,r4,0x3724
    ce98:	29 62 0b 78 	lw r2,(r11+2936)
    ce9c:	78 05 00 01 	mvhi r5,0x1
    cea0:	34 01 00 01 	mvi r1,1
    cea4:	38 a5 36 f4 	ori r5,r5,0x36f4
    cea8:	5c 41 00 03 	bne r2,r1,ceb4 <addForeign+0x330>
    ceac:	78 05 00 01 	mvhi r5,0x1
    ceb0:	38 a5 36 ec 	ori r5,r5,0x36ec
    ceb4:	41 62 0b 76 	lbu r2,(r11+2934)
    ceb8:	34 01 00 01 	mvi r1,1
    cebc:	44 41 00 0d 	be r2,r1,cef0 <addForeign+0x36c>
    cec0:	78 06 00 01 	mvhi r6,0x1
    cec4:	38 c6 31 08 	ori r6,r6,0x3108
    cec8:	34 08 00 02 	mvi r8,2
    cecc:	b8 c0 38 00 	mv r7,r6
    ced0:	5c 48 00 0c 	bne r2,r8,cf00 <addForeign+0x37c>
    ced4:	41 62 0e fc 	lbu r2,(r11+3836)
    ced8:	78 07 00 01 	mvhi r7,0x1
    cedc:	38 e7 36 fc 	ori r7,r7,0x36fc
    cee0:	5c 41 00 08 	bne r2,r1,cf00 <addForeign+0x37c>
    cee4:	78 07 00 01 	mvhi r7,0x1
    cee8:	38 e7 37 04 	ori r7,r7,0x3704
    ceec:	e0 00 00 05 	bi cf00 <addForeign+0x37c>
    cef0:	78 06 00 01 	mvhi r6,0x1
    cef4:	78 07 00 01 	mvhi r7,0x1
    cef8:	38 c6 37 0c 	ori r6,r6,0x370c
    cefc:	38 e7 31 08 	ori r7,r7,0x3108
    cf00:	78 02 00 01 	mvhi r2,0x1
    cf04:	34 01 00 01 	mvi r1,1
    cf08:	38 42 4a 14 	ori r2,r2,0x4a14
    cf0c:	fb ff ce 5d 	calli 880 <wrc_debug_printf>
    cf10:	09 ad 00 58 	muli r13,r13,88
    cf14:	29 61 00 f8 	lw r1,(r11+248)
    cf18:	34 03 00 08 	mvi r3,8
    cf1c:	35 82 00 14 	addi r2,r12,20
    cf20:	b4 2d 08 00 	add r1,r1,r13
    cf24:	f8 00 16 27 	calli 127c0 <memcpy>
    cf28:	29 62 00 f8 	lw r2,(r11+248)
    cf2c:	2d 81 00 1c 	lhu r1,(r12+28)
    cf30:	b4 4d 10 00 	add r2,r2,r13
    cf34:	0c 41 00 08 	sh (r2+8),r1
    cf38:	0c 40 00 0a 	sh (r2+10),r0
    cf3c:	b9 c0 08 00 	mv r1,r14
    cf40:	34 42 00 34 	addi r2,r2,52
    cf44:	fb ff e6 65 	calli 68d8 <msgUnpackHeader>
    cf48:	29 63 00 f8 	lw r3,(r11+248)
    cf4c:	b9 c0 08 00 	mv r1,r14
    cf50:	b4 6d 18 00 	add r3,r3,r13
    cf54:	34 62 00 10 	addi r2,r3,16
    cf58:	34 63 00 34 	addi r3,r3,52
    cf5c:	fb ff e7 48 	calli 6c7c <msgUnpackAnnounce>
    cf60:	29 61 00 f8 	lw r1,(r11+248)
    cf64:	b4 2d 08 00 	add r1,r1,r13
    cf68:	40 21 00 31 	lbu r1,(r1+49)
    cf6c:	44 20 00 2b 	be r1,r0,d018 <addForeign+0x494>
    cf70:	41 61 00 de 	lbu r1,(r11+222)
    cf74:	78 04 00 01 	mvhi r4,0x1
    cf78:	34 02 00 08 	mvi r2,8
    cf7c:	2d 63 00 dc 	lhu r3,(r11+220)
    cf80:	38 84 37 1c 	ori r4,r4,0x371c
    cf84:	44 22 00 07 	be r1,r2,cfa0 <addForeign+0x41c>
    cf88:	78 04 00 01 	mvhi r4,0x1
    cf8c:	34 02 00 05 	mvi r2,5
    cf90:	38 84 37 14 	ori r4,r4,0x3714
    cf94:	5c 22 00 03 	bne r1,r2,cfa0 <addForeign+0x41c>
    cf98:	78 04 00 01 	mvhi r4,0x1
    cf9c:	38 84 37 24 	ori r4,r4,0x3724
    cfa0:	29 62 0b 78 	lw r2,(r11+2936)
    cfa4:	78 05 00 01 	mvhi r5,0x1
    cfa8:	34 01 00 01 	mvi r1,1
    cfac:	38 a5 36 f4 	ori r5,r5,0x36f4
    cfb0:	5c 41 00 03 	bne r2,r1,cfbc <addForeign+0x438>
    cfb4:	78 05 00 01 	mvhi r5,0x1
    cfb8:	38 a5 36 ec 	ori r5,r5,0x36ec
    cfbc:	41 62 0b 76 	lbu r2,(r11+2934)
    cfc0:	34 01 00 01 	mvi r1,1
    cfc4:	44 41 00 0d 	be r2,r1,cff8 <addForeign+0x474>
    cfc8:	78 06 00 01 	mvhi r6,0x1
    cfcc:	38 c6 31 08 	ori r6,r6,0x3108
    cfd0:	34 08 00 02 	mvi r8,2
    cfd4:	b8 c0 38 00 	mv r7,r6
    cfd8:	5c 48 00 0c 	bne r2,r8,d008 <addForeign+0x484>
    cfdc:	41 62 0e fc 	lbu r2,(r11+3836)
    cfe0:	78 07 00 01 	mvhi r7,0x1
    cfe4:	38 e7 36 fc 	ori r7,r7,0x36fc
    cfe8:	5c 41 00 08 	bne r2,r1,d008 <addForeign+0x484>
    cfec:	78 07 00 01 	mvhi r7,0x1
    cff0:	38 e7 37 04 	ori r7,r7,0x3704
    cff4:	e0 00 00 05 	bi d008 <addForeign+0x484>
    cff8:	78 06 00 01 	mvhi r6,0x1
    cffc:	78 07 00 01 	mvhi r7,0x1
    d000:	38 c6 37 0c 	ori r6,r6,0x370c
    d004:	38 e7 31 08 	ori r7,r7,0x3108
    d008:	78 02 00 01 	mvhi r2,0x1
    d00c:	34 01 00 01 	mvi r1,1
    d010:	38 42 4a 54 	ori r2,r2,0x4a54
    d014:	fb ff ce 1b 	calli 880 <wrc_debug_printf>
    d018:	1d 61 01 00 	lh r1,(r11+256)
    d01c:	1d 62 00 fe 	lh r2,(r11+254)
    d020:	34 21 00 01 	addi r1,r1,1
    d024:	f8 00 15 48 	calli 12544 <__modsi3>
    d028:	0d 61 01 00 	sh (r11+256),r1
    d02c:	29 61 00 f8 	lw r1,(r11+248)
    d030:	2d 63 00 dc 	lhu r3,(r11+220)
    d034:	78 04 00 01 	mvhi r4,0x1
    d038:	b4 2d 68 00 	add r13,r1,r13
    d03c:	0d a3 00 0c 	sh (r13+12),r3
    d040:	41 61 00 de 	lbu r1,(r11+222)
    d044:	34 02 00 08 	mvi r2,8
    d048:	38 84 37 1c 	ori r4,r4,0x371c
    d04c:	44 22 00 07 	be r1,r2,d068 <addForeign+0x4e4>
    d050:	78 04 00 01 	mvhi r4,0x1
    d054:	34 02 00 05 	mvi r2,5
    d058:	38 84 37 14 	ori r4,r4,0x3714
    d05c:	5c 22 00 03 	bne r1,r2,d068 <addForeign+0x4e4>
    d060:	78 04 00 01 	mvhi r4,0x1
    d064:	38 84 37 24 	ori r4,r4,0x3724
    d068:	29 62 0b 78 	lw r2,(r11+2936)
    d06c:	78 05 00 01 	mvhi r5,0x1
    d070:	34 01 00 01 	mvi r1,1
    d074:	38 a5 36 f4 	ori r5,r5,0x36f4
    d078:	5c 41 00 03 	bne r2,r1,d084 <addForeign+0x500>
    d07c:	78 05 00 01 	mvhi r5,0x1
    d080:	38 a5 36 ec 	ori r5,r5,0x36ec
    d084:	41 62 0b 76 	lbu r2,(r11+2934)
    d088:	34 01 00 01 	mvi r1,1
    d08c:	44 41 00 0d 	be r2,r1,d0c0 <addForeign+0x53c>
    d090:	78 06 00 01 	mvhi r6,0x1
    d094:	38 c6 31 08 	ori r6,r6,0x3108
    d098:	34 08 00 02 	mvi r8,2
    d09c:	b8 c0 38 00 	mv r7,r6
    d0a0:	5c 48 00 0c 	bne r2,r8,d0d0 <addForeign+0x54c>
    d0a4:	41 62 0e fc 	lbu r2,(r11+3836)
    d0a8:	78 07 00 01 	mvhi r7,0x1
    d0ac:	38 e7 36 fc 	ori r7,r7,0x36fc
    d0b0:	5c 41 00 08 	bne r2,r1,d0d0 <addForeign+0x54c>
    d0b4:	78 07 00 01 	mvhi r7,0x1
    d0b8:	38 e7 37 04 	ori r7,r7,0x3704
    d0bc:	e0 00 00 05 	bi d0d0 <addForeign+0x54c>
    d0c0:	78 06 00 01 	mvhi r6,0x1
    d0c4:	78 07 00 01 	mvhi r7,0x1
    d0c8:	38 c6 37 0c 	ori r6,r6,0x370c
    d0cc:	38 e7 31 08 	ori r7,r7,0x3108
    d0d0:	78 02 00 01 	mvhi r2,0x1
    d0d4:	34 01 00 01 	mvi r1,1
    d0d8:	38 42 4a c0 	ori r2,r2,0x4ac0
    d0dc:	b8 60 40 00 	mv r8,r3
    d0e0:	fb ff cd e8 	calli 880 <wrc_debug_printf>
    d0e4:	e0 00 00 04 	bi d0f4 <addForeign+0x570>
    d0e8:	1d 61 00 fe 	lh r1,(r11+254)
    d0ec:	48 22 ff 5c 	bg r1,r2,ce5c <addForeign+0x2d8>
    d0f0:	e3 ff ff 5d 	bi ce64 <addForeign+0x2e0>
    d0f4:	2b 9d 00 04 	lw ra,(sp+4)
    d0f8:	2b 8b 00 20 	lw r11,(sp+32)
    d0fc:	2b 8c 00 1c 	lw r12,(sp+28)
    d100:	2b 8d 00 18 	lw r13,(sp+24)
    d104:	2b 8e 00 14 	lw r14,(sp+20)
    d108:	2b 8f 00 10 	lw r15,(sp+16)
    d10c:	2b 90 00 0c 	lw r16,(sp+12)
    d110:	2b 91 00 08 	lw r17,(sp+8)
    d114:	37 9c 00 20 	addi sp,sp,32
    d118:	c3 a0 00 00 	ret

0000d11c <handleAnnounce>:
    d11c:	37 9c ff e8 	addi sp,sp,-24
    d120:	5b 8b 00 18 	sw (sp+24),r11
    d124:	5b 8c 00 14 	sw (sp+20),r12
    d128:	5b 8d 00 10 	sw (sp+16),r13
    d12c:	5b 8e 00 0c 	sw (sp+12),r14
    d130:	5b 8f 00 08 	sw (sp+8),r15
    d134:	5b 9d 00 04 	sw (sp+4),ra
    d138:	b8 20 68 00 	mv r13,r1
    d13c:	34 01 00 3f 	mvi r1,63
    d140:	b8 80 70 00 	mv r14,r4
    d144:	b8 a0 10 00 	mv r2,r5
    d148:	b8 c0 58 00 	mv r11,r6
    d14c:	48 61 00 05 	bg r3,r1,d160 <handleAnnounce+0x44>
    d150:	34 01 00 01 	mvi r1,1
    d154:	b8 c0 18 00 	mv r3,r6
    d158:	fb ff f1 65 	calli 96ec <toState>
    d15c:	e0 00 01 1b 	bi d5c8 <handleAnnounce+0x4ac>
    d160:	34 01 00 40 	mvi r1,64
    d164:	44 61 00 30 	be r3,r1,d224 <handleAnnounce+0x108>
    d168:	44 c0 00 2b 	be r6,r0,d214 <handleAnnounce+0xf8>
    d16c:	40 c1 00 de 	lbu r1,(r6+222)
    d170:	78 04 00 01 	mvhi r4,0x1
    d174:	34 02 00 08 	mvi r2,8
    d178:	2c c3 00 dc 	lhu r3,(r6+220)
    d17c:	38 84 37 1c 	ori r4,r4,0x371c
    d180:	44 22 00 07 	be r1,r2,d19c <handleAnnounce+0x80>
    d184:	78 04 00 01 	mvhi r4,0x1
    d188:	34 02 00 05 	mvi r2,5
    d18c:	38 84 37 14 	ori r4,r4,0x3714
    d190:	5c 22 00 03 	bne r1,r2,d19c <handleAnnounce+0x80>
    d194:	78 04 00 01 	mvhi r4,0x1
    d198:	38 84 37 24 	ori r4,r4,0x3724
    d19c:	29 62 0b 78 	lw r2,(r11+2936)
    d1a0:	78 05 00 01 	mvhi r5,0x1
    d1a4:	34 01 00 01 	mvi r1,1
    d1a8:	38 a5 36 f4 	ori r5,r5,0x36f4
    d1ac:	5c 41 00 03 	bne r2,r1,d1b8 <handleAnnounce+0x9c>
    d1b0:	78 05 00 01 	mvhi r5,0x1
    d1b4:	38 a5 36 ec 	ori r5,r5,0x36ec
    d1b8:	41 62 0b 76 	lbu r2,(r11+2934)
    d1bc:	34 01 00 01 	mvi r1,1
    d1c0:	44 41 00 0d 	be r2,r1,d1f4 <handleAnnounce+0xd8>
    d1c4:	78 06 00 01 	mvhi r6,0x1
    d1c8:	38 c6 31 08 	ori r6,r6,0x3108
    d1cc:	34 08 00 02 	mvi r8,2
    d1d0:	b8 c0 38 00 	mv r7,r6
    d1d4:	5c 48 00 0c 	bne r2,r8,d204 <handleAnnounce+0xe8>
    d1d8:	41 62 0e fc 	lbu r2,(r11+3836)
    d1dc:	78 07 00 01 	mvhi r7,0x1
    d1e0:	38 e7 36 fc 	ori r7,r7,0x36fc
    d1e4:	5c 41 00 08 	bne r2,r1,d204 <handleAnnounce+0xe8>
    d1e8:	78 07 00 01 	mvhi r7,0x1
    d1ec:	38 e7 37 04 	ori r7,r7,0x3704
    d1f0:	e0 00 00 05 	bi d204 <handleAnnounce+0xe8>
    d1f4:	78 06 00 01 	mvhi r6,0x1
    d1f8:	78 07 00 01 	mvhi r7,0x1
    d1fc:	38 c6 37 0c 	ori r6,r6,0x370c
    d200:	38 e7 31 08 	ori r7,r7,0x3108
    d204:	78 02 00 01 	mvhi r2,0x1
    d208:	34 01 00 01 	mvi r1,1
    d20c:	38 42 4b 04 	ori r2,r2,0x4b04
    d210:	e0 00 00 2f 	bi d2cc <handleAnnounce+0x1b0>
    d214:	78 02 00 01 	mvhi r2,0x1
    d218:	34 01 00 01 	mvi r1,1
    d21c:	38 42 4b 6c 	ori r2,r2,0x4b6c
    d220:	e0 00 00 30 	bi d2e0 <handleAnnounce+0x1c4>
    d224:	44 c0 00 2c 	be r6,r0,d2d4 <handleAnnounce+0x1b8>
    d228:	40 c1 00 de 	lbu r1,(r6+222)
    d22c:	78 04 00 01 	mvhi r4,0x1
    d230:	34 02 00 08 	mvi r2,8
    d234:	2c c3 00 dc 	lhu r3,(r6+220)
    d238:	38 84 37 1c 	ori r4,r4,0x371c
    d23c:	44 22 00 07 	be r1,r2,d258 <handleAnnounce+0x13c>
    d240:	78 04 00 01 	mvhi r4,0x1
    d244:	34 02 00 05 	mvi r2,5
    d248:	38 84 37 14 	ori r4,r4,0x3714
    d24c:	5c 22 00 03 	bne r1,r2,d258 <handleAnnounce+0x13c>
    d250:	78 04 00 01 	mvhi r4,0x1
    d254:	38 84 37 24 	ori r4,r4,0x3724
    d258:	29 62 0b 78 	lw r2,(r11+2936)
    d25c:	78 05 00 01 	mvhi r5,0x1
    d260:	34 01 00 01 	mvi r1,1
    d264:	38 a5 36 f4 	ori r5,r5,0x36f4
    d268:	5c 41 00 03 	bne r2,r1,d274 <handleAnnounce+0x158>
    d26c:	78 05 00 01 	mvhi r5,0x1
    d270:	38 a5 36 ec 	ori r5,r5,0x36ec
    d274:	41 62 0b 76 	lbu r2,(r11+2934)
    d278:	34 01 00 01 	mvi r1,1
    d27c:	44 41 00 0d 	be r2,r1,d2b0 <handleAnnounce+0x194>
    d280:	78 06 00 01 	mvhi r6,0x1
    d284:	38 c6 31 08 	ori r6,r6,0x3108
    d288:	34 08 00 02 	mvi r8,2
    d28c:	b8 c0 38 00 	mv r7,r6
    d290:	5c 48 00 0c 	bne r2,r8,d2c0 <handleAnnounce+0x1a4>
    d294:	41 62 0e fc 	lbu r2,(r11+3836)
    d298:	78 07 00 01 	mvhi r7,0x1
    d29c:	38 e7 36 fc 	ori r7,r7,0x36fc
    d2a0:	5c 41 00 08 	bne r2,r1,d2c0 <handleAnnounce+0x1a4>
    d2a4:	78 07 00 01 	mvhi r7,0x1
    d2a8:	38 e7 37 04 	ori r7,r7,0x3704
    d2ac:	e0 00 00 05 	bi d2c0 <handleAnnounce+0x1a4>
    d2b0:	78 06 00 01 	mvhi r6,0x1
    d2b4:	78 07 00 01 	mvhi r7,0x1
    d2b8:	38 c6 37 0c 	ori r6,r6,0x370c
    d2bc:	38 e7 31 08 	ori r7,r7,0x3108
    d2c0:	78 02 00 01 	mvhi r2,0x1
    d2c4:	34 01 00 01 	mvi r1,1
    d2c8:	38 42 4b bc 	ori r2,r2,0x4bbc
    d2cc:	fb ff cd 6d 	calli 880 <wrc_debug_printf>
    d2d0:	e0 00 00 05 	bi d2e4 <handleAnnounce+0x1c8>
    d2d4:	78 02 00 01 	mvhi r2,0x1
    d2d8:	34 01 00 01 	mvi r1,1
    d2dc:	38 42 4b f8 	ori r2,r2,0x4bf8
    d2e0:	fb ff cd 68 	calli 880 <wrc_debug_printf>
    d2e4:	41 61 00 de 	lbu r1,(r11+222)
    d2e8:	34 02 00 02 	mvi r2,2
    d2ec:	50 41 00 b7 	bgeu r2,r1,d5c8 <handleAnnounce+0x4ac>
    d2f0:	34 22 ff f9 	addi r2,r1,-7
    d2f4:	34 0c 00 01 	mvi r12,1
    d2f8:	34 0f 00 08 	mvi r15,8
    d2fc:	54 4c 00 84 	bgu r2,r12,d50c <handleAnnounce+0x3f0>
    d300:	5d c0 00 b2 	bne r14,r0,d5c8 <handleAnnounce+0x4ac>
    d304:	59 6c 01 04 	sw (r11+260),r12
    d308:	b9 a0 08 00 	mv r1,r13
    d30c:	b9 60 10 00 	mv r2,r11
    d310:	fb ff f3 f3 	calli a2dc <msgIsFromCurrentParent>
    d314:	44 2e 00 72 	be r1,r14,d4dc <handleAnnounce+0x3c0>
    d318:	41 61 00 de 	lbu r1,(r11+222)
    d31c:	78 04 00 01 	mvhi r4,0x1
    d320:	2d 63 00 dc 	lhu r3,(r11+220)
    d324:	38 84 37 1c 	ori r4,r4,0x371c
    d328:	44 2f 00 07 	be r1,r15,d344 <handleAnnounce+0x228>
    d32c:	78 04 00 01 	mvhi r4,0x1
    d330:	34 02 00 05 	mvi r2,5
    d334:	38 84 37 14 	ori r4,r4,0x3714
    d338:	5c 22 00 03 	bne r1,r2,d344 <handleAnnounce+0x228>
    d33c:	78 04 00 01 	mvhi r4,0x1
    d340:	38 84 37 24 	ori r4,r4,0x3724
    d344:	29 62 0b 78 	lw r2,(r11+2936)
    d348:	78 05 00 01 	mvhi r5,0x1
    d34c:	34 01 00 01 	mvi r1,1
    d350:	38 a5 36 f4 	ori r5,r5,0x36f4
    d354:	5c 41 00 03 	bne r2,r1,d360 <handleAnnounce+0x244>
    d358:	78 05 00 01 	mvhi r5,0x1
    d35c:	38 a5 36 ec 	ori r5,r5,0x36ec
    d360:	41 62 0b 76 	lbu r2,(r11+2934)
    d364:	34 01 00 01 	mvi r1,1
    d368:	44 41 00 0d 	be r2,r1,d39c <handleAnnounce+0x280>
    d36c:	78 06 00 01 	mvhi r6,0x1
    d370:	38 c6 31 08 	ori r6,r6,0x3108
    d374:	34 08 00 02 	mvi r8,2
    d378:	b8 c0 38 00 	mv r7,r6
    d37c:	5c 48 00 0c 	bne r2,r8,d3ac <handleAnnounce+0x290>
    d380:	41 62 0e fc 	lbu r2,(r11+3836)
    d384:	78 07 00 01 	mvhi r7,0x1
    d388:	38 e7 36 fc 	ori r7,r7,0x36fc
    d38c:	5c 41 00 08 	bne r2,r1,d3ac <handleAnnounce+0x290>
    d390:	78 07 00 01 	mvhi r7,0x1
    d394:	38 e7 37 04 	ori r7,r7,0x3704
    d398:	e0 00 00 05 	bi d3ac <handleAnnounce+0x290>
    d39c:	78 06 00 01 	mvhi r6,0x1
    d3a0:	78 07 00 01 	mvhi r7,0x1
    d3a4:	38 c6 37 0c 	ori r6,r6,0x370c
    d3a8:	38 e7 31 08 	ori r7,r7,0x3108
    d3ac:	78 02 00 01 	mvhi r2,0x1
    d3b0:	34 01 00 01 	mvi r1,1
    d3b4:	38 42 4c 20 	ori r2,r2,0x4c20
    d3b8:	fb ff cd 32 	calli 880 <wrc_debug_printf>
    d3bc:	35 6c 05 50 	addi r12,r11,1360
    d3c0:	b9 80 08 00 	mv r1,r12
    d3c4:	35 62 01 2c 	addi r2,r11,300
    d3c8:	b9 a0 18 00 	mv r3,r13
    d3cc:	fb ff e6 2c 	calli 6c7c <msgUnpackAnnounce>
    d3d0:	41 61 01 4d 	lbu r1,(r11+333)
    d3d4:	44 20 00 2b 	be r1,r0,d480 <handleAnnounce+0x364>
    d3d8:	41 61 00 de 	lbu r1,(r11+222)
    d3dc:	78 04 00 01 	mvhi r4,0x1
    d3e0:	34 02 00 08 	mvi r2,8
    d3e4:	2d 63 00 dc 	lhu r3,(r11+220)
    d3e8:	38 84 37 1c 	ori r4,r4,0x371c
    d3ec:	44 22 00 07 	be r1,r2,d408 <handleAnnounce+0x2ec>
    d3f0:	78 04 00 01 	mvhi r4,0x1
    d3f4:	34 02 00 05 	mvi r2,5
    d3f8:	38 84 37 14 	ori r4,r4,0x3714
    d3fc:	5c 22 00 03 	bne r1,r2,d408 <handleAnnounce+0x2ec>
    d400:	78 04 00 01 	mvhi r4,0x1
    d404:	38 84 37 24 	ori r4,r4,0x3724
    d408:	29 62 0b 78 	lw r2,(r11+2936)
    d40c:	78 05 00 01 	mvhi r5,0x1
    d410:	34 01 00 01 	mvi r1,1
    d414:	38 a5 36 f4 	ori r5,r5,0x36f4
    d418:	5c 41 00 03 	bne r2,r1,d424 <handleAnnounce+0x308>
    d41c:	78 05 00 01 	mvhi r5,0x1
    d420:	38 a5 36 ec 	ori r5,r5,0x36ec
    d424:	41 62 0b 76 	lbu r2,(r11+2934)
    d428:	34 01 00 01 	mvi r1,1
    d42c:	44 41 00 0d 	be r2,r1,d460 <handleAnnounce+0x344>
    d430:	78 06 00 01 	mvhi r6,0x1
    d434:	38 c6 31 08 	ori r6,r6,0x3108
    d438:	34 08 00 02 	mvi r8,2
    d43c:	b8 c0 38 00 	mv r7,r6
    d440:	5c 48 00 0c 	bne r2,r8,d470 <handleAnnounce+0x354>
    d444:	41 62 0e fc 	lbu r2,(r11+3836)
    d448:	78 07 00 01 	mvhi r7,0x1
    d44c:	38 e7 36 fc 	ori r7,r7,0x36fc
    d450:	5c 41 00 08 	bne r2,r1,d470 <handleAnnounce+0x354>
    d454:	78 07 00 01 	mvhi r7,0x1
    d458:	38 e7 37 04 	ori r7,r7,0x3704
    d45c:	e0 00 00 05 	bi d470 <handleAnnounce+0x354>
    d460:	78 06 00 01 	mvhi r6,0x1
    d464:	78 07 00 01 	mvhi r7,0x1
    d468:	38 c6 37 0c 	ori r6,r6,0x370c
    d46c:	38 e7 31 08 	ori r7,r7,0x3108
    d470:	78 02 00 01 	mvhi r2,0x1
    d474:	34 01 00 01 	mvi r1,1
    d478:	38 42 4c 70 	ori r2,r2,0x4c70
    d47c:	fb ff cd 01 	calli 880 <wrc_debug_printf>
    d480:	1d 62 01 02 	lh r2,(r11+258)
    d484:	29 61 00 f8 	lw r1,(r11+248)
    d488:	08 42 00 58 	muli r2,r2,88
    d48c:	b4 22 10 00 	add r2,r1,r2
    d490:	34 42 00 34 	addi r2,r2,52
    d494:	b9 80 08 00 	mv r1,r12
    d498:	fb ff e5 10 	calli 68d8 <msgUnpackHeader>
    d49c:	1d 63 01 02 	lh r3,(r11+258)
    d4a0:	29 61 00 f8 	lw r1,(r11+248)
    d4a4:	08 63 00 58 	muli r3,r3,88
    d4a8:	b4 23 18 00 	add r3,r1,r3
    d4ac:	34 62 00 10 	addi r2,r3,16
    d4b0:	b9 80 08 00 	mv r1,r12
    d4b4:	34 63 00 34 	addi r3,r3,52
    d4b8:	fb ff e5 f1 	calli 6c7c <msgUnpackAnnounce>
    d4bc:	41 63 00 f1 	lbu r3,(r11+241)
    d4c0:	11 61 00 f0 	lb r1,(r11+240)
    d4c4:	34 02 00 01 	mvi r2,1
    d4c8:	08 63 03 e8 	muli r3,r3,1000
    d4cc:	bc 41 10 00 	sl r2,r2,r1
    d4d0:	35 61 0b 40 	addi r1,r11,2880
    d4d4:	88 62 10 00 	mul r2,r3,r2
    d4d8:	e0 00 00 0b 	bi d504 <handleAnnounce+0x3e8>
    d4dc:	35 61 05 50 	addi r1,r11,1360
    d4e0:	b9 a0 10 00 	mv r2,r13
    d4e4:	b9 60 18 00 	mv r3,r11
    d4e8:	fb ff fd a7 	calli cb84 <addForeign>
    d4ec:	41 62 00 f1 	lbu r2,(r11+241)
    d4f0:	11 61 00 f0 	lb r1,(r11+240)
    d4f4:	08 42 03 e8 	muli r2,r2,1000
    d4f8:	bd 81 60 00 	sl r12,r12,r1
    d4fc:	35 61 0b 40 	addi r1,r11,2880
    d500:	88 4c 10 00 	mul r2,r2,r12
    d504:	fb ff e9 bd 	calli 7bf8 <timerStart>
    d508:	e0 00 00 30 	bi d5c8 <handleAnnounce+0x4ac>
    d50c:	45 c0 00 2a 	be r14,r0,d5b4 <handleAnnounce+0x498>
    d510:	78 04 00 01 	mvhi r4,0x1
    d514:	2d 63 00 dc 	lhu r3,(r11+220)
    d518:	38 84 37 1c 	ori r4,r4,0x371c
    d51c:	44 2f 00 07 	be r1,r15,d538 <handleAnnounce+0x41c>
    d520:	78 04 00 01 	mvhi r4,0x1
    d524:	34 02 00 05 	mvi r2,5
    d528:	38 84 37 14 	ori r4,r4,0x3714
    d52c:	5c 22 00 03 	bne r1,r2,d538 <handleAnnounce+0x41c>
    d530:	78 04 00 01 	mvhi r4,0x1
    d534:	38 84 37 24 	ori r4,r4,0x3724
    d538:	29 62 0b 78 	lw r2,(r11+2936)
    d53c:	78 05 00 01 	mvhi r5,0x1
    d540:	34 01 00 01 	mvi r1,1
    d544:	38 a5 36 f4 	ori r5,r5,0x36f4
    d548:	5c 41 00 03 	bne r2,r1,d554 <handleAnnounce+0x438>
    d54c:	78 05 00 01 	mvhi r5,0x1
    d550:	38 a5 36 ec 	ori r5,r5,0x36ec
    d554:	41 62 0b 76 	lbu r2,(r11+2934)
    d558:	34 01 00 01 	mvi r1,1
    d55c:	44 41 00 0d 	be r2,r1,d590 <handleAnnounce+0x474>
    d560:	78 06 00 01 	mvhi r6,0x1
    d564:	38 c6 31 08 	ori r6,r6,0x3108
    d568:	34 08 00 02 	mvi r8,2
    d56c:	b8 c0 38 00 	mv r7,r6
    d570:	5c 48 00 0c 	bne r2,r8,d5a0 <handleAnnounce+0x484>
    d574:	41 62 0e fc 	lbu r2,(r11+3836)
    d578:	78 07 00 01 	mvhi r7,0x1
    d57c:	38 e7 36 fc 	ori r7,r7,0x36fc
    d580:	5c 41 00 08 	bne r2,r1,d5a0 <handleAnnounce+0x484>
    d584:	78 07 00 01 	mvhi r7,0x1
    d588:	38 e7 37 04 	ori r7,r7,0x3704
    d58c:	e0 00 00 05 	bi d5a0 <handleAnnounce+0x484>
    d590:	78 06 00 01 	mvhi r6,0x1
    d594:	78 07 00 01 	mvhi r7,0x1
    d598:	38 c6 37 0c 	ori r6,r6,0x370c
    d59c:	38 e7 31 08 	ori r7,r7,0x3108
    d5a0:	78 02 00 01 	mvhi r2,0x1
    d5a4:	34 01 00 01 	mvi r1,1
    d5a8:	38 42 4c e0 	ori r2,r2,0x4ce0
    d5ac:	fb ff cc b5 	calli 880 <wrc_debug_printf>
    d5b0:	e0 00 00 06 	bi d5c8 <handleAnnounce+0x4ac>
    d5b4:	35 61 05 50 	addi r1,r11,1360
    d5b8:	b9 a0 10 00 	mv r2,r13
    d5bc:	b9 60 18 00 	mv r3,r11
    d5c0:	fb ff fd 71 	calli cb84 <addForeign>
    d5c4:	59 6c 01 04 	sw (r11+260),r12
    d5c8:	2b 9d 00 04 	lw ra,(sp+4)
    d5cc:	2b 8b 00 18 	lw r11,(sp+24)
    d5d0:	2b 8c 00 14 	lw r12,(sp+20)
    d5d4:	2b 8d 00 10 	lw r13,(sp+16)
    d5d8:	2b 8e 00 0c 	lw r14,(sp+12)
    d5dc:	2b 8f 00 08 	lw r15,(sp+8)
    d5e0:	37 9c 00 18 	addi sp,sp,24
    d5e4:	c3 a0 00 00 	ret

0000d5e8 <handle>:
    d5e8:	37 9c ff d4 	addi sp,sp,-44
    d5ec:	5b 8b 00 1c 	sw (sp+28),r11
    d5f0:	5b 8c 00 18 	sw (sp+24),r12
    d5f4:	5b 8d 00 14 	sw (sp+20),r13
    d5f8:	5b 8e 00 10 	sw (sp+16),r14
    d5fc:	5b 8f 00 0c 	sw (sp+12),r15
    d600:	5b 90 00 08 	sw (sp+8),r16
    d604:	5b 9d 00 04 	sw (sp+4),ra
    d608:	34 03 00 10 	mvi r3,16
    d60c:	b8 40 58 00 	mv r11,r2
    d610:	b8 20 68 00 	mv r13,r1
    d614:	34 02 00 00 	mvi r2,0
    d618:	37 81 00 20 	addi r1,sp,32
    d61c:	f8 00 14 a2 	calli 128a4 <memset>
    d620:	35 6e 05 50 	addi r14,r11,1360
    d624:	b9 c0 08 00 	mv r1,r14
    d628:	35 62 00 04 	addi r2,r11,4
    d62c:	35 63 0d b8 	addi r3,r11,3512
    d630:	fb ff e8 b9 	calli 7914 <netRecvMsg>
    d634:	b8 20 60 00 	mv r12,r1
    d638:	4c 20 00 34 	bge r1,r0,d708 <handle+0x120>
    d63c:	45 60 00 2d 	be r11,r0,d6f0 <handle+0x108>
    d640:	41 61 00 de 	lbu r1,(r11+222)
    d644:	78 04 00 01 	mvhi r4,0x1
    d648:	34 02 00 08 	mvi r2,8
    d64c:	2d 63 00 dc 	lhu r3,(r11+220)
    d650:	38 84 37 1c 	ori r4,r4,0x371c
    d654:	44 22 00 07 	be r1,r2,d670 <handle+0x88>
    d658:	78 04 00 01 	mvhi r4,0x1
    d65c:	34 02 00 05 	mvi r2,5
    d660:	38 84 37 14 	ori r4,r4,0x3714
    d664:	5c 22 00 03 	bne r1,r2,d670 <handle+0x88>
    d668:	78 04 00 01 	mvhi r4,0x1
    d66c:	38 84 37 24 	ori r4,r4,0x3724
    d670:	29 62 0b 78 	lw r2,(r11+2936)
    d674:	78 05 00 01 	mvhi r5,0x1
    d678:	34 01 00 01 	mvi r1,1
    d67c:	38 a5 36 f4 	ori r5,r5,0x36f4
    d680:	5c 41 00 03 	bne r2,r1,d68c <handle+0xa4>
    d684:	78 05 00 01 	mvhi r5,0x1
    d688:	38 a5 36 ec 	ori r5,r5,0x36ec
    d68c:	41 62 0b 76 	lbu r2,(r11+2934)
    d690:	34 01 00 01 	mvi r1,1
    d694:	44 41 00 0d 	be r2,r1,d6c8 <handle+0xe0>
    d698:	78 06 00 01 	mvhi r6,0x1
    d69c:	38 c6 31 08 	ori r6,r6,0x3108
    d6a0:	34 08 00 02 	mvi r8,2
    d6a4:	b8 c0 38 00 	mv r7,r6
    d6a8:	5c 48 00 0c 	bne r2,r8,d6d8 <handle+0xf0>
    d6ac:	41 62 0e fc 	lbu r2,(r11+3836)
    d6b0:	78 07 00 01 	mvhi r7,0x1
    d6b4:	38 e7 36 fc 	ori r7,r7,0x36fc
    d6b8:	5c 41 00 08 	bne r2,r1,d6d8 <handle+0xf0>
    d6bc:	78 07 00 01 	mvhi r7,0x1
    d6c0:	38 e7 37 04 	ori r7,r7,0x3704
    d6c4:	e0 00 00 05 	bi d6d8 <handle+0xf0>
    d6c8:	78 06 00 01 	mvhi r6,0x1
    d6cc:	78 07 00 01 	mvhi r7,0x1
    d6d0:	38 c6 37 0c 	ori r6,r6,0x370c
    d6d4:	38 e7 31 08 	ori r7,r7,0x3108
    d6d8:	78 02 00 01 	mvhi r2,0x1
    d6dc:	34 01 00 01 	mvi r1,1
    d6e0:	38 42 4d 2c 	ori r2,r2,0x4d2c
    d6e4:	b9 80 40 00 	mv r8,r12
    d6e8:	fb ff cc 66 	calli 880 <wrc_debug_printf>
    d6ec:	e0 00 00 36 	bi d7c4 <handle+0x1dc>
    d6f0:	78 02 00 01 	mvhi r2,0x1
    d6f4:	34 01 00 01 	mvi r1,1
    d6f8:	38 42 4d 74 	ori r2,r2,0x4d74
    d6fc:	b9 80 18 00 	mv r3,r12
    d700:	fb ff cc 60 	calli 880 <wrc_debug_printf>
    d704:	e0 00 00 30 	bi d7c4 <handle+0x1dc>
    d708:	44 20 02 5e 	be r1,r0,e080 <handle+0xa98>
    d70c:	34 01 00 01 	mvi r1,1
    d710:	59 61 0a f4 	sw (r11+2804),r1
    d714:	34 01 00 21 	mvi r1,33
    d718:	49 81 00 30 	bg r12,r1,d7d8 <handle+0x1f0>
    d71c:	41 61 00 de 	lbu r1,(r11+222)
    d720:	78 04 00 01 	mvhi r4,0x1
    d724:	34 02 00 08 	mvi r2,8
    d728:	2d 63 00 dc 	lhu r3,(r11+220)
    d72c:	38 84 37 1c 	ori r4,r4,0x371c
    d730:	44 22 00 07 	be r1,r2,d74c <handle+0x164>
    d734:	78 04 00 01 	mvhi r4,0x1
    d738:	34 02 00 05 	mvi r2,5
    d73c:	38 84 37 14 	ori r4,r4,0x3714
    d740:	5c 22 00 03 	bne r1,r2,d74c <handle+0x164>
    d744:	78 04 00 01 	mvhi r4,0x1
    d748:	38 84 37 24 	ori r4,r4,0x3724
    d74c:	29 62 0b 78 	lw r2,(r11+2936)
    d750:	78 05 00 01 	mvhi r5,0x1
    d754:	34 01 00 01 	mvi r1,1
    d758:	38 a5 36 f4 	ori r5,r5,0x36f4
    d75c:	5c 41 00 03 	bne r2,r1,d768 <handle+0x180>
    d760:	78 05 00 01 	mvhi r5,0x1
    d764:	38 a5 36 ec 	ori r5,r5,0x36ec
    d768:	41 62 0b 76 	lbu r2,(r11+2934)
    d76c:	34 01 00 01 	mvi r1,1
    d770:	44 41 00 0d 	be r2,r1,d7a4 <handle+0x1bc>
    d774:	78 06 00 01 	mvhi r6,0x1
    d778:	38 c6 31 08 	ori r6,r6,0x3108
    d77c:	34 08 00 02 	mvi r8,2
    d780:	b8 c0 38 00 	mv r7,r6
    d784:	5c 48 00 0c 	bne r2,r8,d7b4 <handle+0x1cc>
    d788:	41 62 0e fc 	lbu r2,(r11+3836)
    d78c:	78 07 00 01 	mvhi r7,0x1
    d790:	38 e7 36 fc 	ori r7,r7,0x36fc
    d794:	5c 41 00 08 	bne r2,r1,d7b4 <handle+0x1cc>
    d798:	78 07 00 01 	mvhi r7,0x1
    d79c:	38 e7 37 04 	ori r7,r7,0x3704
    d7a0:	e0 00 00 05 	bi d7b4 <handle+0x1cc>
    d7a4:	78 06 00 01 	mvhi r6,0x1
    d7a8:	78 07 00 01 	mvhi r7,0x1
    d7ac:	38 c6 37 0c 	ori r6,r6,0x370c
    d7b0:	38 e7 31 08 	ori r7,r7,0x3108
    d7b4:	78 02 00 01 	mvhi r2,0x1
    d7b8:	34 01 00 01 	mvi r1,1
    d7bc:	38 42 4d a8 	ori r2,r2,0x4da8
    d7c0:	fb ff cc 30 	calli 880 <wrc_debug_printf>
    d7c4:	34 01 00 01 	mvi r1,1
    d7c8:	b9 a0 10 00 	mv r2,r13
    d7cc:	b9 60 18 00 	mv r3,r11
    d7d0:	fb ff ef c7 	calli 96ec <toState>
    d7d4:	e0 00 02 2b 	bi e080 <handle+0xa98>
    d7d8:	29 61 0d bc 	lw r1,(r11+3516)
    d7dc:	35 70 01 08 	addi r16,r11,264
    d7e0:	ba 00 10 00 	mv r2,r16
    d7e4:	5b 81 00 20 	sw (sp+32),r1
    d7e8:	29 61 0d c0 	lw r1,(r11+3520)
    d7ec:	5b 81 00 24 	sw (sp+36),r1
    d7f0:	b9 c0 08 00 	mv r1,r14
    d7f4:	fb ff e4 39 	calli 68d8 <msgUnpackHeader>
    d7f8:	41 68 01 0a 	lbu r8,(r11+266)
    d7fc:	41 61 00 f5 	lbu r1,(r11+245)
    d800:	44 28 00 2b 	be r1,r8,d8ac <handle+0x2c4>
    d804:	41 61 00 de 	lbu r1,(r11+222)
    d808:	78 04 00 01 	mvhi r4,0x1
    d80c:	34 02 00 08 	mvi r2,8
    d810:	2d 63 00 dc 	lhu r3,(r11+220)
    d814:	38 84 37 1c 	ori r4,r4,0x371c
    d818:	44 22 00 07 	be r1,r2,d834 <handle+0x24c>
    d81c:	78 04 00 01 	mvhi r4,0x1
    d820:	34 02 00 05 	mvi r2,5
    d824:	38 84 37 14 	ori r4,r4,0x3714
    d828:	5c 22 00 03 	bne r1,r2,d834 <handle+0x24c>
    d82c:	78 04 00 01 	mvhi r4,0x1
    d830:	38 84 37 24 	ori r4,r4,0x3724
    d834:	29 62 0b 78 	lw r2,(r11+2936)
    d838:	78 05 00 01 	mvhi r5,0x1
    d83c:	34 01 00 01 	mvi r1,1
    d840:	38 a5 36 f4 	ori r5,r5,0x36f4
    d844:	5c 41 00 03 	bne r2,r1,d850 <handle+0x268>
    d848:	78 05 00 01 	mvhi r5,0x1
    d84c:	38 a5 36 ec 	ori r5,r5,0x36ec
    d850:	41 62 0b 76 	lbu r2,(r11+2934)
    d854:	34 01 00 01 	mvi r1,1
    d858:	44 41 00 0d 	be r2,r1,d88c <handle+0x2a4>
    d85c:	78 06 00 01 	mvhi r6,0x1
    d860:	38 c6 31 08 	ori r6,r6,0x3108
    d864:	34 09 00 02 	mvi r9,2
    d868:	b8 c0 38 00 	mv r7,r6
    d86c:	5c 49 00 0c 	bne r2,r9,d89c <handle+0x2b4>
    d870:	41 62 0e fc 	lbu r2,(r11+3836)
    d874:	78 07 00 01 	mvhi r7,0x1
    d878:	38 e7 36 fc 	ori r7,r7,0x36fc
    d87c:	5c 41 00 08 	bne r2,r1,d89c <handle+0x2b4>
    d880:	78 07 00 01 	mvhi r7,0x1
    d884:	38 e7 37 04 	ori r7,r7,0x3704
    d888:	e0 00 00 05 	bi d89c <handle+0x2b4>
    d88c:	78 06 00 01 	mvhi r6,0x1
    d890:	78 07 00 01 	mvhi r7,0x1
    d894:	38 c6 37 0c 	ori r6,r6,0x370c
    d898:	38 e7 31 08 	ori r7,r7,0x3108
    d89c:	78 02 00 01 	mvhi r2,0x1
    d8a0:	34 01 00 01 	mvi r1,1
    d8a4:	38 42 4d e4 	ori r2,r2,0x4de4
    d8a8:	e0 00 00 2e 	bi d960 <handle+0x378>
    d8ac:	29 61 00 00 	lw r1,(r11+0)
    d8b0:	41 68 01 0e 	lbu r8,(r11+270)
    d8b4:	2d 63 00 dc 	lhu r3,(r11+220)
    d8b8:	40 21 00 0c 	lbu r1,(r1+12)
    d8bc:	44 28 00 2b 	be r1,r8,d968 <handle+0x380>
    d8c0:	41 61 00 de 	lbu r1,(r11+222)
    d8c4:	78 04 00 01 	mvhi r4,0x1
    d8c8:	34 02 00 08 	mvi r2,8
    d8cc:	38 84 37 1c 	ori r4,r4,0x371c
    d8d0:	44 22 00 07 	be r1,r2,d8ec <handle+0x304>
    d8d4:	78 04 00 01 	mvhi r4,0x1
    d8d8:	34 02 00 05 	mvi r2,5
    d8dc:	38 84 37 14 	ori r4,r4,0x3714
    d8e0:	5c 22 00 03 	bne r1,r2,d8ec <handle+0x304>
    d8e4:	78 04 00 01 	mvhi r4,0x1
    d8e8:	38 84 37 24 	ori r4,r4,0x3724
    d8ec:	29 62 0b 78 	lw r2,(r11+2936)
    d8f0:	78 05 00 01 	mvhi r5,0x1
    d8f4:	34 01 00 01 	mvi r1,1
    d8f8:	38 a5 36 f4 	ori r5,r5,0x36f4
    d8fc:	5c 41 00 03 	bne r2,r1,d908 <handle+0x320>
    d900:	78 05 00 01 	mvhi r5,0x1
    d904:	38 a5 36 ec 	ori r5,r5,0x36ec
    d908:	41 62 0b 76 	lbu r2,(r11+2934)
    d90c:	34 01 00 01 	mvi r1,1
    d910:	44 41 00 0d 	be r2,r1,d944 <handle+0x35c>
    d914:	78 06 00 01 	mvhi r6,0x1
    d918:	38 c6 31 08 	ori r6,r6,0x3108
    d91c:	34 09 00 02 	mvi r9,2
    d920:	b8 c0 38 00 	mv r7,r6
    d924:	5c 49 00 0c 	bne r2,r9,d954 <handle+0x36c>
    d928:	41 62 0e fc 	lbu r2,(r11+3836)
    d92c:	78 07 00 01 	mvhi r7,0x1
    d930:	38 e7 36 fc 	ori r7,r7,0x36fc
    d934:	5c 41 00 08 	bne r2,r1,d954 <handle+0x36c>
    d938:	78 07 00 01 	mvhi r7,0x1
    d93c:	38 e7 37 04 	ori r7,r7,0x3704
    d940:	e0 00 00 05 	bi d954 <handle+0x36c>
    d944:	78 06 00 01 	mvhi r6,0x1
    d948:	78 07 00 01 	mvhi r7,0x1
    d94c:	38 c6 37 0c 	ori r6,r6,0x370c
    d950:	38 e7 31 08 	ori r7,r7,0x3108
    d954:	78 02 00 01 	mvhi r2,0x1
    d958:	34 01 00 01 	mvi r1,1
    d95c:	38 42 4e 18 	ori r2,r2,0x4e18
    d960:	fb ff cb c8 	calli 880 <wrc_debug_printf>
    d964:	e0 00 01 c7 	bi e080 <handle+0xa98>
    d968:	2d 61 01 24 	lhu r1,(r11+292)
    d96c:	34 0f 00 00 	mvi r15,0
    d970:	5c 61 00 08 	bne r3,r1,d990 <handle+0x3a8>
    d974:	35 61 01 1c 	addi r1,r11,284
    d978:	35 62 00 d4 	addi r2,r11,212
    d97c:	34 03 00 08 	mvi r3,8
    d980:	f8 00 13 6f 	calli 1273c <memcmp>
    d984:	5c 20 00 03 	bne r1,r0,d990 <handle+0x3a8>
    d988:	34 0f 00 01 	mvi r15,1
    d98c:	e0 00 00 07 	bi d9a8 <handle+0x3c0>
    d990:	2b 81 00 20 	lw r1,(sp+32)
    d994:	4c 01 00 05 	bge r0,r1,d9a8 <handle+0x3c0>
    d998:	37 81 00 20 	addi r1,sp,32
    d99c:	b8 20 10 00 	mv r2,r1
    d9a0:	35 a3 00 44 	addi r3,r13,68
    d9a4:	fb ff e0 b6 	calli 5c7c <subTime>
    d9a8:	41 62 01 09 	lbu r2,(r11+265)
    d9ac:	34 01 00 0d 	mvi r1,13
    d9b0:	54 41 01 b4 	bgu r2,r1,e080 <handle+0xa98>
    d9b4:	78 01 00 01 	mvhi r1,0x1
    d9b8:	3c 42 00 02 	sli r2,r2,2
    d9bc:	38 21 54 b8 	ori r1,r1,0x54b8
    d9c0:	b4 22 08 00 	add r1,r1,r2
    d9c4:	28 21 00 00 	lw r1,(r1+0)
    d9c8:	c0 20 00 00 	b r1
    d9cc:	ba 00 08 00 	mv r1,r16
    d9d0:	b9 c0 10 00 	mv r2,r14
    d9d4:	b9 80 18 00 	mv r3,r12
    d9d8:	b9 e0 20 00 	mv r4,r15
    d9dc:	b9 a0 28 00 	mv r5,r13
    d9e0:	b9 60 30 00 	mv r6,r11
    d9e4:	fb ff fd ce 	calli d11c <handleAnnounce>
    d9e8:	e0 00 01 a6 	bi e080 <handle+0xa98>
    d9ec:	41 61 00 de 	lbu r1,(r11+222)
    d9f0:	78 04 00 01 	mvhi r4,0x1
    d9f4:	34 02 00 08 	mvi r2,8
    d9f8:	2d 63 00 dc 	lhu r3,(r11+220)
    d9fc:	38 84 37 1c 	ori r4,r4,0x371c
    da00:	44 22 00 07 	be r1,r2,da1c <handle+0x434>
    da04:	78 04 00 01 	mvhi r4,0x1
    da08:	34 02 00 05 	mvi r2,5
    da0c:	38 84 37 14 	ori r4,r4,0x3714
    da10:	5c 22 00 03 	bne r1,r2,da1c <handle+0x434>
    da14:	78 04 00 01 	mvhi r4,0x1
    da18:	38 84 37 24 	ori r4,r4,0x3724
    da1c:	29 62 0b 78 	lw r2,(r11+2936)
    da20:	78 05 00 01 	mvhi r5,0x1
    da24:	34 01 00 01 	mvi r1,1
    da28:	38 a5 36 f4 	ori r5,r5,0x36f4
    da2c:	5c 41 00 03 	bne r2,r1,da38 <handle+0x450>
    da30:	78 05 00 01 	mvhi r5,0x1
    da34:	38 a5 36 ec 	ori r5,r5,0x36ec
    da38:	41 62 0b 76 	lbu r2,(r11+2934)
    da3c:	34 01 00 01 	mvi r1,1
    da40:	44 41 00 0d 	be r2,r1,da74 <handle+0x48c>
    da44:	78 06 00 01 	mvhi r6,0x1
    da48:	38 c6 31 08 	ori r6,r6,0x3108
    da4c:	34 08 00 02 	mvi r8,2
    da50:	b8 c0 38 00 	mv r7,r6
    da54:	5c 48 00 0c 	bne r2,r8,da84 <handle+0x49c>
    da58:	41 62 0e fc 	lbu r2,(r11+3836)
    da5c:	78 07 00 01 	mvhi r7,0x1
    da60:	38 e7 36 fc 	ori r7,r7,0x36fc
    da64:	5c 41 00 08 	bne r2,r1,da84 <handle+0x49c>
    da68:	78 07 00 01 	mvhi r7,0x1
    da6c:	38 e7 37 04 	ori r7,r7,0x3704
    da70:	e0 00 00 05 	bi da84 <handle+0x49c>
    da74:	78 06 00 01 	mvhi r6,0x1
    da78:	78 07 00 01 	mvhi r7,0x1
    da7c:	38 c6 37 0c 	ori r6,r6,0x370c
    da80:	38 e7 31 08 	ori r7,r7,0x3108
    da84:	78 02 00 01 	mvhi r2,0x1
    da88:	34 01 00 01 	mvi r1,1
    da8c:	38 42 4e 58 	ori r2,r2,0x4e58
    da90:	fb ff cb 7c 	calli 880 <wrc_debug_printf>
    da94:	ba 00 08 00 	mv r1,r16
    da98:	b9 c0 10 00 	mv r2,r14
    da9c:	b9 80 18 00 	mv r3,r12
    daa0:	37 84 00 20 	addi r4,sp,32
    daa4:	b9 e0 28 00 	mv r5,r15
    daa8:	b9 a0 30 00 	mv r6,r13
    daac:	b9 60 38 00 	mv r7,r11
    dab0:	fb ff f2 22 	calli a338 <handleSync>
    dab4:	78 01 00 01 	mvhi r1,0x1
    dab8:	38 21 59 38 	ori r1,r1,0x5938
    dabc:	28 21 00 00 	lw r1,(r1+0)
    dac0:	44 20 01 70 	be r1,r0,e080 <handle+0xa98>
    dac4:	78 02 00 01 	mvhi r2,0x1
    dac8:	34 01 00 00 	mvi r1,0
    dacc:	38 42 4e a0 	ori r2,r2,0x4ea0
    dad0:	e0 00 00 d1 	bi de14 <handle+0x82c>
    dad4:	41 61 00 de 	lbu r1,(r11+222)
    dad8:	78 04 00 01 	mvhi r4,0x1
    dadc:	34 02 00 08 	mvi r2,8
    dae0:	2d 63 00 dc 	lhu r3,(r11+220)
    dae4:	38 84 37 1c 	ori r4,r4,0x371c
    dae8:	44 22 00 07 	be r1,r2,db04 <handle+0x51c>
    daec:	78 04 00 01 	mvhi r4,0x1
    daf0:	34 02 00 05 	mvi r2,5
    daf4:	38 84 37 14 	ori r4,r4,0x3714
    daf8:	5c 22 00 03 	bne r1,r2,db04 <handle+0x51c>
    dafc:	78 04 00 01 	mvhi r4,0x1
    db00:	38 84 37 24 	ori r4,r4,0x3724
    db04:	29 62 0b 78 	lw r2,(r11+2936)
    db08:	78 05 00 01 	mvhi r5,0x1
    db0c:	34 01 00 01 	mvi r1,1
    db10:	38 a5 36 f4 	ori r5,r5,0x36f4
    db14:	5c 41 00 03 	bne r2,r1,db20 <handle+0x538>
    db18:	78 05 00 01 	mvhi r5,0x1
    db1c:	38 a5 36 ec 	ori r5,r5,0x36ec
    db20:	41 62 0b 76 	lbu r2,(r11+2934)
    db24:	34 01 00 01 	mvi r1,1
    db28:	44 41 00 0d 	be r2,r1,db5c <handle+0x574>
    db2c:	78 06 00 01 	mvhi r6,0x1
    db30:	38 c6 31 08 	ori r6,r6,0x3108
    db34:	34 08 00 02 	mvi r8,2
    db38:	b8 c0 38 00 	mv r7,r6
    db3c:	5c 48 00 0c 	bne r2,r8,db6c <handle+0x584>
    db40:	41 62 0e fc 	lbu r2,(r11+3836)
    db44:	78 07 00 01 	mvhi r7,0x1
    db48:	38 e7 36 fc 	ori r7,r7,0x36fc
    db4c:	5c 41 00 08 	bne r2,r1,db6c <handle+0x584>
    db50:	78 07 00 01 	mvhi r7,0x1
    db54:	38 e7 37 04 	ori r7,r7,0x3704
    db58:	e0 00 00 05 	bi db6c <handle+0x584>
    db5c:	78 06 00 01 	mvhi r6,0x1
    db60:	78 07 00 01 	mvhi r7,0x1
    db64:	38 c6 37 0c 	ori r6,r6,0x370c
    db68:	38 e7 31 08 	ori r7,r7,0x3108
    db6c:	78 02 00 01 	mvhi r2,0x1
    db70:	34 01 00 01 	mvi r1,1
    db74:	38 42 4e d4 	ori r2,r2,0x4ed4
    db78:	fb ff cb 42 	calli 880 <wrc_debug_printf>
    db7c:	ba 00 08 00 	mv r1,r16
    db80:	b9 c0 10 00 	mv r2,r14
    db84:	b9 80 18 00 	mv r3,r12
    db88:	b9 e0 20 00 	mv r4,r15
    db8c:	b9 a0 28 00 	mv r5,r13
    db90:	b9 60 30 00 	mv r6,r11
    db94:	fb ff f2 6d 	calli a548 <handleFollowUp>
    db98:	e0 00 01 3a 	bi e080 <handle+0xa98>
    db9c:	41 61 00 de 	lbu r1,(r11+222)
    dba0:	78 04 00 01 	mvhi r4,0x1
    dba4:	34 02 00 08 	mvi r2,8
    dba8:	2d 63 00 dc 	lhu r3,(r11+220)
    dbac:	38 84 37 1c 	ori r4,r4,0x371c
    dbb0:	44 22 00 07 	be r1,r2,dbcc <handle+0x5e4>
    dbb4:	78 04 00 01 	mvhi r4,0x1
    dbb8:	34 02 00 05 	mvi r2,5
    dbbc:	38 84 37 14 	ori r4,r4,0x3714
    dbc0:	5c 22 00 03 	bne r1,r2,dbcc <handle+0x5e4>
    dbc4:	78 04 00 01 	mvhi r4,0x1
    dbc8:	38 84 37 24 	ori r4,r4,0x3724
    dbcc:	29 62 0b 78 	lw r2,(r11+2936)
    dbd0:	78 05 00 01 	mvhi r5,0x1
    dbd4:	34 01 00 01 	mvi r1,1
    dbd8:	38 a5 36 f4 	ori r5,r5,0x36f4
    dbdc:	5c 41 00 03 	bne r2,r1,dbe8 <handle+0x600>
    dbe0:	78 05 00 01 	mvhi r5,0x1
    dbe4:	38 a5 36 ec 	ori r5,r5,0x36ec
    dbe8:	41 62 0b 76 	lbu r2,(r11+2934)
    dbec:	34 01 00 01 	mvi r1,1
    dbf0:	44 41 00 0d 	be r2,r1,dc24 <handle+0x63c>
    dbf4:	78 06 00 01 	mvhi r6,0x1
    dbf8:	38 c6 31 08 	ori r6,r6,0x3108
    dbfc:	34 08 00 02 	mvi r8,2
    dc00:	b8 c0 38 00 	mv r7,r6
    dc04:	5c 48 00 0c 	bne r2,r8,dc34 <handle+0x64c>
    dc08:	41 62 0e fc 	lbu r2,(r11+3836)
    dc0c:	78 07 00 01 	mvhi r7,0x1
    dc10:	38 e7 36 fc 	ori r7,r7,0x36fc
    dc14:	5c 41 00 08 	bne r2,r1,dc34 <handle+0x64c>
    dc18:	78 07 00 01 	mvhi r7,0x1
    dc1c:	38 e7 37 04 	ori r7,r7,0x3704
    dc20:	e0 00 00 05 	bi dc34 <handle+0x64c>
    dc24:	78 06 00 01 	mvhi r6,0x1
    dc28:	78 07 00 01 	mvhi r7,0x1
    dc2c:	38 c6 37 0c 	ori r6,r6,0x370c
    dc30:	38 e7 31 08 	ori r7,r7,0x3108
    dc34:	78 02 00 01 	mvhi r2,0x1
    dc38:	34 01 00 01 	mvi r1,1
    dc3c:	38 42 4f 20 	ori r2,r2,0x4f20
    dc40:	fb ff cb 10 	calli 880 <wrc_debug_printf>
    dc44:	ba 00 08 00 	mv r1,r16
    dc48:	b9 c0 10 00 	mv r2,r14
    dc4c:	b9 80 18 00 	mv r3,r12
    dc50:	b9 e0 20 00 	mv r4,r15
    dc54:	b9 a0 28 00 	mv r5,r13
    dc58:	b9 60 30 00 	mv r6,r11
    dc5c:	fb ff f9 a8 	calli c2fc <handleDelayReq>
    dc60:	e0 00 01 08 	bi e080 <handle+0xa98>
    dc64:	41 61 00 de 	lbu r1,(r11+222)
    dc68:	78 04 00 01 	mvhi r4,0x1
    dc6c:	34 02 00 08 	mvi r2,8
    dc70:	2d 63 00 dc 	lhu r3,(r11+220)
    dc74:	38 84 37 1c 	ori r4,r4,0x371c
    dc78:	44 22 00 07 	be r1,r2,dc94 <handle+0x6ac>
    dc7c:	78 04 00 01 	mvhi r4,0x1
    dc80:	34 02 00 05 	mvi r2,5
    dc84:	38 84 37 14 	ori r4,r4,0x3714
    dc88:	5c 22 00 03 	bne r1,r2,dc94 <handle+0x6ac>
    dc8c:	78 04 00 01 	mvhi r4,0x1
    dc90:	38 84 37 24 	ori r4,r4,0x3724
    dc94:	29 62 0b 78 	lw r2,(r11+2936)
    dc98:	78 05 00 01 	mvhi r5,0x1
    dc9c:	34 01 00 01 	mvi r1,1
    dca0:	38 a5 36 f4 	ori r5,r5,0x36f4
    dca4:	5c 41 00 03 	bne r2,r1,dcb0 <handle+0x6c8>
    dca8:	78 05 00 01 	mvhi r5,0x1
    dcac:	38 a5 36 ec 	ori r5,r5,0x36ec
    dcb0:	41 62 0b 76 	lbu r2,(r11+2934)
    dcb4:	34 01 00 01 	mvi r1,1
    dcb8:	44 41 00 0d 	be r2,r1,dcec <handle+0x704>
    dcbc:	78 06 00 01 	mvhi r6,0x1
    dcc0:	38 c6 31 08 	ori r6,r6,0x3108
    dcc4:	34 08 00 02 	mvi r8,2
    dcc8:	b8 c0 38 00 	mv r7,r6
    dccc:	5c 48 00 0c 	bne r2,r8,dcfc <handle+0x714>
    dcd0:	41 62 0e fc 	lbu r2,(r11+3836)
    dcd4:	78 07 00 01 	mvhi r7,0x1
    dcd8:	38 e7 36 fc 	ori r7,r7,0x36fc
    dcdc:	5c 41 00 08 	bne r2,r1,dcfc <handle+0x714>
    dce0:	78 07 00 01 	mvhi r7,0x1
    dce4:	38 e7 37 04 	ori r7,r7,0x3704
    dce8:	e0 00 00 05 	bi dcfc <handle+0x714>
    dcec:	78 06 00 01 	mvhi r6,0x1
    dcf0:	78 07 00 01 	mvhi r7,0x1
    dcf4:	38 c6 37 0c 	ori r6,r6,0x370c
    dcf8:	38 e7 31 08 	ori r7,r7,0x3108
    dcfc:	78 02 00 01 	mvhi r2,0x1
    dd00:	34 01 00 01 	mvi r1,1
    dd04:	38 42 4f 6c 	ori r2,r2,0x4f6c
    dd08:	fb ff ca de 	calli 880 <wrc_debug_printf>
    dd0c:	ba 00 08 00 	mv r1,r16
    dd10:	b9 c0 10 00 	mv r2,r14
    dd14:	b9 80 18 00 	mv r3,r12
    dd18:	37 84 00 20 	addi r4,sp,32
    dd1c:	b9 e0 28 00 	mv r5,r15
    dd20:	b9 a0 30 00 	mv r6,r13
    dd24:	b9 60 38 00 	mv r7,r11
    dd28:	fb ff fa b1 	calli c7ec <handlePDelayReq>
    dd2c:	e0 00 00 d5 	bi e080 <handle+0xa98>
    dd30:	41 61 00 de 	lbu r1,(r11+222)
    dd34:	78 04 00 01 	mvhi r4,0x1
    dd38:	34 02 00 08 	mvi r2,8
    dd3c:	2d 63 00 dc 	lhu r3,(r11+220)
    dd40:	38 84 37 1c 	ori r4,r4,0x371c
    dd44:	44 22 00 07 	be r1,r2,dd60 <handle+0x778>
    dd48:	78 04 00 01 	mvhi r4,0x1
    dd4c:	34 02 00 05 	mvi r2,5
    dd50:	38 84 37 14 	ori r4,r4,0x3714
    dd54:	5c 22 00 03 	bne r1,r2,dd60 <handle+0x778>
    dd58:	78 04 00 01 	mvhi r4,0x1
    dd5c:	38 84 37 24 	ori r4,r4,0x3724
    dd60:	29 62 0b 78 	lw r2,(r11+2936)
    dd64:	78 05 00 01 	mvhi r5,0x1
    dd68:	34 01 00 01 	mvi r1,1
    dd6c:	38 a5 36 f4 	ori r5,r5,0x36f4
    dd70:	5c 41 00 03 	bne r2,r1,dd7c <handle+0x794>
    dd74:	78 05 00 01 	mvhi r5,0x1
    dd78:	38 a5 36 ec 	ori r5,r5,0x36ec
    dd7c:	41 62 0b 76 	lbu r2,(r11+2934)
    dd80:	34 01 00 01 	mvi r1,1
    dd84:	44 41 00 0d 	be r2,r1,ddb8 <handle+0x7d0>
    dd88:	78 06 00 01 	mvhi r6,0x1
    dd8c:	38 c6 31 08 	ori r6,r6,0x3108
    dd90:	34 08 00 02 	mvi r8,2
    dd94:	b8 c0 38 00 	mv r7,r6
    dd98:	5c 48 00 0c 	bne r2,r8,ddc8 <handle+0x7e0>
    dd9c:	41 62 0e fc 	lbu r2,(r11+3836)
    dda0:	78 07 00 01 	mvhi r7,0x1
    dda4:	38 e7 36 fc 	ori r7,r7,0x36fc
    dda8:	5c 41 00 08 	bne r2,r1,ddc8 <handle+0x7e0>
    ddac:	78 07 00 01 	mvhi r7,0x1
    ddb0:	38 e7 37 04 	ori r7,r7,0x3704
    ddb4:	e0 00 00 05 	bi ddc8 <handle+0x7e0>
    ddb8:	78 06 00 01 	mvhi r6,0x1
    ddbc:	78 07 00 01 	mvhi r7,0x1
    ddc0:	38 c6 37 0c 	ori r6,r6,0x370c
    ddc4:	38 e7 31 08 	ori r7,r7,0x3108
    ddc8:	78 02 00 01 	mvhi r2,0x1
    ddcc:	34 01 00 01 	mvi r1,1
    ddd0:	38 42 4f b8 	ori r2,r2,0x4fb8
    ddd4:	fb ff ca ab 	calli 880 <wrc_debug_printf>
    ddd8:	ba 00 08 00 	mv r1,r16
    dddc:	b9 c0 10 00 	mv r2,r14
    dde0:	37 83 00 20 	addi r3,sp,32
    dde4:	b9 80 20 00 	mv r4,r12
    dde8:	b9 e0 28 00 	mv r5,r15
    ddec:	b9 a0 30 00 	mv r6,r13
    ddf0:	b9 60 38 00 	mv r7,r11
    ddf4:	fb ff fa 42 	calli c6fc <handlePDelayResp>
    ddf8:	78 01 00 01 	mvhi r1,0x1
    ddfc:	38 21 59 38 	ori r1,r1,0x5938
    de00:	28 21 00 00 	lw r1,(r1+0)
    de04:	44 20 00 9f 	be r1,r0,e080 <handle+0xa98>
    de08:	78 02 00 01 	mvhi r2,0x1
    de0c:	34 01 00 00 	mvi r1,0
    de10:	38 42 4f ec 	ori r2,r2,0x4fec
    de14:	29 63 0d bc 	lw r3,(r11+3516)
    de18:	29 64 0d c0 	lw r4,(r11+3520)
    de1c:	29 65 0d c4 	lw r5,(r11+3524)
    de20:	fb ff ca 98 	calli 880 <wrc_debug_printf>
    de24:	e0 00 00 97 	bi e080 <handle+0xa98>
    de28:	41 61 00 de 	lbu r1,(r11+222)
    de2c:	78 04 00 01 	mvhi r4,0x1
    de30:	34 02 00 08 	mvi r2,8
    de34:	2d 63 00 dc 	lhu r3,(r11+220)
    de38:	38 84 37 1c 	ori r4,r4,0x371c
    de3c:	44 22 00 07 	be r1,r2,de58 <handle+0x870>
    de40:	78 04 00 01 	mvhi r4,0x1
    de44:	34 02 00 05 	mvi r2,5
    de48:	38 84 37 14 	ori r4,r4,0x3714
    de4c:	5c 22 00 03 	bne r1,r2,de58 <handle+0x870>
    de50:	78 04 00 01 	mvhi r4,0x1
    de54:	38 84 37 24 	ori r4,r4,0x3724
    de58:	29 62 0b 78 	lw r2,(r11+2936)
    de5c:	78 05 00 01 	mvhi r5,0x1
    de60:	34 01 00 01 	mvi r1,1
    de64:	38 a5 36 f4 	ori r5,r5,0x36f4
    de68:	5c 41 00 03 	bne r2,r1,de74 <handle+0x88c>
    de6c:	78 05 00 01 	mvhi r5,0x1
    de70:	38 a5 36 ec 	ori r5,r5,0x36ec
    de74:	41 62 0b 76 	lbu r2,(r11+2934)
    de78:	34 01 00 01 	mvi r1,1
    de7c:	44 41 00 0d 	be r2,r1,deb0 <handle+0x8c8>
    de80:	78 06 00 01 	mvhi r6,0x1
    de84:	38 c6 31 08 	ori r6,r6,0x3108
    de88:	34 08 00 02 	mvi r8,2
    de8c:	b8 c0 38 00 	mv r7,r6
    de90:	5c 48 00 0c 	bne r2,r8,dec0 <handle+0x8d8>
    de94:	41 62 0e fc 	lbu r2,(r11+3836)
    de98:	78 07 00 01 	mvhi r7,0x1
    de9c:	38 e7 36 fc 	ori r7,r7,0x36fc
    dea0:	5c 41 00 08 	bne r2,r1,dec0 <handle+0x8d8>
    dea4:	78 07 00 01 	mvhi r7,0x1
    dea8:	38 e7 37 04 	ori r7,r7,0x3704
    deac:	e0 00 00 05 	bi dec0 <handle+0x8d8>
    deb0:	78 06 00 01 	mvhi r6,0x1
    deb4:	78 07 00 01 	mvhi r7,0x1
    deb8:	38 c6 37 0c 	ori r6,r6,0x370c
    debc:	38 e7 31 08 	ori r7,r7,0x3108
    dec0:	78 02 00 01 	mvhi r2,0x1
    dec4:	34 01 00 01 	mvi r1,1
    dec8:	38 42 50 24 	ori r2,r2,0x5024
    decc:	fb ff ca 6d 	calli 880 <wrc_debug_printf>
    ded0:	ba 00 08 00 	mv r1,r16
    ded4:	b9 c0 10 00 	mv r2,r14
    ded8:	b9 80 18 00 	mv r3,r12
    dedc:	b9 e0 20 00 	mv r4,r15
    dee0:	b9 a0 28 00 	mv r5,r13
    dee4:	b9 60 30 00 	mv r6,r11
    dee8:	fb ff f2 dd 	calli aa5c <handlePDelayRespFollowUp>
    deec:	e0 00 00 65 	bi e080 <handle+0xa98>
    def0:	41 61 00 de 	lbu r1,(r11+222)
    def4:	78 04 00 01 	mvhi r4,0x1
    def8:	34 02 00 08 	mvi r2,8
    defc:	2d 63 00 dc 	lhu r3,(r11+220)
    df00:	38 84 37 1c 	ori r4,r4,0x371c
    df04:	44 22 00 07 	be r1,r2,df20 <handle+0x938>
    df08:	78 04 00 01 	mvhi r4,0x1
    df0c:	34 02 00 05 	mvi r2,5
    df10:	38 84 37 14 	ori r4,r4,0x3714
    df14:	5c 22 00 03 	bne r1,r2,df20 <handle+0x938>
    df18:	78 04 00 01 	mvhi r4,0x1
    df1c:	38 84 37 24 	ori r4,r4,0x3724
    df20:	29 62 0b 78 	lw r2,(r11+2936)
    df24:	78 05 00 01 	mvhi r5,0x1
    df28:	34 01 00 01 	mvi r1,1
    df2c:	38 a5 36 f4 	ori r5,r5,0x36f4
    df30:	5c 41 00 03 	bne r2,r1,df3c <handle+0x954>
    df34:	78 05 00 01 	mvhi r5,0x1
    df38:	38 a5 36 ec 	ori r5,r5,0x36ec
    df3c:	41 62 0b 76 	lbu r2,(r11+2934)
    df40:	34 01 00 01 	mvi r1,1
    df44:	44 41 00 0d 	be r2,r1,df78 <handle+0x990>
    df48:	78 06 00 01 	mvhi r6,0x1
    df4c:	38 c6 31 08 	ori r6,r6,0x3108
    df50:	34 08 00 02 	mvi r8,2
    df54:	b8 c0 38 00 	mv r7,r6
    df58:	5c 48 00 0c 	bne r2,r8,df88 <handle+0x9a0>
    df5c:	41 62 0e fc 	lbu r2,(r11+3836)
    df60:	78 07 00 01 	mvhi r7,0x1
    df64:	38 e7 36 fc 	ori r7,r7,0x36fc
    df68:	5c 41 00 08 	bne r2,r1,df88 <handle+0x9a0>
    df6c:	78 07 00 01 	mvhi r7,0x1
    df70:	38 e7 37 04 	ori r7,r7,0x3704
    df74:	e0 00 00 05 	bi df88 <handle+0x9a0>
    df78:	78 06 00 01 	mvhi r6,0x1
    df7c:	78 07 00 01 	mvhi r7,0x1
    df80:	38 c6 37 0c 	ori r6,r6,0x370c
    df84:	38 e7 31 08 	ori r7,r7,0x3108
    df88:	78 02 00 01 	mvhi r2,0x1
    df8c:	34 01 00 01 	mvi r1,1
    df90:	38 42 50 60 	ori r2,r2,0x5060
    df94:	fb ff ca 3b 	calli 880 <wrc_debug_printf>
    df98:	ba 00 08 00 	mv r1,r16
    df9c:	b9 c0 10 00 	mv r2,r14
    dfa0:	b9 80 18 00 	mv r3,r12
    dfa4:	b9 e0 20 00 	mv r4,r15
    dfa8:	b9 a0 28 00 	mv r5,r13
    dfac:	b9 60 30 00 	mv r6,r11
    dfb0:	fb ff f2 36 	calli a888 <handleDelayResp>
    dfb4:	e0 00 00 33 	bi e080 <handle+0xa98>
    dfb8:	41 61 00 de 	lbu r1,(r11+222)
    dfbc:	78 04 00 01 	mvhi r4,0x1
    dfc0:	34 02 00 08 	mvi r2,8
    dfc4:	2d 63 00 dc 	lhu r3,(r11+220)
    dfc8:	38 84 37 1c 	ori r4,r4,0x371c
    dfcc:	44 22 00 07 	be r1,r2,dfe8 <handle+0xa00>
    dfd0:	78 04 00 01 	mvhi r4,0x1
    dfd4:	34 02 00 05 	mvi r2,5
    dfd8:	38 84 37 14 	ori r4,r4,0x3714
    dfdc:	5c 22 00 03 	bne r1,r2,dfe8 <handle+0xa00>
    dfe0:	78 04 00 01 	mvhi r4,0x1
    dfe4:	38 84 37 24 	ori r4,r4,0x3724
    dfe8:	29 62 0b 78 	lw r2,(r11+2936)
    dfec:	78 05 00 01 	mvhi r5,0x1
    dff0:	34 01 00 01 	mvi r1,1
    dff4:	38 a5 36 f4 	ori r5,r5,0x36f4
    dff8:	5c 41 00 03 	bne r2,r1,e004 <handle+0xa1c>
    dffc:	78 05 00 01 	mvhi r5,0x1
    e000:	38 a5 36 ec 	ori r5,r5,0x36ec
    e004:	41 62 0b 76 	lbu r2,(r11+2934)
    e008:	34 01 00 01 	mvi r1,1
    e00c:	44 41 00 0d 	be r2,r1,e040 <handle+0xa58>
    e010:	78 06 00 01 	mvhi r6,0x1
    e014:	38 c6 31 08 	ori r6,r6,0x3108
    e018:	34 08 00 02 	mvi r8,2
    e01c:	b8 c0 38 00 	mv r7,r6
    e020:	5c 48 00 0c 	bne r2,r8,e050 <handle+0xa68>
    e024:	41 62 0e fc 	lbu r2,(r11+3836)
    e028:	78 07 00 01 	mvhi r7,0x1
    e02c:	38 e7 36 fc 	ori r7,r7,0x36fc
    e030:	5c 41 00 08 	bne r2,r1,e050 <handle+0xa68>
    e034:	78 07 00 01 	mvhi r7,0x1
    e038:	38 e7 37 04 	ori r7,r7,0x3704
    e03c:	e0 00 00 05 	bi e050 <handle+0xa68>
    e040:	78 06 00 01 	mvhi r6,0x1
    e044:	78 07 00 01 	mvhi r7,0x1
    e048:	38 c6 37 0c 	ori r6,r6,0x370c
    e04c:	38 e7 31 08 	ori r7,r7,0x3108
    e050:	78 02 00 01 	mvhi r2,0x1
    e054:	34 01 00 01 	mvi r1,1
    e058:	38 42 50 90 	ori r2,r2,0x5090
    e05c:	fb ff ca 09 	calli 880 <wrc_debug_printf>
    e060:	e0 00 00 08 	bi e080 <handle+0xa98>
    e064:	ba 00 08 00 	mv r1,r16
    e068:	b9 c0 10 00 	mv r2,r14
    e06c:	b9 80 18 00 	mv r3,r12
    e070:	b9 e0 20 00 	mv r4,r15
    e074:	b9 a0 28 00 	mv r5,r13
    e078:	b9 60 30 00 	mv r6,r11
    e07c:	fb ff f3 24 	calli ad0c <handleSignaling>
    e080:	2b 9d 00 04 	lw ra,(sp+4)
    e084:	2b 8b 00 1c 	lw r11,(sp+28)
    e088:	2b 8c 00 18 	lw r12,(sp+24)
    e08c:	2b 8d 00 14 	lw r13,(sp+20)
    e090:	2b 8e 00 10 	lw r14,(sp+16)
    e094:	2b 8f 00 0c 	lw r15,(sp+12)
    e098:	2b 90 00 08 	lw r16,(sp+8)
    e09c:	37 9c 00 2c 	addi sp,sp,44
    e0a0:	c3 a0 00 00 	ret

0000e0a4 <doState>:
    e0a4:	37 9c ff ec 	addi sp,sp,-20
    e0a8:	5b 8b 00 14 	sw (sp+20),r11
    e0ac:	5b 8c 00 10 	sw (sp+16),r12
    e0b0:	5b 8d 00 0c 	sw (sp+12),r13
    e0b4:	5b 8e 00 08 	sw (sp+8),r14
    e0b8:	5b 9d 00 04 	sw (sp+4),ra
    e0bc:	b8 40 58 00 	mv r11,r2
    e0c0:	40 42 00 de 	lbu r2,(r2+222)
    e0c4:	34 0d 00 08 	mvi r13,8
    e0c8:	b8 20 60 00 	mv r12,r1
    e0cc:	54 4d 00 fc 	bgu r2,r13,e4bc <doState+0x418>
    e0d0:	34 01 00 01 	mvi r1,1
    e0d4:	bc 22 10 00 	sl r2,r1,r2
    e0d8:	20 42 01 68 	andi r2,r2,0x168
    e0dc:	44 40 00 f8 	be r2,r0,e4bc <doState+0x418>
    e0e0:	29 62 00 00 	lw r2,(r11+0)
    e0e4:	28 4e 00 78 	lw r14,(r2+120)
    e0e8:	5d c1 00 f5 	bne r14,r1,e4bc <doState+0x418>
    e0ec:	41 62 0b 75 	lbu r2,(r11+2933)
    e0f0:	34 01 00 09 	mvi r1,9
    e0f4:	5c 41 00 f2 	bne r2,r1,e4bc <doState+0x418>
    e0f8:	29 61 00 f8 	lw r1,(r11+248)
    e0fc:	b9 80 10 00 	mv r2,r12
    e100:	59 60 01 04 	sw (r11+260),r0
    e104:	b9 60 18 00 	mv r3,r11
    e108:	fb ff e1 3e 	calli 6600 <bmc>
    e10c:	41 62 00 de 	lbu r2,(r11+222)
    e110:	44 22 00 49 	be r1,r2,e234 <doState+0x190>
    e114:	5c 2d 00 e7 	bne r1,r13,e4b0 <doState+0x40c>
    e118:	34 44 ff fd 	addi r4,r2,-3
    e11c:	20 84 00 ff 	andi r4,r4,0xff
    e120:	34 03 00 04 	mvi r3,4
    e124:	54 83 00 e3 	bgu r4,r3,e4b0 <doState+0x40c>
    e128:	34 01 00 02 	mvi r1,2
    e12c:	31 61 0b 76 	sb (r11+2934),r1
    e130:	78 04 00 01 	mvhi r4,0x1
    e134:	59 60 0b 78 	sw (r11+2936),r0
    e138:	34 01 00 05 	mvi r1,5
    e13c:	2d 63 00 dc 	lhu r3,(r11+220)
    e140:	38 84 37 14 	ori r4,r4,0x3714
    e144:	5c 41 00 03 	bne r2,r1,e150 <doState+0xac>
    e148:	78 04 00 01 	mvhi r4,0x1
    e14c:	38 84 37 24 	ori r4,r4,0x3724
    e150:	41 62 0e fc 	lbu r2,(r11+3836)
    e154:	78 07 00 01 	mvhi r7,0x1
    e158:	34 01 00 01 	mvi r1,1
    e15c:	38 e7 36 fc 	ori r7,r7,0x36fc
    e160:	5c 41 00 03 	bne r2,r1,e16c <doState+0xc8>
    e164:	78 07 00 01 	mvhi r7,0x1
    e168:	38 e7 37 04 	ori r7,r7,0x3704
    e16c:	78 02 00 01 	mvhi r2,0x1
    e170:	78 05 00 01 	mvhi r5,0x1
    e174:	78 06 00 01 	mvhi r6,0x1
    e178:	34 01 00 01 	mvi r1,1
    e17c:	38 42 50 b4 	ori r2,r2,0x50b4
    e180:	38 a5 36 f4 	ori r5,r5,0x36f4
    e184:	38 c6 31 08 	ori r6,r6,0x3108
    e188:	fb ff c9 be 	calli 880 <wrc_debug_printf>
    e18c:	41 61 00 de 	lbu r1,(r11+222)
    e190:	78 04 00 01 	mvhi r4,0x1
    e194:	34 02 00 08 	mvi r2,8
    e198:	2d 63 00 dc 	lhu r3,(r11+220)
    e19c:	38 84 37 1c 	ori r4,r4,0x371c
    e1a0:	44 22 00 07 	be r1,r2,e1bc <doState+0x118>
    e1a4:	78 04 00 01 	mvhi r4,0x1
    e1a8:	34 02 00 05 	mvi r2,5
    e1ac:	38 84 37 14 	ori r4,r4,0x3714
    e1b0:	5c 22 00 03 	bne r1,r2,e1bc <doState+0x118>
    e1b4:	78 04 00 01 	mvhi r4,0x1
    e1b8:	38 84 37 24 	ori r4,r4,0x3724
    e1bc:	29 62 0b 78 	lw r2,(r11+2936)
    e1c0:	78 05 00 01 	mvhi r5,0x1
    e1c4:	34 01 00 01 	mvi r1,1
    e1c8:	38 a5 36 f4 	ori r5,r5,0x36f4
    e1cc:	5c 41 00 03 	bne r2,r1,e1d8 <doState+0x134>
    e1d0:	78 05 00 01 	mvhi r5,0x1
    e1d4:	38 a5 36 ec 	ori r5,r5,0x36ec
    e1d8:	41 61 0b 76 	lbu r1,(r11+2934)
    e1dc:	34 02 00 01 	mvi r2,1
    e1e0:	44 22 00 0d 	be r1,r2,e214 <doState+0x170>
    e1e4:	78 06 00 01 	mvhi r6,0x1
    e1e8:	38 c6 31 08 	ori r6,r6,0x3108
    e1ec:	34 08 00 02 	mvi r8,2
    e1f0:	b8 c0 38 00 	mv r7,r6
    e1f4:	5c 28 00 0c 	bne r1,r8,e224 <doState+0x180>
    e1f8:	41 68 0e fc 	lbu r8,(r11+3836)
    e1fc:	78 07 00 01 	mvhi r7,0x1
    e200:	38 e7 36 fc 	ori r7,r7,0x36fc
    e204:	5d 02 00 08 	bne r8,r2,e224 <doState+0x180>
    e208:	78 07 00 01 	mvhi r7,0x1
    e20c:	38 e7 37 04 	ori r7,r7,0x3704
    e210:	e0 00 00 05 	bi e224 <doState+0x180>
    e214:	78 06 00 01 	mvhi r6,0x1
    e218:	78 07 00 01 	mvhi r7,0x1
    e21c:	38 c6 37 0c 	ori r6,r6,0x370c
    e220:	38 e7 31 08 	ori r7,r7,0x3108
    e224:	78 02 00 01 	mvhi r2,0x1
    e228:	34 01 00 01 	mvi r1,1
    e22c:	38 42 51 08 	ori r2,r2,0x5108
    e230:	e0 00 00 9e 	bi e4a8 <doState+0x404>
    e234:	29 62 0f 00 	lw r2,(r11+3840)
    e238:	5c 4e 00 a1 	bne r2,r14,e4bc <doState+0x418>
    e23c:	5c 2d 00 a0 	bne r1,r13,e4bc <doState+0x418>
    e240:	41 62 0b 76 	lbu r2,(r11+2934)
    e244:	34 01 00 02 	mvi r1,2
    e248:	5c 41 00 9d 	bne r2,r1,e4bc <doState+0x418>
    e24c:	29 61 0b a0 	lw r1,(r11+2976)
    e250:	44 20 00 03 	be r1,r0,e25c <doState+0x1b8>
    e254:	29 61 0b 78 	lw r1,(r11+2936)
    e258:	5c 20 00 99 	bne r1,r0,e4bc <doState+0x418>
    e25c:	29 62 0b 78 	lw r2,(r11+2936)
    e260:	78 05 00 01 	mvhi r5,0x1
    e264:	34 01 00 01 	mvi r1,1
    e268:	2d 63 00 dc 	lhu r3,(r11+220)
    e26c:	38 a5 36 f4 	ori r5,r5,0x36f4
    e270:	5c 41 00 03 	bne r2,r1,e27c <doState+0x1d8>
    e274:	78 05 00 01 	mvhi r5,0x1
    e278:	38 a5 36 ec 	ori r5,r5,0x36ec
    e27c:	41 62 0e fc 	lbu r2,(r11+3836)
    e280:	78 07 00 01 	mvhi r7,0x1
    e284:	34 01 00 01 	mvi r1,1
    e288:	38 e7 36 fc 	ori r7,r7,0x36fc
    e28c:	5c 41 00 03 	bne r2,r1,e298 <doState+0x1f4>
    e290:	78 07 00 01 	mvhi r7,0x1
    e294:	38 e7 37 04 	ori r7,r7,0x3704
    e298:	78 0d 00 01 	mvhi r13,0x1
    e29c:	39 ad 37 1c 	ori r13,r13,0x371c
    e2a0:	78 02 00 01 	mvhi r2,0x1
    e2a4:	78 06 00 01 	mvhi r6,0x1
    e2a8:	34 01 20 01 	mvi r1,8193
    e2ac:	38 42 51 40 	ori r2,r2,0x5140
    e2b0:	b9 a0 20 00 	mv r4,r13
    e2b4:	38 c6 31 08 	ori r6,r6,0x3108
    e2b8:	fb ff c9 72 	calli 880 <wrc_debug_printf>
    e2bc:	29 61 0b a0 	lw r1,(r11+2976)
    e2c0:	5c 20 00 2a 	bne r1,r0,e368 <doState+0x2c4>
    e2c4:	41 61 00 de 	lbu r1,(r11+222)
    e2c8:	34 02 00 08 	mvi r2,8
    e2cc:	2d 63 00 dc 	lhu r3,(r11+220)
    e2d0:	b9 a0 20 00 	mv r4,r13
    e2d4:	44 22 00 07 	be r1,r2,e2f0 <doState+0x24c>
    e2d8:	78 04 00 01 	mvhi r4,0x1
    e2dc:	34 02 00 05 	mvi r2,5
    e2e0:	38 84 37 14 	ori r4,r4,0x3714
    e2e4:	5c 22 00 03 	bne r1,r2,e2f0 <doState+0x24c>
    e2e8:	78 04 00 01 	mvhi r4,0x1
    e2ec:	38 84 37 24 	ori r4,r4,0x3724
    e2f0:	29 62 0b 78 	lw r2,(r11+2936)
    e2f4:	78 05 00 01 	mvhi r5,0x1
    e2f8:	34 01 00 01 	mvi r1,1
    e2fc:	38 a5 36 f4 	ori r5,r5,0x36f4
    e300:	5c 41 00 03 	bne r2,r1,e30c <doState+0x268>
    e304:	78 05 00 01 	mvhi r5,0x1
    e308:	38 a5 36 ec 	ori r5,r5,0x36ec
    e30c:	41 61 0b 76 	lbu r1,(r11+2934)
    e310:	34 02 00 01 	mvi r2,1
    e314:	44 22 00 0d 	be r1,r2,e348 <doState+0x2a4>
    e318:	78 06 00 01 	mvhi r6,0x1
    e31c:	38 c6 31 08 	ori r6,r6,0x3108
    e320:	34 08 00 02 	mvi r8,2
    e324:	b8 c0 38 00 	mv r7,r6
    e328:	5c 28 00 0c 	bne r1,r8,e358 <doState+0x2b4>
    e32c:	41 68 0e fc 	lbu r8,(r11+3836)
    e330:	78 07 00 01 	mvhi r7,0x1
    e334:	38 e7 36 fc 	ori r7,r7,0x36fc
    e338:	5d 02 00 08 	bne r8,r2,e358 <doState+0x2b4>
    e33c:	78 07 00 01 	mvhi r7,0x1
    e340:	38 e7 37 04 	ori r7,r7,0x3704
    e344:	e0 00 00 05 	bi e358 <doState+0x2b4>
    e348:	78 06 00 01 	mvhi r6,0x1
    e34c:	78 07 00 01 	mvhi r7,0x1
    e350:	38 c6 37 0c 	ori r6,r6,0x370c
    e354:	38 e7 31 08 	ori r7,r7,0x3108
    e358:	78 02 00 01 	mvhi r2,0x1
    e35c:	34 01 20 01 	mvi r1,8193
    e360:	38 42 51 8c 	ori r2,r2,0x518c
    e364:	fb ff c9 47 	calli 880 <wrc_debug_printf>
    e368:	29 61 0b 78 	lw r1,(r11+2936)
    e36c:	5c 20 00 26 	bne r1,r0,e404 <doState+0x360>
    e370:	41 61 00 de 	lbu r1,(r11+222)
    e374:	78 04 00 01 	mvhi r4,0x1
    e378:	34 02 00 08 	mvi r2,8
    e37c:	2d 63 00 dc 	lhu r3,(r11+220)
    e380:	38 84 37 1c 	ori r4,r4,0x371c
    e384:	44 22 00 07 	be r1,r2,e3a0 <doState+0x2fc>
    e388:	78 04 00 01 	mvhi r4,0x1
    e38c:	34 02 00 05 	mvi r2,5
    e390:	38 84 37 14 	ori r4,r4,0x3714
    e394:	5c 22 00 03 	bne r1,r2,e3a0 <doState+0x2fc>
    e398:	78 04 00 01 	mvhi r4,0x1
    e39c:	38 84 37 24 	ori r4,r4,0x3724
    e3a0:	41 61 0b 76 	lbu r1,(r11+2934)
    e3a4:	34 02 00 01 	mvi r2,1
    e3a8:	44 22 00 0d 	be r1,r2,e3dc <doState+0x338>
    e3ac:	78 06 00 01 	mvhi r6,0x1
    e3b0:	38 c6 31 08 	ori r6,r6,0x3108
    e3b4:	34 05 00 02 	mvi r5,2
    e3b8:	b8 c0 38 00 	mv r7,r6
    e3bc:	5c 25 00 0c 	bne r1,r5,e3ec <doState+0x348>
    e3c0:	41 65 0e fc 	lbu r5,(r11+3836)
    e3c4:	78 07 00 01 	mvhi r7,0x1
    e3c8:	38 e7 36 fc 	ori r7,r7,0x36fc
    e3cc:	5c a2 00 08 	bne r5,r2,e3ec <doState+0x348>
    e3d0:	78 07 00 01 	mvhi r7,0x1
    e3d4:	38 e7 37 04 	ori r7,r7,0x3704
    e3d8:	e0 00 00 05 	bi e3ec <doState+0x348>
    e3dc:	78 06 00 01 	mvhi r6,0x1
    e3e0:	78 07 00 01 	mvhi r7,0x1
    e3e4:	38 c6 37 0c 	ori r6,r6,0x370c
    e3e8:	38 e7 31 08 	ori r7,r7,0x3108
    e3ec:	78 02 00 01 	mvhi r2,0x1
    e3f0:	78 05 00 01 	mvhi r5,0x1
    e3f4:	34 01 20 01 	mvi r1,8193
    e3f8:	38 42 51 dc 	ori r2,r2,0x51dc
    e3fc:	38 a5 36 f4 	ori r5,r5,0x36f4
    e400:	fb ff c9 20 	calli 880 <wrc_debug_printf>
    e404:	41 61 00 de 	lbu r1,(r11+222)
    e408:	78 04 00 01 	mvhi r4,0x1
    e40c:	34 02 00 08 	mvi r2,8
    e410:	2d 63 00 dc 	lhu r3,(r11+220)
    e414:	38 84 37 1c 	ori r4,r4,0x371c
    e418:	44 22 00 07 	be r1,r2,e434 <doState+0x390>
    e41c:	78 04 00 01 	mvhi r4,0x1
    e420:	34 02 00 05 	mvi r2,5
    e424:	38 84 37 14 	ori r4,r4,0x3714
    e428:	5c 22 00 03 	bne r1,r2,e434 <doState+0x390>
    e42c:	78 04 00 01 	mvhi r4,0x1
    e430:	38 84 37 24 	ori r4,r4,0x3724
    e434:	29 62 0b 78 	lw r2,(r11+2936)
    e438:	78 05 00 01 	mvhi r5,0x1
    e43c:	34 01 00 01 	mvi r1,1
    e440:	38 a5 36 f4 	ori r5,r5,0x36f4
    e444:	5c 41 00 03 	bne r2,r1,e450 <doState+0x3ac>
    e448:	78 05 00 01 	mvhi r5,0x1
    e44c:	38 a5 36 ec 	ori r5,r5,0x36ec
    e450:	41 61 0b 76 	lbu r1,(r11+2934)
    e454:	34 02 00 01 	mvi r2,1
    e458:	44 22 00 0d 	be r1,r2,e48c <doState+0x3e8>
    e45c:	78 06 00 01 	mvhi r6,0x1
    e460:	38 c6 31 08 	ori r6,r6,0x3108
    e464:	34 08 00 02 	mvi r8,2
    e468:	b8 c0 38 00 	mv r7,r6
    e46c:	5c 28 00 0c 	bne r1,r8,e49c <doState+0x3f8>
    e470:	41 68 0e fc 	lbu r8,(r11+3836)
    e474:	78 07 00 01 	mvhi r7,0x1
    e478:	38 e7 36 fc 	ori r7,r7,0x36fc
    e47c:	5d 02 00 08 	bne r8,r2,e49c <doState+0x3f8>
    e480:	78 07 00 01 	mvhi r7,0x1
    e484:	38 e7 37 04 	ori r7,r7,0x3704
    e488:	e0 00 00 05 	bi e49c <doState+0x3f8>
    e48c:	78 06 00 01 	mvhi r6,0x1
    e490:	78 07 00 01 	mvhi r7,0x1
    e494:	38 c6 37 0c 	ori r6,r6,0x370c
    e498:	38 e7 31 08 	ori r7,r7,0x3108
    e49c:	78 02 00 01 	mvhi r2,0x1
    e4a0:	34 01 20 01 	mvi r1,8193
    e4a4:	38 42 52 28 	ori r2,r2,0x5228
    e4a8:	fb ff c8 f6 	calli 880 <wrc_debug_printf>
    e4ac:	34 01 00 07 	mvi r1,7
    e4b0:	b9 80 10 00 	mv r2,r12
    e4b4:	b9 60 18 00 	mv r3,r11
    e4b8:	fb ff ec 8d 	calli 96ec <toState>
    e4bc:	41 62 00 de 	lbu r2,(r11+222)
    e4c0:	34 01 00 07 	mvi r1,7
    e4c4:	34 42 ff ff 	addi r2,r2,-1
    e4c8:	20 42 00 ff 	andi r2,r2,0xff
    e4cc:	54 41 01 3d 	bgu r2,r1,e9c0 <doState+0x91c>
    e4d0:	78 01 00 01 	mvhi r1,0x1
    e4d4:	3c 42 00 02 	sli r2,r2,2
    e4d8:	38 21 54 f0 	ori r1,r1,0x54f0
    e4dc:	b4 22 08 00 	add r1,r1,r2
    e4e0:	28 21 00 00 	lw r1,(r1+0)
    e4e4:	c0 20 00 00 	b r1
    e4e8:	34 01 00 00 	mvi r1,0
    e4ec:	e0 00 00 2f 	bi e5a8 <doState+0x504>
    e4f0:	41 62 0b 76 	lbu r2,(r11+2934)
    e4f4:	34 01 00 02 	mvi r1,2
    e4f8:	44 41 00 e3 	be r2,r1,e884 <doState+0x7e0>
    e4fc:	34 01 00 08 	mvi r1,8
    e500:	b9 80 10 00 	mv r2,r12
    e504:	b9 60 18 00 	mv r3,r11
    e508:	fb ff ec 79 	calli 96ec <toState>
    e50c:	e0 00 00 e1 	bi e890 <doState+0x7ec>
    e510:	41 61 0b 62 	lbu r1,(r11+2914)
    e514:	34 02 00 01 	mvi r2,1
    e518:	5c 22 00 28 	bne r1,r2,e5b8 <doState+0x514>
    e51c:	29 62 0b 78 	lw r2,(r11+2936)
    e520:	78 05 00 01 	mvhi r5,0x1
    e524:	2d 63 00 dc 	lhu r3,(r11+220)
    e528:	38 a5 36 f4 	ori r5,r5,0x36f4
    e52c:	5c 41 00 03 	bne r2,r1,e538 <doState+0x494>
    e530:	78 05 00 01 	mvhi r5,0x1
    e534:	38 a5 36 ec 	ori r5,r5,0x36ec
    e538:	41 61 0b 76 	lbu r1,(r11+2934)
    e53c:	34 02 00 01 	mvi r2,1
    e540:	44 22 00 0d 	be r1,r2,e574 <doState+0x4d0>
    e544:	78 06 00 01 	mvhi r6,0x1
    e548:	38 c6 31 08 	ori r6,r6,0x3108
    e54c:	34 04 00 02 	mvi r4,2
    e550:	b8 c0 38 00 	mv r7,r6
    e554:	5c 24 00 0c 	bne r1,r4,e584 <doState+0x4e0>
    e558:	41 64 0e fc 	lbu r4,(r11+3836)
    e55c:	78 07 00 01 	mvhi r7,0x1
    e560:	38 e7 36 fc 	ori r7,r7,0x36fc
    e564:	5c 82 00 08 	bne r4,r2,e584 <doState+0x4e0>
    e568:	78 07 00 01 	mvhi r7,0x1
    e56c:	38 e7 37 04 	ori r7,r7,0x3704
    e570:	e0 00 00 05 	bi e584 <doState+0x4e0>
    e574:	78 06 00 01 	mvhi r6,0x1
    e578:	78 07 00 01 	mvhi r7,0x1
    e57c:	38 c6 37 0c 	ori r6,r6,0x370c
    e580:	38 e7 31 08 	ori r7,r7,0x3108
    e584:	78 02 00 01 	mvhi r2,0x1
    e588:	78 04 00 01 	mvhi r4,0x1
    e58c:	34 01 00 01 	mvi r1,1
    e590:	38 42 52 54 	ori r2,r2,0x5254
    e594:	38 84 37 14 	ori r4,r4,0x3714
    e598:	fb ff c8 ba 	calli 880 <wrc_debug_printf>
    e59c:	b9 60 08 00 	mv r1,r11
    e5a0:	fb ff de 55 	calli 5ef4 <m1>
    e5a4:	34 01 00 05 	mvi r1,5
    e5a8:	b9 80 10 00 	mv r2,r12
    e5ac:	b9 60 18 00 	mv r3,r11
    e5b0:	fb ff ec 4f 	calli 96ec <toState>
    e5b4:	e0 00 01 03 	bi e9c0 <doState+0x91c>
    e5b8:	b9 80 08 00 	mv r1,r12
    e5bc:	b9 60 10 00 	mv r2,r11
    e5c0:	fb ff fc 0a 	calli d5e8 <handle>
    e5c4:	35 61 0b 40 	addi r1,r11,2880
    e5c8:	fb ff e5 9d 	calli 7c3c <timerExpired>
    e5cc:	44 20 00 40 	be r1,r0,e6cc <doState+0x628>
    e5d0:	41 61 00 de 	lbu r1,(r11+222)
    e5d4:	78 04 00 01 	mvhi r4,0x1
    e5d8:	34 02 00 08 	mvi r2,8
    e5dc:	2d 63 00 dc 	lhu r3,(r11+220)
    e5e0:	38 84 37 1c 	ori r4,r4,0x371c
    e5e4:	44 22 00 07 	be r1,r2,e600 <doState+0x55c>
    e5e8:	78 04 00 01 	mvhi r4,0x1
    e5ec:	34 02 00 05 	mvi r2,5
    e5f0:	38 84 37 14 	ori r4,r4,0x3714
    e5f4:	5c 22 00 03 	bne r1,r2,e600 <doState+0x55c>
    e5f8:	78 04 00 01 	mvhi r4,0x1
    e5fc:	38 84 37 24 	ori r4,r4,0x3724
    e600:	29 62 0b 78 	lw r2,(r11+2936)
    e604:	78 05 00 01 	mvhi r5,0x1
    e608:	34 01 00 01 	mvi r1,1
    e60c:	38 a5 36 f4 	ori r5,r5,0x36f4
    e610:	5c 41 00 03 	bne r2,r1,e61c <doState+0x578>
    e614:	78 05 00 01 	mvhi r5,0x1
    e618:	38 a5 36 ec 	ori r5,r5,0x36ec
    e61c:	41 61 0b 76 	lbu r1,(r11+2934)
    e620:	34 02 00 01 	mvi r2,1
    e624:	44 22 00 0d 	be r1,r2,e658 <doState+0x5b4>
    e628:	78 06 00 01 	mvhi r6,0x1
    e62c:	38 c6 31 08 	ori r6,r6,0x3108
    e630:	34 08 00 02 	mvi r8,2
    e634:	b8 c0 38 00 	mv r7,r6
    e638:	5c 28 00 0c 	bne r1,r8,e668 <doState+0x5c4>
    e63c:	41 68 0e fc 	lbu r8,(r11+3836)
    e640:	78 07 00 01 	mvhi r7,0x1
    e644:	38 e7 36 fc 	ori r7,r7,0x36fc
    e648:	5d 02 00 08 	bne r8,r2,e668 <doState+0x5c4>
    e64c:	78 07 00 01 	mvhi r7,0x1
    e650:	38 e7 37 04 	ori r7,r7,0x3704
    e654:	e0 00 00 05 	bi e668 <doState+0x5c4>
    e658:	78 06 00 01 	mvhi r6,0x1
    e65c:	78 07 00 01 	mvhi r7,0x1
    e660:	38 c6 37 0c 	ori r6,r6,0x370c
    e664:	38 e7 31 08 	ori r7,r7,0x3108
    e668:	78 02 00 01 	mvhi r2,0x1
    e66c:	34 01 00 01 	mvi r1,1
    e670:	38 42 52 b8 	ori r2,r2,0x52b8
    e674:	fb ff c8 83 	calli 880 <wrc_debug_printf>
    e678:	41 62 0b 62 	lbu r2,(r11+2914)
    e67c:	0d 60 00 fc 	sh (r11+252),r0
    e680:	0d 60 01 00 	sh (r11+256),r0
    e684:	31 60 0b 76 	sb (r11+2934),r0
    e688:	59 60 0b 78 	sw (r11+2936),r0
    e68c:	34 01 00 02 	mvi r1,2
    e690:	44 41 00 09 	be r2,r1,e6b4 <doState+0x610>
    e694:	29 61 00 00 	lw r1,(r11+0)
    e698:	40 22 00 06 	lbu r2,(r1+6)
    e69c:	34 01 00 ff 	mvi r1,255
    e6a0:	44 41 00 05 	be r2,r1,e6b4 <doState+0x610>
    e6a4:	b9 60 08 00 	mv r1,r11
    e6a8:	fb ff de 13 	calli 5ef4 <m1>
    e6ac:	34 01 00 05 	mvi r1,5
    e6b0:	e0 00 00 04 	bi e6c0 <doState+0x61c>
    e6b4:	41 62 00 de 	lbu r2,(r11+222)
    e6b8:	34 01 00 03 	mvi r1,3
    e6bc:	44 41 00 04 	be r2,r1,e6cc <doState+0x628>
    e6c0:	b9 80 10 00 	mv r2,r12
    e6c4:	b9 60 18 00 	mv r3,r11
    e6c8:	fb ff ec 09 	calli 96ec <toState>
    e6cc:	29 81 00 6c 	lw r1,(r12+108)
    e6d0:	44 20 00 32 	be r1,r0,e798 <doState+0x6f4>
    e6d4:	35 61 0b 20 	addi r1,r11,2848
    e6d8:	fb ff e5 59 	calli 7c3c <timerExpired>
    e6dc:	44 20 00 b9 	be r1,r0,e9c0 <doState+0x91c>
    e6e0:	41 61 00 de 	lbu r1,(r11+222)
    e6e4:	78 04 00 01 	mvhi r4,0x1
    e6e8:	34 02 00 08 	mvi r2,8
    e6ec:	2d 63 00 dc 	lhu r3,(r11+220)
    e6f0:	38 84 37 1c 	ori r4,r4,0x371c
    e6f4:	44 22 00 07 	be r1,r2,e710 <doState+0x66c>
    e6f8:	78 04 00 01 	mvhi r4,0x1
    e6fc:	34 02 00 05 	mvi r2,5
    e700:	38 84 37 14 	ori r4,r4,0x3714
    e704:	5c 22 00 03 	bne r1,r2,e710 <doState+0x66c>
    e708:	78 04 00 01 	mvhi r4,0x1
    e70c:	38 84 37 24 	ori r4,r4,0x3724
    e710:	29 62 0b 78 	lw r2,(r11+2936)
    e714:	78 05 00 01 	mvhi r5,0x1
    e718:	34 01 00 01 	mvi r1,1
    e71c:	38 a5 36 f4 	ori r5,r5,0x36f4
    e720:	5c 41 00 03 	bne r2,r1,e72c <doState+0x688>
    e724:	78 05 00 01 	mvhi r5,0x1
    e728:	38 a5 36 ec 	ori r5,r5,0x36ec
    e72c:	41 61 0b 76 	lbu r1,(r11+2934)
    e730:	34 02 00 01 	mvi r2,1
    e734:	44 22 00 0d 	be r1,r2,e768 <doState+0x6c4>
    e738:	78 06 00 01 	mvhi r6,0x1
    e73c:	38 c6 31 08 	ori r6,r6,0x3108
    e740:	34 08 00 02 	mvi r8,2
    e744:	b8 c0 38 00 	mv r7,r6
    e748:	5c 28 00 0c 	bne r1,r8,e778 <doState+0x6d4>
    e74c:	41 68 0e fc 	lbu r8,(r11+3836)
    e750:	78 07 00 01 	mvhi r7,0x1
    e754:	38 e7 36 fc 	ori r7,r7,0x36fc
    e758:	5d 02 00 08 	bne r8,r2,e778 <doState+0x6d4>
    e75c:	78 07 00 01 	mvhi r7,0x1
    e760:	38 e7 37 04 	ori r7,r7,0x3704
    e764:	e0 00 00 05 	bi e778 <doState+0x6d4>
    e768:	78 06 00 01 	mvhi r6,0x1
    e76c:	78 07 00 01 	mvhi r7,0x1
    e770:	38 c6 37 0c 	ori r6,r6,0x370c
    e774:	38 e7 31 08 	ori r7,r7,0x3108
    e778:	78 02 00 01 	mvhi r2,0x1
    e77c:	34 01 00 01 	mvi r1,1
    e780:	38 42 53 20 	ori r2,r2,0x5320
    e784:	fb ff c8 3f 	calli 880 <wrc_debug_printf>
    e788:	b9 80 08 00 	mv r1,r12
    e78c:	b9 60 10 00 	mv r2,r11
    e790:	fb ff f4 7c 	calli b980 <issueDelayReq>
    e794:	e0 00 00 8b 	bi e9c0 <doState+0x91c>
    e798:	29 82 00 70 	lw r2,(r12+112)
    e79c:	44 41 00 89 	be r2,r1,e9c0 <doState+0x91c>
    e7a0:	35 61 0b 00 	addi r1,r11,2816
    e7a4:	fb ff e5 26 	calli 7c3c <timerExpired>
    e7a8:	44 20 00 86 	be r1,r0,e9c0 <doState+0x91c>
    e7ac:	41 61 00 de 	lbu r1,(r11+222)
    e7b0:	78 04 00 01 	mvhi r4,0x1
    e7b4:	34 02 00 08 	mvi r2,8
    e7b8:	2d 63 00 dc 	lhu r3,(r11+220)
    e7bc:	38 84 37 1c 	ori r4,r4,0x371c
    e7c0:	44 22 00 07 	be r1,r2,e7dc <doState+0x738>
    e7c4:	78 04 00 01 	mvhi r4,0x1
    e7c8:	34 02 00 05 	mvi r2,5
    e7cc:	38 84 37 14 	ori r4,r4,0x3714
    e7d0:	5c 22 00 03 	bne r1,r2,e7dc <doState+0x738>
    e7d4:	78 04 00 01 	mvhi r4,0x1
    e7d8:	38 84 37 24 	ori r4,r4,0x3724
    e7dc:	29 62 0b 78 	lw r2,(r11+2936)
    e7e0:	78 05 00 01 	mvhi r5,0x1
    e7e4:	34 01 00 01 	mvi r1,1
    e7e8:	38 a5 36 f4 	ori r5,r5,0x36f4
    e7ec:	5c 41 00 03 	bne r2,r1,e7f8 <doState+0x754>
    e7f0:	78 05 00 01 	mvhi r5,0x1
    e7f4:	38 a5 36 ec 	ori r5,r5,0x36ec
    e7f8:	41 61 0b 76 	lbu r1,(r11+2934)
    e7fc:	34 02 00 01 	mvi r2,1
    e800:	44 22 00 0d 	be r1,r2,e834 <doState+0x790>
    e804:	78 06 00 01 	mvhi r6,0x1
    e808:	38 c6 31 08 	ori r6,r6,0x3108
    e80c:	34 08 00 02 	mvi r8,2
    e810:	b8 c0 38 00 	mv r7,r6
    e814:	5c 28 00 0c 	bne r1,r8,e844 <doState+0x7a0>
    e818:	41 68 0e fc 	lbu r8,(r11+3836)
    e81c:	78 07 00 01 	mvhi r7,0x1
    e820:	38 e7 36 fc 	ori r7,r7,0x36fc
    e824:	5d 02 00 08 	bne r8,r2,e844 <doState+0x7a0>
    e828:	78 07 00 01 	mvhi r7,0x1
    e82c:	38 e7 37 04 	ori r7,r7,0x3704
    e830:	e0 00 00 05 	bi e844 <doState+0x7a0>
    e834:	78 06 00 01 	mvhi r6,0x1
    e838:	78 07 00 01 	mvhi r7,0x1
    e83c:	38 c6 37 0c 	ori r6,r6,0x370c
    e840:	38 e7 31 08 	ori r7,r7,0x3108
    e844:	78 02 00 01 	mvhi r2,0x1
    e848:	34 01 00 01 	mvi r1,1
    e84c:	38 42 53 5c 	ori r2,r2,0x535c
    e850:	fb ff c8 0c 	calli 880 <wrc_debug_printf>
    e854:	b9 80 08 00 	mv r1,r12
    e858:	b9 60 10 00 	mv r2,r11
    e85c:	fb ff f4 ee 	calli bc14 <issuePDelayReq>
    e860:	34 01 00 01 	mvi r1,1
    e864:	f8 00 07 5a 	calli 105cc <ptpd_netif_enable_timing_output>
    e868:	e0 00 00 56 	bi e9c0 <doState+0x91c>
    e86c:	41 62 0b 76 	lbu r2,(r11+2934)
    e870:	34 01 00 01 	mvi r1,1
    e874:	5c 41 00 09 	bne r2,r1,e898 <doState+0x7f4>
    e878:	41 62 0b 75 	lbu r2,(r11+2933)
    e87c:	34 01 00 09 	mvi r1,9
    e880:	44 41 00 06 	be r2,r1,e898 <doState+0x7f4>
    e884:	b9 80 08 00 	mv r1,r12
    e888:	b9 60 10 00 	mv r2,r11
    e88c:	f8 00 03 49 	calli f5b0 <doWRState>
    e890:	0d 60 0b bc 	sh (r11+3004),r0
    e894:	e0 00 00 4b 	bi e9c0 <doState+0x91c>
    e898:	b9 80 08 00 	mv r1,r12
    e89c:	b9 60 10 00 	mv r2,r11
    e8a0:	fb ff fb 52 	calli d5e8 <handle>
    e8a4:	35 61 0b 30 	addi r1,r11,2864
    e8a8:	fb ff e4 e5 	calli 7c3c <timerExpired>
    e8ac:	44 20 00 33 	be r1,r0,e978 <doState+0x8d4>
    e8b0:	41 61 00 de 	lbu r1,(r11+222)
    e8b4:	78 04 00 01 	mvhi r4,0x1
    e8b8:	34 02 00 08 	mvi r2,8
    e8bc:	2d 63 00 dc 	lhu r3,(r11+220)
    e8c0:	38 84 37 1c 	ori r4,r4,0x371c
    e8c4:	44 22 00 07 	be r1,r2,e8e0 <doState+0x83c>
    e8c8:	78 04 00 01 	mvhi r4,0x1
    e8cc:	34 02 00 05 	mvi r2,5
    e8d0:	38 84 37 14 	ori r4,r4,0x3714
    e8d4:	5c 22 00 03 	bne r1,r2,e8e0 <doState+0x83c>
    e8d8:	78 04 00 01 	mvhi r4,0x1
    e8dc:	38 84 37 24 	ori r4,r4,0x3724
    e8e0:	29 62 0b 78 	lw r2,(r11+2936)
    e8e4:	78 05 00 01 	mvhi r5,0x1
    e8e8:	34 01 00 01 	mvi r1,1
    e8ec:	38 a5 36 f4 	ori r5,r5,0x36f4
    e8f0:	5c 41 00 03 	bne r2,r1,e8fc <doState+0x858>
    e8f4:	78 05 00 01 	mvhi r5,0x1
    e8f8:	38 a5 36 ec 	ori r5,r5,0x36ec
    e8fc:	41 61 0b 76 	lbu r1,(r11+2934)
    e900:	34 02 00 01 	mvi r2,1
    e904:	44 22 00 0d 	be r1,r2,e938 <doState+0x894>
    e908:	78 06 00 01 	mvhi r6,0x1
    e90c:	38 c6 31 08 	ori r6,r6,0x3108
    e910:	34 08 00 02 	mvi r8,2
    e914:	b8 c0 38 00 	mv r7,r6
    e918:	5c 28 00 0c 	bne r1,r8,e948 <doState+0x8a4>
    e91c:	41 68 0e fc 	lbu r8,(r11+3836)
    e920:	78 07 00 01 	mvhi r7,0x1
    e924:	38 e7 36 fc 	ori r7,r7,0x36fc
    e928:	5d 02 00 08 	bne r8,r2,e948 <doState+0x8a4>
    e92c:	78 07 00 01 	mvhi r7,0x1
    e930:	38 e7 37 04 	ori r7,r7,0x3704
    e934:	e0 00 00 05 	bi e948 <doState+0x8a4>
    e938:	78 06 00 01 	mvhi r6,0x1
    e93c:	78 07 00 01 	mvhi r7,0x1
    e940:	38 c6 37 0c 	ori r6,r6,0x370c
    e944:	38 e7 31 08 	ori r7,r7,0x3108
    e948:	78 02 00 01 	mvhi r2,0x1
    e94c:	34 01 00 01 	mvi r1,1
    e950:	38 42 53 98 	ori r2,r2,0x5398
    e954:	fb ff c7 cb 	calli 880 <wrc_debug_printf>
    e958:	b9 80 08 00 	mv r1,r12
    e95c:	b9 60 10 00 	mv r2,r11
    e960:	fb ff f2 dc 	calli b4d0 <issueSync>
    e964:	29 61 0d 54 	lw r1,(r11+3412)
    e968:	44 20 00 04 	be r1,r0,e978 <doState+0x8d4>
    e96c:	b9 80 08 00 	mv r1,r12
    e970:	b9 60 10 00 	mv r2,r11
    e974:	fb ff f3 7c 	calli b764 <issueFollowup>
    e978:	35 61 0b 50 	addi r1,r11,2896
    e97c:	fb ff e4 b0 	calli 7c3c <timerExpired>
    e980:	44 20 00 04 	be r1,r0,e990 <doState+0x8ec>
    e984:	b9 80 08 00 	mv r1,r12
    e988:	b9 60 10 00 	mv r2,r11
    e98c:	fb ff f2 3f 	calli b288 <issueAnnounce>
    e990:	41 62 0b 62 	lbu r2,(r11+2914)
    e994:	34 01 00 02 	mvi r1,2
    e998:	44 41 00 05 	be r2,r1,e9ac <doState+0x908>
    e99c:	29 61 00 00 	lw r1,(r11+0)
    e9a0:	40 22 00 06 	lbu r2,(r1+6)
    e9a4:	34 01 00 ff 	mvi r1,255
    e9a8:	5c 41 00 06 	bne r2,r1,e9c0 <doState+0x91c>
    e9ac:	34 01 00 03 	mvi r1,3
    e9b0:	e3 ff fe fe 	bi e5a8 <doState+0x504>
    e9b4:	b9 80 08 00 	mv r1,r12
    e9b8:	b9 60 10 00 	mv r2,r11
    e9bc:	fb ff fb 0b 	calli d5e8 <handle>
    e9c0:	2b 9d 00 04 	lw ra,(sp+4)
    e9c4:	2b 8b 00 14 	lw r11,(sp+20)
    e9c8:	2b 8c 00 10 	lw r12,(sp+16)
    e9cc:	2b 8d 00 0c 	lw r13,(sp+12)
    e9d0:	2b 8e 00 08 	lw r14,(sp+8)
    e9d4:	37 9c 00 14 	addi sp,sp,20
    e9d8:	c3 a0 00 00 	ret

0000e9dc <globalBestForeignMastersUpdate>:
    e9dc:	37 9c ff bc 	addi sp,sp,-68
    e9e0:	5b 8b 00 44 	sw (sp+68),r11
    e9e4:	5b 8c 00 40 	sw (sp+64),r12
    e9e8:	5b 8d 00 3c 	sw (sp+60),r13
    e9ec:	5b 8e 00 38 	sw (sp+56),r14
    e9f0:	5b 8f 00 34 	sw (sp+52),r15
    e9f4:	5b 90 00 30 	sw (sp+48),r16
    e9f8:	5b 91 00 2c 	sw (sp+44),r17
    e9fc:	5b 92 00 28 	sw (sp+40),r18
    ea00:	5b 93 00 24 	sw (sp+36),r19
    ea04:	5b 94 00 20 	sw (sp+32),r20
    ea08:	5b 95 00 1c 	sw (sp+28),r21
    ea0c:	5b 96 00 18 	sw (sp+24),r22
    ea10:	5b 97 00 14 	sw (sp+20),r23
    ea14:	5b 98 00 10 	sw (sp+16),r24
    ea18:	5b 99 00 0c 	sw (sp+12),r25
    ea1c:	5b 9b 00 08 	sw (sp+8),fp
    ea20:	5b 9d 00 04 	sw (sp+4),ra
    ea24:	78 18 00 01 	mvhi r24,0x1
    ea28:	78 16 00 01 	mvhi r22,0x1
    ea2c:	78 15 00 01 	mvhi r21,0x1
    ea30:	78 14 00 01 	mvhi r20,0x1
    ea34:	78 0c 00 01 	mvhi r12,0x1
    ea38:	78 13 00 01 	mvhi r19,0x1
    ea3c:	78 12 00 01 	mvhi r18,0x1
    ea40:	78 11 00 01 	mvhi r17,0x1
    ea44:	78 10 00 01 	mvhi r16,0x1
    ea48:	78 0f 00 01 	mvhi r15,0x1
    ea4c:	b8 20 58 00 	mv r11,r1
    ea50:	b8 20 68 00 	mv r13,r1
    ea54:	34 19 00 00 	mvi r25,0
    ea58:	34 0e 00 00 	mvi r14,0
    ea5c:	34 1b 00 08 	mvi fp,8
    ea60:	3b 18 37 1c 	ori r24,r24,0x371c
    ea64:	34 17 00 01 	mvi r23,1
    ea68:	3a d6 36 f4 	ori r22,r22,0x36f4
    ea6c:	3a b5 53 c8 	ori r21,r21,0x53c8
    ea70:	3a 94 37 0c 	ori r20,r20,0x370c
    ea74:	39 8c 31 08 	ori r12,r12,0x3108
    ea78:	3a 73 36 fc 	ori r19,r19,0x36fc
    ea7c:	3a 52 37 04 	ori r18,r18,0x3704
    ea80:	3a 31 36 ec 	ori r17,r17,0x36ec
    ea84:	3a 10 37 14 	ori r16,r16,0x3714
    ea88:	39 ef 37 24 	ori r15,r15,0x3724
    ea8c:	e0 00 00 24 	bi eb1c <globalBestForeignMastersUpdate+0x140>
    ea90:	29 a1 01 04 	lw r1,(r13+260)
    ea94:	44 20 00 20 	be r1,r0,eb14 <globalBestForeignMastersUpdate+0x138>
    ea98:	29 a1 00 f8 	lw r1,(r13+248)
    ea9c:	b9 60 10 00 	mv r2,r11
    eaa0:	fb ff de f3 	calli 666c <ErBest>
    eaa4:	41 61 00 de 	lbu r1,(r11+222)
    eaa8:	2d 63 00 dc 	lhu r3,(r11+220)
    eaac:	bb 00 20 00 	mv r4,r24
    eab0:	44 3b 00 05 	be r1,fp,eac4 <globalBestForeignMastersUpdate+0xe8>
    eab4:	34 02 00 05 	mvi r2,5
    eab8:	ba 00 20 00 	mv r4,r16
    eabc:	5c 22 00 02 	bne r1,r2,eac4 <globalBestForeignMastersUpdate+0xe8>
    eac0:	b9 e0 20 00 	mv r4,r15
    eac4:	29 61 0b 78 	lw r1,(r11+2936)
    eac8:	ba c0 28 00 	mv r5,r22
    eacc:	5c 37 00 02 	bne r1,r23,ead4 <globalBestForeignMastersUpdate+0xf8>
    ead0:	ba 20 28 00 	mv r5,r17
    ead4:	41 61 0b 76 	lbu r1,(r11+2934)
    ead8:	ba 80 30 00 	mv r6,r20
    eadc:	b9 80 38 00 	mv r7,r12
    eae0:	44 37 00 08 	be r1,r23,eb00 <globalBestForeignMastersUpdate+0x124>
    eae4:	34 02 00 02 	mvi r2,2
    eae8:	b9 80 30 00 	mv r6,r12
    eaec:	5c 22 00 05 	bne r1,r2,eb00 <globalBestForeignMastersUpdate+0x124>
    eaf0:	41 61 0e fc 	lbu r1,(r11+3836)
    eaf4:	ba 60 38 00 	mv r7,r19
    eaf8:	5c 37 00 02 	bne r1,r23,eb00 <globalBestForeignMastersUpdate+0x124>
    eafc:	ba 40 38 00 	mv r7,r18
    eb00:	2d a8 00 dc 	lhu r8,(r13+220)
    eb04:	34 01 00 01 	mvi r1,1
    eb08:	ba a0 10 00 	mv r2,r21
    eb0c:	fb ff c7 5d 	calli 880 <wrc_debug_printf>
    eb10:	34 0e 00 01 	mvi r14,1
    eb14:	37 39 00 01 	addi r25,r25,1
    eb18:	35 ad 0f 08 	addi r13,r13,3848
    eb1c:	29 61 00 00 	lw r1,(r11+0)
    eb20:	2c 21 00 04 	lhu r1,(r1+4)
    eb24:	48 39 ff db 	bg r1,r25,ea90 <globalBestForeignMastersUpdate+0xb4>
    eb28:	45 c0 00 03 	be r14,r0,eb34 <globalBestForeignMastersUpdate+0x158>
    eb2c:	b9 60 08 00 	mv r1,r11
    eb30:	fb ff df 01 	calli 6734 <EBest>
    eb34:	b9 c0 08 00 	mv r1,r14
    eb38:	2b 9d 00 04 	lw ra,(sp+4)
    eb3c:	2b 8b 00 44 	lw r11,(sp+68)
    eb40:	2b 8c 00 40 	lw r12,(sp+64)
    eb44:	2b 8d 00 3c 	lw r13,(sp+60)
    eb48:	2b 8e 00 38 	lw r14,(sp+56)
    eb4c:	2b 8f 00 34 	lw r15,(sp+52)
    eb50:	2b 90 00 30 	lw r16,(sp+48)
    eb54:	2b 91 00 2c 	lw r17,(sp+44)
    eb58:	2b 92 00 28 	lw r18,(sp+40)
    eb5c:	2b 93 00 24 	lw r19,(sp+36)
    eb60:	2b 94 00 20 	lw r20,(sp+32)
    eb64:	2b 95 00 1c 	lw r21,(sp+28)
    eb68:	2b 96 00 18 	lw r22,(sp+24)
    eb6c:	2b 97 00 14 	lw r23,(sp+20)
    eb70:	2b 98 00 10 	lw r24,(sp+16)
    eb74:	2b 99 00 0c 	lw r25,(sp+12)
    eb78:	2b 9b 00 08 	lw fp,(sp+8)
    eb7c:	37 9c 00 44 	addi sp,sp,68
    eb80:	c3 a0 00 00 	ret

0000eb84 <globalSecondSlavesUpdate>:
    eb84:	37 9c ff e0 	addi sp,sp,-32
    eb88:	5b 8b 00 20 	sw (sp+32),r11
    eb8c:	5b 8c 00 1c 	sw (sp+28),r12
    eb90:	5b 8d 00 18 	sw (sp+24),r13
    eb94:	5b 8e 00 14 	sw (sp+20),r14
    eb98:	5b 8f 00 10 	sw (sp+16),r15
    eb9c:	5b 90 00 0c 	sw (sp+12),r16
    eba0:	5b 91 00 08 	sw (sp+8),r17
    eba4:	5b 9d 00 04 	sw (sp+4),ra
    eba8:	b8 20 58 00 	mv r11,r1
    ebac:	28 21 00 00 	lw r1,(r1+0)
    ebb0:	b9 60 10 00 	mv r2,r11
    ebb4:	34 05 00 02 	mvi r5,2
    ebb8:	2c 23 00 04 	lhu r3,(r1+4)
    ebbc:	34 01 00 00 	mvi r1,0
    ebc0:	e0 00 00 05 	bi ebd4 <globalSecondSlavesUpdate+0x50>
    ebc4:	40 46 0e fc 	lbu r6,(r2+3836)
    ebc8:	34 21 00 01 	addi r1,r1,1
    ebcc:	34 42 0f 08 	addi r2,r2,3848
    ebd0:	44 c5 00 04 	be r6,r5,ebe0 <globalSecondSlavesUpdate+0x5c>
    ebd4:	dc 20 70 00 	sexth r14,r1
    ebd8:	b8 20 20 00 	mv r4,r1
    ebdc:	48 61 ff fa 	bg r3,r1,ebc4 <globalSecondSlavesUpdate+0x40>
    ebe0:	34 01 00 00 	mvi r1,0
    ebe4:	44 83 00 27 	be r4,r3,ec80 <globalSecondSlavesUpdate+0xfc>
    ebe8:	35 cd 00 01 	addi r13,r14,1
    ebec:	dd a0 68 00 	sexth r13,r13
    ebf0:	09 ac 0f 08 	muli r12,r13,3848
    ebf4:	b9 a0 88 00 	mv r17,r13
    ebf8:	34 0f 00 00 	mvi r15,0
    ebfc:	b5 6c 60 00 	add r12,r11,r12
    ec00:	34 10 00 02 	mvi r16,2
    ec04:	e0 00 00 14 	bi ec54 <globalSecondSlavesUpdate+0xd0>
    ec08:	41 81 0e fc 	lbu r1,(r12+3836)
    ec0c:	5c 30 00 0e 	bne r1,r16,ec44 <globalSecondSlavesUpdate+0xc0>
    ec10:	09 c6 0f 08 	muli r6,r14,3848
    ec14:	2d 83 0e ac 	lhu r3,(r12+3756)
    ec18:	35 81 0e d4 	addi r1,r12,3796
    ec1c:	b5 66 30 00 	add r6,r11,r6
    ec20:	34 c4 0e d4 	addi r4,r6,3796
    ec24:	34 c5 0e b0 	addi r5,r6,3760
    ec28:	2c c6 0e ac 	lhu r6,(r6+3756)
    ec2c:	35 82 0e b0 	addi r2,r12,3760
    ec30:	b9 60 38 00 	mv r7,r11
    ec34:	fb ff dd 74 	calli 6204 <bmcDataSetComparison>
    ec38:	48 01 00 02 	bg r0,r1,ec40 <globalSecondSlavesUpdate+0xbc>
    ec3c:	e0 00 00 02 	bi ec44 <globalSecondSlavesUpdate+0xc0>
    ec40:	b9 a0 70 00 	mv r14,r13
    ec44:	35 ad 00 01 	addi r13,r13,1
    ec48:	dd a0 68 00 	sexth r13,r13
    ec4c:	35 ef 00 01 	addi r15,r15,1
    ec50:	35 8c 0f 08 	addi r12,r12,3848
    ec54:	29 61 00 00 	lw r1,(r11+0)
    ec58:	b5 f1 10 00 	add r2,r15,r17
    ec5c:	2c 23 00 04 	lhu r3,(r1+4)
    ec60:	48 62 ff ea 	bg r3,r2,ec08 <globalSecondSlavesUpdate+0x84>
    ec64:	09 ce 0f 08 	muli r14,r14,3848
    ec68:	b5 6e 58 00 	add r11,r11,r14
    ec6c:	2d 62 00 dc 	lhu r2,(r11+220)
    ec70:	35 6b 0e a0 	addi r11,r11,3744
    ec74:	58 2b 00 80 	sw (r1+128),r11
    ec78:	0c 22 00 32 	sh (r1+50),r2
    ec7c:	34 01 00 01 	mvi r1,1
    ec80:	2b 9d 00 04 	lw ra,(sp+4)
    ec84:	2b 8b 00 20 	lw r11,(sp+32)
    ec88:	2b 8c 00 1c 	lw r12,(sp+28)
    ec8c:	2b 8d 00 18 	lw r13,(sp+24)
    ec90:	2b 8e 00 14 	lw r14,(sp+20)
    ec94:	2b 8f 00 10 	lw r15,(sp+16)
    ec98:	2b 90 00 0c 	lw r16,(sp+12)
    ec9c:	2b 91 00 08 	lw r17,(sp+8)
    eca0:	37 9c 00 20 	addi sp,sp,32
    eca4:	c3 a0 00 00 	ret

0000eca8 <clearForeignMasters>:
    eca8:	2c 23 00 fc 	lhu r3,(r1+252)
    ecac:	34 02 00 00 	mvi r2,0
    ecb0:	08 63 00 58 	muli r3,r3,88
    ecb4:	e0 00 00 05 	bi ecc8 <clearForeignMasters+0x20>
    ecb8:	28 24 00 f8 	lw r4,(r1+248)
    ecbc:	b4 82 20 00 	add r4,r4,r2
    ecc0:	0c 80 00 0c 	sh (r4+12),r0
    ecc4:	34 42 00 58 	addi r2,r2,88
    ecc8:	5c 43 ff fc 	bne r2,r3,ecb8 <clearForeignMasters+0x10>
    eccc:	0c 20 01 00 	sh (r1+256),r0
    ecd0:	0c 20 00 fc 	sh (r1+252),r0
    ecd4:	0c 20 01 02 	sh (r1+258),r0
    ecd8:	c3 a0 00 00 	ret

0000ecdc <singlePortLoop>:
    ecdc:	37 9c ff f0 	addi sp,sp,-16
    ece0:	5b 8b 00 10 	sw (sp+16),r11
    ece4:	5b 8c 00 0c 	sw (sp+12),r12
    ece8:	5b 8d 00 08 	sw (sp+8),r13
    ecec:	5b 9d 00 04 	sw (sp+4),ra
    ecf0:	b8 20 60 00 	mv r12,r1
    ecf4:	34 41 00 04 	addi r1,r2,4
    ecf8:	b8 40 58 00 	mv r11,r2
    ecfc:	f8 00 00 bc 	calli efec <isPortUp>
    ed00:	b8 20 68 00 	mv r13,r1
    ed04:	29 61 0f 00 	lw r1,(r11+3840)
    ed08:	45 a0 00 06 	be r13,r0,ed20 <singlePortLoop+0x44>
    ed0c:	34 03 00 00 	mvi r3,0
    ed10:	34 04 00 00 	mvi r4,0
    ed14:	5c 20 00 08 	bne r1,r0,ed34 <singlePortLoop+0x58>
    ed18:	34 04 00 01 	mvi r4,1
    ed1c:	e0 00 00 06 	bi ed34 <singlePortLoop+0x58>
    ed20:	fc 2d 08 00 	cmpne r1,r1,r13
    ed24:	34 03 00 01 	mvi r3,1
    ed28:	c8 01 08 00 	sub r1,r0,r1
    ed2c:	34 04 00 00 	mvi r4,0
    ed30:	a0 61 18 00 	and r3,r3,r1
    ed34:	59 6d 0f 00 	sw (r11+3840),r13
    ed38:	5c 80 00 03 	bne r4,r0,ed44 <singlePortLoop+0x68>
    ed3c:	29 61 0f 04 	lw r1,(r11+3844)
    ed40:	44 24 00 0f 	be r1,r4,ed7c <singlePortLoop+0xa0>
    ed44:	34 01 00 00 	mvi r1,0
    ed48:	b9 80 10 00 	mv r2,r12
    ed4c:	b9 60 18 00 	mv r3,r11
    ed50:	fb ff ea 67 	calli 96ec <toState>
    ed54:	b9 60 10 00 	mv r2,r11
    ed58:	b9 80 08 00 	mv r1,r12
    ed5c:	fb ff ed 02 	calli a164 <doInit>
    ed60:	41 62 0b 62 	lbu r2,(r11+2914)
    ed64:	34 01 00 02 	mvi r1,2
    ed68:	5c 41 00 03 	bne r2,r1,ed74 <singlePortLoop+0x98>
    ed6c:	b9 60 08 00 	mv r1,r11
    ed70:	fb ff ff ce 	calli eca8 <clearForeignMasters>
    ed74:	59 60 0f 04 	sw (r11+3844),r0
    ed78:	e0 00 00 0b 	bi eda4 <singlePortLoop+0xc8>
    ed7c:	44 60 00 0a 	be r3,r0,eda4 <singlePortLoop+0xc8>
    ed80:	41 62 0b 62 	lbu r2,(r11+2914)
    ed84:	34 01 00 02 	mvi r1,2
    ed88:	5c 41 00 03 	bne r2,r1,ed94 <singlePortLoop+0xb8>
    ed8c:	b9 60 08 00 	mv r1,r11
    ed90:	fb ff ff c6 	calli eca8 <clearForeignMasters>
    ed94:	41 62 0b 76 	lbu r2,(r11+2934)
    ed98:	34 01 00 02 	mvi r1,2
    ed9c:	5c 41 00 02 	bne r2,r1,eda4 <singlePortLoop+0xc8>
    eda0:	fb ff e4 1c 	calli 7e10 <wr_servo_reset>
    eda4:	45 a0 00 0a 	be r13,r0,edcc <singlePortLoop+0xf0>
    eda8:	41 61 00 de 	lbu r1,(r11+222)
    edac:	44 20 00 05 	be r1,r0,edc0 <singlePortLoop+0xe4>
    edb0:	b9 80 08 00 	mv r1,r12
    edb4:	b9 60 10 00 	mv r2,r11
    edb8:	fb ff fc bb 	calli e0a4 <doState>
    edbc:	e0 00 00 04 	bi edcc <singlePortLoop+0xf0>
    edc0:	b9 80 08 00 	mv r1,r12
    edc4:	b9 60 10 00 	mv r2,r11
    edc8:	fb ff ec e7 	calli a164 <doInit>
    edcc:	2b 9d 00 04 	lw ra,(sp+4)
    edd0:	2b 8b 00 10 	lw r11,(sp+16)
    edd4:	2b 8c 00 0c 	lw r12,(sp+12)
    edd8:	2b 8d 00 08 	lw r13,(sp+8)
    eddc:	37 9c 00 10 	addi sp,sp,16
    ede0:	c3 a0 00 00 	ret

0000ede4 <checkClockClassValidity>:
    ede4:	37 9c ff f8 	addi sp,sp,-8
    ede8:	5b 8b 00 08 	sw (sp+8),r11
    edec:	5b 9d 00 04 	sw (sp+4),ra
    edf0:	40 22 00 06 	lbu r2,(r1+6)
    edf4:	b8 20 58 00 	mv r11,r1
    edf8:	34 01 00 06 	mvi r1,6
    edfc:	5c 41 00 09 	bne r2,r1,ee20 <checkClockClassValidity+0x3c>
    ee00:	35 61 00 88 	addi r1,r11,136
    ee04:	fb ff e3 8e 	calli 7c3c <timerExpired>
    ee08:	44 20 00 06 	be r1,r0,ee20 <checkClockClassValidity+0x3c>
    ee0c:	fb ff e3 6c 	calli 7bbc <extsrcLocked>
    ee10:	34 02 00 01 	mvi r2,1
    ee14:	44 22 00 03 	be r1,r2,ee20 <checkClockClassValidity+0x3c>
    ee18:	34 01 00 07 	mvi r1,7
    ee1c:	31 61 00 06 	sb (r11+6),r1
    ee20:	2b 9d 00 04 	lw ra,(sp+4)
    ee24:	2b 8b 00 08 	lw r11,(sp+8)
    ee28:	37 9c 00 08 	addi sp,sp,8
    ee2c:	c3 a0 00 00 	ret

0000ee30 <sharedPortsLoop>:
    ee30:	37 9c ff f8 	addi sp,sp,-8
    ee34:	5b 8b 00 08 	sw (sp+8),r11
    ee38:	5b 9d 00 04 	sw (sp+4),ra
    ee3c:	b8 20 58 00 	mv r11,r1
    ee40:	28 21 00 00 	lw r1,(r1+0)
    ee44:	28 21 00 78 	lw r1,(r1+120)
    ee48:	44 20 00 30 	be r1,r0,ef08 <sharedPortsLoop+0xd8>
    ee4c:	41 61 00 de 	lbu r1,(r11+222)
    ee50:	78 04 00 01 	mvhi r4,0x1
    ee54:	34 02 00 08 	mvi r2,8
    ee58:	2d 63 00 dc 	lhu r3,(r11+220)
    ee5c:	38 84 37 1c 	ori r4,r4,0x371c
    ee60:	44 22 00 07 	be r1,r2,ee7c <sharedPortsLoop+0x4c>
    ee64:	78 04 00 01 	mvhi r4,0x1
    ee68:	34 02 00 05 	mvi r2,5
    ee6c:	38 84 37 14 	ori r4,r4,0x3714
    ee70:	5c 22 00 03 	bne r1,r2,ee7c <sharedPortsLoop+0x4c>
    ee74:	78 04 00 01 	mvhi r4,0x1
    ee78:	38 84 37 24 	ori r4,r4,0x3724
    ee7c:	29 62 0b 78 	lw r2,(r11+2936)
    ee80:	78 05 00 01 	mvhi r5,0x1
    ee84:	34 01 00 01 	mvi r1,1
    ee88:	38 a5 36 f4 	ori r5,r5,0x36f4
    ee8c:	5c 41 00 03 	bne r2,r1,ee98 <sharedPortsLoop+0x68>
    ee90:	78 05 00 01 	mvhi r5,0x1
    ee94:	38 a5 36 ec 	ori r5,r5,0x36ec
    ee98:	41 61 0b 76 	lbu r1,(r11+2934)
    ee9c:	34 02 00 01 	mvi r2,1
    eea0:	44 22 00 0d 	be r1,r2,eed4 <sharedPortsLoop+0xa4>
    eea4:	78 06 00 01 	mvhi r6,0x1
    eea8:	38 c6 31 08 	ori r6,r6,0x3108
    eeac:	34 08 00 02 	mvi r8,2
    eeb0:	b8 c0 38 00 	mv r7,r6
    eeb4:	5c 28 00 0c 	bne r1,r8,eee4 <sharedPortsLoop+0xb4>
    eeb8:	41 68 0e fc 	lbu r8,(r11+3836)
    eebc:	78 07 00 01 	mvhi r7,0x1
    eec0:	38 e7 36 fc 	ori r7,r7,0x36fc
    eec4:	5d 02 00 08 	bne r8,r2,eee4 <sharedPortsLoop+0xb4>
    eec8:	78 07 00 01 	mvhi r7,0x1
    eecc:	38 e7 37 04 	ori r7,r7,0x3704
    eed0:	e0 00 00 05 	bi eee4 <sharedPortsLoop+0xb4>
    eed4:	78 06 00 01 	mvhi r6,0x1
    eed8:	78 07 00 01 	mvhi r7,0x1
    eedc:	38 c6 37 0c 	ori r6,r6,0x370c
    eee0:	38 e7 31 08 	ori r7,r7,0x3108
    eee4:	78 02 00 01 	mvhi r2,0x1
    eee8:	34 01 00 01 	mvi r1,1
    eeec:	38 42 54 0c 	ori r2,r2,0x540c
    eef0:	fb ff c6 64 	calli 880 <wrc_debug_printf>
    eef4:	b9 60 08 00 	mv r1,r11
    eef8:	fb ff ff 23 	calli eb84 <globalSecondSlavesUpdate>
    eefc:	5c 20 00 03 	bne r1,r0,ef08 <sharedPortsLoop+0xd8>
    ef00:	29 61 00 00 	lw r1,(r11+0)
    ef04:	58 20 00 78 	sw (r1+120),r0
    ef08:	b9 60 08 00 	mv r1,r11
    ef0c:	fb ff fe b4 	calli e9dc <globalBestForeignMastersUpdate>
    ef10:	44 20 00 2f 	be r1,r0,efcc <sharedPortsLoop+0x19c>
    ef14:	41 61 00 de 	lbu r1,(r11+222)
    ef18:	78 04 00 01 	mvhi r4,0x1
    ef1c:	34 02 00 08 	mvi r2,8
    ef20:	2d 63 00 dc 	lhu r3,(r11+220)
    ef24:	38 84 37 1c 	ori r4,r4,0x371c
    ef28:	44 22 00 07 	be r1,r2,ef44 <sharedPortsLoop+0x114>
    ef2c:	78 04 00 01 	mvhi r4,0x1
    ef30:	34 02 00 05 	mvi r2,5
    ef34:	38 84 37 14 	ori r4,r4,0x3714
    ef38:	5c 22 00 03 	bne r1,r2,ef44 <sharedPortsLoop+0x114>
    ef3c:	78 04 00 01 	mvhi r4,0x1
    ef40:	38 84 37 24 	ori r4,r4,0x3724
    ef44:	29 62 0b 78 	lw r2,(r11+2936)
    ef48:	78 05 00 01 	mvhi r5,0x1
    ef4c:	34 01 00 01 	mvi r1,1
    ef50:	38 a5 36 f4 	ori r5,r5,0x36f4
    ef54:	5c 41 00 03 	bne r2,r1,ef60 <sharedPortsLoop+0x130>
    ef58:	78 05 00 01 	mvhi r5,0x1
    ef5c:	38 a5 36 ec 	ori r5,r5,0x36ec
    ef60:	41 61 0b 76 	lbu r1,(r11+2934)
    ef64:	34 02 00 01 	mvi r2,1
    ef68:	44 22 00 0d 	be r1,r2,ef9c <sharedPortsLoop+0x16c>
    ef6c:	78 06 00 01 	mvhi r6,0x1
    ef70:	38 c6 31 08 	ori r6,r6,0x3108
    ef74:	34 08 00 02 	mvi r8,2
    ef78:	b8 c0 38 00 	mv r7,r6
    ef7c:	5c 28 00 0c 	bne r1,r8,efac <sharedPortsLoop+0x17c>
    ef80:	41 68 0e fc 	lbu r8,(r11+3836)
    ef84:	78 07 00 01 	mvhi r7,0x1
    ef88:	38 e7 36 fc 	ori r7,r7,0x36fc
    ef8c:	5d 02 00 08 	bne r8,r2,efac <sharedPortsLoop+0x17c>
    ef90:	78 07 00 01 	mvhi r7,0x1
    ef94:	38 e7 37 04 	ori r7,r7,0x3704
    ef98:	e0 00 00 05 	bi efac <sharedPortsLoop+0x17c>
    ef9c:	78 06 00 01 	mvhi r6,0x1
    efa0:	78 07 00 01 	mvhi r7,0x1
    efa4:	38 c6 37 0c 	ori r6,r6,0x370c
    efa8:	38 e7 31 08 	ori r7,r7,0x3108
    efac:	78 02 00 01 	mvhi r2,0x1
    efb0:	34 01 00 01 	mvi r1,1
    efb4:	38 42 54 3c 	ori r2,r2,0x543c
    efb8:	fb ff c6 32 	calli 880 <wrc_debug_printf>
    efbc:	29 62 00 00 	lw r2,(r11+0)
    efc0:	34 01 00 01 	mvi r1,1
    efc4:	58 41 00 78 	sw (r2+120),r1
    efc8:	e0 00 00 03 	bi efd4 <sharedPortsLoop+0x1a4>
    efcc:	29 61 00 00 	lw r1,(r11+0)
    efd0:	58 20 00 78 	sw (r1+120),r0
    efd4:	29 61 00 00 	lw r1,(r11+0)
    efd8:	fb ff ff 83 	calli ede4 <checkClockClassValidity>
    efdc:	2b 9d 00 04 	lw ra,(sp+4)
    efe0:	2b 8b 00 08 	lw r11,(sp+8)
    efe4:	37 9c 00 08 	addi sp,sp,8
    efe8:	c3 a0 00 00 	ret

0000efec <isPortUp>:
    efec:	37 9c ff fc 	addi sp,sp,-4
    eff0:	5b 9d 00 04 	sw (sp+4),ra
    eff4:	34 21 00 08 	addi r1,r1,8
    eff8:	f8 00 03 8e 	calli fe30 <ptpd_netif_get_port_state>
    effc:	64 21 00 00 	cmpei r1,r1,0
    f000:	2b 9d 00 04 	lw ra,(sp+4)
    f004:	37 9c 00 04 	addi sp,sp,4
    f008:	c3 a0 00 00 	ret

0000f00c <returnCurrentWRMainState>:
    f00c:	40 21 0b 75 	lbu r1,(r1+2933)
    f010:	34 02 00 16 	mvi r2,22
    f014:	54 22 00 14 	bgu r1,r2,f064 <returnCurrentWRMainState+0x58>
    f018:	78 03 00 01 	mvhi r3,0x1
    f01c:	38 63 55 10 	ori r3,r3,0x5510
    f020:	34 02 00 01 	mvi r2,1
    f024:	28 64 00 00 	lw r4,(r3+0)
    f028:	bc 41 10 00 	sl r2,r2,r1
    f02c:	a0 44 20 00 	and r4,r2,r4
    f030:	5c 80 00 0c 	bne r4,r0,f060 <returnCurrentWRMainState+0x54>
    f034:	78 05 00 01 	mvhi r5,0x1
    f038:	38 a5 55 14 	ori r5,r5,0x5514
    f03c:	28 a3 00 00 	lw r3,(r5+0)
    f040:	a0 43 18 00 	and r3,r2,r3
    f044:	5c 64 00 05 	bne r3,r4,f058 <returnCurrentWRMainState+0x4c>
    f048:	20 42 0c 02 	andi r2,r2,0xc02
    f04c:	44 43 00 06 	be r2,r3,f064 <returnCurrentWRMainState+0x58>
    f050:	34 01 00 01 	mvi r1,1
    f054:	c3 a0 00 00 	ret
    f058:	34 01 00 04 	mvi r1,4
    f05c:	c3 a0 00 00 	ret
    f060:	34 01 00 06 	mvi r1,6
    f064:	c3 a0 00 00 	ret

0000f068 <wrTimetoutManage>:
    f068:	37 9c ff f4 	addi sp,sp,-12
    f06c:	5b 8b 00 0c 	sw (sp+12),r11
    f070:	5b 8c 00 08 	sw (sp+8),r12
    f074:	5b 9d 00 04 	sw (sp+4),ra
    f078:	20 2c 00 ff 	andi r12,r1,0xff
    f07c:	20 42 00 ff 	andi r2,r2,0xff
    f080:	b8 80 58 00 	mv r11,r4
    f084:	45 82 00 03 	be r12,r2,f090 <wrTimetoutManage+0x28>
    f088:	30 80 0d f8 	sb (r4+3576),r0
    f08c:	e0 00 00 04 	bi f09c <wrTimetoutManage+0x34>
    f090:	40 81 0d f8 	lbu r1,(r4+3576)
    f094:	34 21 00 01 	addi r1,r1,1
    f098:	30 81 0d f8 	sb (r4+3576),r1
    f09c:	34 01 00 09 	mvi r1,9
    f0a0:	44 41 00 05 	be r2,r1,f0b4 <wrTimetoutManage+0x4c>
    f0a4:	34 42 00 e0 	addi r2,r2,224
    f0a8:	3c 41 00 04 	sli r1,r2,4
    f0ac:	b5 61 08 00 	add r1,r11,r1
    f0b0:	fb ff e2 e1 	calli 7c34 <timerStop>
    f0b4:	34 01 00 09 	mvi r1,9
    f0b8:	45 81 00 09 	be r12,r1,f0dc <wrTimetoutManage+0x74>
    f0bc:	35 81 00 e0 	addi r1,r12,224
    f0c0:	35 8c 03 a0 	addi r12,r12,928
    f0c4:	3d 8c 00 02 	sli r12,r12,2
    f0c8:	3c 21 00 04 	sli r1,r1,4
    f0cc:	b5 6c 60 00 	add r12,r11,r12
    f0d0:	29 82 00 00 	lw r2,(r12+0)
    f0d4:	b5 61 08 00 	add r1,r11,r1
    f0d8:	fb ff e2 c8 	calli 7bf8 <timerStart>
    f0dc:	2b 9d 00 04 	lw ra,(sp+4)
    f0e0:	2b 8b 00 0c 	lw r11,(sp+12)
    f0e4:	2b 8c 00 08 	lw r12,(sp+8)
    f0e8:	37 9c 00 0c 	addi sp,sp,12
    f0ec:	c3 a0 00 00 	ret

0000f0f0 <printf_bits>:
    f0f0:	78 02 00 01 	mvhi r2,0x1
    f0f4:	38 42 69 83 	ori r2,r2,0x6983
    f0f8:	34 03 00 00 	mvi r3,0
    f0fc:	34 06 00 30 	mvi r6,48
    f100:	34 05 00 31 	mvi r5,49
    f104:	34 04 00 20 	mvi r4,32
    f108:	80 23 38 00 	sru r7,r1,r3
    f10c:	20 e7 00 01 	andi r7,r7,0x1
    f110:	44 e0 00 03 	be r7,r0,f11c <printf_bits+0x2c>
    f114:	30 45 00 00 	sb (r2+0),r5
    f118:	e0 00 00 02 	bi f120 <printf_bits+0x30>
    f11c:	30 46 00 00 	sb (r2+0),r6
    f120:	34 63 00 01 	addi r3,r3,1
    f124:	34 42 ff ff 	addi r2,r2,-1
    f128:	5c 64 ff f8 	bne r3,r4,f108 <printf_bits+0x18>
    f12c:	78 01 00 01 	mvhi r1,0x1
    f130:	38 21 69 64 	ori r1,r1,0x6964
    f134:	30 20 00 20 	sb (r1+32),r0
    f138:	c3 a0 00 00 	ret

0000f13c <initWrData>:
    f13c:	37 9c ff e4 	addi sp,sp,-28
    f140:	5b 8b 00 0c 	sw (sp+12),r11
    f144:	5b 8c 00 08 	sw (sp+8),r12
    f148:	5b 9d 00 04 	sw (sp+4),ra
    f14c:	b8 20 58 00 	mv r11,r1
    f150:	58 20 0b 78 	sw (r1+2936),r0
    f154:	34 01 00 09 	mvi r1,9
    f158:	31 61 0b 75 	sb (r11+2933),r1
    f15c:	29 61 0b 64 	lw r1,(r11+2916)
    f160:	20 4c 00 ff 	andi r12,r2,0xff
    f164:	37 83 00 10 	addi r3,sp,16
    f168:	64 21 00 00 	cmpei r1,r1,0
    f16c:	37 82 00 18 	addi r2,sp,24
    f170:	59 61 0b 7c 	sw (r11+2940),r1
    f174:	34 04 00 00 	mvi r4,0
    f178:	35 61 00 0c 	addi r1,r11,12
    f17c:	34 05 00 00 	mvi r5,0
    f180:	f8 00 04 ce 	calli 104b8 <ptpd_netif_read_calibration_data>
    f184:	29 61 0b 64 	lw r1,(r11+2916)
    f188:	5c 20 00 12 	bne r1,r0,f1d0 <initWrData+0x94>
    f18c:	2b 81 00 1c 	lw r1,(sp+28)
    f190:	3c 22 00 10 	sli r2,r1,16
    f194:	00 21 00 10 	srui r1,r1,16
    f198:	59 62 0b 80 	sw (r11+2944),r2
    f19c:	2b 82 00 18 	lw r2,(sp+24)
    f1a0:	3c 42 00 10 	sli r2,r2,16
    f1a4:	b8 41 08 00 	or r1,r2,r1
    f1a8:	59 61 0b 84 	sw (r11+2948),r1
    f1ac:	2b 81 00 14 	lw r1,(sp+20)
    f1b0:	3c 22 00 10 	sli r2,r1,16
    f1b4:	00 21 00 10 	srui r1,r1,16
    f1b8:	59 62 0b 88 	sw (r11+2952),r2
    f1bc:	2b 82 00 10 	lw r2,(sp+16)
    f1c0:	3c 42 00 10 	sli r2,r2,16
    f1c4:	b8 41 08 00 	or r1,r2,r1
    f1c8:	59 61 0b 8c 	sw (r11+2956),r1
    f1cc:	e0 00 00 05 	bi f1e0 <initWrData+0xa4>
    f1d0:	59 60 0b 80 	sw (r11+2944),r0
    f1d4:	59 60 0b 84 	sw (r11+2948),r0
    f1d8:	59 60 0b 88 	sw (r11+2952),r0
    f1dc:	59 60 0b 8c 	sw (r11+2956),r0
    f1e0:	29 61 0b 68 	lw r1,(r11+2920)
    f1e4:	31 60 0b 6d 	sb (r11+2925),r0
    f1e8:	59 60 0b a0 	sw (r11+2976),r0
    f1ec:	59 61 0e 8c 	sw (r11+3724),r1
    f1f0:	59 61 0e 90 	sw (r11+3728),r1
    f1f4:	59 61 0e 94 	sw (r11+3732),r1
    f1f8:	59 61 0e 98 	sw (r11+3736),r1
    f1fc:	59 61 0e 9c 	sw (r11+3740),r1
    f200:	34 01 03 e8 	mvi r1,1000
    f204:	59 61 0e 80 	sw (r11+3712),r1
    f208:	34 01 27 10 	mvi r1,10000
    f20c:	59 60 0b a4 	sw (r11+2980),r0
    f210:	59 60 0b ac 	sw (r11+2988),r0
    f214:	31 60 0b b0 	sb (r11+2992),r0
    f218:	0d 60 0b aa 	sh (r11+2986),r0
    f21c:	59 60 0b 90 	sw (r11+2960),r0
    f220:	59 60 0b 94 	sw (r11+2964),r0
    f224:	59 60 0b 98 	sw (r11+2968),r0
    f228:	59 60 0b 9c 	sw (r11+2972),r0
    f22c:	59 61 0e 84 	sw (r11+3716),r1
    f230:	59 61 0e 88 	sw (r11+3720),r1
    f234:	5d 80 00 03 	bne r12,r0,f240 <initWrData+0x104>
    f238:	31 60 0b 76 	sb (r11+2934),r0
    f23c:	31 60 0e fc 	sb (r11+3836),r0
    f240:	2b 9d 00 04 	lw ra,(sp+4)
    f244:	2b 8b 00 0c 	lw r11,(sp+12)
    f248:	2b 8c 00 08 	lw r12,(sp+8)
    f24c:	37 9c 00 1c 	addi sp,sp,28
    f250:	c3 a0 00 00 	ret

0000f254 <toWRState>:
    f254:	37 9c ff e4 	addi sp,sp,-28
    f258:	5b 8b 00 1c 	sw (sp+28),r11
    f25c:	5b 8c 00 18 	sw (sp+24),r12
    f260:	5b 8d 00 14 	sw (sp+20),r13
    f264:	5b 8e 00 10 	sw (sp+16),r14
    f268:	5b 8f 00 0c 	sw (sp+12),r15
    f26c:	5b 90 00 08 	sw (sp+8),r16
    f270:	5b 9d 00 04 	sw (sp+4),ra
    f274:	20 2d 00 ff 	andi r13,r1,0xff
    f278:	b8 60 08 00 	mv r1,r3
    f27c:	b8 40 60 00 	mv r12,r2
    f280:	b8 60 58 00 	mv r11,r3
    f284:	fb ff ff 62 	calli f00c <returnCurrentWRMainState>
    f288:	41 62 0b 75 	lbu r2,(r11+2933)
    f28c:	b8 20 80 00 	mv r16,r1
    f290:	34 01 00 09 	mvi r1,9
    f294:	5c 41 00 04 	bne r2,r1,f2a4 <toWRState+0x50>
    f298:	b9 60 08 00 	mv r1,r11
    f29c:	34 02 00 01 	mvi r2,1
    f2a0:	fb ff ff a7 	calli f13c <initWrData>
    f2a4:	34 01 00 09 	mvi r1,9
    f2a8:	55 a1 00 78 	bgu r13,r1,f488 <toWRState+0x234>
    f2ac:	3d a1 00 02 	sli r1,r13,2
    f2b0:	78 03 00 01 	mvhi r3,0x1
    f2b4:	38 63 55 18 	ori r3,r3,0x5518
    f2b8:	b4 61 18 00 	add r3,r3,r1
    f2bc:	28 61 00 00 	lw r1,(r3+0)
    f2c0:	c0 20 00 00 	b r1
    f2c4:	34 01 00 09 	mvi r1,9
    f2c8:	e0 00 00 6f 	bi f484 <toWRState+0x230>
    f2cc:	34 01 10 00 	mvi r1,4096
    f2d0:	b9 80 10 00 	mv r2,r12
    f2d4:	b9 60 18 00 	mv r3,r11
    f2d8:	fb ff f5 de 	calli ca50 <issueWRSignalingMsg>
    f2dc:	31 60 0b 75 	sb (r11+2933),r0
    f2e0:	e0 00 00 6a 	bi f488 <toWRState+0x234>
    f2e4:	41 6e 0e fc 	lbu r14,(r11+3836)
    f2e8:	34 0f 00 01 	mvi r15,1
    f2ec:	5d cf 00 08 	bne r14,r15,f30c <toWRState+0xb8>
    f2f0:	41 61 0b 76 	lbu r1,(r11+2934)
    f2f4:	35 62 00 0c 	addi r2,r11,12
    f2f8:	34 03 00 00 	mvi r3,0
    f2fc:	f8 00 02 d8 	calli fe5c <ptpd_netif_locking_enable>
    f300:	44 20 00 0a 	be r1,r0,f328 <toWRState+0xd4>
    f304:	31 6e 0b 75 	sb (r11+2933),r14
    f308:	e0 00 00 60 	bi f488 <toWRState+0x234>
    f30c:	34 01 00 02 	mvi r1,2
    f310:	5d c1 00 5e 	bne r14,r1,f488 <toWRState+0x234>
    f314:	41 61 0b 76 	lbu r1,(r11+2934)
    f318:	35 62 00 0c 	addi r2,r11,12
    f31c:	34 03 00 01 	mvi r3,1
    f320:	f8 00 02 cf 	calli fe5c <ptpd_netif_locking_enable>
    f324:	5c 20 00 03 	bne r1,r0,f330 <toWRState+0xdc>
    f328:	34 01 00 0a 	mvi r1,10
    f32c:	e0 00 00 56 	bi f484 <toWRState+0x230>
    f330:	31 6f 0b 75 	sb (r11+2933),r15
    f334:	e0 00 00 55 	bi f488 <toWRState+0x234>
    f338:	34 01 10 02 	mvi r1,4098
    f33c:	b9 80 10 00 	mv r2,r12
    f340:	b9 60 18 00 	mv r3,r11
    f344:	fb ff f5 c3 	calli ca50 <issueWRSignalingMsg>
    f348:	34 01 00 03 	mvi r1,3
    f34c:	e0 00 00 4e 	bi f484 <toWRState+0x230>
    f350:	34 01 10 01 	mvi r1,4097
    f354:	b9 80 10 00 	mv r2,r12
    f358:	b9 60 18 00 	mv r3,r11
    f35c:	fb ff f5 bd 	calli ca50 <issueWRSignalingMsg>
    f360:	34 01 00 02 	mvi r1,2
    f364:	e0 00 00 48 	bi f484 <toWRState+0x230>
    f368:	b9 60 18 00 	mv r3,r11
    f36c:	34 01 10 03 	mvi r1,4099
    f370:	b9 80 10 00 	mv r2,r12
    f374:	fb ff f5 b7 	calli ca50 <issueWRSignalingMsg>
    f378:	29 63 0b 70 	lw r3,(r11+2928)
    f37c:	44 60 00 03 	be r3,r0,f388 <toWRState+0x134>
    f380:	59 63 0e 90 	sw (r11+3728),r3
    f384:	e0 00 00 03 	bi f390 <toWRState+0x13c>
    f388:	29 61 0b 68 	lw r1,(r11+2920)
    f38c:	59 61 0e 90 	sw (r11+3728),r1
    f390:	29 62 0b 7c 	lw r2,(r11+2940)
    f394:	34 01 00 01 	mvi r1,1
    f398:	44 41 00 0e 	be r2,r1,f3d0 <toWRState+0x17c>
    f39c:	35 6f 00 0c 	addi r15,r11,12
    f3a0:	b9 e0 08 00 	mv r1,r15
    f3a4:	34 02 00 00 	mvi r2,0
    f3a8:	34 03 00 00 	mvi r3,0
    f3ac:	34 04 00 00 	mvi r4,0
    f3b0:	f8 00 01 f7 	calli fb8c <ptpd_netif_calibration_pattern_enable>
    f3b4:	b8 20 70 00 	mv r14,r1
    f3b8:	34 01 00 04 	mvi r1,4
    f3bc:	5d c0 00 32 	bne r14,r0,f484 <toWRState+0x230>
    f3c0:	34 01 00 01 	mvi r1,1
    f3c4:	b9 e0 10 00 	mv r2,r15
    f3c8:	f8 00 01 ef 	calli fb84 <ptpd_netif_calibrating_enable>
    f3cc:	5c 2e 00 03 	bne r1,r14,f3d8 <toWRState+0x184>
    f3d0:	34 01 00 0d 	mvi r1,13
    f3d4:	e0 00 00 2c 	bi f484 <toWRState+0x230>
    f3d8:	34 01 00 0c 	mvi r1,12
    f3dc:	e0 00 00 2a 	bi f484 <toWRState+0x230>
    f3e0:	34 01 00 05 	mvi r1,5
    f3e4:	e0 00 00 28 	bi f484 <toWRState+0x230>
    f3e8:	2d 62 0b aa 	lhu r2,(r11+2986)
    f3ec:	34 01 00 01 	mvi r1,1
    f3f0:	5c 41 00 0e 	bne r2,r1,f428 <toWRState+0x1d4>
    f3f4:	29 62 0b ac 	lw r2,(r11+2988)
    f3f8:	44 40 00 03 	be r2,r0,f404 <toWRState+0x1b0>
    f3fc:	59 62 0e 98 	sw (r11+3736),r2
    f400:	e0 00 00 03 	bi f40c <toWRState+0x1b8>
    f404:	29 61 0b 68 	lw r1,(r11+2920)
    f408:	59 61 0e 98 	sw (r11+3736),r1
    f40c:	35 61 00 0c 	addi r1,r11,12
    f410:	34 03 00 00 	mvi r3,0
    f414:	34 04 00 00 	mvi r4,0
    f418:	f8 00 01 dd 	calli fb8c <ptpd_netif_calibration_pattern_enable>
    f41c:	44 20 00 03 	be r1,r0,f428 <toWRState+0x1d4>
    f420:	34 01 00 06 	mvi r1,6
    f424:	e0 00 00 18 	bi f484 <toWRState+0x230>
    f428:	34 01 00 14 	mvi r1,20
    f42c:	e0 00 00 16 	bi f484 <toWRState+0x230>
    f430:	34 0e 00 01 	mvi r14,1
    f434:	59 6e 0b 78 	sw (r11+2936),r14
    f438:	35 61 00 04 	addi r1,r11,4
    f43c:	fb ff e1 c7 	calli 7b58 <netEnablePhaseTracking>
    f440:	41 61 0b 76 	lbu r1,(r11+2934)
    f444:	5c 2e 00 05 	bne r1,r14,f458 <toWRState+0x204>
    f448:	34 01 10 05 	mvi r1,4101
    f44c:	b9 80 10 00 	mv r2,r12
    f450:	b9 60 18 00 	mv r3,r11
    f454:	fb ff f5 7f 	calli ca50 <issueWRSignalingMsg>
    f458:	1d 63 01 02 	lh r3,(r11+258)
    f45c:	29 61 00 f8 	lw r1,(r11+248)
    f460:	34 04 00 01 	mvi r4,1
    f464:	08 63 00 58 	muli r3,r3,88
    f468:	59 64 0b a0 	sw (r11+2976),r4
    f46c:	b4 23 18 00 	add r3,r1,r3
    f470:	40 61 00 31 	lbu r1,(r3+49)
    f474:	38 21 00 08 	ori r1,r1,0x8
    f478:	30 61 00 31 	sb (r3+49),r1
    f47c:	59 64 0b a4 	sw (r11+2980),r4
    f480:	34 01 00 07 	mvi r1,7
    f484:	31 61 0b 75 	sb (r11+2933),r1
    f488:	b9 a0 08 00 	mv r1,r13
    f48c:	ba 00 10 00 	mv r2,r16
    f490:	b9 80 18 00 	mv r3,r12
    f494:	b9 60 20 00 	mv r4,r11
    f498:	fb ff fe f4 	calli f068 <wrTimetoutManage>
    f49c:	2b 9d 00 04 	lw ra,(sp+4)
    f4a0:	2b 8b 00 1c 	lw r11,(sp+28)
    f4a4:	2b 8c 00 18 	lw r12,(sp+24)
    f4a8:	2b 8d 00 14 	lw r13,(sp+20)
    f4ac:	2b 8e 00 10 	lw r14,(sp+16)
    f4b0:	2b 8f 00 0c 	lw r15,(sp+12)
    f4b4:	2b 90 00 08 	lw r16,(sp+8)
    f4b8:	37 9c 00 1c 	addi sp,sp,28
    f4bc:	c3 a0 00 00 	ret

0000f4c0 <wrTimerExpired>:
    f4c0:	37 9c ff ec 	addi sp,sp,-20
    f4c4:	5b 8b 00 14 	sw (sp+20),r11
    f4c8:	5b 8c 00 10 	sw (sp+16),r12
    f4cc:	5b 8d 00 0c 	sw (sp+12),r13
    f4d0:	5b 8e 00 08 	sw (sp+8),r14
    f4d4:	5b 9d 00 04 	sw (sp+4),ra
    f4d8:	20 2d 00 ff 	andi r13,r1,0xff
    f4dc:	34 01 00 09 	mvi r1,9
    f4e0:	b8 40 60 00 	mv r12,r2
    f4e4:	b8 60 58 00 	mv r11,r3
    f4e8:	20 8e 00 ff 	andi r14,r4,0xff
    f4ec:	45 a1 00 2a 	be r13,r1,f594 <wrTimerExpired+0xd4>
    f4f0:	35 a1 00 e0 	addi r1,r13,224
    f4f4:	3c 21 00 04 	sli r1,r1,4
    f4f8:	b4 61 08 00 	add r1,r3,r1
    f4fc:	fb ff e1 d0 	calli 7c3c <timerExpired>
    f500:	44 20 00 25 	be r1,r0,f594 <wrTimerExpired+0xd4>
    f504:	34 01 00 04 	mvi r1,4
    f508:	5d a1 00 03 	bne r13,r1,f514 <wrTimerExpired+0x54>
    f50c:	41 61 0b 74 	lbu r1,(r11+2932)
    f510:	e0 00 00 04 	bi f520 <wrTimerExpired+0x60>
    f514:	34 01 00 06 	mvi r1,6
    f518:	5d a1 00 03 	bne r13,r1,f524 <wrTimerExpired+0x64>
    f51c:	41 61 0b b0 	lbu r1,(r11+2992)
    f520:	5c 20 00 02 	bne r1,r0,f528 <wrTimerExpired+0x68>
    f524:	41 61 0b 6c 	lbu r1,(r11+2924)
    f528:	41 62 0d f8 	lbu r2,(r11+3576)
    f52c:	50 41 00 06 	bgeu r2,r1,f544 <wrTimerExpired+0x84>
    f530:	b9 a0 08 00 	mv r1,r13
    f534:	b9 80 10 00 	mv r2,r12
    f538:	b9 60 18 00 	mv r3,r11
    f53c:	fb ff ff 46 	calli f254 <toWRState>
    f540:	e0 00 00 15 	bi f594 <wrTimerExpired+0xd4>
    f544:	34 01 00 09 	mvi r1,9
    f548:	59 60 0b 78 	sw (r11+2936),r0
    f54c:	b9 80 10 00 	mv r2,r12
    f550:	b9 60 18 00 	mv r3,r11
    f554:	fb ff ff 40 	calli f254 <toWRState>
    f558:	29 81 00 9c 	lw r1,(r12+156)
    f55c:	44 20 00 03 	be r1,r0,f568 <wrTimerExpired+0xa8>
    f560:	34 01 00 02 	mvi r1,2
    f564:	e0 00 00 06 	bi f57c <wrTimerExpired+0xbc>
    f568:	34 01 00 01 	mvi r1,1
    f56c:	5d c1 00 03 	bne r14,r1,f578 <wrTimerExpired+0xb8>
    f570:	34 01 00 05 	mvi r1,5
    f574:	e0 00 00 02 	bi f57c <wrTimerExpired+0xbc>
    f578:	34 01 00 08 	mvi r1,8
    f57c:	b9 80 10 00 	mv r2,r12
    f580:	b9 60 18 00 	mv r3,r11
    f584:	fb ff e8 5a 	calli 96ec <toState>
    f588:	b9 60 08 00 	mv r1,r11
    f58c:	34 02 00 00 	mvi r2,0
    f590:	fb ff fe eb 	calli f13c <initWrData>
    f594:	2b 9d 00 04 	lw ra,(sp+4)
    f598:	2b 8b 00 14 	lw r11,(sp+20)
    f59c:	2b 8c 00 10 	lw r12,(sp+16)
    f5a0:	2b 8d 00 0c 	lw r13,(sp+12)
    f5a4:	2b 8e 00 08 	lw r14,(sp+8)
    f5a8:	37 9c 00 14 	addi sp,sp,20
    f5ac:	c3 a0 00 00 	ret

0000f5b0 <doWRState>:
    f5b0:	37 9c ff e4 	addi sp,sp,-28
    f5b4:	5b 8b 00 14 	sw (sp+20),r11
    f5b8:	5b 8c 00 10 	sw (sp+16),r12
    f5bc:	5b 8d 00 0c 	sw (sp+12),r13
    f5c0:	5b 8e 00 08 	sw (sp+8),r14
    f5c4:	5b 9d 00 04 	sw (sp+4),ra
    f5c8:	b8 40 58 00 	mv r11,r2
    f5cc:	40 42 0b 75 	lbu r2,(r2+2933)
    f5d0:	b8 20 60 00 	mv r12,r1
    f5d4:	34 01 00 16 	mvi r1,22
    f5d8:	54 41 00 f2 	bgu r2,r1,f9a0 <doWRState+0x3f0>
    f5dc:	78 01 00 01 	mvhi r1,0x1
    f5e0:	3c 42 00 02 	sli r2,r2,2
    f5e4:	38 21 55 40 	ori r1,r1,0x5540
    f5e8:	b4 22 08 00 	add r1,r1,r2
    f5ec:	28 21 00 00 	lw r1,(r1+0)
    f5f0:	c0 20 00 00 	b r1
    f5f4:	b9 80 08 00 	mv r1,r12
    f5f8:	b9 60 10 00 	mv r2,r11
    f5fc:	fb ff f7 fb 	calli d5e8 <handle>
    f600:	2d 62 0b bc 	lhu r2,(r11+3004)
    f604:	34 01 10 01 	mvi r1,4097
    f608:	5c 41 00 e6 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f60c:	34 01 00 01 	mvi r1,1
    f610:	b9 80 10 00 	mv r2,r12
    f614:	b9 60 18 00 	mv r3,r11
    f618:	fb ff ff 0f 	calli f254 <toWRState>
    f61c:	0d 60 0b bc 	sh (r11+3004),r0
    f620:	e0 00 00 e0 	bi f9a0 <doWRState+0x3f0>
    f624:	41 61 0e fc 	lbu r1,(r11+3836)
    f628:	34 02 00 01 	mvi r2,1
    f62c:	5c 22 00 05 	bne r1,r2,f640 <doWRState+0x90>
    f630:	41 61 0b 76 	lbu r1,(r11+2934)
    f634:	35 62 00 0c 	addi r2,r11,12
    f638:	34 03 00 00 	mvi r3,0
    f63c:	e0 00 00 06 	bi f654 <doWRState+0xa4>
    f640:	34 02 00 02 	mvi r2,2
    f644:	5c 22 00 08 	bne r1,r2,f664 <doWRState+0xb4>
    f648:	41 61 0b 76 	lbu r1,(r11+2934)
    f64c:	35 62 00 0c 	addi r2,r11,12
    f650:	34 03 00 01 	mvi r3,1
    f654:	f8 00 02 02 	calli fe5c <ptpd_netif_locking_enable>
    f658:	5c 20 00 03 	bne r1,r0,f664 <doWRState+0xb4>
    f65c:	34 01 00 0a 	mvi r1,10
    f660:	31 61 0b 75 	sb (r11+2933),r1
    f664:	41 62 0b 75 	lbu r2,(r11+2933)
    f668:	34 01 00 0a 	mvi r1,10
    f66c:	5c 41 00 cd 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f670:	41 6d 0e fc 	lbu r13,(r11+3836)
    f674:	34 0e 00 01 	mvi r14,1
    f678:	5d ae 00 07 	bne r13,r14,f694 <doWRState+0xe4>
    f67c:	41 61 0b 76 	lbu r1,(r11+2934)
    f680:	35 62 00 0c 	addi r2,r11,12
    f684:	34 03 00 00 	mvi r3,0
    f688:	f8 00 02 02 	calli fe90 <ptpd_netif_locking_poll>
    f68c:	5c 2d 00 c5 	bne r1,r13,f9a0 <doWRState+0x3f0>
    f690:	e0 00 00 08 	bi f6b0 <doWRState+0x100>
    f694:	34 01 00 02 	mvi r1,2
    f698:	5d a1 00 c2 	bne r13,r1,f9a0 <doWRState+0x3f0>
    f69c:	41 61 0b 76 	lbu r1,(r11+2934)
    f6a0:	35 62 00 0c 	addi r2,r11,12
    f6a4:	34 03 00 01 	mvi r3,1
    f6a8:	f8 00 01 fa 	calli fe90 <ptpd_netif_locking_poll>
    f6ac:	5c 2e 00 bd 	bne r1,r14,f9a0 <doWRState+0x3f0>
    f6b0:	34 01 00 0b 	mvi r1,11
    f6b4:	31 61 0b 75 	sb (r11+2933),r1
    f6b8:	41 61 0e fc 	lbu r1,(r11+3836)
    f6bc:	34 02 00 01 	mvi r2,1
    f6c0:	5c 22 00 05 	bne r1,r2,f6d4 <doWRState+0x124>
    f6c4:	41 61 0b 76 	lbu r1,(r11+2934)
    f6c8:	35 62 00 0c 	addi r2,r11,12
    f6cc:	34 03 00 00 	mvi r3,0
    f6d0:	e0 00 00 06 	bi f6e8 <doWRState+0x138>
    f6d4:	34 02 00 02 	mvi r2,2
    f6d8:	5c 22 00 b2 	bne r1,r2,f9a0 <doWRState+0x3f0>
    f6dc:	41 61 0b 76 	lbu r1,(r11+2934)
    f6e0:	35 62 00 0c 	addi r2,r11,12
    f6e4:	34 03 00 01 	mvi r3,1
    f6e8:	f8 00 01 db 	calli fe54 <ptpd_netif_locking_disable>
    f6ec:	5c 20 00 ad 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f6f0:	34 01 00 03 	mvi r1,3
    f6f4:	e0 00 00 98 	bi f954 <doWRState+0x3a4>
    f6f8:	b9 80 08 00 	mv r1,r12
    f6fc:	b9 60 10 00 	mv r2,r11
    f700:	fb ff f7 ba 	calli d5e8 <handle>
    f704:	2d 62 0b bc 	lhu r2,(r11+3004)
    f708:	34 01 10 02 	mvi r1,4098
    f70c:	5c 41 00 a5 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f710:	e0 00 00 8e 	bi f948 <doWRState+0x398>
    f714:	b9 80 08 00 	mv r1,r12
    f718:	b9 60 10 00 	mv r2,r11
    f71c:	fb ff f7 b3 	calli d5e8 <handle>
    f720:	2d 62 0b bc 	lhu r2,(r11+3004)
    f724:	34 01 10 03 	mvi r1,4099
    f728:	5c 41 00 9e 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f72c:	34 01 00 06 	mvi r1,6
    f730:	e0 00 00 89 	bi f954 <doWRState+0x3a4>
    f734:	35 61 00 0c 	addi r1,r11,12
    f738:	34 02 00 00 	mvi r2,0
    f73c:	34 03 00 00 	mvi r3,0
    f740:	34 04 00 00 	mvi r4,0
    f744:	f8 00 01 12 	calli fb8c <ptpd_netif_calibration_pattern_enable>
    f748:	5c 20 00 96 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f74c:	34 01 00 0c 	mvi r1,12
    f750:	31 61 0b 75 	sb (r11+2933),r1
    f754:	34 01 00 01 	mvi r1,1
    f758:	35 62 00 0c 	addi r2,r11,12
    f75c:	f8 00 01 0a 	calli fb84 <ptpd_netif_calibrating_enable>
    f760:	5c 20 00 90 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f764:	34 01 00 0d 	mvi r1,13
    f768:	31 61 0b 75 	sb (r11+2933),r1
    f76c:	35 62 00 0c 	addi r2,r11,12
    f770:	34 01 00 01 	mvi r1,1
    f774:	37 83 00 18 	addi r3,sp,24
    f778:	f8 00 03 79 	calli 1055c <ptpd_netif_calibrating_poll>
    f77c:	34 02 00 01 	mvi r2,1
    f780:	5c 22 00 88 	bne r1,r2,f9a0 <doWRState+0x3f0>
    f784:	2b 82 00 1c 	lw r2,(sp+28)
    f788:	2b 83 00 18 	lw r3,(sp+24)
    f78c:	00 41 00 10 	srui r1,r2,16
    f790:	3c 63 00 10 	sli r3,r3,16
    f794:	b8 61 08 00 	or r1,r3,r1
    f798:	59 61 0b 84 	sw (r11+2948),r1
    f79c:	3c 41 00 10 	sli r1,r2,16
    f7a0:	59 61 0b 80 	sw (r11+2944),r1
    f7a4:	34 01 00 0e 	mvi r1,14
    f7a8:	31 61 0b 75 	sb (r11+2933),r1
    f7ac:	34 01 00 01 	mvi r1,1
    f7b0:	35 62 00 0c 	addi r2,r11,12
    f7b4:	f8 00 00 f2 	calli fb7c <ptpd_netif_calibrating_disable>
    f7b8:	5c 20 00 7a 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f7bc:	34 01 00 0f 	mvi r1,15
    f7c0:	31 61 0b 75 	sb (r11+2933),r1
    f7c4:	35 61 00 0c 	addi r1,r11,12
    f7c8:	f8 00 00 f8 	calli fba8 <ptpd_netif_calibration_pattern_disable>
    f7cc:	5c 20 00 75 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f7d0:	34 01 00 10 	mvi r1,16
    f7d4:	31 61 0b 75 	sb (r11+2933),r1
    f7d8:	34 01 00 02 	mvi r1,2
    f7dc:	35 62 00 0c 	addi r2,r11,12
    f7e0:	f8 00 00 e9 	calli fb84 <ptpd_netif_calibrating_enable>
    f7e4:	5c 20 00 6f 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f7e8:	34 01 00 11 	mvi r1,17
    f7ec:	31 61 0b 75 	sb (r11+2933),r1
    f7f0:	35 62 00 0c 	addi r2,r11,12
    f7f4:	34 01 00 02 	mvi r1,2
    f7f8:	37 83 00 18 	addi r3,sp,24
    f7fc:	f8 00 03 58 	calli 1055c <ptpd_netif_calibrating_poll>
    f800:	34 02 00 01 	mvi r2,1
    f804:	5c 22 00 67 	bne r1,r2,f9a0 <doWRState+0x3f0>
    f808:	2b 82 00 1c 	lw r2,(sp+28)
    f80c:	2b 83 00 18 	lw r3,(sp+24)
    f810:	00 41 00 10 	srui r1,r2,16
    f814:	3c 63 00 10 	sli r3,r3,16
    f818:	b8 61 08 00 	or r1,r3,r1
    f81c:	59 61 0b 8c 	sw (r11+2956),r1
    f820:	3c 41 00 10 	sli r1,r2,16
    f824:	59 61 0b 88 	sw (r11+2952),r1
    f828:	34 01 00 12 	mvi r1,18
    f82c:	31 61 0b 75 	sb (r11+2933),r1
    f830:	34 01 00 02 	mvi r1,2
    f834:	35 62 00 0c 	addi r2,r11,12
    f838:	f8 00 00 d1 	calli fb7c <ptpd_netif_calibrating_disable>
    f83c:	5c 20 00 59 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f840:	34 01 00 13 	mvi r1,19
    f844:	31 61 0b 75 	sb (r11+2933),r1
    f848:	34 01 10 04 	mvi r1,4100
    f84c:	b9 80 10 00 	mv r2,r12
    f850:	b9 60 18 00 	mv r3,r11
    f854:	fb ff f4 7f 	calli ca50 <issueWRSignalingMsg>
    f858:	34 01 00 05 	mvi r1,5
    f85c:	b9 80 10 00 	mv r2,r12
    f860:	b9 60 18 00 	mv r3,r11
    f864:	fb ff fe 7c 	calli f254 <toWRState>
    f868:	34 01 00 01 	mvi r1,1
    f86c:	59 61 0b 7c 	sw (r11+2940),r1
    f870:	e0 00 00 4c 	bi f9a0 <doWRState+0x3f0>
    f874:	b9 80 08 00 	mv r1,r12
    f878:	b9 60 10 00 	mv r2,r11
    f87c:	fb ff f7 5b 	calli d5e8 <handle>
    f880:	2d 62 0b bc 	lhu r2,(r11+3004)
    f884:	34 01 10 03 	mvi r1,4099
    f888:	5c 41 00 08 	bne r2,r1,f8a8 <doWRState+0x2f8>
    f88c:	41 62 0b 76 	lbu r2,(r11+2934)
    f890:	34 01 00 01 	mvi r1,1
    f894:	5c 41 00 05 	bne r2,r1,f8a8 <doWRState+0x2f8>
    f898:	34 01 00 06 	mvi r1,6
    f89c:	b9 80 10 00 	mv r2,r12
    f8a0:	b9 60 18 00 	mv r3,r11
    f8a4:	fb ff fe 6c 	calli f254 <toWRState>
    f8a8:	2d 62 0b bc 	lhu r2,(r11+3004)
    f8ac:	34 01 10 05 	mvi r1,4101
    f8b0:	5c 41 00 3c 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f8b4:	41 62 0b 76 	lbu r2,(r11+2934)
    f8b8:	34 01 00 02 	mvi r1,2
    f8bc:	5c 41 00 39 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f8c0:	e0 00 00 1e 	bi f938 <doWRState+0x388>
    f8c4:	29 62 0b ac 	lw r2,(r11+2988)
    f8c8:	35 61 00 0c 	addi r1,r11,12
    f8cc:	34 03 00 00 	mvi r3,0
    f8d0:	34 04 00 00 	mvi r4,0
    f8d4:	f8 00 00 ae 	calli fb8c <ptpd_netif_calibration_pattern_enable>
    f8d8:	5c 20 00 32 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f8dc:	34 01 00 14 	mvi r1,20
    f8e0:	31 61 0b 75 	sb (r11+2933),r1
    f8e4:	b9 80 08 00 	mv r1,r12
    f8e8:	b9 60 10 00 	mv r2,r11
    f8ec:	fb ff f7 3f 	calli d5e8 <handle>
    f8f0:	2d 62 0b bc 	lhu r2,(r11+3004)
    f8f4:	34 01 10 04 	mvi r1,4100
    f8f8:	5c 41 00 2a 	bne r2,r1,f9a0 <doWRState+0x3f0>
    f8fc:	2d 62 0b aa 	lhu r2,(r11+2986)
    f900:	34 01 00 01 	mvi r1,1
    f904:	5c 41 00 03 	bne r2,r1,f910 <doWRState+0x360>
    f908:	34 01 00 15 	mvi r1,21
    f90c:	e0 00 00 02 	bi f914 <doWRState+0x364>
    f910:	34 01 00 16 	mvi r1,22
    f914:	31 61 0b 75 	sb (r11+2933),r1
    f918:	35 61 00 0c 	addi r1,r11,12
    f91c:	f8 00 00 a3 	calli fba8 <ptpd_netif_calibration_pattern_disable>
    f920:	5c 20 00 20 	bne r1,r0,f9a0 <doWRState+0x3f0>
    f924:	34 01 00 16 	mvi r1,22
    f928:	31 61 0b 75 	sb (r11+2933),r1
    f92c:	41 61 0b 76 	lbu r1,(r11+2934)
    f930:	34 02 00 01 	mvi r2,1
    f934:	5c 22 00 03 	bne r1,r2,f940 <doWRState+0x390>
    f938:	34 01 00 07 	mvi r1,7
    f93c:	e0 00 00 06 	bi f954 <doWRState+0x3a4>
    f940:	34 02 00 02 	mvi r2,2
    f944:	5c 22 00 03 	bne r1,r2,f950 <doWRState+0x3a0>
    f948:	34 01 00 04 	mvi r1,4
    f94c:	e0 00 00 02 	bi f954 <doWRState+0x3a4>
    f950:	34 01 00 09 	mvi r1,9
    f954:	b9 80 10 00 	mv r2,r12
    f958:	b9 60 18 00 	mv r3,r11
    f95c:	fb ff fe 3e 	calli f254 <toWRState>
    f960:	e0 00 00 10 	bi f9a0 <doWRState+0x3f0>
    f964:	34 01 00 09 	mvi r1,9
    f968:	b9 80 10 00 	mv r2,r12
    f96c:	b9 60 18 00 	mv r3,r11
    f970:	fb ff fe 39 	calli f254 <toWRState>
    f974:	41 61 0b 76 	lbu r1,(r11+2934)
    f978:	34 02 00 02 	mvi r2,2
    f97c:	5c 22 00 03 	bne r1,r2,f988 <doWRState+0x3d8>
    f980:	34 01 00 08 	mvi r1,8
    f984:	e0 00 00 04 	bi f994 <doWRState+0x3e4>
    f988:	34 02 00 01 	mvi r2,1
    f98c:	5c 22 00 05 	bne r1,r2,f9a0 <doWRState+0x3f0>
    f990:	34 01 00 05 	mvi r1,5
    f994:	b9 80 10 00 	mv r2,r12
    f998:	b9 60 18 00 	mv r3,r11
    f99c:	fb ff e7 54 	calli 96ec <toState>
    f9a0:	b9 60 08 00 	mv r1,r11
    f9a4:	fb ff fd 9a 	calli f00c <returnCurrentWRMainState>
    f9a8:	41 64 0b 76 	lbu r4,(r11+2934)
    f9ac:	b9 80 10 00 	mv r2,r12
    f9b0:	b9 60 18 00 	mv r3,r11
    f9b4:	fb ff fe c3 	calli f4c0 <wrTimerExpired>
    f9b8:	2b 9d 00 04 	lw ra,(sp+4)
    f9bc:	2b 8b 00 14 	lw r11,(sp+20)
    f9c0:	2b 8c 00 10 	lw r12,(sp+16)
    f9c4:	2b 8d 00 0c 	lw r13,(sp+12)
    f9c8:	2b 8e 00 08 	lw r14,(sp+8)
    f9cc:	37 9c 00 1c 	addi sp,sp,28
    f9d0:	c3 a0 00 00 	ret

0000f9d4 <ptpdStartup>:
    f9d4:	37 9c ff f0 	addi sp,sp,-16
    f9d8:	5b 8b 00 10 	sw (sp+16),r11
    f9dc:	5b 8c 00 0c 	sw (sp+12),r12
    f9e0:	5b 8d 00 08 	sw (sp+8),r13
    f9e4:	5b 9d 00 04 	sw (sp+4),ra
    f9e8:	78 02 00 01 	mvhi r2,0x1
    f9ec:	34 81 00 0c 	addi r1,r4,12
    f9f0:	38 42 30 3c 	ori r2,r2,0x303c
    f9f4:	b8 a0 68 00 	mv r13,r5
    f9f8:	b8 60 60 00 	mv r12,r3
    f9fc:	78 0b 00 01 	mvhi r11,0x1
    fa00:	f8 00 0b ea 	calli 129a8 <strcpy>
    fa04:	39 6b 69 88 	ori r11,r11,0x6988
    fa08:	34 01 00 01 	mvi r1,1
    fa0c:	0d 61 00 dc 	sh (r11+220),r1
    fa10:	78 01 00 01 	mvhi r1,0x1
    fa14:	38 21 78 90 	ori r1,r1,0x7890
    fa18:	59 61 00 f8 	sw (r11+248),r1
    fa1c:	78 01 00 01 	mvhi r1,0x1
    fa20:	34 02 00 00 	mvi r2,0
    fa24:	34 03 04 00 	mvi r3,1024
    fa28:	38 21 6e d8 	ori r1,r1,0x6ed8
    fa2c:	f8 00 0b 9e 	calli 128a4 <memset>
    fa30:	78 01 00 01 	mvhi r1,0x1
    fa34:	34 02 00 00 	mvi r2,0
    fa38:	34 03 04 00 	mvi r3,1024
    fa3c:	38 21 6a d8 	ori r1,r1,0x6ad8
    fa40:	f8 00 0b 99 	calli 128a4 <memset>
    fa44:	b9 60 08 00 	mv r1,r11
    fa48:	59 6d 00 00 	sw (r11+0),r13
    fa4c:	0d 80 00 00 	sh (r12+0),r0
    fa50:	2b 9d 00 04 	lw ra,(sp+4)
    fa54:	2b 8b 00 10 	lw r11,(sp+16)
    fa58:	2b 8c 00 0c 	lw r12,(sp+12)
    fa5c:	2b 8d 00 08 	lw r13,(sp+8)
    fa60:	37 9c 00 10 	addi sp,sp,16
    fa64:	c3 a0 00 00 	ret

0000fa68 <ptpdShutdown>:
    fa68:	c3 a0 00 00 	ret

0000fa6c <timeInternal_display>:
    fa6c:	c3 a0 00 00 	ret

0000fa70 <displayConfigINFO>:
    fa70:	c3 a0 00 00 	ret

0000fa74 <usleep>:
    fa74:	e0 00 00 03 	bi fa80 <usleep+0xc>
    fa78:	34 00 00 00 	nop
    fa7c:	34 21 ff ff 	addi r1,r1,-1
    fa80:	5c 20 ff fe 	bne r1,r0,fa78 <usleep+0x4>
    fa84:	c3 a0 00 00 	ret

0000fa88 <ptpd_netif_get_msec_tics>:
    fa88:	37 9c ff fc 	addi sp,sp,-4
    fa8c:	5b 9d 00 04 	sw (sp+4),ra
    fa90:	fb ff c8 08 	calli 1ab0 <timer_get_tics>
    fa94:	b8 20 10 00 	mv r2,r1
    fa98:	34 01 00 00 	mvi r1,0
    fa9c:	2b 9d 00 04 	lw ra,(sp+4)
    faa0:	37 9c 00 04 	addi sp,sp,4
    faa4:	c3 a0 00 00 	ret

0000faa8 <halexp_pps_cmd>:
    faa8:	37 9c ff fc 	addi sp,sp,-4
    faac:	5b 9d 00 04 	sw (sp+4),ra
    fab0:	34 03 00 02 	mvi r3,2
    fab4:	44 23 00 0e 	be r1,r3,faec <halexp_pps_cmd+0x44>
    fab8:	48 23 00 04 	bg r1,r3,fac8 <halexp_pps_cmd+0x20>
    fabc:	34 03 00 01 	mvi r3,1
    fac0:	5c 23 00 17 	bne r1,r3,fb1c <halexp_pps_cmd+0x74>
    fac4:	e0 00 00 06 	bi fadc <halexp_pps_cmd+0x34>
    fac8:	34 03 00 03 	mvi r3,3
    facc:	44 23 00 0b 	be r1,r3,faf8 <halexp_pps_cmd+0x50>
    fad0:	34 02 00 04 	mvi r2,4
    fad4:	5c 22 00 12 	bne r1,r2,fb1c <halexp_pps_cmd+0x74>
    fad8:	e0 00 00 0b 	bi fb04 <halexp_pps_cmd+0x5c>
    fadc:	28 42 00 18 	lw r2,(r2+24)
    fae0:	38 01 ff ff 	mvu r1,0xffff
    fae4:	fb ff ce 26 	calli 337c <spll_set_phase_shift>
    fae8:	e0 00 00 0d 	bi fb1c <halexp_pps_cmd+0x74>
    faec:	28 41 00 24 	lw r1,(r2+36)
    faf0:	fb ff c7 88 	calli 1910 <pps_gen_adjust_utc>
    faf4:	e0 00 00 0a 	bi fb1c <halexp_pps_cmd+0x74>
    faf8:	28 41 00 28 	lw r1,(r2+40)
    fafc:	fb ff c7 66 	calli 1894 <pps_gen_adjust_nsec>
    fb00:	e0 00 00 07 	bi fb1c <halexp_pps_cmd+0x74>
    fb04:	fb ff c7 9e 	calli 197c <pps_gen_busy>
    fb08:	34 02 00 01 	mvi r2,1
    fb0c:	5c 20 00 05 	bne r1,r0,fb20 <halexp_pps_cmd+0x78>
    fb10:	fb ff ce cf 	calli 364c <spll_shifter_busy>
    fb14:	7c 22 00 00 	cmpnei r2,r1,0
    fb18:	e0 00 00 02 	bi fb20 <halexp_pps_cmd+0x78>
    fb1c:	34 02 00 00 	mvi r2,0
    fb20:	b8 40 08 00 	mv r1,r2
    fb24:	2b 9d 00 04 	lw ra,(sp+4)
    fb28:	37 9c 00 04 	addi sp,sp,4
    fb2c:	c3 a0 00 00 	ret

0000fb30 <ptpd_netif_init>:
    fb30:	37 9c ff fc 	addi sp,sp,-4
    fb34:	5b 9d 00 04 	sw (sp+4),ra
    fb38:	78 01 00 01 	mvhi r1,0x1
    fb3c:	34 02 00 00 	mvi r2,0
    fb40:	34 03 03 78 	mvi r3,888
    fb44:	38 21 79 80 	ori r1,r1,0x7980
    fb48:	f8 00 0b 57 	calli 128a4 <memset>
    fb4c:	34 01 00 00 	mvi r1,0
    fb50:	2b 9d 00 04 	lw ra,(sp+4)
    fb54:	37 9c 00 04 	addi sp,sp,4
    fb58:	c3 a0 00 00 	ret

0000fb5c <ptpd_netif_get_hw_addr>:
    fb5c:	37 9c ff fc 	addi sp,sp,-4
    fb60:	5b 9d 00 04 	sw (sp+4),ra
    fb64:	b8 40 08 00 	mv r1,r2
    fb68:	fb ff c4 d8 	calli ec8 <get_mac_addr>
    fb6c:	34 01 00 00 	mvi r1,0
    fb70:	2b 9d 00 04 	lw ra,(sp+4)
    fb74:	37 9c 00 04 	addi sp,sp,4
    fb78:	c3 a0 00 00 	ret

0000fb7c <ptpd_netif_calibrating_disable>:
    fb7c:	34 01 00 00 	mvi r1,0
    fb80:	c3 a0 00 00 	ret

0000fb84 <ptpd_netif_calibrating_enable>:
    fb84:	34 01 00 00 	mvi r1,0
    fb88:	c3 a0 00 00 	ret

0000fb8c <ptpd_netif_calibration_pattern_enable>:
    fb8c:	37 9c ff fc 	addi sp,sp,-4
    fb90:	5b 9d 00 04 	sw (sp+4),ra
    fb94:	fb ff c5 9f 	calli 1210 <ep_cal_pattern_enable>
    fb98:	34 01 00 00 	mvi r1,0
    fb9c:	2b 9d 00 04 	lw ra,(sp+4)
    fba0:	37 9c 00 04 	addi sp,sp,4
    fba4:	c3 a0 00 00 	ret

0000fba8 <ptpd_netif_calibration_pattern_disable>:
    fba8:	37 9c ff fc 	addi sp,sp,-4
    fbac:	5b 9d 00 04 	sw (sp+4),ra
    fbb0:	fb ff c5 a3 	calli 123c <ep_cal_pattern_disable>
    fbb4:	34 01 00 00 	mvi r1,0
    fbb8:	2b 9d 00 04 	lw ra,(sp+4)
    fbbc:	37 9c 00 04 	addi sp,sp,4
    fbc0:	c3 a0 00 00 	ret

0000fbc4 <read_phase_val>:
    fbc4:	37 9c ff f4 	addi sp,sp,-12
    fbc8:	5b 8b 00 08 	sw (sp+8),r11
    fbcc:	5b 9d 00 04 	sw (sp+4),ra
    fbd0:	34 03 00 00 	mvi r3,0
    fbd4:	b8 20 58 00 	mv r11,r1
    fbd8:	37 82 00 0c 	addi r2,sp,12
    fbdc:	34 01 00 00 	mvi r1,0
    fbe0:	fb ff ce 3b 	calli 34cc <spll_read_ptracker>
    fbe4:	44 20 00 06 	be r1,r0,fbfc <read_phase_val+0x38>
    fbe8:	2b 81 00 0c 	lw r1,(sp+12)
    fbec:	59 61 00 10 	sw (r11+16),r1
    fbf0:	34 01 00 01 	mvi r1,1
    fbf4:	59 61 00 14 	sw (r11+20),r1
    fbf8:	e0 00 00 03 	bi fc04 <read_phase_val+0x40>
    fbfc:	59 60 00 10 	sw (r11+16),r0
    fc00:	59 60 00 14 	sw (r11+20),r0
    fc04:	34 01 00 00 	mvi r1,0
    fc08:	2b 9d 00 04 	lw ra,(sp+4)
    fc0c:	2b 8b 00 08 	lw r11,(sp+8)
    fc10:	37 9c 00 0c 	addi sp,sp,12
    fc14:	c3 a0 00 00 	ret

0000fc18 <ptpd_netif_set_phase_transition>:
    fc18:	58 22 00 40 	sw (r1+64),r2
    fc1c:	c3 a0 00 00 	ret

0000fc20 <halexp_get_port_state>:
    fc20:	37 9c ff f4 	addi sp,sp,-12
    fc24:	5b 8b 00 0c 	sw (sp+12),r11
    fc28:	5b 8c 00 08 	sw (sp+8),r12
    fc2c:	5b 9d 00 04 	sw (sp+4),ra
    fc30:	34 0c 00 01 	mvi r12,1
    fc34:	b8 20 58 00 	mv r11,r1
    fc38:	58 2c 00 00 	sw (r1+0),r12
    fc3c:	34 01 00 02 	mvi r1,2
    fc40:	35 62 00 0c 	addi r2,r11,12
    fc44:	59 61 00 04 	sw (r11+4),r1
    fc48:	35 61 00 08 	addi r1,r11,8
    fc4c:	fb ff c5 28 	calli 10ec <ep_get_deltas>
    fc50:	b9 60 08 00 	mv r1,r11
    fc54:	fb ff ff dc 	calli fbc4 <read_phase_val>
    fc58:	34 01 00 00 	mvi r1,0
    fc5c:	fb ff c5 06 	calli 1074 <ep_link_up>
    fc60:	59 61 00 18 	sw (r11+24),r1
    fc64:	59 6c 00 1c 	sw (r11+28),r12
    fc68:	59 6c 00 20 	sw (r11+32),r12
    fc6c:	34 01 00 00 	mvi r1,0
    fc70:	fb ff cd b2 	calli 3338 <spll_check_lock>
    fc74:	59 61 00 2c 	sw (r11+44),r1
    fc78:	34 02 00 00 	mvi r2,0
    fc7c:	35 63 00 34 	addi r3,r11,52
    fc80:	59 60 00 30 	sw (r11+48),r0
    fc84:	34 01 00 00 	mvi r1,0
    fc88:	fb ff cd e6 	calli 3420 <spll_get_phase_shift>
    fc8c:	34 01 1f 40 	mvi r1,8000
    fc90:	59 61 00 38 	sw (r11+56),r1
    fc94:	78 01 00 01 	mvhi r1,0x1
    fc98:	38 21 59 08 	ori r1,r1,0x5908
    fc9c:	28 21 00 00 	lw r1,(r1+0)
    fca0:	59 61 00 3c 	sw (r11+60),r1
    fca4:	59 61 00 40 	sw (r11+64),r1
    fca8:	35 61 00 44 	addi r1,r11,68
    fcac:	fb ff c4 87 	calli ec8 <get_mac_addr>
    fcb0:	78 01 00 01 	mvhi r1,0x1
    fcb4:	38 21 59 04 	ori r1,r1,0x5904
    fcb8:	28 21 00 00 	lw r1,(r1+0)
    fcbc:	59 60 00 4c 	sw (r11+76),r0
    fcc0:	59 61 00 50 	sw (r11+80),r1
    fcc4:	34 01 00 00 	mvi r1,0
    fcc8:	2b 9d 00 04 	lw ra,(sp+4)
    fccc:	2b 8b 00 0c 	lw r11,(sp+12)
    fcd0:	2b 8c 00 08 	lw r12,(sp+8)
    fcd4:	37 9c 00 0c 	addi sp,sp,12
    fcd8:	c3 a0 00 00 	ret

0000fcdc <ptpd_netif_create_socket>:
    fcdc:	37 9c ff 8c 	addi sp,sp,-116
    fce0:	5b 8b 00 18 	sw (sp+24),r11
    fce4:	5b 8c 00 14 	sw (sp+20),r12
    fce8:	5b 8d 00 10 	sw (sp+16),r13
    fcec:	5b 8e 00 0c 	sw (sp+12),r14
    fcf0:	5b 8f 00 08 	sw (sp+8),r15
    fcf4:	5b 9d 00 04 	sw (sp+4),ra
    fcf8:	78 04 00 01 	mvhi r4,0x1
    fcfc:	38 84 79 80 	ori r4,r4,0x7980
    fd00:	b8 20 68 00 	mv r13,r1
    fd04:	28 81 00 00 	lw r1,(r4+0)
    fd08:	b8 60 70 00 	mv r14,r3
    fd0c:	44 20 00 08 	be r1,r0,fd2c <ptpd_netif_create_socket+0x50>
    fd10:	28 81 01 28 	lw r1,(r4+296)
    fd14:	44 20 00 08 	be r1,r0,fd34 <ptpd_netif_create_socket+0x58>
    fd18:	28 81 02 50 	lw r1,(r4+592)
    fd1c:	34 0b 00 00 	mvi r11,0
    fd20:	34 0c 00 02 	mvi r12,2
    fd24:	5c 20 00 2d 	bne r1,r0,fdd8 <ptpd_netif_create_socket+0xfc>
    fd28:	e0 00 00 04 	bi fd38 <ptpd_netif_create_socket+0x5c>
    fd2c:	34 0c 00 00 	mvi r12,0
    fd30:	e0 00 00 02 	bi fd38 <ptpd_netif_create_socket+0x5c>
    fd34:	34 0c 00 01 	mvi r12,1
    fd38:	34 01 00 01 	mvi r1,1
    fd3c:	34 0b 00 00 	mvi r11,0
    fd40:	5d a1 00 26 	bne r13,r1,fdd8 <ptpd_netif_create_socket+0xfc>
    fd44:	37 81 00 1c 	addi r1,sp,28
    fd48:	b9 c0 10 00 	mv r2,r14
    fd4c:	fb ff ff b5 	calli fc20 <halexp_get_port_state>
    fd50:	48 01 00 22 	bg r0,r1,fdd8 <ptpd_netif_create_socket+0xfc>
    fd54:	09 8f 01 28 	muli r15,r12,296
    fd58:	78 0c 00 01 	mvhi r12,0x1
    fd5c:	39 8c 79 80 	ori r12,r12,0x7980
    fd60:	b5 ec 58 00 	add r11,r15,r12
    fd64:	b9 c0 10 00 	mv r2,r14
    fd68:	34 03 00 2c 	mvi r3,44
    fd6c:	35 61 00 04 	addi r1,r11,4
    fd70:	f8 00 0a 94 	calli 127c0 <memcpy>
    fd74:	37 8e 00 70 	addi r14,sp,112
    fd78:	b9 c0 08 00 	mv r1,r14
    fd7c:	fb ff c4 53 	calli ec8 <get_mac_addr>
    fd80:	35 e1 00 30 	addi r1,r15,48
    fd84:	b9 c0 10 00 	mv r2,r14
    fd88:	34 03 00 06 	mvi r3,6
    fd8c:	b4 2c 08 00 	add r1,r1,r12
    fd90:	f8 00 0a 8c 	calli 127c0 <memcpy>
    fd94:	2b 81 00 54 	lw r1,(sp+84)
    fd98:	59 61 00 3c 	sw (r11+60),r1
    fd9c:	2b 81 00 58 	lw r1,(sp+88)
    fda0:	59 61 00 40 	sw (r11+64),r1
    fda4:	2b 81 00 2c 	lw r1,(sp+44)
    fda8:	59 61 00 44 	sw (r11+68),r1
    fdac:	fb ff c7 41 	calli 1ab0 <timer_get_tics>
    fdb0:	59 61 00 4c 	sw (r11+76),r1
    fdb4:	34 01 00 64 	mvi r1,100
    fdb8:	59 61 00 54 	sw (r11+84),r1
    fdbc:	35 61 01 20 	addi r1,r11,288
    fdc0:	59 60 00 48 	sw (r11+72),r0
    fdc4:	59 60 00 50 	sw (r11+80),r0
    fdc8:	30 20 00 01 	sb (r1+1),r0
    fdcc:	31 60 01 20 	sb (r11+288),r0
    fdd0:	30 20 00 02 	sb (r1+2),r0
    fdd4:	59 6d 00 00 	sw (r11+0),r13
    fdd8:	b9 60 08 00 	mv r1,r11
    fddc:	2b 9d 00 04 	lw ra,(sp+4)
    fde0:	2b 8b 00 18 	lw r11,(sp+24)
    fde4:	2b 8c 00 14 	lw r12,(sp+20)
    fde8:	2b 8d 00 10 	lw r13,(sp+16)
    fdec:	2b 8e 00 0c 	lw r14,(sp+12)
    fdf0:	2b 8f 00 08 	lw r15,(sp+8)
    fdf4:	37 9c 00 74 	addi sp,sp,116
    fdf8:	c3 a0 00 00 	ret

0000fdfc <ptpd_netif_close_socket>:
    fdfc:	44 20 00 02 	be r1,r0,fe04 <ptpd_netif_close_socket+0x8>
    fe00:	58 20 00 00 	sw (r1+0),r0
    fe04:	34 01 00 00 	mvi r1,0
    fe08:	c3 a0 00 00 	ret

0000fe0c <ptpd_netif_get_ifName>:
    fe0c:	37 9c ff fc 	addi sp,sp,-4
    fe10:	5b 9d 00 04 	sw (sp+4),ra
    fe14:	78 02 00 01 	mvhi r2,0x1
    fe18:	38 42 55 9c 	ori r2,r2,0x559c
    fe1c:	f8 00 0a e3 	calli 129a8 <strcpy>
    fe20:	34 01 00 00 	mvi r1,0
    fe24:	2b 9d 00 04 	lw ra,(sp+4)
    fe28:	37 9c 00 04 	addi sp,sp,4
    fe2c:	c3 a0 00 00 	ret

0000fe30 <ptpd_netif_get_port_state>:
    fe30:	37 9c ff fc 	addi sp,sp,-4
    fe34:	5b 9d 00 04 	sw (sp+4),ra
    fe38:	34 01 00 00 	mvi r1,0
    fe3c:	fb ff c4 8e 	calli 1074 <ep_link_up>
    fe40:	64 21 00 00 	cmpei r1,r1,0
    fe44:	c8 01 08 00 	sub r1,r0,r1
    fe48:	2b 9d 00 04 	lw ra,(sp+4)
    fe4c:	37 9c 00 04 	addi sp,sp,4
    fe50:	c3 a0 00 00 	ret

0000fe54 <ptpd_netif_locking_disable>:
    fe54:	34 01 00 00 	mvi r1,0
    fe58:	c3 a0 00 00 	ret

0000fe5c <ptpd_netif_locking_enable>:
    fe5c:	37 9c ff fc 	addi sp,sp,-4
    fe60:	5b 9d 00 04 	sw (sp+4),ra
    fe64:	34 03 00 01 	mvi r3,1
    fe68:	34 01 00 03 	mvi r1,3
    fe6c:	34 02 00 00 	mvi r2,0
    fe70:	fb ff ca f6 	calli 2a48 <spll_init>
    fe74:	34 02 00 01 	mvi r2,1
    fe78:	34 01 00 00 	mvi r1,0
    fe7c:	fb ff ce 02 	calli 3684 <spll_enable_ptracker>
    fe80:	34 01 00 00 	mvi r1,0
    fe84:	2b 9d 00 04 	lw ra,(sp+4)
    fe88:	37 9c 00 04 	addi sp,sp,4
    fe8c:	c3 a0 00 00 	ret

0000fe90 <ptpd_netif_locking_poll>:
    fe90:	37 9c ff fc 	addi sp,sp,-4
    fe94:	5b 9d 00 04 	sw (sp+4),ra
    fe98:	34 01 00 00 	mvi r1,0
    fe9c:	fb ff cd 27 	calli 3338 <spll_check_lock>
    fea0:	64 21 00 00 	cmpei r1,r1,0
    fea4:	c8 01 08 00 	sub r1,r0,r1
    fea8:	38 21 00 01 	ori r1,r1,0x1
    feac:	2b 9d 00 04 	lw ra,(sp+4)
    feb0:	37 9c 00 04 	addi sp,sp,4
    feb4:	c3 a0 00 00 	ret

0000feb8 <ptpd_netif_linearize_rx_timestamp>:
    feb8:	37 9c ff e0 	addi sp,sp,-32
    febc:	5b 8b 00 20 	sw (sp+32),r11
    fec0:	5b 8c 00 1c 	sw (sp+28),r12
    fec4:	5b 8d 00 18 	sw (sp+24),r13
    fec8:	5b 8e 00 14 	sw (sp+20),r14
    fecc:	5b 8f 00 10 	sw (sp+16),r15
    fed0:	5b 90 00 0c 	sw (sp+12),r16
    fed4:	5b 91 00 08 	sw (sp+8),r17
    fed8:	5b 9d 00 04 	sw (sp+4),ra
    fedc:	14 ad 00 1f 	sri r13,r5,31
    fee0:	34 b0 ff ff 	addi r16,r5,-1
    fee4:	01 ad 00 1e 	srui r13,r13,30
    fee8:	58 22 00 10 	sw (r1+16),r2
    feec:	b5 a5 68 00 	add r13,r13,r5
    fef0:	15 ad 00 02 	sri r13,r13,2
    fef4:	b8 20 60 00 	mv r12,r1
    fef8:	c8 8d 68 00 	sub r13,r4,r13
    fefc:	b8 80 78 00 	mv r15,r4
    ff00:	b8 a0 58 00 	mv r11,r5
    ff04:	ca 02 70 00 	sub r14,r16,r2
    ff08:	4d a0 00 02 	bge r13,r0,ff10 <ptpd_netif_linearize_rx_timestamp+0x58>
    ff0c:	b5 a5 68 00 	add r13,r13,r5
    ff10:	15 61 00 1f 	sri r1,r11,31
    ff14:	00 21 00 1e 	srui r1,r1,30
    ff18:	b4 2b 08 00 	add r1,r1,r11
    ff1c:	14 21 00 02 	sri r1,r1,2
    ff20:	b4 2f 08 00 	add r1,r1,r15
    ff24:	49 61 00 02 	bg r11,r1,ff2c <ptpd_netif_linearize_rx_timestamp+0x74>
    ff28:	c8 2b 08 00 	sub r1,r1,r11
    ff2c:	ec 2e 28 00 	cmpge r5,r1,r14
    ff30:	ed cd 10 00 	cmpge r2,r14,r13
    ff34:	b8 a2 20 00 	or r4,r5,r2
    ff38:	4d a1 00 02 	bge r13,r1,ff40 <ptpd_netif_linearize_rx_timestamp+0x88>
    ff3c:	a0 a2 20 00 	and r4,r5,r2
    ff40:	44 80 00 14 	be r4,r0,ff90 <ptpd_netif_linearize_rx_timestamp+0xd8>
    ff44:	29 91 00 08 	lw r17,(r12+8)
    ff48:	34 01 00 00 	mvi r1,0
    ff4c:	44 60 00 04 	be r3,r0,ff5c <ptpd_netif_linearize_rx_timestamp+0xa4>
    ff50:	b9 60 08 00 	mv r1,r11
    ff54:	34 02 03 e8 	mvi r2,1000
    ff58:	f8 00 09 4e 	calli 12490 <__divsi3>
    ff5c:	ca 21 88 00 	sub r17,r17,r1
    ff60:	ed cd 10 00 	cmpge r2,r14,r13
    ff64:	ed ee 18 00 	cmpge r3,r15,r14
    ff68:	59 91 00 08 	sw (r12+8),r17
    ff6c:	b8 43 08 00 	or r1,r2,r3
    ff70:	4d af 00 02 	bge r13,r15,ff78 <ptpd_netif_linearize_rx_timestamp+0xc0>
    ff74:	a0 43 08 00 	and r1,r2,r3
    ff78:	44 20 00 06 	be r1,r0,ff90 <ptpd_netif_linearize_rx_timestamp+0xd8>
    ff7c:	b9 60 08 00 	mv r1,r11
    ff80:	34 02 03 e8 	mvi r2,1000
    ff84:	f8 00 09 43 	calli 12490 <__divsi3>
    ff88:	b6 21 08 00 	add r1,r17,r1
    ff8c:	59 81 00 08 	sw (r12+8),r1
    ff90:	a5 e0 78 00 	not r15,r15
    ff94:	b5 ee 70 00 	add r14,r15,r14
    ff98:	59 8e 00 0c 	sw (r12+12),r14
    ff9c:	4d c0 00 03 	bge r14,r0,ffa8 <ptpd_netif_linearize_rx_timestamp+0xf0>
    ffa0:	b5 cb 70 00 	add r14,r14,r11
    ffa4:	59 8e 00 0c 	sw (r12+12),r14
    ffa8:	29 81 00 0c 	lw r1,(r12+12)
    ffac:	ca 01 80 00 	sub r16,r16,r1
    ffb0:	59 90 00 0c 	sw (r12+12),r16
    ffb4:	2b 9d 00 04 	lw ra,(sp+4)
    ffb8:	2b 8b 00 20 	lw r11,(sp+32)
    ffbc:	2b 8c 00 1c 	lw r12,(sp+28)
    ffc0:	2b 8d 00 18 	lw r13,(sp+24)
    ffc4:	2b 8e 00 14 	lw r14,(sp+20)
    ffc8:	2b 8f 00 10 	lw r15,(sp+16)
    ffcc:	2b 90 00 0c 	lw r16,(sp+12)
    ffd0:	2b 91 00 08 	lw r17,(sp+8)
    ffd4:	37 9c 00 20 	addi sp,sp,32
    ffd8:	c3 a0 00 00 	ret

0000ffdc <ptpd_netif_recvfrom>:
    ffdc:	37 9c ff 94 	addi sp,sp,-108
    ffe0:	5b 8b 00 58 	sw (sp+88),r11
    ffe4:	5b 8c 00 54 	sw (sp+84),r12
    ffe8:	5b 8d 00 50 	sw (sp+80),r13
    ffec:	5b 8e 00 4c 	sw (sp+76),r14
    fff0:	5b 8f 00 48 	sw (sp+72),r15
    fff4:	5b 90 00 44 	sw (sp+68),r16
    fff8:	5b 91 00 40 	sw (sp+64),r17
    fffc:	5b 92 00 3c 	sw (sp+60),r18
   10000:	5b 93 00 38 	sw (sp+56),r19
   10004:	5b 94 00 34 	sw (sp+52),r20
   10008:	5b 9d 00 30 	sw (sp+48),ra
   1000c:	40 2e 01 22 	lbu r14,(r1+290)
   10010:	b8 20 60 00 	mv r12,r1
   10014:	b8 40 58 00 	mv r11,r2
   10018:	b8 60 90 00 	mv r18,r3
   1001c:	b8 a0 68 00 	mv r13,r5
   10020:	34 01 00 00 	mvi r1,0
   10024:	45 c0 00 76 	be r14,r0,101fc <ptpd_netif_recvfrom+0x220>
   10028:	41 82 01 21 	lbu r2,(r12+289)
   1002c:	35 ce ff ff 	addi r14,r14,-1
   10030:	78 11 00 01 	mvhi r17,0x1
   10034:	b5 82 08 00 	add r1,r12,r2
   10038:	40 30 00 58 	lbu r16,(r1+88)
   1003c:	34 41 00 01 	addi r1,r2,1
   10040:	34 02 00 c8 	mvi r2,200
   10044:	f8 00 09 40 	calli 12544 <__modsi3>
   10048:	31 81 01 21 	sb (r12+289),r1
   1004c:	31 8e 01 22 	sb (r12+290),r14
   10050:	34 14 00 c8 	mvi r20,200
   10054:	ba 00 70 00 	mv r14,r16
   10058:	3a 31 78 f4 	ori r17,r17,0x78f4
   1005c:	35 93 00 58 	addi r19,r12,88
   10060:	e0 00 00 14 	bi 100b0 <ptpd_netif_recvfrom+0xd4>
   10064:	41 82 01 21 	lbu r2,(r12+289)
   10068:	b9 c0 78 00 	mv r15,r14
   1006c:	ca 82 20 00 	sub r4,r20,r2
   10070:	50 8e 00 02 	bgeu r4,r14,10078 <ptpd_netif_recvfrom+0x9c>
   10074:	b8 80 78 00 	mv r15,r4
   10078:	ca 0e 20 00 	sub r4,r16,r14
   1007c:	b6 24 08 00 	add r1,r17,r4
   10080:	b6 62 10 00 	add r2,r19,r2
   10084:	b9 e0 18 00 	mv r3,r15
   10088:	f8 00 09 ce 	calli 127c0 <memcpy>
   1008c:	41 82 01 21 	lbu r2,(r12+289)
   10090:	c9 cf 70 00 	sub r14,r14,r15
   10094:	b5 e2 08 00 	add r1,r15,r2
   10098:	34 02 00 c8 	mvi r2,200
   1009c:	f8 00 09 5a 	calli 12604 <__umodsi3>
   100a0:	31 81 01 21 	sb (r12+289),r1
   100a4:	41 81 01 22 	lbu r1,(r12+290)
   100a8:	c8 2f 08 00 	sub r1,r1,r15
   100ac:	31 81 01 22 	sb (r12+290),r1
   100b0:	5d c0 ff ed 	bne r14,r0,10064 <ptpd_netif_recvfrom+0x88>
   100b4:	78 0f 00 01 	mvhi r15,0x1
   100b8:	39 ef 78 f4 	ori r15,r15,0x78f4
   100bc:	2d e1 00 0c 	lhu r1,(r15+12)
   100c0:	35 e2 00 06 	addi r2,r15,6
   100c4:	34 03 00 06 	mvi r3,6
   100c8:	0d 61 00 26 	sh (r11+38),r1
   100cc:	35 61 00 14 	addi r1,r11,20
   100d0:	f8 00 09 bc 	calli 127c0 <memcpy>
   100d4:	b9 e0 10 00 	mv r2,r15
   100d8:	34 03 00 06 	mvi r3,6
   100dc:	35 61 00 1a 	addi r1,r11,26
   100e0:	f8 00 09 b8 	calli 127c0 <memcpy>
   100e4:	36 11 ff de 	addi r17,r16,-34
   100e8:	78 02 00 01 	mvhi r2,0x1
   100ec:	38 42 79 02 	ori r2,r2,0x7902
   100f0:	ba 20 18 00 	mv r3,r17
   100f4:	ba 40 08 00 	mv r1,r18
   100f8:	f8 00 09 b2 	calli 127c0 <memcpy>
   100fc:	36 02 ff ec 	addi r2,r16,-20
   10100:	37 81 00 5c 	addi r1,sp,92
   10104:	b5 e2 10 00 	add r2,r15,r2
   10108:	34 03 00 14 	mvi r3,20
   1010c:	f8 00 09 ad 	calli 127c0 <memcpy>
   10110:	45 ae 00 17 	be r13,r14,1016c <ptpd_netif_recvfrom+0x190>
   10114:	2b 81 00 68 	lw r1,(sp+104)
   10118:	35 a2 00 10 	addi r2,r13,16
   1011c:	34 03 00 00 	mvi r3,0
   10120:	59 a1 00 14 	sw (r13+20),r1
   10124:	2b 81 00 60 	lw r1,(sp+96)
   10128:	59 a1 00 18 	sw (r13+24),r1
   1012c:	34 01 00 00 	mvi r1,0
   10130:	fb ff cc e7 	calli 34cc <spll_read_ptracker>
   10134:	2b 81 00 64 	lw r1,(sp+100)
   10138:	29 a2 00 10 	lw r2,(r13+16)
   1013c:	2b 83 00 60 	lw r3,(sp+96)
   10140:	59 a1 00 04 	sw (r13+4),r1
   10144:	2b 81 00 68 	lw r1,(sp+104)
   10148:	29 84 00 40 	lw r4,(r12+64)
   1014c:	29 85 00 3c 	lw r5,(r12+60)
   10150:	59 a1 00 08 	sw (r13+8),r1
   10154:	43 81 00 5c 	lbu r1,(sp+92)
   10158:	59 a0 00 00 	sw (r13+0),r0
   1015c:	59 a0 00 0c 	sw (r13+12),r0
   10160:	59 a1 00 1c 	sw (r13+28),r1
   10164:	b9 a0 08 00 	mv r1,r13
   10168:	fb ff ff 54 	calli feb8 <ptpd_netif_linearize_rx_timestamp>
   1016c:	78 02 00 01 	mvhi r2,0x1
   10170:	38 42 59 38 	ori r2,r2,0x5938
   10174:	28 41 00 00 	lw r1,(r2+0)
   10178:	44 20 00 20 	be r1,r0,101f8 <ptpd_netif_recvfrom+0x21c>
   1017c:	41 61 00 19 	lbu r1,(r11+25)
   10180:	41 62 00 1a 	lbu r2,(r11+26)
   10184:	41 64 00 14 	lbu r4,(r11+20)
   10188:	5b 81 00 04 	sw (sp+4),r1
   1018c:	41 61 00 1b 	lbu r1,(r11+27)
   10190:	41 65 00 15 	lbu r5,(r11+21)
   10194:	41 66 00 16 	lbu r6,(r11+22)
   10198:	5b 81 00 0c 	sw (sp+12),r1
   1019c:	5b 81 00 14 	sw (sp+20),r1
   101a0:	41 61 00 1c 	lbu r1,(r11+28)
   101a4:	41 67 00 17 	lbu r7,(r11+23)
   101a8:	41 68 00 18 	lbu r8,(r11+24)
   101ac:	5b 81 00 18 	sw (sp+24),r1
   101b0:	41 61 00 1d 	lbu r1,(r11+29)
   101b4:	5b 82 00 08 	sw (sp+8),r2
   101b8:	5b 82 00 10 	sw (sp+16),r2
   101bc:	5b 81 00 1c 	sw (sp+28),r1
   101c0:	41 61 00 1e 	lbu r1,(r11+30)
   101c4:	78 02 00 01 	mvhi r2,0x1
   101c8:	78 03 00 01 	mvhi r3,0x1
   101cc:	5b 81 00 20 	sw (sp+32),r1
   101d0:	41 61 00 1f 	lbu r1,(r11+31)
   101d4:	38 42 55 a0 	ori r2,r2,0x55a0
   101d8:	38 63 55 f8 	ori r3,r3,0x55f8
   101dc:	5b 81 00 24 	sw (sp+36),r1
   101e0:	41 61 00 20 	lbu r1,(r11+32)
   101e4:	5b 81 00 28 	sw (sp+40),r1
   101e8:	41 61 00 21 	lbu r1,(r11+33)
   101ec:	5b 81 00 2c 	sw (sp+44),r1
   101f0:	34 01 00 00 	mvi r1,0
   101f4:	fb ff c1 a3 	calli 880 <wrc_debug_printf>
   101f8:	ba 20 08 00 	mv r1,r17
   101fc:	2b 9d 00 30 	lw ra,(sp+48)
   10200:	2b 8b 00 58 	lw r11,(sp+88)
   10204:	2b 8c 00 54 	lw r12,(sp+84)
   10208:	2b 8d 00 50 	lw r13,(sp+80)
   1020c:	2b 8e 00 4c 	lw r14,(sp+76)
   10210:	2b 8f 00 48 	lw r15,(sp+72)
   10214:	2b 90 00 44 	lw r16,(sp+68)
   10218:	2b 91 00 40 	lw r17,(sp+64)
   1021c:	2b 92 00 3c 	lw r18,(sp+60)
   10220:	2b 93 00 38 	lw r19,(sp+56)
   10224:	2b 94 00 34 	lw r20,(sp+52)
   10228:	37 9c 00 6c 	addi sp,sp,108
   1022c:	c3 a0 00 00 	ret

00010230 <ptpd_netif_select>:
   10230:	34 01 00 00 	mvi r1,0
   10234:	c3 a0 00 00 	ret

00010238 <ptpd_netif_sendto>:
   10238:	37 9c ff c0 	addi sp,sp,-64
   1023c:	5b 8b 00 1c 	sw (sp+28),r11
   10240:	5b 8c 00 18 	sw (sp+24),r12
   10244:	5b 8d 00 14 	sw (sp+20),r13
   10248:	5b 8e 00 10 	sw (sp+16),r14
   1024c:	5b 8f 00 0c 	sw (sp+12),r15
   10250:	5b 90 00 08 	sw (sp+8),r16
   10254:	5b 9d 00 04 	sw (sp+4),ra
   10258:	37 8c 00 34 	addi r12,sp,52
   1025c:	b8 20 80 00 	mv r16,r1
   10260:	b8 40 68 00 	mv r13,r2
   10264:	b8 60 78 00 	mv r15,r3
   10268:	b9 80 08 00 	mv r1,r12
   1026c:	34 42 00 14 	addi r2,r2,20
   10270:	34 03 00 06 	mvi r3,6
   10274:	b8 a0 58 00 	mv r11,r5
   10278:	b8 80 70 00 	mv r14,r4
   1027c:	f8 00 09 51 	calli 127c0 <memcpy>
   10280:	36 02 00 30 	addi r2,r16,48
   10284:	37 81 00 3a 	addi r1,sp,58
   10288:	34 03 00 06 	mvi r3,6
   1028c:	f8 00 09 4d 	calli 127c0 <memcpy>
   10290:	35 a2 00 26 	addi r2,r13,38
   10294:	37 81 00 40 	addi r1,sp,64
   10298:	34 03 00 02 	mvi r3,2
   1029c:	f8 00 09 49 	calli 127c0 <memcpy>
   102a0:	b9 e0 10 00 	mv r2,r15
   102a4:	b9 80 08 00 	mv r1,r12
   102a8:	35 c3 00 0e 	addi r3,r14,14
   102ac:	37 84 00 20 	addi r4,sp,32
   102b0:	fb ff c4 ce 	calli 15e8 <minic_tx_frame>
   102b4:	2b 82 00 28 	lw r2,(sp+40)
   102b8:	59 60 00 00 	sw (r11+0),r0
   102bc:	59 60 00 0c 	sw (r11+12),r0
   102c0:	59 62 00 04 	sw (r11+4),r2
   102c4:	2b 82 00 2c 	lw r2,(sp+44)
   102c8:	59 62 00 08 	sw (r11+8),r2
   102cc:	43 82 00 20 	lbu r2,(sp+32)
   102d0:	59 62 00 1c 	sw (r11+28),r2
   102d4:	2b 9d 00 04 	lw ra,(sp+4)
   102d8:	2b 8b 00 1c 	lw r11,(sp+28)
   102dc:	2b 8c 00 18 	lw r12,(sp+24)
   102e0:	2b 8d 00 14 	lw r13,(sp+20)
   102e4:	2b 8e 00 10 	lw r14,(sp+16)
   102e8:	2b 8f 00 0c 	lw r15,(sp+12)
   102ec:	2b 90 00 08 	lw r16,(sp+8)
   102f0:	37 9c 00 40 	addi sp,sp,64
   102f4:	c3 a0 00 00 	ret

000102f8 <update_rx_queues>:
   102f8:	37 9c ff c8 	addi sp,sp,-56
   102fc:	5b 8b 00 20 	sw (sp+32),r11
   10300:	5b 8c 00 1c 	sw (sp+28),r12
   10304:	5b 8d 00 18 	sw (sp+24),r13
   10308:	5b 8e 00 14 	sw (sp+20),r14
   1030c:	5b 8f 00 10 	sw (sp+16),r15
   10310:	5b 90 00 0c 	sw (sp+12),r16
   10314:	5b 91 00 08 	sw (sp+8),r17
   10318:	5b 9d 00 04 	sw (sp+4),ra
   1031c:	78 0b 00 01 	mvhi r11,0x1
   10320:	39 6b 78 f5 	ori r11,r11,0x78f5
   10324:	78 02 00 01 	mvhi r2,0x1
   10328:	b9 60 08 00 	mv r1,r11
   1032c:	38 42 79 03 	ori r2,r2,0x7903
   10330:	34 03 00 64 	mvi r3,100
   10334:	37 84 00 24 	addi r4,sp,36
   10338:	fb ff c4 13 	calli 1384 <minic_rx_frame>
   1033c:	20 2d 00 ff 	andi r13,r1,0xff
   10340:	34 01 ff ff 	mvi r1,-1
   10344:	45 a0 00 53 	be r13,r0,10490 <update_rx_queues+0x198>
   10348:	78 0c 00 01 	mvhi r12,0x1
   1034c:	37 81 00 38 	addi r1,sp,56
   10350:	35 62 00 0c 	addi r2,r11,12
   10354:	34 03 00 02 	mvi r3,2
   10358:	39 8c 79 80 	ori r12,r12,0x7980
   1035c:	f8 00 09 19 	calli 127c0 <memcpy>
   10360:	34 0e 00 00 	mvi r14,0
   10364:	b9 80 78 00 	mv r15,r12
   10368:	34 11 00 03 	mvi r17,3
   1036c:	29 81 00 00 	lw r1,(r12+0)
   10370:	21 d0 00 ff 	andi r16,r14,0xff
   10374:	44 20 00 17 	be r1,r0,103d0 <update_rx_queues+0xd8>
   10378:	09 c2 01 28 	muli r2,r14,296
   1037c:	b9 60 08 00 	mv r1,r11
   10380:	34 03 00 06 	mvi r3,6
   10384:	b5 e2 10 00 	add r2,r15,r2
   10388:	34 42 00 18 	addi r2,r2,24
   1038c:	f8 00 08 ec 	calli 1273c <memcmp>
   10390:	5c 20 00 10 	bne r1,r0,103d0 <update_rx_queues+0xd8>
   10394:	2f 82 00 38 	lhu r2,(sp+56)
   10398:	2d 81 00 2a 	lhu r1,(r12+42)
   1039c:	5c 41 00 0d 	bne r2,r1,103d0 <update_rx_queues+0xd8>
   103a0:	0a 0b 01 28 	muli r11,r16,296
   103a4:	35 a1 00 22 	addi r1,r13,34
   103a8:	20 21 00 ff 	andi r1,r1,0xff
   103ac:	b5 6f 58 00 	add r11,r11,r15
   103b0:	33 81 00 3b 	sb (sp+59),r1
   103b4:	34 23 00 01 	addi r3,r1,1
   103b8:	41 61 01 22 	lbu r1,(r11+290)
   103bc:	34 02 00 c8 	mvi r2,200
   103c0:	c8 41 10 00 	sub r2,r2,r1
   103c4:	34 01 ff ff 	mvi r1,-1
   103c8:	54 62 00 32 	bgu r3,r2,10490 <update_rx_queues+0x198>
   103cc:	e0 00 00 06 	bi 103e4 <update_rx_queues+0xec>
   103d0:	35 ce 00 01 	addi r14,r14,1
   103d4:	35 8c 01 28 	addi r12,r12,296
   103d8:	5d d1 ff e5 	bne r14,r17,1036c <update_rx_queues+0x74>
   103dc:	34 01 ff ff 	mvi r1,-1
   103e0:	e0 00 00 2c 	bi 10490 <update_rx_queues+0x198>
   103e4:	78 0c 00 01 	mvhi r12,0x1
   103e8:	39 8c 78 f4 	ori r12,r12,0x78f4
   103ec:	37 82 00 3b 	addi r2,sp,59
   103f0:	34 03 00 01 	mvi r3,1
   103f4:	b9 80 08 00 	mv r1,r12
   103f8:	f8 00 08 f2 	calli 127c0 <memcpy>
   103fc:	35 a1 00 0f 	addi r1,r13,15
   10400:	b4 2c 08 00 	add r1,r1,r12
   10404:	37 82 00 24 	addi r2,sp,36
   10408:	34 03 00 14 	mvi r3,20
   1040c:	f8 00 08 ed 	calli 127c0 <memcpy>
   10410:	43 81 00 3b 	lbu r1,(sp+59)
   10414:	34 11 00 c8 	mvi r17,200
   10418:	35 70 00 58 	addi r16,r11,88
   1041c:	34 21 00 01 	addi r1,r1,1
   10420:	33 81 00 3b 	sb (sp+59),r1
   10424:	34 0f 00 23 	mvi r15,35
   10428:	e0 00 00 17 	bi 10484 <update_rx_queues+0x18c>
   1042c:	41 61 01 20 	lbu r1,(r11+288)
   10430:	ca 21 70 00 	sub r14,r17,r1
   10434:	4c 4e 00 02 	bge r2,r14,1043c <update_rx_queues+0x144>
   10438:	b8 40 70 00 	mv r14,r2
   1043c:	c9 e2 10 00 	sub r2,r15,r2
   10440:	21 ce 00 ff 	andi r14,r14,0xff
   10444:	b4 4d 10 00 	add r2,r2,r13
   10448:	b9 c0 18 00 	mv r3,r14
   1044c:	b5 82 10 00 	add r2,r12,r2
   10450:	b6 01 08 00 	add r1,r16,r1
   10454:	f8 00 08 db 	calli 127c0 <memcpy>
   10458:	41 61 01 20 	lbu r1,(r11+288)
   1045c:	34 02 00 c8 	mvi r2,200
   10460:	b5 c1 08 00 	add r1,r14,r1
   10464:	f8 00 08 38 	calli 12544 <__modsi3>
   10468:	31 61 01 20 	sb (r11+288),r1
   1046c:	41 61 01 22 	lbu r1,(r11+290)
   10470:	b5 c1 08 00 	add r1,r14,r1
   10474:	31 61 01 22 	sb (r11+290),r1
   10478:	43 81 00 3b 	lbu r1,(sp+59)
   1047c:	c8 2e 70 00 	sub r14,r1,r14
   10480:	33 8e 00 3b 	sb (sp+59),r14
   10484:	43 82 00 3b 	lbu r2,(sp+59)
   10488:	5c 40 ff e9 	bne r2,r0,1042c <update_rx_queues+0x134>
   1048c:	35 a1 00 23 	addi r1,r13,35
   10490:	2b 9d 00 04 	lw ra,(sp+4)
   10494:	2b 8b 00 20 	lw r11,(sp+32)
   10498:	2b 8c 00 1c 	lw r12,(sp+28)
   1049c:	2b 8d 00 18 	lw r13,(sp+24)
   104a0:	2b 8e 00 14 	lw r14,(sp+20)
   104a4:	2b 8f 00 10 	lw r15,(sp+16)
   104a8:	2b 90 00 0c 	lw r16,(sp+12)
   104ac:	2b 91 00 08 	lw r17,(sp+8)
   104b0:	37 9c 00 38 	addi sp,sp,56
   104b4:	c3 a0 00 00 	ret

000104b8 <ptpd_netif_read_calibration_data>:
   104b8:	37 9c ff 98 	addi sp,sp,-104
   104bc:	5b 8b 00 14 	sw (sp+20),r11
   104c0:	5b 8c 00 10 	sw (sp+16),r12
   104c4:	5b 8d 00 0c 	sw (sp+12),r13
   104c8:	5b 8e 00 08 	sw (sp+8),r14
   104cc:	5b 9d 00 04 	sw (sp+4),ra
   104d0:	b8 20 30 00 	mv r6,r1
   104d4:	b8 40 60 00 	mv r12,r2
   104d8:	37 81 00 18 	addi r1,sp,24
   104dc:	b8 c0 10 00 	mv r2,r6
   104e0:	b8 60 58 00 	mv r11,r3
   104e4:	b8 80 68 00 	mv r13,r4
   104e8:	b8 a0 70 00 	mv r14,r5
   104ec:	fb ff fd cd 	calli fc20 <halexp_get_port_state>
   104f0:	2b 82 00 18 	lw r2,(sp+24)
   104f4:	34 01 00 00 	mvi r1,0
   104f8:	44 40 00 12 	be r2,r0,10540 <ptpd_netif_read_calibration_data+0x88>
   104fc:	45 a0 00 03 	be r13,r0,10508 <ptpd_netif_read_calibration_data+0x50>
   10500:	2b 81 00 68 	lw r1,(sp+104)
   10504:	59 a1 00 00 	sw (r13+0),r1
   10508:	2b 81 00 50 	lw r1,(sp+80)
   1050c:	2b 82 00 34 	lw r2,(sp+52)
   10510:	59 c1 00 00 	sw (r14+0),r1
   10514:	34 01 ff fd 	mvi r1,-3
   10518:	44 40 00 0a 	be r2,r0,10540 <ptpd_netif_read_calibration_data+0x88>
   1051c:	2b 82 00 20 	lw r2,(sp+32)
   10520:	59 80 00 00 	sw (r12+0),r0
   10524:	59 82 00 04 	sw (r12+4),r2
   10528:	2b 82 00 38 	lw r2,(sp+56)
   1052c:	44 40 00 05 	be r2,r0,10540 <ptpd_netif_read_calibration_data+0x88>
   10530:	2b 81 00 24 	lw r1,(sp+36)
   10534:	59 60 00 00 	sw (r11+0),r0
   10538:	59 61 00 04 	sw (r11+4),r1
   1053c:	34 01 00 00 	mvi r1,0
   10540:	2b 9d 00 04 	lw ra,(sp+4)
   10544:	2b 8b 00 14 	lw r11,(sp+20)
   10548:	2b 8c 00 10 	lw r12,(sp+16)
   1054c:	2b 8d 00 0c 	lw r13,(sp+12)
   10550:	2b 8e 00 08 	lw r14,(sp+8)
   10554:	37 9c 00 68 	addi sp,sp,104
   10558:	c3 a0 00 00 	ret

0001055c <ptpd_netif_calibrating_poll>:
   1055c:	37 9c ff e4 	addi sp,sp,-28
   10560:	5b 8b 00 0c 	sw (sp+12),r11
   10564:	5b 8c 00 08 	sw (sp+8),r12
   10568:	5b 9d 00 04 	sw (sp+4),ra
   1056c:	34 04 00 00 	mvi r4,0
   10570:	b8 20 60 00 	mv r12,r1
   10574:	b8 60 58 00 	mv r11,r3
   10578:	b8 40 08 00 	mv r1,r2
   1057c:	37 83 00 18 	addi r3,sp,24
   10580:	37 82 00 10 	addi r2,sp,16
   10584:	34 05 00 00 	mvi r5,0
   10588:	fb ff ff cc 	calli 104b8 <ptpd_netif_read_calibration_data>
   1058c:	34 02 00 01 	mvi r2,1
   10590:	5d 82 00 05 	bne r12,r2,105a4 <ptpd_netif_calibrating_poll+0x48>
   10594:	2b 81 00 10 	lw r1,(sp+16)
   10598:	59 61 00 00 	sw (r11+0),r1
   1059c:	2b 81 00 14 	lw r1,(sp+20)
   105a0:	e0 00 00 04 	bi 105b0 <ptpd_netif_calibrating_poll+0x54>
   105a4:	2b 81 00 18 	lw r1,(sp+24)
   105a8:	59 61 00 00 	sw (r11+0),r1
   105ac:	2b 81 00 1c 	lw r1,(sp+28)
   105b0:	59 61 00 04 	sw (r11+4),r1
   105b4:	34 01 00 01 	mvi r1,1
   105b8:	2b 9d 00 04 	lw ra,(sp+4)
   105bc:	2b 8b 00 0c 	lw r11,(sp+12)
   105c0:	2b 8c 00 08 	lw r12,(sp+8)
   105c4:	37 9c 00 1c 	addi sp,sp,28
   105c8:	c3 a0 00 00 	ret

000105cc <ptpd_netif_enable_timing_output>:
   105cc:	37 9c ff fc 	addi sp,sp,-4
   105d0:	5b 9d 00 04 	sw (sp+4),ra
   105d4:	fb ff c5 02 	calli 19dc <pps_gen_enable_output>
   105d8:	34 01 00 00 	mvi r1,0
   105dc:	2b 9d 00 04 	lw ra,(sp+4)
   105e0:	37 9c 00 04 	addi sp,sp,4
   105e4:	c3 a0 00 00 	ret

000105e8 <ptpd_netif_adjust_in_progress>:
   105e8:	37 9c ff fc 	addi sp,sp,-4
   105ec:	5b 9d 00 04 	sw (sp+4),ra
   105f0:	34 02 00 00 	mvi r2,0
   105f4:	34 01 00 04 	mvi r1,4
   105f8:	fb ff fd 2c 	calli faa8 <halexp_pps_cmd>
   105fc:	2b 9d 00 04 	lw ra,(sp+4)
   10600:	37 9c 00 04 	addi sp,sp,4
   10604:	c3 a0 00 00 	ret

00010608 <ptpd_netif_adjust_counters>:
   10608:	37 9c ff b8 	addi sp,sp,-72
   1060c:	5b 8b 00 08 	sw (sp+8),r11
   10610:	5b 9d 00 04 	sw (sp+4),ra
   10614:	5b 82 00 30 	sw (sp+48),r2
   10618:	5b 81 00 2c 	sw (sp+44),r1
   1061c:	5b 83 00 34 	sw (sp+52),r3
   10620:	b8 22 10 00 	or r2,r1,r2
   10624:	b8 60 58 00 	mv r11,r3
   10628:	44 40 00 04 	be r2,r0,10638 <ptpd_netif_adjust_counters+0x30>
   1062c:	34 01 00 02 	mvi r1,2
   10630:	37 82 00 0c 	addi r2,sp,12
   10634:	fb ff fd 1d 	calli faa8 <halexp_pps_cmd>
   10638:	45 60 00 04 	be r11,r0,10648 <ptpd_netif_adjust_counters+0x40>
   1063c:	34 01 00 03 	mvi r1,3
   10640:	37 82 00 0c 	addi r2,sp,12
   10644:	fb ff fd 19 	calli faa8 <halexp_pps_cmd>
   10648:	34 01 00 00 	mvi r1,0
   1064c:	2b 9d 00 04 	lw ra,(sp+4)
   10650:	2b 8b 00 08 	lw r11,(sp+8)
   10654:	37 9c 00 48 	addi sp,sp,72
   10658:	c3 a0 00 00 	ret

0001065c <ptpd_netif_adjust_phase>:
   1065c:	37 9c ff bc 	addi sp,sp,-68
   10660:	5b 9d 00 04 	sw (sp+4),ra
   10664:	5b 81 00 20 	sw (sp+32),r1
   10668:	37 82 00 08 	addi r2,sp,8
   1066c:	34 01 00 01 	mvi r1,1
   10670:	fb ff fd 0e 	calli faa8 <halexp_pps_cmd>
   10674:	2b 9d 00 04 	lw ra,(sp+4)
   10678:	37 9c 00 44 	addi sp,sp,68
   1067c:	c3 a0 00 00 	ret

00010680 <ptpd_netif_extsrc_detection>:
   10680:	34 01 00 00 	mvi r1,0
   10684:	c3 a0 00 00 	ret

00010688 <ptpd_netif_get_dmtd_phase>:
   10688:	37 9c ff fc 	addi sp,sp,-4
   1068c:	5b 9d 00 04 	sw (sp+4),ra
   10690:	44 40 00 04 	be r2,r0,106a0 <ptpd_netif_get_dmtd_phase+0x18>
   10694:	34 01 00 00 	mvi r1,0
   10698:	34 03 00 00 	mvi r3,0
   1069c:	fb ff cb 8c 	calli 34cc <spll_read_ptracker>
   106a0:	2b 9d 00 04 	lw ra,(sp+4)
   106a4:	37 9c 00 04 	addi sp,sp,4
   106a8:	c3 a0 00 00 	ret

000106ac <format_wr_timestamp>:
   106ac:	37 9c ff e0 	addi sp,sp,-32
   106b0:	78 01 00 01 	mvhi r1,0x1
   106b4:	38 21 78 e8 	ori r1,r1,0x78e8
   106b8:	30 20 00 00 	sb (r1+0),r0
   106bc:	37 9c 00 20 	addi sp,sp,32
   106c0:	c3 a0 00 00 	ret

000106c4 <ptpd_netif_enable_phase_tracking>:
   106c4:	37 9c ff fc 	addi sp,sp,-4
   106c8:	5b 9d 00 04 	sw (sp+4),ra
   106cc:	34 02 00 01 	mvi r2,1
   106d0:	34 01 00 00 	mvi r1,0
   106d4:	fb ff cb ec 	calli 3684 <spll_enable_ptracker>
   106d8:	34 01 00 00 	mvi r1,0
   106dc:	2b 9d 00 04 	lw ra,(sp+4)
   106e0:	37 9c 00 04 	addi sp,sp,4
   106e4:	c3 a0 00 00 	ret

000106e8 <__muldi3>:
   106e8:	20 45 ff ff 	andi r5,r2,0xffff
   106ec:	00 46 00 10 	srui r6,r2,16
   106f0:	20 88 ff ff 	andi r8,r4,0xffff
   106f4:	00 89 00 10 	srui r9,r4,16
   106f8:	89 05 38 00 	mul r7,r8,r5
   106fc:	89 06 40 00 	mul r8,r8,r6
   10700:	89 25 28 00 	mul r5,r9,r5
   10704:	00 ea 00 10 	srui r10,r7,16
   10708:	89 26 30 00 	mul r6,r9,r6
   1070c:	b5 05 28 00 	add r5,r8,r5
   10710:	b4 aa 28 00 	add r5,r5,r10
   10714:	50 a8 00 03 	bgeu r5,r8,10720 <__muldi3+0x38>
   10718:	78 08 00 01 	mvhi r8,0x1
   1071c:	b4 c8 30 00 	add r6,r6,r8
   10720:	88 43 10 00 	mul r2,r2,r3
   10724:	88 81 20 00 	mul r4,r4,r1
   10728:	00 a1 00 10 	srui r1,r5,16
   1072c:	3c a5 00 10 	sli r5,r5,16
   10730:	b4 c1 30 00 	add r6,r6,r1
   10734:	20 e7 ff ff 	andi r7,r7,0xffff
   10738:	b4 44 08 00 	add r1,r2,r4
   1073c:	b4 26 08 00 	add r1,r1,r6
   10740:	b4 a7 10 00 	add r2,r5,r7
   10744:	c3 a0 00 00 	ret

00010748 <__divdi3>:
   10748:	37 9c ff d0 	addi sp,sp,-48
   1074c:	5b 8b 00 30 	sw (sp+48),r11
   10750:	5b 8c 00 2c 	sw (sp+44),r12
   10754:	5b 8d 00 28 	sw (sp+40),r13
   10758:	5b 8e 00 24 	sw (sp+36),r14
   1075c:	5b 8f 00 20 	sw (sp+32),r15
   10760:	5b 90 00 1c 	sw (sp+28),r16
   10764:	5b 91 00 18 	sw (sp+24),r17
   10768:	5b 92 00 14 	sw (sp+20),r18
   1076c:	5b 93 00 10 	sw (sp+16),r19
   10770:	5b 94 00 0c 	sw (sp+12),r20
   10774:	5b 95 00 08 	sw (sp+8),r21
   10778:	5b 9d 00 04 	sw (sp+4),ra
   1077c:	34 0e 00 00 	mvi r14,0
   10780:	b8 20 60 00 	mv r12,r1
   10784:	b8 40 68 00 	mv r13,r2
   10788:	4c 20 00 06 	bge r1,r0,107a0 <__divdi3+0x58>
   1078c:	c8 02 68 00 	sub r13,r0,r2
   10790:	7d a1 00 00 	cmpnei r1,r13,0
   10794:	c8 0c 60 00 	sub r12,r0,r12
   10798:	c9 81 60 00 	sub r12,r12,r1
   1079c:	34 0e ff ff 	mvi r14,-1
   107a0:	4c 60 00 06 	bge r3,r0,107b8 <__divdi3+0x70>
   107a4:	c8 04 20 00 	sub r4,r0,r4
   107a8:	7c 81 00 00 	cmpnei r1,r4,0
   107ac:	c8 03 18 00 	sub r3,r0,r3
   107b0:	a5 c0 70 00 	not r14,r14
   107b4:	c8 61 18 00 	sub r3,r3,r1
   107b8:	b8 80 58 00 	mv r11,r4
   107bc:	b9 a0 80 00 	mv r16,r13
   107c0:	b9 80 78 00 	mv r15,r12
   107c4:	5c 60 00 0b 	bne r3,r0,107f0 <__divdi3+0xa8>
   107c8:	51 84 00 6a 	bgeu r12,r4,10970 <__divdi3+0x228>
   107cc:	38 01 ff ff 	mvu r1,0xffff
   107d0:	54 81 00 14 	bgu r4,r1,10820 <__divdi3+0xd8>
   107d4:	34 01 00 ff 	mvi r1,255
   107d8:	34 03 00 08 	mvi r3,8
   107dc:	34 02 00 08 	mvi r2,8
   107e0:	54 81 00 18 	bgu r4,r1,10840 <__divdi3+0xf8>
   107e4:	34 03 00 00 	mvi r3,0
   107e8:	34 02 00 00 	mvi r2,0
   107ec:	e0 00 00 15 	bi 10840 <__divdi3+0xf8>
   107f0:	34 02 00 00 	mvi r2,0
   107f4:	34 01 00 00 	mvi r1,0
   107f8:	54 6c 00 4b 	bgu r3,r12,10924 <__divdi3+0x1dc>
   107fc:	38 01 ff ff 	mvu r1,0xffff
   10800:	54 61 00 aa 	bgu r3,r1,10aa8 <__divdi3+0x360>
   10804:	34 01 00 ff 	mvi r1,255
   10808:	34 05 00 08 	mvi r5,8
   1080c:	34 02 00 08 	mvi r2,8
   10810:	54 61 00 ae 	bgu r3,r1,10ac8 <__divdi3+0x380>
   10814:	34 05 00 00 	mvi r5,0
   10818:	34 02 00 00 	mvi r2,0
   1081c:	e0 00 00 ab 	bi 10ac8 <__divdi3+0x380>
   10820:	78 05 00 01 	mvhi r5,0x1
   10824:	38 a5 2c 68 	ori r5,r5,0x2c68
   10828:	28 a1 00 00 	lw r1,(r5+0)
   1082c:	34 03 00 18 	mvi r3,24
   10830:	34 02 00 18 	mvi r2,24
   10834:	54 81 00 03 	bgu r4,r1,10840 <__divdi3+0xf8>
   10838:	34 03 00 10 	mvi r3,16
   1083c:	34 02 00 10 	mvi r2,16
   10840:	78 01 00 01 	mvhi r1,0x1
   10844:	80 83 18 00 	sru r3,r4,r3
   10848:	38 21 57 5c 	ori r1,r1,0x575c
   1084c:	b4 23 08 00 	add r1,r1,r3
   10850:	40 21 00 00 	lbu r1,(r1+0)
   10854:	b4 22 10 00 	add r2,r1,r2
   10858:	34 01 00 20 	mvi r1,32
   1085c:	c8 22 08 00 	sub r1,r1,r2
   10860:	44 20 00 06 	be r1,r0,10878 <__divdi3+0x130>
   10864:	bd 81 60 00 	sl r12,r12,r1
   10868:	81 a2 10 00 	sru r2,r13,r2
   1086c:	bc 81 58 00 	sl r11,r4,r1
   10870:	bd a1 80 00 	sl r16,r13,r1
   10874:	b9 82 78 00 	or r15,r12,r2
   10878:	01 6c 00 10 	srui r12,r11,16
   1087c:	b9 e0 08 00 	mv r1,r15
   10880:	b9 80 10 00 	mv r2,r12
   10884:	f8 00 07 60 	calli 12604 <__umodsi3>
   10888:	b8 20 88 00 	mv r17,r1
   1088c:	b9 80 10 00 	mv r2,r12
   10890:	b9 e0 08 00 	mv r1,r15
   10894:	f8 00 07 4c 	calli 125c4 <__udivsi3>
   10898:	21 6f ff ff 	andi r15,r11,0xffff
   1089c:	b8 20 68 00 	mv r13,r1
   108a0:	3e 23 00 10 	sli r3,r17,16
   108a4:	02 02 00 10 	srui r2,r16,16
   108a8:	88 2f 08 00 	mul r1,r1,r15
   108ac:	b8 62 18 00 	or r3,r3,r2
   108b0:	50 61 00 07 	bgeu r3,r1,108cc <__divdi3+0x184>
   108b4:	b4 6b 18 00 	add r3,r3,r11
   108b8:	35 ad ff ff 	addi r13,r13,-1
   108bc:	55 63 00 04 	bgu r11,r3,108cc <__divdi3+0x184>
   108c0:	50 61 00 03 	bgeu r3,r1,108cc <__divdi3+0x184>
   108c4:	35 ad ff ff 	addi r13,r13,-1
   108c8:	b4 6b 18 00 	add r3,r3,r11
   108cc:	c8 61 88 00 	sub r17,r3,r1
   108d0:	b9 80 10 00 	mv r2,r12
   108d4:	ba 20 08 00 	mv r1,r17
   108d8:	f8 00 07 4b 	calli 12604 <__umodsi3>
   108dc:	b8 20 90 00 	mv r18,r1
   108e0:	b9 80 10 00 	mv r2,r12
   108e4:	ba 20 08 00 	mv r1,r17
   108e8:	f8 00 07 37 	calli 125c4 <__udivsi3>
   108ec:	b8 20 18 00 	mv r3,r1
   108f0:	88 6f 78 00 	mul r15,r3,r15
   108f4:	3e 41 00 10 	sli r1,r18,16
   108f8:	22 10 ff ff 	andi r16,r16,0xffff
   108fc:	b8 30 80 00 	or r16,r1,r16
   10900:	52 0f 00 06 	bgeu r16,r15,10918 <__divdi3+0x1d0>
   10904:	b6 0b 80 00 	add r16,r16,r11
   10908:	34 63 ff ff 	addi r3,r3,-1
   1090c:	55 70 00 03 	bgu r11,r16,10918 <__divdi3+0x1d0>
   10910:	f5 f0 78 00 	cmpgu r15,r15,r16
   10914:	c8 6f 18 00 	sub r3,r3,r15
   10918:	3d a2 00 10 	sli r2,r13,16
   1091c:	34 01 00 00 	mvi r1,0
   10920:	b8 62 10 00 	or r2,r3,r2
   10924:	45 c0 00 05 	be r14,r0,10938 <__divdi3+0x1f0>
   10928:	c8 02 10 00 	sub r2,r0,r2
   1092c:	7c 43 00 00 	cmpnei r3,r2,0
   10930:	c8 01 08 00 	sub r1,r0,r1
   10934:	c8 23 08 00 	sub r1,r1,r3
   10938:	2b 9d 00 04 	lw ra,(sp+4)
   1093c:	2b 8b 00 30 	lw r11,(sp+48)
   10940:	2b 8c 00 2c 	lw r12,(sp+44)
   10944:	2b 8d 00 28 	lw r13,(sp+40)
   10948:	2b 8e 00 24 	lw r14,(sp+36)
   1094c:	2b 8f 00 20 	lw r15,(sp+32)
   10950:	2b 90 00 1c 	lw r16,(sp+28)
   10954:	2b 91 00 18 	lw r17,(sp+24)
   10958:	2b 92 00 14 	lw r18,(sp+20)
   1095c:	2b 93 00 10 	lw r19,(sp+16)
   10960:	2b 94 00 0c 	lw r20,(sp+12)
   10964:	2b 95 00 08 	lw r21,(sp+8)
   10968:	37 9c 00 30 	addi sp,sp,48
   1096c:	c3 a0 00 00 	ret
   10970:	5c 80 00 08 	bne r4,r0,10990 <__divdi3+0x248>
   10974:	34 01 00 01 	mvi r1,1
   10978:	34 02 00 00 	mvi r2,0
   1097c:	f8 00 07 12 	calli 125c4 <__udivsi3>
   10980:	b8 20 58 00 	mv r11,r1
   10984:	34 03 00 00 	mvi r3,0
   10988:	34 02 00 00 	mvi r2,0
   1098c:	e0 00 00 10 	bi 109cc <__divdi3+0x284>
   10990:	38 01 ff ff 	mvu r1,0xffff
   10994:	54 81 00 06 	bgu r4,r1,109ac <__divdi3+0x264>
   10998:	34 01 00 ff 	mvi r1,255
   1099c:	34 03 00 08 	mvi r3,8
   109a0:	34 02 00 08 	mvi r2,8
   109a4:	54 81 00 0a 	bgu r4,r1,109cc <__divdi3+0x284>
   109a8:	e3 ff ff f7 	bi 10984 <__divdi3+0x23c>
   109ac:	78 06 00 01 	mvhi r6,0x1
   109b0:	38 c6 2c 68 	ori r6,r6,0x2c68
   109b4:	28 c1 00 00 	lw r1,(r6+0)
   109b8:	34 03 00 18 	mvi r3,24
   109bc:	34 02 00 18 	mvi r2,24
   109c0:	54 81 00 03 	bgu r4,r1,109cc <__divdi3+0x284>
   109c4:	34 03 00 10 	mvi r3,16
   109c8:	34 02 00 10 	mvi r2,16
   109cc:	81 63 18 00 	sru r3,r11,r3
   109d0:	78 01 00 01 	mvhi r1,0x1
   109d4:	38 21 57 5c 	ori r1,r1,0x575c
   109d8:	b4 23 08 00 	add r1,r1,r3
   109dc:	40 24 00 00 	lbu r4,(r1+0)
   109e0:	34 03 00 20 	mvi r3,32
   109e4:	b4 82 20 00 	add r4,r4,r2
   109e8:	c8 64 18 00 	sub r3,r3,r4
   109ec:	5c 60 00 49 	bne r3,r0,10b10 <__divdi3+0x3c8>
   109f0:	01 6f 00 10 	srui r15,r11,16
   109f4:	c9 8b 60 00 	sub r12,r12,r11
   109f8:	21 6d ff ff 	andi r13,r11,0xffff
   109fc:	34 12 00 01 	mvi r18,1
   10a00:	b9 80 08 00 	mv r1,r12
   10a04:	b9 e0 10 00 	mv r2,r15
   10a08:	f8 00 06 ff 	calli 12604 <__umodsi3>
   10a0c:	b8 20 88 00 	mv r17,r1
   10a10:	b9 e0 10 00 	mv r2,r15
   10a14:	b9 80 08 00 	mv r1,r12
   10a18:	f8 00 06 eb 	calli 125c4 <__udivsi3>
   10a1c:	3e 23 00 10 	sli r3,r17,16
   10a20:	02 04 00 10 	srui r4,r16,16
   10a24:	88 2d 10 00 	mul r2,r1,r13
   10a28:	b8 64 18 00 	or r3,r3,r4
   10a2c:	b8 20 60 00 	mv r12,r1
   10a30:	50 62 00 07 	bgeu r3,r2,10a4c <__divdi3+0x304>
   10a34:	b4 6b 18 00 	add r3,r3,r11
   10a38:	34 2c ff ff 	addi r12,r1,-1
   10a3c:	55 63 00 04 	bgu r11,r3,10a4c <__divdi3+0x304>
   10a40:	50 62 00 03 	bgeu r3,r2,10a4c <__divdi3+0x304>
   10a44:	35 8c ff ff 	addi r12,r12,-1
   10a48:	b4 6b 18 00 	add r3,r3,r11
   10a4c:	c8 62 88 00 	sub r17,r3,r2
   10a50:	ba 20 08 00 	mv r1,r17
   10a54:	b9 e0 10 00 	mv r2,r15
   10a58:	f8 00 06 eb 	calli 12604 <__umodsi3>
   10a5c:	b8 20 98 00 	mv r19,r1
   10a60:	b9 e0 10 00 	mv r2,r15
   10a64:	ba 20 08 00 	mv r1,r17
   10a68:	f8 00 06 d7 	calli 125c4 <__udivsi3>
   10a6c:	b8 20 18 00 	mv r3,r1
   10a70:	88 6d 68 00 	mul r13,r3,r13
   10a74:	3e 61 00 10 	sli r1,r19,16
   10a78:	22 10 ff ff 	andi r16,r16,0xffff
   10a7c:	b8 30 80 00 	or r16,r1,r16
   10a80:	52 0d 00 06 	bgeu r16,r13,10a98 <__divdi3+0x350>
   10a84:	b6 0b 80 00 	add r16,r16,r11
   10a88:	34 63 ff ff 	addi r3,r3,-1
   10a8c:	55 70 00 03 	bgu r11,r16,10a98 <__divdi3+0x350>
   10a90:	f5 b0 68 00 	cmpgu r13,r13,r16
   10a94:	c8 6d 18 00 	sub r3,r3,r13
   10a98:	3d 82 00 10 	sli r2,r12,16
   10a9c:	ba 40 08 00 	mv r1,r18
   10aa0:	b8 62 10 00 	or r2,r3,r2
   10aa4:	e3 ff ff a0 	bi 10924 <__divdi3+0x1dc>
   10aa8:	78 06 00 01 	mvhi r6,0x1
   10aac:	38 c6 2c 68 	ori r6,r6,0x2c68
   10ab0:	28 c1 00 00 	lw r1,(r6+0)
   10ab4:	34 05 00 18 	mvi r5,24
   10ab8:	34 02 00 18 	mvi r2,24
   10abc:	54 61 00 03 	bgu r3,r1,10ac8 <__divdi3+0x380>
   10ac0:	34 05 00 10 	mvi r5,16
   10ac4:	34 02 00 10 	mvi r2,16
   10ac8:	80 65 28 00 	sru r5,r3,r5
   10acc:	78 01 00 01 	mvhi r1,0x1
   10ad0:	38 21 57 5c 	ori r1,r1,0x575c
   10ad4:	b4 25 08 00 	add r1,r1,r5
   10ad8:	40 25 00 00 	lbu r5,(r1+0)
   10adc:	34 0b 00 20 	mvi r11,32
   10ae0:	b4 a2 28 00 	add r5,r5,r2
   10ae4:	c9 65 58 00 	sub r11,r11,r5
   10ae8:	5d 60 00 3d 	bne r11,r0,10bdc <__divdi3+0x494>
   10aec:	f1 a4 20 00 	cmpgeu r4,r13,r4
   10af0:	f5 83 60 00 	cmpgu r12,r12,r3
   10af4:	34 01 00 00 	mvi r1,0
   10af8:	b8 8c 18 00 	or r3,r4,r12
   10afc:	fc 61 18 00 	cmpne r3,r3,r1
   10b00:	34 02 00 01 	mvi r2,1
   10b04:	c8 03 18 00 	sub r3,r0,r3
   10b08:	a0 43 10 00 	and r2,r2,r3
   10b0c:	e3 ff ff 86 	bi 10924 <__divdi3+0x1dc>
   10b10:	bd 63 58 00 	sl r11,r11,r3
   10b14:	81 84 88 00 	sru r17,r12,r4
   10b18:	01 6f 00 10 	srui r15,r11,16
   10b1c:	bd 83 60 00 	sl r12,r12,r3
   10b20:	81 a4 20 00 	sru r4,r13,r4
   10b24:	ba 20 08 00 	mv r1,r17
   10b28:	b9 e0 10 00 	mv r2,r15
   10b2c:	b9 84 90 00 	or r18,r12,r4
   10b30:	bd a3 80 00 	sl r16,r13,r3
   10b34:	f8 00 06 b4 	calli 12604 <__umodsi3>
   10b38:	b8 20 60 00 	mv r12,r1
   10b3c:	b9 e0 10 00 	mv r2,r15
   10b40:	ba 20 08 00 	mv r1,r17
   10b44:	f8 00 06 a0 	calli 125c4 <__udivsi3>
   10b48:	21 6d ff ff 	andi r13,r11,0xffff
   10b4c:	b8 20 88 00 	mv r17,r1
   10b50:	3d 83 00 10 	sli r3,r12,16
   10b54:	02 42 00 10 	srui r2,r18,16
   10b58:	88 2d 08 00 	mul r1,r1,r13
   10b5c:	b8 62 18 00 	or r3,r3,r2
   10b60:	50 61 00 07 	bgeu r3,r1,10b7c <__divdi3+0x434>
   10b64:	b4 6b 18 00 	add r3,r3,r11
   10b68:	36 31 ff ff 	addi r17,r17,-1
   10b6c:	55 63 00 04 	bgu r11,r3,10b7c <__divdi3+0x434>
   10b70:	50 61 00 03 	bgeu r3,r1,10b7c <__divdi3+0x434>
   10b74:	36 31 ff ff 	addi r17,r17,-1
   10b78:	b4 6b 18 00 	add r3,r3,r11
   10b7c:	c8 61 60 00 	sub r12,r3,r1
   10b80:	b9 80 08 00 	mv r1,r12
   10b84:	b9 e0 10 00 	mv r2,r15
   10b88:	f8 00 06 9f 	calli 12604 <__umodsi3>
   10b8c:	b8 20 98 00 	mv r19,r1
   10b90:	b9 e0 10 00 	mv r2,r15
   10b94:	b9 80 08 00 	mv r1,r12
   10b98:	f8 00 06 8b 	calli 125c4 <__udivsi3>
   10b9c:	3e 62 00 10 	sli r2,r19,16
   10ba0:	88 2d 60 00 	mul r12,r1,r13
   10ba4:	22 52 ff ff 	andi r18,r18,0xffff
   10ba8:	b8 52 10 00 	or r2,r2,r18
   10bac:	b8 20 18 00 	mv r3,r1
   10bb0:	50 4c 00 07 	bgeu r2,r12,10bcc <__divdi3+0x484>
   10bb4:	b4 4b 10 00 	add r2,r2,r11
   10bb8:	34 23 ff ff 	addi r3,r1,-1
   10bbc:	55 62 00 04 	bgu r11,r2,10bcc <__divdi3+0x484>
   10bc0:	50 4c 00 03 	bgeu r2,r12,10bcc <__divdi3+0x484>
   10bc4:	34 63 ff ff 	addi r3,r3,-1
   10bc8:	b4 4b 10 00 	add r2,r2,r11
   10bcc:	3e 31 00 10 	sli r17,r17,16
   10bd0:	c8 4c 60 00 	sub r12,r2,r12
   10bd4:	b8 71 90 00 	or r18,r3,r17
   10bd8:	e3 ff ff 8a 	bi 10a00 <__divdi3+0x2b8>
   10bdc:	80 85 08 00 	sru r1,r4,r5
   10be0:	bc 6b 18 00 	sl r3,r3,r11
   10be4:	81 85 88 00 	sru r17,r12,r5
   10be8:	b8 61 78 00 	or r15,r3,r1
   10bec:	01 f0 00 10 	srui r16,r15,16
   10bf0:	81 a5 28 00 	sru r5,r13,r5
   10bf4:	bd 8b 60 00 	sl r12,r12,r11
   10bf8:	ba 20 08 00 	mv r1,r17
   10bfc:	ba 00 10 00 	mv r2,r16
   10c00:	b9 85 60 00 	or r12,r12,r5
   10c04:	bc 8b 90 00 	sl r18,r4,r11
   10c08:	f8 00 06 7f 	calli 12604 <__umodsi3>
   10c0c:	b8 20 a0 00 	mv r20,r1
   10c10:	ba 00 10 00 	mv r2,r16
   10c14:	ba 20 08 00 	mv r1,r17
   10c18:	f8 00 06 6b 	calli 125c4 <__udivsi3>
   10c1c:	21 f3 ff ff 	andi r19,r15,0xffff
   10c20:	b8 20 88 00 	mv r17,r1
   10c24:	3e 86 00 10 	sli r6,r20,16
   10c28:	01 82 00 10 	srui r2,r12,16
   10c2c:	88 33 08 00 	mul r1,r1,r19
   10c30:	b8 c2 30 00 	or r6,r6,r2
   10c34:	50 c1 00 07 	bgeu r6,r1,10c50 <__divdi3+0x508>
   10c38:	b4 cf 30 00 	add r6,r6,r15
   10c3c:	36 31 ff ff 	addi r17,r17,-1
   10c40:	55 e6 00 04 	bgu r15,r6,10c50 <__divdi3+0x508>
   10c44:	50 c1 00 03 	bgeu r6,r1,10c50 <__divdi3+0x508>
   10c48:	36 31 ff ff 	addi r17,r17,-1
   10c4c:	b4 cf 30 00 	add r6,r6,r15
   10c50:	c8 c1 a0 00 	sub r20,r6,r1
   10c54:	ba 00 10 00 	mv r2,r16
   10c58:	ba 80 08 00 	mv r1,r20
   10c5c:	f8 00 06 6a 	calli 12604 <__umodsi3>
   10c60:	b8 20 a8 00 	mv r21,r1
   10c64:	ba 00 10 00 	mv r2,r16
   10c68:	ba 80 08 00 	mv r1,r20
   10c6c:	f8 00 06 56 	calli 125c4 <__udivsi3>
   10c70:	3e a3 00 10 	sli r3,r21,16
   10c74:	88 33 38 00 	mul r7,r1,r19
   10c78:	21 8c ff ff 	andi r12,r12,0xffff
   10c7c:	b8 6c 18 00 	or r3,r3,r12
   10c80:	b8 20 30 00 	mv r6,r1
   10c84:	50 67 00 07 	bgeu r3,r7,10ca0 <__divdi3+0x558>
   10c88:	b4 6f 18 00 	add r3,r3,r15
   10c8c:	34 26 ff ff 	addi r6,r1,-1
   10c90:	55 e3 00 04 	bgu r15,r3,10ca0 <__divdi3+0x558>
   10c94:	50 67 00 03 	bgeu r3,r7,10ca0 <__divdi3+0x558>
   10c98:	34 c6 ff ff 	addi r6,r6,-1
   10c9c:	b4 6f 18 00 	add r3,r3,r15
   10ca0:	3e 22 00 10 	sli r2,r17,16
   10ca4:	22 45 ff ff 	andi r5,r18,0xffff
   10ca8:	b8 c2 10 00 	or r2,r6,r2
   10cac:	20 41 ff ff 	andi r1,r2,0xffff
   10cb0:	00 46 00 10 	srui r6,r2,16
   10cb4:	02 44 00 10 	srui r4,r18,16
   10cb8:	88 25 40 00 	mul r8,r1,r5
   10cbc:	88 24 08 00 	mul r1,r1,r4
   10cc0:	88 c5 28 00 	mul r5,r6,r5
   10cc4:	01 09 00 10 	srui r9,r8,16
   10cc8:	c8 67 18 00 	sub r3,r3,r7
   10ccc:	b4 a1 08 00 	add r1,r5,r1
   10cd0:	b4 29 08 00 	add r1,r1,r9
   10cd4:	88 c4 20 00 	mul r4,r6,r4
   10cd8:	50 25 00 03 	bgeu r1,r5,10ce4 <__divdi3+0x59c>
   10cdc:	78 05 00 01 	mvhi r5,0x1
   10ce0:	b4 85 20 00 	add r4,r4,r5
   10ce4:	00 25 00 10 	srui r5,r1,16
   10ce8:	b4 85 20 00 	add r4,r4,r5
   10cec:	54 83 00 09 	bgu r4,r3,10d10 <__divdi3+0x5c8>
   10cf0:	3c 21 00 10 	sli r1,r1,16
   10cf4:	bd ab 68 00 	sl r13,r13,r11
   10cf8:	21 08 ff ff 	andi r8,r8,0xffff
   10cfc:	b4 28 58 00 	add r11,r1,r8
   10d00:	e4 64 18 00 	cmpe r3,r3,r4
   10d04:	f5 6d 58 00 	cmpgu r11,r11,r13
   10d08:	a0 6b 18 00 	and r3,r3,r11
   10d0c:	44 60 00 02 	be r3,r0,10d14 <__divdi3+0x5cc>
   10d10:	34 42 ff ff 	addi r2,r2,-1
   10d14:	34 01 00 00 	mvi r1,0
   10d18:	e3 ff ff 03 	bi 10924 <__divdi3+0x1dc>

00010d1c <__moddi3>:
   10d1c:	37 9c ff c0 	addi sp,sp,-64
   10d20:	5b 8b 00 38 	sw (sp+56),r11
   10d24:	5b 8c 00 34 	sw (sp+52),r12
   10d28:	5b 8d 00 30 	sw (sp+48),r13
   10d2c:	5b 8e 00 2c 	sw (sp+44),r14
   10d30:	5b 8f 00 28 	sw (sp+40),r15
   10d34:	5b 90 00 24 	sw (sp+36),r16
   10d38:	5b 91 00 20 	sw (sp+32),r17
   10d3c:	5b 92 00 1c 	sw (sp+28),r18
   10d40:	5b 93 00 18 	sw (sp+24),r19
   10d44:	5b 94 00 14 	sw (sp+20),r20
   10d48:	5b 95 00 10 	sw (sp+16),r21
   10d4c:	5b 96 00 0c 	sw (sp+12),r22
   10d50:	5b 97 00 08 	sw (sp+8),r23
   10d54:	5b 9d 00 04 	sw (sp+4),ra
   10d58:	34 12 00 00 	mvi r18,0
   10d5c:	b8 20 58 00 	mv r11,r1
   10d60:	b8 40 68 00 	mv r13,r2
   10d64:	4c 20 00 06 	bge r1,r0,10d7c <__moddi3+0x60>
   10d68:	c8 02 68 00 	sub r13,r0,r2
   10d6c:	7d a1 00 00 	cmpnei r1,r13,0
   10d70:	c8 0b 58 00 	sub r11,r0,r11
   10d74:	c9 61 58 00 	sub r11,r11,r1
   10d78:	34 12 ff ff 	mvi r18,-1
   10d7c:	4c 60 00 05 	bge r3,r0,10d90 <__moddi3+0x74>
   10d80:	c8 04 20 00 	sub r4,r0,r4
   10d84:	7c 81 00 00 	cmpnei r1,r4,0
   10d88:	c8 03 18 00 	sub r3,r0,r3
   10d8c:	c8 61 18 00 	sub r3,r3,r1
   10d90:	37 8e 00 3c 	addi r14,sp,60
   10d94:	b8 80 60 00 	mv r12,r4
   10d98:	b9 a0 78 00 	mv r15,r13
   10d9c:	b9 60 88 00 	mv r17,r11
   10da0:	5c 60 00 0b 	bne r3,r0,10dcc <__moddi3+0xb0>
   10da4:	51 64 00 2d 	bgeu r11,r4,10e58 <__moddi3+0x13c>
   10da8:	38 01 ff ff 	mvu r1,0xffff
   10dac:	54 81 00 36 	bgu r4,r1,10e84 <__moddi3+0x168>
   10db0:	34 01 00 ff 	mvi r1,255
   10db4:	34 03 00 08 	mvi r3,8
   10db8:	34 02 00 08 	mvi r2,8
   10dbc:	54 81 00 3a 	bgu r4,r1,10ea4 <__moddi3+0x188>
   10dc0:	34 03 00 00 	mvi r3,0
   10dc4:	34 02 00 00 	mvi r2,0
   10dc8:	e0 00 00 37 	bi 10ea4 <__moddi3+0x188>
   10dcc:	51 63 00 1a 	bgeu r11,r3,10e34 <__moddi3+0x118>
   10dd0:	59 cb 00 00 	sw (r14+0),r11
   10dd4:	59 cd 00 04 	sw (r14+4),r13
   10dd8:	46 40 00 28 	be r18,r0,10e78 <__moddi3+0x15c>
   10ddc:	2b 82 00 40 	lw r2,(sp+64)
   10de0:	2b 81 00 3c 	lw r1,(sp+60)
   10de4:	c8 02 10 00 	sub r2,r0,r2
   10de8:	7c 43 00 00 	cmpnei r3,r2,0
   10dec:	c8 01 08 00 	sub r1,r0,r1
   10df0:	c8 23 08 00 	sub r1,r1,r3
   10df4:	2b 9d 00 04 	lw ra,(sp+4)
   10df8:	2b 8b 00 38 	lw r11,(sp+56)
   10dfc:	2b 8c 00 34 	lw r12,(sp+52)
   10e00:	2b 8d 00 30 	lw r13,(sp+48)
   10e04:	2b 8e 00 2c 	lw r14,(sp+44)
   10e08:	2b 8f 00 28 	lw r15,(sp+40)
   10e0c:	2b 90 00 24 	lw r16,(sp+36)
   10e10:	2b 91 00 20 	lw r17,(sp+32)
   10e14:	2b 92 00 1c 	lw r18,(sp+28)
   10e18:	2b 93 00 18 	lw r19,(sp+24)
   10e1c:	2b 94 00 14 	lw r20,(sp+20)
   10e20:	2b 95 00 10 	lw r21,(sp+16)
   10e24:	2b 96 00 0c 	lw r22,(sp+12)
   10e28:	2b 97 00 08 	lw r23,(sp+8)
   10e2c:	37 9c 00 40 	addi sp,sp,64
   10e30:	c3 a0 00 00 	ret
   10e34:	38 01 ff ff 	mvu r1,0xffff
   10e38:	54 61 00 8c 	bgu r3,r1,11068 <__moddi3+0x34c>
   10e3c:	34 01 00 ff 	mvi r1,255
   10e40:	34 05 00 08 	mvi r5,8
   10e44:	34 02 00 08 	mvi r2,8
   10e48:	54 61 00 90 	bgu r3,r1,11088 <__moddi3+0x36c>
   10e4c:	34 05 00 00 	mvi r5,0
   10e50:	34 02 00 00 	mvi r2,0
   10e54:	e0 00 00 8d 	bi 11088 <__moddi3+0x36c>
   10e58:	5c 80 00 4b 	bne r4,r0,10f84 <__moddi3+0x268>
   10e5c:	34 01 00 01 	mvi r1,1
   10e60:	34 02 00 00 	mvi r2,0
   10e64:	f8 00 05 d8 	calli 125c4 <__udivsi3>
   10e68:	b8 20 60 00 	mv r12,r1
   10e6c:	34 03 00 00 	mvi r3,0
   10e70:	34 02 00 00 	mvi r2,0
   10e74:	e0 00 00 53 	bi 10fc0 <__moddi3+0x2a4>
   10e78:	2b 81 00 3c 	lw r1,(sp+60)
   10e7c:	2b 82 00 40 	lw r2,(sp+64)
   10e80:	e3 ff ff dd 	bi 10df4 <__moddi3+0xd8>
   10e84:	78 05 00 01 	mvhi r5,0x1
   10e88:	38 a5 2c 68 	ori r5,r5,0x2c68
   10e8c:	28 a1 00 00 	lw r1,(r5+0)
   10e90:	34 03 00 18 	mvi r3,24
   10e94:	34 02 00 18 	mvi r2,24
   10e98:	54 81 00 03 	bgu r4,r1,10ea4 <__moddi3+0x188>
   10e9c:	34 03 00 10 	mvi r3,16
   10ea0:	34 02 00 10 	mvi r2,16
   10ea4:	78 01 00 01 	mvhi r1,0x1
   10ea8:	80 83 18 00 	sru r3,r4,r3
   10eac:	38 21 57 5c 	ori r1,r1,0x575c
   10eb0:	b4 23 08 00 	add r1,r1,r3
   10eb4:	40 21 00 00 	lbu r1,(r1+0)
   10eb8:	34 10 00 00 	mvi r16,0
   10ebc:	b4 22 10 00 	add r2,r1,r2
   10ec0:	34 01 00 20 	mvi r1,32
   10ec4:	c8 22 08 00 	sub r1,r1,r2
   10ec8:	44 20 00 07 	be r1,r0,10ee4 <__moddi3+0x1c8>
   10ecc:	bd 61 58 00 	sl r11,r11,r1
   10ed0:	81 a2 10 00 	sru r2,r13,r2
   10ed4:	bc 81 60 00 	sl r12,r4,r1
   10ed8:	bd a1 78 00 	sl r15,r13,r1
   10edc:	b8 20 80 00 	mv r16,r1
   10ee0:	b9 62 88 00 	or r17,r11,r2
   10ee4:	01 8b 00 10 	srui r11,r12,16
   10ee8:	ba 20 08 00 	mv r1,r17
   10eec:	b9 60 10 00 	mv r2,r11
   10ef0:	f8 00 05 c5 	calli 12604 <__umodsi3>
   10ef4:	b8 20 68 00 	mv r13,r1
   10ef8:	b9 60 10 00 	mv r2,r11
   10efc:	ba 20 08 00 	mv r1,r17
   10f00:	f8 00 05 b1 	calli 125c4 <__udivsi3>
   10f04:	21 93 ff ff 	andi r19,r12,0xffff
   10f08:	3d a3 00 10 	sli r3,r13,16
   10f0c:	01 e2 00 10 	srui r2,r15,16
   10f10:	88 33 08 00 	mul r1,r1,r19
   10f14:	b8 62 18 00 	or r3,r3,r2
   10f18:	50 61 00 05 	bgeu r3,r1,10f2c <__moddi3+0x210>
   10f1c:	b4 6c 18 00 	add r3,r3,r12
   10f20:	55 83 00 03 	bgu r12,r3,10f2c <__moddi3+0x210>
   10f24:	50 61 00 02 	bgeu r3,r1,10f2c <__moddi3+0x210>
   10f28:	b4 6c 18 00 	add r3,r3,r12
   10f2c:	c8 61 68 00 	sub r13,r3,r1
   10f30:	b9 60 10 00 	mv r2,r11
   10f34:	b9 a0 08 00 	mv r1,r13
   10f38:	f8 00 05 b3 	calli 12604 <__umodsi3>
   10f3c:	b8 20 88 00 	mv r17,r1
   10f40:	b9 60 10 00 	mv r2,r11
   10f44:	b9 a0 08 00 	mv r1,r13
   10f48:	f8 00 05 9f 	calli 125c4 <__udivsi3>
   10f4c:	88 33 98 00 	mul r19,r1,r19
   10f50:	3e 21 00 10 	sli r1,r17,16
   10f54:	21 ef ff ff 	andi r15,r15,0xffff
   10f58:	b8 2f 78 00 	or r15,r1,r15
   10f5c:	51 f3 00 05 	bgeu r15,r19,10f70 <__moddi3+0x254>
   10f60:	b5 ec 78 00 	add r15,r15,r12
   10f64:	55 8f 00 03 	bgu r12,r15,10f70 <__moddi3+0x254>
   10f68:	51 f3 00 02 	bgeu r15,r19,10f70 <__moddi3+0x254>
   10f6c:	b5 ec 78 00 	add r15,r15,r12
   10f70:	c9 f3 78 00 	sub r15,r15,r19
   10f74:	81 f0 80 00 	sru r16,r15,r16
   10f78:	59 c0 00 00 	sw (r14+0),r0
   10f7c:	59 d0 00 04 	sw (r14+4),r16
   10f80:	e3 ff ff 96 	bi 10dd8 <__moddi3+0xbc>
   10f84:	38 01 ff ff 	mvu r1,0xffff
   10f88:	54 81 00 06 	bgu r4,r1,10fa0 <__moddi3+0x284>
   10f8c:	34 01 00 ff 	mvi r1,255
   10f90:	34 03 00 08 	mvi r3,8
   10f94:	34 02 00 08 	mvi r2,8
   10f98:	54 81 00 0a 	bgu r4,r1,10fc0 <__moddi3+0x2a4>
   10f9c:	e3 ff ff b4 	bi 10e6c <__moddi3+0x150>
   10fa0:	78 06 00 01 	mvhi r6,0x1
   10fa4:	38 c6 2c 68 	ori r6,r6,0x2c68
   10fa8:	28 c1 00 00 	lw r1,(r6+0)
   10fac:	34 03 00 18 	mvi r3,24
   10fb0:	34 02 00 18 	mvi r2,24
   10fb4:	54 81 00 03 	bgu r4,r1,10fc0 <__moddi3+0x2a4>
   10fb8:	34 03 00 10 	mvi r3,16
   10fbc:	34 02 00 10 	mvi r2,16
   10fc0:	78 01 00 01 	mvhi r1,0x1
   10fc4:	81 83 18 00 	sru r3,r12,r3
   10fc8:	38 21 57 5c 	ori r1,r1,0x575c
   10fcc:	b4 23 08 00 	add r1,r1,r3
   10fd0:	40 21 00 00 	lbu r1,(r1+0)
   10fd4:	34 10 00 20 	mvi r16,32
   10fd8:	b4 22 10 00 	add r2,r1,r2
   10fdc:	ca 02 80 00 	sub r16,r16,r2
   10fe0:	5e 00 00 9b 	bne r16,r0,1124c <__moddi3+0x530>
   10fe4:	01 91 00 10 	srui r17,r12,16
   10fe8:	c9 6c 58 00 	sub r11,r11,r12
   10fec:	21 93 ff ff 	andi r19,r12,0xffff
   10ff0:	ba 20 10 00 	mv r2,r17
   10ff4:	b9 60 08 00 	mv r1,r11
   10ff8:	f8 00 05 83 	calli 12604 <__umodsi3>
   10ffc:	b8 20 68 00 	mv r13,r1
   11000:	ba 20 10 00 	mv r2,r17
   11004:	b9 60 08 00 	mv r1,r11
   11008:	f8 00 05 6f 	calli 125c4 <__udivsi3>
   1100c:	3d a2 00 10 	sli r2,r13,16
   11010:	01 e4 00 10 	srui r4,r15,16
   11014:	88 33 18 00 	mul r3,r1,r19
   11018:	b8 44 10 00 	or r2,r2,r4
   1101c:	50 43 00 05 	bgeu r2,r3,11030 <__moddi3+0x314>
   11020:	b4 4c 10 00 	add r2,r2,r12
   11024:	55 82 00 03 	bgu r12,r2,11030 <__moddi3+0x314>
   11028:	50 43 00 02 	bgeu r2,r3,11030 <__moddi3+0x314>
   1102c:	b4 4c 10 00 	add r2,r2,r12
   11030:	c8 43 58 00 	sub r11,r2,r3
   11034:	b9 60 08 00 	mv r1,r11
   11038:	ba 20 10 00 	mv r2,r17
   1103c:	f8 00 05 72 	calli 12604 <__umodsi3>
   11040:	b8 20 68 00 	mv r13,r1
   11044:	ba 20 10 00 	mv r2,r17
   11048:	b9 60 08 00 	mv r1,r11
   1104c:	f8 00 05 5e 	calli 125c4 <__udivsi3>
   11050:	88 33 98 00 	mul r19,r1,r19
   11054:	3d a1 00 10 	sli r1,r13,16
   11058:	21 ef ff ff 	andi r15,r15,0xffff
   1105c:	b8 2f 78 00 	or r15,r1,r15
   11060:	51 f3 ff c4 	bgeu r15,r19,10f70 <__moddi3+0x254>
   11064:	e3 ff ff bf 	bi 10f60 <__moddi3+0x244>
   11068:	78 06 00 01 	mvhi r6,0x1
   1106c:	38 c6 2c 68 	ori r6,r6,0x2c68
   11070:	28 c1 00 00 	lw r1,(r6+0)
   11074:	34 05 00 18 	mvi r5,24
   11078:	34 02 00 18 	mvi r2,24
   1107c:	54 61 00 03 	bgu r3,r1,11088 <__moddi3+0x36c>
   11080:	34 05 00 10 	mvi r5,16
   11084:	34 02 00 10 	mvi r2,16
   11088:	78 01 00 01 	mvhi r1,0x1
   1108c:	80 65 28 00 	sru r5,r3,r5
   11090:	38 21 57 5c 	ori r1,r1,0x575c
   11094:	b4 25 08 00 	add r1,r1,r5
   11098:	40 30 00 00 	lbu r16,(r1+0)
   1109c:	34 0c 00 20 	mvi r12,32
   110a0:	b6 02 80 00 	add r16,r16,r2
   110a4:	c9 90 60 00 	sub r12,r12,r16
   110a8:	5d 80 00 0c 	bne r12,r0,110d8 <__moddi3+0x3bc>
   110ac:	f1 a4 10 00 	cmpgeu r2,r13,r4
   110b0:	f5 63 08 00 	cmpgu r1,r11,r3
   110b4:	b8 41 08 00 	or r1,r2,r1
   110b8:	44 2c 00 05 	be r1,r12,110cc <__moddi3+0x3b0>
   110bc:	c9 a4 78 00 	sub r15,r13,r4
   110c0:	f5 ed 68 00 	cmpgu r13,r15,r13
   110c4:	c9 63 18 00 	sub r3,r11,r3
   110c8:	c8 6d 88 00 	sub r17,r3,r13
   110cc:	59 d1 00 00 	sw (r14+0),r17
   110d0:	59 cf 00 04 	sw (r14+4),r15
   110d4:	e3 ff ff 41 	bi 10dd8 <__moddi3+0xbc>
   110d8:	80 90 08 00 	sru r1,r4,r16
   110dc:	bc 6c 18 00 	sl r3,r3,r12
   110e0:	81 70 98 00 	sru r19,r11,r16
   110e4:	b8 61 78 00 	or r15,r3,r1
   110e8:	01 f1 00 10 	srui r17,r15,16
   110ec:	81 b0 18 00 	sru r3,r13,r16
   110f0:	bd 6c 58 00 	sl r11,r11,r12
   110f4:	ba 60 08 00 	mv r1,r19
   110f8:	ba 20 10 00 	mv r2,r17
   110fc:	b9 63 58 00 	or r11,r11,r3
   11100:	bc 8c a0 00 	sl r20,r4,r12
   11104:	f8 00 05 40 	calli 12604 <__umodsi3>
   11108:	b8 20 b0 00 	mv r22,r1
   1110c:	ba 20 10 00 	mv r2,r17
   11110:	ba 60 08 00 	mv r1,r19
   11114:	f8 00 05 2c 	calli 125c4 <__udivsi3>
   11118:	21 f5 ff ff 	andi r21,r15,0xffff
   1111c:	b8 20 98 00 	mv r19,r1
   11120:	3e c3 00 10 	sli r3,r22,16
   11124:	01 62 00 10 	srui r2,r11,16
   11128:	88 35 08 00 	mul r1,r1,r21
   1112c:	b8 62 18 00 	or r3,r3,r2
   11130:	bd ac 68 00 	sl r13,r13,r12
   11134:	50 61 00 07 	bgeu r3,r1,11150 <__moddi3+0x434>
   11138:	b4 6f 18 00 	add r3,r3,r15
   1113c:	36 73 ff ff 	addi r19,r19,-1
   11140:	55 e3 00 04 	bgu r15,r3,11150 <__moddi3+0x434>
   11144:	50 61 00 03 	bgeu r3,r1,11150 <__moddi3+0x434>
   11148:	36 73 ff ff 	addi r19,r19,-1
   1114c:	b4 6f 18 00 	add r3,r3,r15
   11150:	c8 61 b0 00 	sub r22,r3,r1
   11154:	ba 20 10 00 	mv r2,r17
   11158:	ba c0 08 00 	mv r1,r22
   1115c:	f8 00 05 2a 	calli 12604 <__umodsi3>
   11160:	b8 20 b8 00 	mv r23,r1
   11164:	ba 20 10 00 	mv r2,r17
   11168:	ba c0 08 00 	mv r1,r22
   1116c:	f8 00 05 16 	calli 125c4 <__udivsi3>
   11170:	3e e2 00 10 	sli r2,r23,16
   11174:	88 35 20 00 	mul r4,r1,r21
   11178:	21 6b ff ff 	andi r11,r11,0xffff
   1117c:	b8 4b 10 00 	or r2,r2,r11
   11180:	b8 20 18 00 	mv r3,r1
   11184:	50 44 00 07 	bgeu r2,r4,111a0 <__moddi3+0x484>
   11188:	b4 4f 10 00 	add r2,r2,r15
   1118c:	34 23 ff ff 	addi r3,r1,-1
   11190:	55 e2 00 04 	bgu r15,r2,111a0 <__moddi3+0x484>
   11194:	50 44 00 03 	bgeu r2,r4,111a0 <__moddi3+0x484>
   11198:	34 63 ff ff 	addi r3,r3,-1
   1119c:	b4 4f 10 00 	add r2,r2,r15
   111a0:	3e 61 00 10 	sli r1,r19,16
   111a4:	22 87 ff ff 	andi r7,r20,0xffff
   111a8:	b8 61 08 00 	or r1,r3,r1
   111ac:	20 25 ff ff 	andi r5,r1,0xffff
   111b0:	02 88 00 10 	srui r8,r20,16
   111b4:	00 21 00 10 	srui r1,r1,16
   111b8:	88 a7 30 00 	mul r6,r5,r7
   111bc:	88 27 38 00 	mul r7,r1,r7
   111c0:	88 a8 28 00 	mul r5,r5,r8
   111c4:	00 c3 00 10 	srui r3,r6,16
   111c8:	c8 44 10 00 	sub r2,r2,r4
   111cc:	b4 e5 28 00 	add r5,r7,r5
   111d0:	b4 a3 28 00 	add r5,r5,r3
   111d4:	88 28 08 00 	mul r1,r1,r8
   111d8:	50 a7 00 03 	bgeu r5,r7,111e4 <__moddi3+0x4c8>
   111dc:	78 03 00 01 	mvhi r3,0x1
   111e0:	b4 23 08 00 	add r1,r1,r3
   111e4:	00 a3 00 10 	srui r3,r5,16
   111e8:	3c a5 00 10 	sli r5,r5,16
   111ec:	20 c6 ff ff 	andi r6,r6,0xffff
   111f0:	b4 23 08 00 	add r1,r1,r3
   111f4:	b4 a6 28 00 	add r5,r5,r6
   111f8:	54 22 00 06 	bgu r1,r2,11210 <__moddi3+0x4f4>
   111fc:	e4 41 30 00 	cmpe r6,r2,r1
   11200:	f4 ad 18 00 	cmpgu r3,r5,r13
   11204:	b8 a0 20 00 	mv r4,r5
   11208:	a0 c3 18 00 	and r3,r6,r3
   1120c:	44 60 00 05 	be r3,r0,11220 <__moddi3+0x504>
   11210:	c8 b4 20 00 	sub r4,r5,r20
   11214:	f4 85 28 00 	cmpgu r5,r4,r5
   11218:	c8 2f 08 00 	sub r1,r1,r15
   1121c:	c8 25 08 00 	sub r1,r1,r5
   11220:	c9 a4 20 00 	sub r4,r13,r4
   11224:	f4 8d 68 00 	cmpgu r13,r4,r13
   11228:	c8 41 10 00 	sub r2,r2,r1
   1122c:	c8 4d 10 00 	sub r2,r2,r13
   11230:	bc 50 80 00 	sl r16,r2,r16
   11234:	80 8c 20 00 	sru r4,r4,r12
   11238:	80 4c 10 00 	sru r2,r2,r12
   1123c:	ba 04 20 00 	or r4,r16,r4
   11240:	59 c2 00 00 	sw (r14+0),r2
   11244:	59 c4 00 04 	sw (r14+4),r4
   11248:	e3 ff fe e4 	bi 10dd8 <__moddi3+0xbc>
   1124c:	bd 90 60 00 	sl r12,r12,r16
   11250:	81 62 78 00 	sru r15,r11,r2
   11254:	01 91 00 10 	srui r17,r12,16
   11258:	81 a2 18 00 	sru r3,r13,r2
   1125c:	bd 70 58 00 	sl r11,r11,r16
   11260:	b9 e0 08 00 	mv r1,r15
   11264:	ba 20 10 00 	mv r2,r17
   11268:	b9 63 a0 00 	or r20,r11,r3
   1126c:	f8 00 04 e6 	calli 12604 <__umodsi3>
   11270:	b8 20 58 00 	mv r11,r1
   11274:	ba 20 10 00 	mv r2,r17
   11278:	b9 e0 08 00 	mv r1,r15
   1127c:	f8 00 04 d2 	calli 125c4 <__udivsi3>
   11280:	21 93 ff ff 	andi r19,r12,0xffff
   11284:	3d 63 00 10 	sli r3,r11,16
   11288:	02 82 00 10 	srui r2,r20,16
   1128c:	88 33 08 00 	mul r1,r1,r19
   11290:	b8 62 18 00 	or r3,r3,r2
   11294:	bd b0 78 00 	sl r15,r13,r16
   11298:	50 61 00 05 	bgeu r3,r1,112ac <__moddi3+0x590>
   1129c:	b4 6c 18 00 	add r3,r3,r12
   112a0:	55 83 00 03 	bgu r12,r3,112ac <__moddi3+0x590>
   112a4:	50 61 00 02 	bgeu r3,r1,112ac <__moddi3+0x590>
   112a8:	b4 6c 18 00 	add r3,r3,r12
   112ac:	c8 61 58 00 	sub r11,r3,r1
   112b0:	b9 60 08 00 	mv r1,r11
   112b4:	ba 20 10 00 	mv r2,r17
   112b8:	f8 00 04 d3 	calli 12604 <__umodsi3>
   112bc:	b8 20 68 00 	mv r13,r1
   112c0:	ba 20 10 00 	mv r2,r17
   112c4:	b9 60 08 00 	mv r1,r11
   112c8:	f8 00 04 bf 	calli 125c4 <__udivsi3>
   112cc:	3d a2 00 10 	sli r2,r13,16
   112d0:	88 33 58 00 	mul r11,r1,r19
   112d4:	22 94 ff ff 	andi r20,r20,0xffff
   112d8:	b8 54 10 00 	or r2,r2,r20
   112dc:	50 4b 00 05 	bgeu r2,r11,112f0 <__moddi3+0x5d4>
   112e0:	b4 4c 10 00 	add r2,r2,r12
   112e4:	55 82 00 03 	bgu r12,r2,112f0 <__moddi3+0x5d4>
   112e8:	50 4b 00 02 	bgeu r2,r11,112f0 <__moddi3+0x5d4>
   112ec:	b4 4c 10 00 	add r2,r2,r12
   112f0:	c8 4b 58 00 	sub r11,r2,r11
   112f4:	e3 ff ff 3f 	bi 10ff0 <__moddi3+0x2d4>

000112f8 <__muldf3>:
   112f8:	37 9c ff cc 	addi sp,sp,-52
   112fc:	5b 8b 00 28 	sw (sp+40),r11
   11300:	5b 8c 00 24 	sw (sp+36),r12
   11304:	5b 8d 00 20 	sw (sp+32),r13
   11308:	5b 8e 00 1c 	sw (sp+28),r14
   1130c:	5b 8f 00 18 	sw (sp+24),r15
   11310:	5b 90 00 14 	sw (sp+20),r16
   11314:	5b 91 00 10 	sw (sp+16),r17
   11318:	5b 92 00 0c 	sw (sp+12),r18
   1131c:	5b 93 00 08 	sw (sp+8),r19
   11320:	5b 9d 00 04 	sw (sp+4),ra
   11324:	78 05 00 01 	mvhi r5,0x1
   11328:	38 a5 56 0c 	ori r5,r5,0x560c
   1132c:	00 2d 00 14 	srui r13,r1,20
   11330:	28 ab 00 00 	lw r11,(r5+0)
   11334:	21 ad 07 ff 	andi r13,r13,0x7ff
   11338:	b8 40 70 00 	mv r14,r2
   1133c:	a0 2b 58 00 	and r11,r1,r11
   11340:	00 2f 00 1f 	srui r15,r1,31
   11344:	45 a0 00 4c 	be r13,r0,11474 <__muldf3+0x17c>
   11348:	34 01 07 ff 	mvi r1,2047
   1134c:	45 a1 00 41 	be r13,r1,11450 <__muldf3+0x158>
   11350:	78 01 00 10 	mvhi r1,0x10
   11354:	b9 61 58 00 	or r11,r11,r1
   11358:	3d 6b 00 03 	sli r11,r11,3
   1135c:	00 41 00 1d 	srui r1,r2,29
   11360:	3c 4e 00 03 	sli r14,r2,3
   11364:	b9 61 58 00 	or r11,r11,r1
   11368:	35 ad fc 01 	addi r13,r13,-1023
   1136c:	34 11 00 00 	mvi r17,0
   11370:	34 12 00 00 	mvi r18,0
   11374:	78 06 00 01 	mvhi r6,0x1
   11378:	38 c6 56 0c 	ori r6,r6,0x560c
   1137c:	00 62 00 14 	srui r2,r3,20
   11380:	28 cc 00 00 	lw r12,(r6+0)
   11384:	20 42 07 ff 	andi r2,r2,0x7ff
   11388:	b8 80 28 00 	mv r5,r4
   1138c:	a0 6c 60 00 	and r12,r3,r12
   11390:	00 70 00 1f 	srui r16,r3,31
   11394:	44 40 00 1a 	be r2,r0,113fc <__muldf3+0x104>
   11398:	34 01 07 ff 	mvi r1,2047
   1139c:	44 41 00 11 	be r2,r1,113e0 <__muldf3+0xe8>
   113a0:	78 01 00 10 	mvhi r1,0x10
   113a4:	b9 81 60 00 	or r12,r12,r1
   113a8:	3d 8c 00 03 	sli r12,r12,3
   113ac:	00 81 00 1d 	srui r1,r4,29
   113b0:	3c 85 00 03 	sli r5,r4,3
   113b4:	b9 81 60 00 	or r12,r12,r1
   113b8:	34 42 fc 01 	addi r2,r2,-1023
   113bc:	34 06 00 00 	mvi r6,0
   113c0:	b8 d1 88 00 	or r17,r6,r17
   113c4:	78 04 00 01 	mvhi r4,0x1
   113c8:	3e 31 00 02 	sli r17,r17,2
   113cc:	38 84 56 14 	ori r4,r4,0x5614
   113d0:	b4 91 20 00 	add r4,r4,r17
   113d4:	28 81 00 00 	lw r1,(r4+0)
   113d8:	9a 0f 38 00 	xor r7,r16,r15
   113dc:	c0 20 00 00 	b r1
   113e0:	b9 84 08 00 	or r1,r12,r4
   113e4:	34 06 00 03 	mvi r6,3
   113e8:	5c 20 ff f6 	bne r1,r0,113c0 <__muldf3+0xc8>
   113ec:	34 0c 00 00 	mvi r12,0
   113f0:	34 05 00 00 	mvi r5,0
   113f4:	34 06 00 02 	mvi r6,2
   113f8:	e3 ff ff f2 	bi 113c0 <__muldf3+0xc8>
   113fc:	b9 84 08 00 	or r1,r12,r4
   11400:	44 22 00 3c 	be r1,r2,114f0 <__muldf3+0x1f8>
   11404:	45 80 01 29 	be r12,r0,118a8 <__muldf3+0x5b0>
   11408:	b9 80 08 00 	mv r1,r12
   1140c:	5b 84 00 2c 	sw (sp+44),r4
   11410:	f8 00 04 8d 	calli 12644 <__clzsi2>
   11414:	2b 84 00 2c 	lw r4,(sp+44)
   11418:	34 22 ff f5 	addi r2,r1,-11
   1141c:	34 03 00 1c 	mvi r3,28
   11420:	48 43 01 1e 	bg r2,r3,11898 <__muldf3+0x5a0>
   11424:	34 25 ff f8 	addi r5,r1,-8
   11428:	34 01 00 1d 	mvi r1,29
   1142c:	c8 22 08 00 	sub r1,r1,r2
   11430:	bd 85 60 00 	sl r12,r12,r5
   11434:	80 81 08 00 	sru r1,r4,r1
   11438:	bc 85 28 00 	sl r5,r4,r5
   1143c:	b8 2c 60 00 	or r12,r1,r12
   11440:	34 01 fc 02 	mvi r1,-1022
   11444:	c8 22 10 00 	sub r2,r1,r2
   11448:	34 06 00 00 	mvi r6,0
   1144c:	e3 ff ff dd 	bi 113c0 <__muldf3+0xc8>
   11450:	b9 62 08 00 	or r1,r11,r2
   11454:	34 11 00 0c 	mvi r17,12
   11458:	34 12 00 03 	mvi r18,3
   1145c:	5c 20 ff c6 	bne r1,r0,11374 <__muldf3+0x7c>
   11460:	34 11 00 08 	mvi r17,8
   11464:	34 0b 00 00 	mvi r11,0
   11468:	34 0e 00 00 	mvi r14,0
   1146c:	34 12 00 02 	mvi r18,2
   11470:	e3 ff ff c1 	bi 11374 <__muldf3+0x7c>
   11474:	b9 62 08 00 	or r1,r11,r2
   11478:	44 2d 00 19 	be r1,r13,114dc <__muldf3+0x1e4>
   1147c:	45 60 00 fd 	be r11,r0,11870 <__muldf3+0x578>
   11480:	b9 60 08 00 	mv r1,r11
   11484:	5b 82 00 34 	sw (sp+52),r2
   11488:	5b 83 00 30 	sw (sp+48),r3
   1148c:	5b 84 00 2c 	sw (sp+44),r4
   11490:	f8 00 04 6d 	calli 12644 <__clzsi2>
   11494:	2b 82 00 34 	lw r2,(sp+52)
   11498:	2b 83 00 30 	lw r3,(sp+48)
   1149c:	2b 84 00 2c 	lw r4,(sp+44)
   114a0:	34 25 ff f5 	addi r5,r1,-11
   114a4:	34 06 00 1c 	mvi r6,28
   114a8:	48 a6 00 ee 	bg r5,r6,11860 <__muldf3+0x568>
   114ac:	34 2e ff f8 	addi r14,r1,-8
   114b0:	34 01 00 1d 	mvi r1,29
   114b4:	c8 25 08 00 	sub r1,r1,r5
   114b8:	bd 6e 58 00 	sl r11,r11,r14
   114bc:	80 41 08 00 	sru r1,r2,r1
   114c0:	bc 4e 70 00 	sl r14,r2,r14
   114c4:	b8 2b 58 00 	or r11,r1,r11
   114c8:	34 0d fc 02 	mvi r13,-1022
   114cc:	c9 a5 68 00 	sub r13,r13,r5
   114d0:	34 11 00 00 	mvi r17,0
   114d4:	34 12 00 00 	mvi r18,0
   114d8:	e3 ff ff a7 	bi 11374 <__muldf3+0x7c>
   114dc:	34 11 00 04 	mvi r17,4
   114e0:	34 0b 00 00 	mvi r11,0
   114e4:	34 0e 00 00 	mvi r14,0
   114e8:	34 12 00 01 	mvi r18,1
   114ec:	e3 ff ff a2 	bi 11374 <__muldf3+0x7c>
   114f0:	34 0c 00 00 	mvi r12,0
   114f4:	34 05 00 00 	mvi r5,0
   114f8:	34 06 00 01 	mvi r6,1
   114fc:	e3 ff ff b1 	bi 113c0 <__muldf3+0xc8>
   11500:	b9 e0 08 00 	mv r1,r15
   11504:	b9 60 20 00 	mv r4,r11
   11508:	b9 c0 10 00 	mv r2,r14
   1150c:	b9 e0 38 00 	mv r7,r15
   11510:	ba 40 30 00 	mv r6,r18
   11514:	34 05 00 02 	mvi r5,2
   11518:	44 c5 00 4a 	be r6,r5,11640 <__muldf3+0x348>
   1151c:	34 05 00 03 	mvi r5,3
   11520:	44 c5 00 39 	be r6,r5,11604 <__muldf3+0x30c>
   11524:	34 03 00 01 	mvi r3,1
   11528:	44 c3 00 ca 	be r6,r3,11850 <__muldf3+0x558>
   1152c:	36 63 03 ff 	addi r3,r19,1023
   11530:	4c 03 00 c3 	bge r0,r3,1183c <__muldf3+0x544>
   11534:	20 45 00 0f 	andi r5,r2,0xf
   11538:	34 01 00 04 	mvi r1,4
   1153c:	44 a1 00 05 	be r5,r1,11550 <__muldf3+0x258>
   11540:	34 41 00 04 	addi r1,r2,4
   11544:	f4 41 28 00 	cmpgu r5,r2,r1
   11548:	b8 20 10 00 	mv r2,r1
   1154c:	b4 85 20 00 	add r4,r4,r5
   11550:	78 01 01 00 	mvhi r1,0x100
   11554:	a0 81 08 00 	and r1,r4,r1
   11558:	44 20 00 06 	be r1,r0,11570 <__muldf3+0x278>
   1155c:	78 05 00 01 	mvhi r5,0x1
   11560:	38 a5 56 10 	ori r5,r5,0x5610
   11564:	28 a1 00 00 	lw r1,(r5+0)
   11568:	34 63 00 01 	addi r3,r3,1
   1156c:	a0 81 20 00 	and r4,r4,r1
   11570:	34 01 07 fe 	mvi r1,2046
   11574:	4c 23 00 d3 	bge r1,r3,118c0 <__muldf3+0x5c8>
   11578:	b8 e0 08 00 	mv r1,r7
   1157c:	34 03 07 ff 	mvi r3,2047
   11580:	34 04 00 00 	mvi r4,0
   11584:	34 02 00 00 	mvi r2,0
   11588:	78 06 00 01 	mvhi r6,0x1
   1158c:	38 c6 56 0c 	ori r6,r6,0x560c
   11590:	28 c5 00 00 	lw r5,(r6+0)
   11594:	3c 63 00 14 	sli r3,r3,20
   11598:	3c 21 00 1f 	sli r1,r1,31
   1159c:	a0 85 20 00 	and r4,r4,r5
   115a0:	b8 83 20 00 	or r4,r4,r3
   115a4:	b8 81 08 00 	or r1,r4,r1
   115a8:	2b 9d 00 04 	lw ra,(sp+4)
   115ac:	2b 8b 00 28 	lw r11,(sp+40)
   115b0:	2b 8c 00 24 	lw r12,(sp+36)
   115b4:	2b 8d 00 20 	lw r13,(sp+32)
   115b8:	2b 8e 00 1c 	lw r14,(sp+28)
   115bc:	2b 8f 00 18 	lw r15,(sp+24)
   115c0:	2b 90 00 14 	lw r16,(sp+20)
   115c4:	2b 91 00 10 	lw r17,(sp+16)
   115c8:	2b 92 00 0c 	lw r18,(sp+12)
   115cc:	2b 93 00 08 	lw r19,(sp+8)
   115d0:	37 9c 00 34 	addi sp,sp,52
   115d4:	c3 a0 00 00 	ret
   115d8:	78 01 00 08 	mvhi r1,0x8
   115dc:	a1 61 18 00 	and r3,r11,r1
   115e0:	b9 60 20 00 	mv r4,r11
   115e4:	b9 c0 10 00 	mv r2,r14
   115e8:	b9 e0 38 00 	mv r7,r15
   115ec:	44 60 00 06 	be r3,r0,11604 <__muldf3+0x30c>
   115f0:	a1 81 08 00 	and r1,r12,r1
   115f4:	b9 80 20 00 	mv r4,r12
   115f8:	b8 a0 10 00 	mv r2,r5
   115fc:	ba 00 38 00 	mv r7,r16
   11600:	5c 20 00 b8 	bne r1,r0,118e0 <__muldf3+0x5e8>
   11604:	78 06 00 01 	mvhi r6,0x1
   11608:	78 01 00 08 	mvhi r1,0x8
   1160c:	38 c6 56 0c 	ori r6,r6,0x560c
   11610:	b8 81 20 00 	or r4,r4,r1
   11614:	28 c1 00 00 	lw r1,(r6+0)
   11618:	34 03 07 ff 	mvi r3,2047
   1161c:	a0 81 20 00 	and r4,r4,r1
   11620:	b8 e0 08 00 	mv r1,r7
   11624:	e3 ff ff d9 	bi 11588 <__muldf3+0x290>
   11628:	ba 40 30 00 	mv r6,r18
   1162c:	34 05 00 02 	mvi r5,2
   11630:	b8 e0 08 00 	mv r1,r7
   11634:	b9 60 20 00 	mv r4,r11
   11638:	b9 c0 10 00 	mv r2,r14
   1163c:	5c c5 ff b8 	bne r6,r5,1151c <__muldf3+0x224>
   11640:	34 03 07 ff 	mvi r3,2047
   11644:	34 04 00 00 	mvi r4,0
   11648:	34 02 00 00 	mvi r2,0
   1164c:	e3 ff ff cf 	bi 11588 <__muldf3+0x290>
   11650:	78 01 00 01 	mvhi r1,0x1
   11654:	38 21 56 0c 	ori r1,r1,0x560c
   11658:	28 24 00 00 	lw r4,(r1+0)
   1165c:	34 02 ff ff 	mvi r2,-1
   11660:	34 01 00 00 	mvi r1,0
   11664:	34 07 00 00 	mvi r7,0
   11668:	34 06 00 03 	mvi r6,3
   1166c:	e3 ff ff aa 	bi 11514 <__muldf3+0x21c>
   11670:	b8 e0 08 00 	mv r1,r7
   11674:	b9 80 20 00 	mv r4,r12
   11678:	b8 a0 10 00 	mv r2,r5
   1167c:	e3 ff ff a6 	bi 11514 <__muldf3+0x21c>
   11680:	ba 00 08 00 	mv r1,r16
   11684:	b9 80 20 00 	mv r4,r12
   11688:	b8 a0 10 00 	mv r2,r5
   1168c:	ba 00 38 00 	mv r7,r16
   11690:	e3 ff ff a1 	bi 11514 <__muldf3+0x21c>
   11694:	21 c6 ff ff 	andi r6,r14,0xffff
   11698:	20 a4 ff ff 	andi r4,r5,0xffff
   1169c:	88 86 50 00 	mul r10,r4,r6
   116a0:	00 a5 00 10 	srui r5,r5,16
   116a4:	01 ce 00 10 	srui r14,r14,16
   116a8:	88 a6 40 00 	mul r8,r5,r6
   116ac:	01 43 00 10 	srui r3,r10,16
   116b0:	88 8e 08 00 	mul r1,r4,r14
   116b4:	b4 4d 98 00 	add r19,r2,r13
   116b8:	b5 03 10 00 	add r2,r8,r3
   116bc:	b4 41 10 00 	add r2,r2,r1
   116c0:	88 ae 18 00 	mul r3,r5,r14
   116c4:	50 41 00 03 	bgeu r2,r1,116d0 <__muldf3+0x3d8>
   116c8:	78 01 00 01 	mvhi r1,0x1
   116cc:	b4 61 18 00 	add r3,r3,r1
   116d0:	21 81 ff ff 	andi r1,r12,0xffff
   116d4:	88 26 78 00 	mul r15,r1,r6
   116d8:	01 8c 00 10 	srui r12,r12,16
   116dc:	88 2e 40 00 	mul r8,r1,r14
   116e0:	89 86 30 00 	mul r6,r12,r6
   116e4:	01 e9 00 10 	srui r9,r15,16
   116e8:	3c 50 00 10 	sli r16,r2,16
   116ec:	b4 c9 48 00 	add r9,r6,r9
   116f0:	21 4a ff ff 	andi r10,r10,0xffff
   116f4:	b5 28 48 00 	add r9,r9,r8
   116f8:	00 46 00 10 	srui r6,r2,16
   116fc:	b6 0a 80 00 	add r16,r16,r10
   11700:	89 8e 70 00 	mul r14,r12,r14
   11704:	51 28 00 03 	bgeu r9,r8,11710 <__muldf3+0x418>
   11708:	78 02 00 01 	mvhi r2,0x1
   1170c:	b5 c2 70 00 	add r14,r14,r2
   11710:	21 62 ff ff 	andi r2,r11,0xffff
   11714:	88 82 68 00 	mul r13,r4,r2
   11718:	01 6b 00 10 	srui r11,r11,16
   1171c:	88 a2 88 00 	mul r17,r5,r2
   11720:	88 8b 20 00 	mul r4,r4,r11
   11724:	01 a8 00 10 	srui r8,r13,16
   11728:	01 2a 00 10 	srui r10,r9,16
   1172c:	b6 28 40 00 	add r8,r17,r8
   11730:	3d 29 00 10 	sli r9,r9,16
   11734:	21 ef ff ff 	andi r15,r15,0xffff
   11738:	b5 04 40 00 	add r8,r8,r4
   1173c:	b5 ca 70 00 	add r14,r14,r10
   11740:	b5 2f 48 00 	add r9,r9,r15
   11744:	88 ab 28 00 	mul r5,r5,r11
   11748:	51 04 00 03 	bgeu r8,r4,11754 <__muldf3+0x45c>
   1174c:	78 04 00 01 	mvhi r4,0x1
   11750:	b4 a4 28 00 	add r5,r5,r4
   11754:	88 22 20 00 	mul r4,r1,r2
   11758:	89 82 10 00 	mul r2,r12,r2
   1175c:	88 2b 08 00 	mul r1,r1,r11
   11760:	00 8f 00 10 	srui r15,r4,16
   11764:	01 0a 00 10 	srui r10,r8,16
   11768:	b4 4f 10 00 	add r2,r2,r15
   1176c:	3d 08 00 10 	sli r8,r8,16
   11770:	21 ad ff ff 	andi r13,r13,0xffff
   11774:	b4 41 10 00 	add r2,r2,r1
   11778:	b4 aa 28 00 	add r5,r5,r10
   1177c:	b5 0d 40 00 	add r8,r8,r13
   11780:	89 8b 58 00 	mul r11,r12,r11
   11784:	50 41 00 03 	bgeu r2,r1,11790 <__muldf3+0x498>
   11788:	78 01 00 01 	mvhi r1,0x1
   1178c:	b5 61 58 00 	add r11,r11,r1
   11790:	b5 26 30 00 	add r6,r9,r6
   11794:	3c 4a 00 10 	sli r10,r2,16
   11798:	b4 c3 30 00 	add r6,r6,r3
   1179c:	20 84 ff ff 	andi r4,r4,0xffff
   117a0:	f5 26 48 00 	cmpgu r9,r9,r6
   117a4:	b5 44 50 00 	add r10,r10,r4
   117a8:	b4 c8 30 00 	add r6,r6,r8
   117ac:	b5 4e 50 00 	add r10,r10,r14
   117b0:	f5 06 40 00 	cmpgu r8,r8,r6
   117b4:	b5 49 20 00 	add r4,r10,r9
   117b8:	b4 a4 18 00 	add r3,r5,r4
   117bc:	b4 68 08 00 	add r1,r3,r8
   117c0:	f5 ca 70 00 	cmpgu r14,r14,r10
   117c4:	f5 24 20 00 	cmpgu r4,r9,r4
   117c8:	f4 a3 28 00 	cmpgu r5,r5,r3
   117cc:	00 42 00 10 	srui r2,r2,16
   117d0:	f5 01 40 00 	cmpgu r8,r8,r1
   117d4:	b8 8e 20 00 	or r4,r4,r14
   117d8:	b4 82 20 00 	add r4,r4,r2
   117dc:	b9 05 28 00 	or r5,r8,r5
   117e0:	b4 85 20 00 	add r4,r4,r5
   117e4:	3c c2 00 09 	sli r2,r6,9
   117e8:	b4 8b 58 00 	add r11,r4,r11
   117ec:	00 23 00 17 	srui r3,r1,23
   117f0:	3d 64 00 09 	sli r4,r11,9
   117f4:	b8 50 10 00 	or r2,r2,r16
   117f8:	7c 42 00 00 	cmpnei r2,r2,0
   117fc:	00 c6 00 17 	srui r6,r6,23
   11800:	b8 83 20 00 	or r4,r4,r3
   11804:	3c 21 00 09 	sli r1,r1,9
   11808:	78 03 01 00 	mvhi r3,0x100
   1180c:	b8 46 10 00 	or r2,r2,r6
   11810:	a0 83 18 00 	and r3,r4,r3
   11814:	b8 41 10 00 	or r2,r2,r1
   11818:	44 60 ff 45 	be r3,r0,1152c <__muldf3+0x234>
   1181c:	00 43 00 01 	srui r3,r2,1
   11820:	3c 81 00 1f 	sli r1,r4,31
   11824:	20 42 00 01 	andi r2,r2,0x1
   11828:	b8 43 10 00 	or r2,r2,r3
   1182c:	36 73 00 01 	addi r19,r19,1
   11830:	b8 41 10 00 	or r2,r2,r1
   11834:	00 84 00 01 	srui r4,r4,1
   11838:	e3 ff ff 3d 	bi 1152c <__muldf3+0x234>
   1183c:	34 01 00 01 	mvi r1,1
   11840:	c8 23 18 00 	sub r3,r1,r3
   11844:	34 01 00 38 	mvi r1,56
   11848:	4c 23 00 2a 	bge r1,r3,118f0 <__muldf3+0x5f8>
   1184c:	b8 e0 08 00 	mv r1,r7
   11850:	34 03 00 00 	mvi r3,0
   11854:	34 04 00 00 	mvi r4,0
   11858:	34 02 00 00 	mvi r2,0
   1185c:	e3 ff ff 4b 	bi 11588 <__muldf3+0x290>
   11860:	34 2b ff d8 	addi r11,r1,-40
   11864:	bc 4b 58 00 	sl r11,r2,r11
   11868:	34 0e 00 00 	mvi r14,0
   1186c:	e3 ff ff 17 	bi 114c8 <__muldf3+0x1d0>
   11870:	b8 40 08 00 	mv r1,r2
   11874:	5b 82 00 34 	sw (sp+52),r2
   11878:	5b 83 00 30 	sw (sp+48),r3
   1187c:	5b 84 00 2c 	sw (sp+44),r4
   11880:	f8 00 03 71 	calli 12644 <__clzsi2>
   11884:	34 21 00 20 	addi r1,r1,32
   11888:	2b 84 00 2c 	lw r4,(sp+44)
   1188c:	2b 83 00 30 	lw r3,(sp+48)
   11890:	2b 82 00 34 	lw r2,(sp+52)
   11894:	e3 ff ff 03 	bi 114a0 <__muldf3+0x1a8>
   11898:	34 2c ff d8 	addi r12,r1,-40
   1189c:	bc 8c 60 00 	sl r12,r4,r12
   118a0:	34 05 00 00 	mvi r5,0
   118a4:	e3 ff fe e7 	bi 11440 <__muldf3+0x148>
   118a8:	b8 80 08 00 	mv r1,r4
   118ac:	5b 84 00 2c 	sw (sp+44),r4
   118b0:	f8 00 03 65 	calli 12644 <__clzsi2>
   118b4:	34 21 00 20 	addi r1,r1,32
   118b8:	2b 84 00 2c 	lw r4,(sp+44)
   118bc:	e3 ff fe d7 	bi 11418 <__muldf3+0x120>
   118c0:	3c 81 00 1d 	sli r1,r4,29
   118c4:	00 42 00 03 	srui r2,r2,3
   118c8:	3c 84 00 09 	sli r4,r4,9
   118cc:	b8 22 10 00 	or r2,r1,r2
   118d0:	00 84 00 0c 	srui r4,r4,12
   118d4:	20 63 07 ff 	andi r3,r3,0x7ff
   118d8:	b8 e0 08 00 	mv r1,r7
   118dc:	e3 ff ff 2b 	bi 11588 <__muldf3+0x290>
   118e0:	b9 60 20 00 	mv r4,r11
   118e4:	b9 c0 10 00 	mv r2,r14
   118e8:	b9 e0 38 00 	mv r7,r15
   118ec:	e3 ff ff 46 	bi 11604 <__muldf3+0x30c>
   118f0:	34 01 00 1f 	mvi r1,31
   118f4:	48 61 00 19 	bg r3,r1,11958 <__muldf3+0x660>
   118f8:	34 01 00 20 	mvi r1,32
   118fc:	c8 23 08 00 	sub r1,r1,r3
   11900:	bc 41 28 00 	sl r5,r2,r1
   11904:	80 43 10 00 	sru r2,r2,r3
   11908:	bc 81 08 00 	sl r1,r4,r1
   1190c:	7c a5 00 00 	cmpnei r5,r5,0
   11910:	b8 22 08 00 	or r1,r1,r2
   11914:	80 83 18 00 	sru r3,r4,r3
   11918:	b8 25 08 00 	or r1,r1,r5
   1191c:	20 24 00 0f 	andi r4,r1,0xf
   11920:	34 02 00 04 	mvi r2,4
   11924:	44 82 00 05 	be r4,r2,11938 <__muldf3+0x640>
   11928:	34 22 00 04 	addi r2,r1,4
   1192c:	f4 22 20 00 	cmpgu r4,r1,r2
   11930:	b8 40 08 00 	mv r1,r2
   11934:	b4 64 18 00 	add r3,r3,r4
   11938:	78 02 00 80 	mvhi r2,0x80
   1193c:	a0 62 10 00 	and r2,r3,r2
   11940:	44 40 00 11 	be r2,r0,11984 <__muldf3+0x68c>
   11944:	b8 e0 08 00 	mv r1,r7
   11948:	34 03 00 01 	mvi r3,1
   1194c:	34 04 00 00 	mvi r4,0
   11950:	34 02 00 00 	mvi r2,0
   11954:	e3 ff ff 0d 	bi 11588 <__muldf3+0x290>
   11958:	34 06 00 20 	mvi r6,32
   1195c:	80 83 08 00 	sru r1,r4,r3
   11960:	34 05 00 00 	mvi r5,0
   11964:	44 66 00 03 	be r3,r6,11970 <__muldf3+0x678>
   11968:	c8 03 18 00 	sub r3,r0,r3
   1196c:	bc 83 28 00 	sl r5,r4,r3
   11970:	b8 a2 10 00 	or r2,r5,r2
   11974:	7c 42 00 00 	cmpnei r2,r2,0
   11978:	34 03 00 00 	mvi r3,0
   1197c:	b8 41 08 00 	or r1,r2,r1
   11980:	e3 ff ff e7 	bi 1191c <__muldf3+0x624>
   11984:	00 21 00 03 	srui r1,r1,3
   11988:	3c 62 00 1d 	sli r2,r3,29
   1198c:	3c 63 00 09 	sli r3,r3,9
   11990:	b8 41 10 00 	or r2,r2,r1
   11994:	00 64 00 0c 	srui r4,r3,12
   11998:	b8 e0 08 00 	mv r1,r7
   1199c:	34 03 00 00 	mvi r3,0
   119a0:	e3 ff fe fa 	bi 11588 <__muldf3+0x290>

000119a4 <__subdf3>:
   119a4:	37 9c ff ec 	addi sp,sp,-20
   119a8:	5b 8b 00 14 	sw (sp+20),r11
   119ac:	5b 8c 00 10 	sw (sp+16),r12
   119b0:	5b 8d 00 0c 	sw (sp+12),r13
   119b4:	5b 8e 00 08 	sw (sp+8),r14
   119b8:	5b 9d 00 04 	sw (sp+4),ra
   119bc:	78 05 00 01 	mvhi r5,0x1
   119c0:	38 a5 56 0c 	ori r5,r5,0x560c
   119c4:	28 a8 00 00 	lw r8,(r5+0)
   119c8:	00 6c 00 14 	srui r12,r3,20
   119cc:	00 27 00 14 	srui r7,r1,20
   119d0:	a0 28 48 00 	and r9,r1,r8
   119d4:	a0 68 40 00 	and r8,r3,r8
   119d8:	00 4a 00 1d 	srui r10,r2,29
   119dc:	00 86 00 1d 	srui r6,r4,29
   119e0:	3d 29 00 03 	sli r9,r9,3
   119e4:	3d 08 00 03 	sli r8,r8,3
   119e8:	21 8c 07 ff 	andi r12,r12,0x7ff
   119ec:	34 05 07 ff 	mvi r5,2047
   119f0:	20 e7 07 ff 	andi r7,r7,0x7ff
   119f4:	00 21 00 1f 	srui r1,r1,31
   119f8:	b9 2a 48 00 	or r9,r9,r10
   119fc:	3c 42 00 03 	sli r2,r2,3
   11a00:	00 63 00 1f 	srui r3,r3,31
   11a04:	b9 06 40 00 	or r8,r8,r6
   11a08:	3c 84 00 03 	sli r4,r4,3
   11a0c:	45 85 00 3e 	be r12,r5,11b04 <__subdf3+0x160>
   11a10:	18 63 00 01 	xori r3,r3,0x1
   11a14:	44 23 00 7b 	be r1,r3,11c00 <__subdf3+0x25c>
   11a18:	c8 ec 28 00 	sub r5,r7,r12
   11a1c:	4c 05 00 b3 	bge r0,r5,11ce8 <__subdf3+0x344>
   11a20:	5d 80 00 3d 	bne r12,r0,11b14 <__subdf3+0x170>
   11a24:	b9 04 18 00 	or r3,r8,r4
   11a28:	5c 6c 00 8b 	bne r3,r12,11c54 <__subdf3+0x2b0>
   11a2c:	34 e6 00 01 	addi r6,r7,1
   11a30:	b9 20 28 00 	mv r5,r9
   11a34:	b8 40 58 00 	mv r11,r2
   11a38:	b8 e0 60 00 	mv r12,r7
   11a3c:	b8 20 68 00 	mv r13,r1
   11a40:	21 62 00 0f 	andi r2,r11,0xf
   11a44:	34 01 00 04 	mvi r1,4
   11a48:	44 41 00 90 	be r2,r1,11c88 <__subdf3+0x2e4>
   11a4c:	35 64 00 04 	addi r4,r11,4
   11a50:	f5 64 58 00 	cmpgu r11,r11,r4
   11a54:	35 86 00 01 	addi r6,r12,1
   11a58:	b4 ab 28 00 	add r5,r5,r11
   11a5c:	21 ad 00 01 	andi r13,r13,0x1
   11a60:	78 01 00 80 	mvhi r1,0x80
   11a64:	a0 a1 08 00 	and r1,r5,r1
   11a68:	44 20 00 0c 	be r1,r0,11a98 <__subdf3+0xf4>
   11a6c:	34 01 07 ff 	mvi r1,2047
   11a70:	34 0c 07 ff 	mvi r12,2047
   11a74:	34 03 00 00 	mvi r3,0
   11a78:	34 02 00 00 	mvi r2,0
   11a7c:	44 c1 00 13 	be r6,r1,11ac8 <__subdf3+0x124>
   11a80:	78 02 00 01 	mvhi r2,0x1
   11a84:	38 42 56 54 	ori r2,r2,0x5654
   11a88:	28 41 00 00 	lw r1,(r2+0)
   11a8c:	b8 c0 60 00 	mv r12,r6
   11a90:	34 c6 00 01 	addi r6,r6,1
   11a94:	a0 a1 28 00 	and r5,r5,r1
   11a98:	3c a2 00 1d 	sli r2,r5,29
   11a9c:	00 84 00 03 	srui r4,r4,3
   11aa0:	20 c6 07 ff 	andi r6,r6,0x7ff
   11aa4:	34 01 00 01 	mvi r1,1
   11aa8:	b8 44 10 00 	or r2,r2,r4
   11aac:	00 a5 00 03 	srui r5,r5,3
   11ab0:	4c 26 00 83 	bge r1,r6,11cbc <__subdf3+0x318>
   11ab4:	78 04 00 01 	mvhi r4,0x1
   11ab8:	38 84 56 0c 	ori r4,r4,0x560c
   11abc:	28 83 00 00 	lw r3,(r4+0)
   11ac0:	21 8c 07 ff 	andi r12,r12,0x7ff
   11ac4:	a0 a3 18 00 	and r3,r5,r3
   11ac8:	78 05 00 01 	mvhi r5,0x1
   11acc:	38 a5 56 0c 	ori r5,r5,0x560c
   11ad0:	28 a1 00 00 	lw r1,(r5+0)
   11ad4:	3d 8c 00 14 	sli r12,r12,20
   11ad8:	3d ad 00 1f 	sli r13,r13,31
   11adc:	a0 61 18 00 	and r3,r3,r1
   11ae0:	b8 6c 08 00 	or r1,r3,r12
   11ae4:	b8 2d 08 00 	or r1,r1,r13
   11ae8:	2b 9d 00 04 	lw ra,(sp+4)
   11aec:	2b 8b 00 14 	lw r11,(sp+20)
   11af0:	2b 8c 00 10 	lw r12,(sp+16)
   11af4:	2b 8d 00 0c 	lw r13,(sp+12)
   11af8:	2b 8e 00 08 	lw r14,(sp+8)
   11afc:	37 9c 00 14 	addi sp,sp,20
   11b00:	c3 a0 00 00 	ret
   11b04:	b9 04 28 00 	or r5,r8,r4
   11b08:	5c a0 ff c3 	bne r5,r0,11a14 <__subdf3+0x70>
   11b0c:	18 63 00 01 	xori r3,r3,0x1
   11b10:	e3 ff ff c1 	bi 11a14 <__subdf3+0x70>
   11b14:	34 03 07 ff 	mvi r3,2047
   11b18:	44 e3 00 54 	be r7,r3,11c68 <__subdf3+0x2c4>
   11b1c:	78 03 00 80 	mvhi r3,0x80
   11b20:	b9 03 40 00 	or r8,r8,r3
   11b24:	34 03 00 38 	mvi r3,56
   11b28:	48 a3 00 9d 	bg r5,r3,11d9c <__subdf3+0x3f8>
   11b2c:	34 03 00 1f 	mvi r3,31
   11b30:	48 a3 00 ca 	bg r5,r3,11e58 <__subdf3+0x4b4>
   11b34:	34 03 00 20 	mvi r3,32
   11b38:	c8 65 18 00 	sub r3,r3,r5
   11b3c:	bc 83 30 00 	sl r6,r4,r3
   11b40:	bd 03 18 00 	sl r3,r8,r3
   11b44:	80 85 20 00 	sru r4,r4,r5
   11b48:	7c c6 00 00 	cmpnei r6,r6,0
   11b4c:	b8 64 58 00 	or r11,r3,r4
   11b50:	81 05 40 00 	sru r8,r8,r5
   11b54:	b9 66 58 00 	or r11,r11,r6
   11b58:	c8 4b 58 00 	sub r11,r2,r11
   11b5c:	f5 62 10 00 	cmpgu r2,r11,r2
   11b60:	c9 28 28 00 	sub r5,r9,r8
   11b64:	c8 a2 28 00 	sub r5,r5,r2
   11b68:	b8 e0 60 00 	mv r12,r7
   11b6c:	b8 20 68 00 	mv r13,r1
   11b70:	78 02 00 01 	mvhi r2,0x1
   11b74:	38 42 56 58 	ori r2,r2,0x5658
   11b78:	28 4e 00 00 	lw r14,(r2+0)
   11b7c:	78 01 00 80 	mvhi r1,0x80
   11b80:	a0 a1 08 00 	and r1,r5,r1
   11b84:	a0 ae 70 00 	and r14,r5,r14
   11b88:	35 86 00 01 	addi r6,r12,1
   11b8c:	44 20 ff ad 	be r1,r0,11a40 <__subdf3+0x9c>
   11b90:	45 c0 00 74 	be r14,r0,11d60 <__subdf3+0x3bc>
   11b94:	b9 c0 08 00 	mv r1,r14
   11b98:	f8 00 02 ab 	calli 12644 <__clzsi2>
   11b9c:	34 22 ff f8 	addi r2,r1,-8
   11ba0:	34 03 00 1f 	mvi r3,31
   11ba4:	48 43 00 73 	bg r2,r3,11d70 <__subdf3+0x3cc>
   11ba8:	c8 02 28 00 	sub r5,r0,r2
   11bac:	81 65 28 00 	sru r5,r11,r5
   11bb0:	bd c2 70 00 	sl r14,r14,r2
   11bb4:	bd 62 58 00 	sl r11,r11,r2
   11bb8:	b8 ae 28 00 	or r5,r5,r14
   11bbc:	49 82 00 71 	bg r12,r2,11d80 <__subdf3+0x3dc>
   11bc0:	c8 4c 10 00 	sub r2,r2,r12
   11bc4:	34 42 00 01 	addi r2,r2,1
   11bc8:	34 01 00 1f 	mvi r1,31
   11bcc:	48 41 00 96 	bg r2,r1,11e24 <__subdf3+0x480>
   11bd0:	34 01 00 20 	mvi r1,32
   11bd4:	c8 22 08 00 	sub r1,r1,r2
   11bd8:	bd 61 18 00 	sl r3,r11,r1
   11bdc:	bc a1 08 00 	sl r1,r5,r1
   11be0:	81 62 58 00 	sru r11,r11,r2
   11be4:	7c 63 00 00 	cmpnei r3,r3,0
   11be8:	b9 61 58 00 	or r11,r11,r1
   11bec:	b9 63 58 00 	or r11,r11,r3
   11bf0:	80 a2 28 00 	sru r5,r5,r2
   11bf4:	34 06 00 01 	mvi r6,1
   11bf8:	34 0c 00 00 	mvi r12,0
   11bfc:	e3 ff ff 91 	bi 11a40 <__subdf3+0x9c>
   11c00:	c8 ec 18 00 	sub r3,r7,r12
   11c04:	4c 03 00 6f 	bge r0,r3,11dc0 <__subdf3+0x41c>
   11c08:	45 80 00 23 	be r12,r0,11c94 <__subdf3+0x2f0>
   11c0c:	34 05 07 ff 	mvi r5,2047
   11c10:	44 e5 00 16 	be r7,r5,11c68 <__subdf3+0x2c4>
   11c14:	78 05 00 80 	mvhi r5,0x80
   11c18:	b9 05 40 00 	or r8,r8,r5
   11c1c:	34 05 00 38 	mvi r5,56
   11c20:	48 65 00 bc 	bg r3,r5,11f10 <__subdf3+0x56c>
   11c24:	34 05 00 1f 	mvi r5,31
   11c28:	48 65 00 f1 	bg r3,r5,11fec <__subdf3+0x648>
   11c2c:	34 05 00 20 	mvi r5,32
   11c30:	c8 a3 28 00 	sub r5,r5,r3
   11c34:	bc 85 30 00 	sl r6,r4,r5
   11c38:	80 83 20 00 	sru r4,r4,r3
   11c3c:	bd 05 28 00 	sl r5,r8,r5
   11c40:	7c c6 00 00 	cmpnei r6,r6,0
   11c44:	b8 a4 58 00 	or r11,r5,r4
   11c48:	b9 66 58 00 	or r11,r11,r6
   11c4c:	81 03 18 00 	sru r3,r8,r3
   11c50:	e0 00 00 b3 	bi 11f1c <__subdf3+0x578>
   11c54:	34 a5 ff ff 	addi r5,r5,-1
   11c58:	c8 44 58 00 	sub r11,r2,r4
   11c5c:	44 a0 ff c0 	be r5,r0,11b5c <__subdf3+0x1b8>
   11c60:	34 03 07 ff 	mvi r3,2047
   11c64:	5c e3 ff b0 	bne r7,r3,11b24 <__subdf3+0x180>
   11c68:	b8 40 58 00 	mv r11,r2
   11c6c:	b8 20 68 00 	mv r13,r1
   11c70:	21 62 00 0f 	andi r2,r11,0xf
   11c74:	34 01 00 04 	mvi r1,4
   11c78:	b9 20 28 00 	mv r5,r9
   11c7c:	34 06 08 00 	mvi r6,2048
   11c80:	34 0c 07 ff 	mvi r12,2047
   11c84:	5c 41 ff 72 	bne r2,r1,11a4c <__subdf3+0xa8>
   11c88:	21 ad 00 01 	andi r13,r13,0x1
   11c8c:	b9 60 20 00 	mv r4,r11
   11c90:	e3 ff ff 74 	bi 11a60 <__subdf3+0xbc>
   11c94:	b9 04 28 00 	or r5,r8,r4
   11c98:	44 ac ff 65 	be r5,r12,11a2c <__subdf3+0x88>
   11c9c:	34 63 ff ff 	addi r3,r3,-1
   11ca0:	5c 60 00 cb 	bne r3,r0,11fcc <__subdf3+0x628>
   11ca4:	b4 82 58 00 	add r11,r4,r2
   11ca8:	f4 4b 10 00 	cmpgu r2,r2,r11
   11cac:	b5 09 28 00 	add r5,r8,r9
   11cb0:	b4 a2 28 00 	add r5,r5,r2
   11cb4:	b8 e0 60 00 	mv r12,r7
   11cb8:	e0 00 00 9e 	bi 11f30 <__subdf3+0x58c>
   11cbc:	b8 45 08 00 	or r1,r2,r5
   11cc0:	44 20 01 83 	be r1,r0,122cc <__subdf3+0x928>
   11cc4:	45 80 00 3a 	be r12,r0,11dac <__subdf3+0x408>
   11cc8:	78 04 00 01 	mvhi r4,0x1
   11ccc:	38 84 56 0c 	ori r4,r4,0x560c
   11cd0:	28 81 00 00 	lw r1,(r4+0)
   11cd4:	78 03 00 08 	mvhi r3,0x8
   11cd8:	b8 a3 18 00 	or r3,r5,r3
   11cdc:	a0 61 18 00 	and r3,r3,r1
   11ce0:	21 8c 07 ff 	andi r12,r12,0x7ff
   11ce4:	e3 ff ff 79 	bi 11ac8 <__subdf3+0x124>
   11ce8:	5c a0 00 67 	bne r5,r0,11e84 <__subdf3+0x4e0>
   11cec:	34 e6 00 01 	addi r6,r7,1
   11cf0:	20 c6 07 ff 	andi r6,r6,0x7ff
   11cf4:	34 05 00 01 	mvi r5,1
   11cf8:	48 c5 00 0c 	bg r6,r5,11d28 <__subdf3+0x384>
   11cfc:	5c e0 00 d0 	bne r7,r0,1203c <__subdf3+0x698>
   11d00:	b9 22 28 00 	or r5,r9,r2
   11d04:	5c a7 01 1d 	bne r5,r7,12178 <__subdf3+0x7d4>
   11d08:	b9 04 08 00 	or r1,r8,r4
   11d0c:	44 20 00 7b 	be r1,r0,11ef8 <__subdf3+0x554>
   11d10:	b9 00 28 00 	mv r5,r8
   11d14:	b8 80 58 00 	mv r11,r4
   11d18:	b8 60 68 00 	mv r13,r3
   11d1c:	34 06 00 01 	mvi r6,1
   11d20:	34 0c 00 00 	mvi r12,0
   11d24:	e3 ff ff 47 	bi 11a40 <__subdf3+0x9c>
   11d28:	c8 44 58 00 	sub r11,r2,r4
   11d2c:	f5 62 28 00 	cmpgu r5,r11,r2
   11d30:	c9 28 70 00 	sub r14,r9,r8
   11d34:	c9 c5 70 00 	sub r14,r14,r5
   11d38:	78 05 00 80 	mvhi r5,0x80
   11d3c:	a1 c5 28 00 	and r5,r14,r5
   11d40:	44 a0 00 6a 	be r5,r0,11ee8 <__subdf3+0x544>
   11d44:	c8 82 58 00 	sub r11,r4,r2
   11d48:	f5 64 20 00 	cmpgu r4,r11,r4
   11d4c:	c9 09 40 00 	sub r8,r8,r9
   11d50:	c9 04 70 00 	sub r14,r8,r4
   11d54:	b8 e0 60 00 	mv r12,r7
   11d58:	b8 60 68 00 	mv r13,r3
   11d5c:	5d c0 ff 8e 	bne r14,r0,11b94 <__subdf3+0x1f0>
   11d60:	b9 60 08 00 	mv r1,r11
   11d64:	f8 00 02 38 	calli 12644 <__clzsi2>
   11d68:	34 21 00 20 	addi r1,r1,32
   11d6c:	e3 ff ff 8c 	bi 11b9c <__subdf3+0x1f8>
   11d70:	34 25 ff d8 	addi r5,r1,-40
   11d74:	bd 65 28 00 	sl r5,r11,r5
   11d78:	34 0b 00 00 	mvi r11,0
   11d7c:	e3 ff ff 90 	bi 11bbc <__subdf3+0x218>
   11d80:	78 04 00 01 	mvhi r4,0x1
   11d84:	38 84 56 54 	ori r4,r4,0x5654
   11d88:	28 81 00 00 	lw r1,(r4+0)
   11d8c:	c9 82 60 00 	sub r12,r12,r2
   11d90:	35 86 00 01 	addi r6,r12,1
   11d94:	a0 a1 28 00 	and r5,r5,r1
   11d98:	e3 ff ff 2a 	bi 11a40 <__subdf3+0x9c>
   11d9c:	b9 04 58 00 	or r11,r8,r4
   11da0:	7d 6b 00 00 	cmpnei r11,r11,0
   11da4:	34 08 00 00 	mvi r8,0
   11da8:	e3 ff ff 6c 	bi 11b58 <__subdf3+0x1b4>
   11dac:	78 01 00 01 	mvhi r1,0x1
   11db0:	38 21 56 0c 	ori r1,r1,0x560c
   11db4:	28 23 00 00 	lw r3,(r1+0)
   11db8:	a0 a3 18 00 	and r3,r5,r3
   11dbc:	e3 ff ff 43 	bi 11ac8 <__subdf3+0x124>
   11dc0:	5c 60 00 96 	bne r3,r0,12018 <__subdf3+0x674>
   11dc4:	34 ec 00 01 	addi r12,r7,1
   11dc8:	21 85 07 ff 	andi r5,r12,0x7ff
   11dcc:	34 03 00 01 	mvi r3,1
   11dd0:	48 a3 00 6b 	bg r5,r3,11f7c <__subdf3+0x5d8>
   11dd4:	5c e0 00 fa 	bne r7,r0,121bc <__subdf3+0x818>
   11dd8:	b9 22 18 00 	or r3,r9,r2
   11ddc:	44 67 01 36 	be r3,r7,122b4 <__subdf3+0x910>
   11de0:	b9 04 18 00 	or r3,r8,r4
   11de4:	44 60 01 4c 	be r3,r0,12314 <__subdf3+0x970>
   11de8:	b4 82 58 00 	add r11,r4,r2
   11dec:	f4 4b 10 00 	cmpgu r2,r2,r11
   11df0:	b5 09 28 00 	add r5,r8,r9
   11df4:	b4 a2 28 00 	add r5,r5,r2
   11df8:	78 02 00 80 	mvhi r2,0x80
   11dfc:	a0 a2 10 00 	and r2,r5,r2
   11e00:	44 40 01 13 	be r2,r0,1224c <__subdf3+0x8a8>
   11e04:	78 02 00 01 	mvhi r2,0x1
   11e08:	38 42 56 54 	ori r2,r2,0x5654
   11e0c:	b8 20 68 00 	mv r13,r1
   11e10:	28 41 00 00 	lw r1,(r2+0)
   11e14:	34 06 00 02 	mvi r6,2
   11e18:	34 0c 00 01 	mvi r12,1
   11e1c:	a0 a1 28 00 	and r5,r5,r1
   11e20:	e3 ff ff 08 	bi 11a40 <__subdf3+0x9c>
   11e24:	34 04 00 20 	mvi r4,32
   11e28:	80 a2 18 00 	sru r3,r5,r2
   11e2c:	34 01 00 00 	mvi r1,0
   11e30:	44 44 00 03 	be r2,r4,11e3c <__subdf3+0x498>
   11e34:	c8 02 08 00 	sub r1,r0,r2
   11e38:	bc a1 08 00 	sl r1,r5,r1
   11e3c:	b8 2b 58 00 	or r11,r1,r11
   11e40:	7d 6b 00 00 	cmpnei r11,r11,0
   11e44:	34 06 00 01 	mvi r6,1
   11e48:	b9 63 58 00 	or r11,r11,r3
   11e4c:	34 05 00 00 	mvi r5,0
   11e50:	34 0c 00 00 	mvi r12,0
   11e54:	e3 ff fe fb 	bi 11a40 <__subdf3+0x9c>
   11e58:	34 0a 00 20 	mvi r10,32
   11e5c:	81 05 30 00 	sru r6,r8,r5
   11e60:	34 03 00 00 	mvi r3,0
   11e64:	44 aa 00 03 	be r5,r10,11e70 <__subdf3+0x4cc>
   11e68:	c8 05 18 00 	sub r3,r0,r5
   11e6c:	bd 03 18 00 	sl r3,r8,r3
   11e70:	b8 64 58 00 	or r11,r3,r4
   11e74:	7d 6b 00 00 	cmpnei r11,r11,0
   11e78:	34 08 00 00 	mvi r8,0
   11e7c:	b9 66 58 00 	or r11,r11,r6
   11e80:	e3 ff ff 36 	bi 11b58 <__subdf3+0x1b4>
   11e84:	c8 05 28 00 	sub r5,r0,r5
   11e88:	44 e0 00 4a 	be r7,r0,11fb0 <__subdf3+0x60c>
   11e8c:	34 01 07 ff 	mvi r1,2047
   11e90:	45 81 00 79 	be r12,r1,12074 <__subdf3+0x6d0>
   11e94:	78 01 00 80 	mvhi r1,0x80
   11e98:	b9 21 48 00 	or r9,r9,r1
   11e9c:	34 01 00 38 	mvi r1,56
   11ea0:	48 a1 00 83 	bg r5,r1,120ac <__subdf3+0x708>
   11ea4:	34 01 00 1f 	mvi r1,31
   11ea8:	48 a1 00 ed 	bg r5,r1,1225c <__subdf3+0x8b8>
   11eac:	34 01 00 20 	mvi r1,32
   11eb0:	c8 25 08 00 	sub r1,r1,r5
   11eb4:	bc 41 30 00 	sl r6,r2,r1
   11eb8:	bd 21 08 00 	sl r1,r9,r1
   11ebc:	80 45 10 00 	sru r2,r2,r5
   11ec0:	7c c6 00 00 	cmpnei r6,r6,0
   11ec4:	b8 22 58 00 	or r11,r1,r2
   11ec8:	81 25 48 00 	sru r9,r9,r5
   11ecc:	b9 66 58 00 	or r11,r11,r6
   11ed0:	c8 8b 58 00 	sub r11,r4,r11
   11ed4:	f5 64 20 00 	cmpgu r4,r11,r4
   11ed8:	c9 09 28 00 	sub r5,r8,r9
   11edc:	c8 a4 28 00 	sub r5,r5,r4
   11ee0:	b8 60 68 00 	mv r13,r3
   11ee4:	e3 ff ff 23 	bi 11b70 <__subdf3+0x1cc>
   11ee8:	b9 cb 10 00 	or r2,r14,r11
   11eec:	b8 e0 60 00 	mv r12,r7
   11ef0:	b8 20 68 00 	mv r13,r1
   11ef4:	5c 45 ff 27 	bne r2,r5,11b90 <__subdf3+0x1ec>
   11ef8:	34 0d 00 00 	mvi r13,0
   11efc:	34 06 00 01 	mvi r6,1
   11f00:	34 05 00 00 	mvi r5,0
   11f04:	34 04 00 04 	mvi r4,4
   11f08:	34 0c 00 00 	mvi r12,0
   11f0c:	e3 ff fe d5 	bi 11a60 <__subdf3+0xbc>
   11f10:	b9 04 58 00 	or r11,r8,r4
   11f14:	7d 6b 00 00 	cmpnei r11,r11,0
   11f18:	34 03 00 00 	mvi r3,0
   11f1c:	b5 62 58 00 	add r11,r11,r2
   11f20:	f4 4b 10 00 	cmpgu r2,r2,r11
   11f24:	b4 69 18 00 	add r3,r3,r9
   11f28:	b4 62 28 00 	add r5,r3,r2
   11f2c:	b8 e0 60 00 	mv r12,r7
   11f30:	78 02 00 80 	mvhi r2,0x80
   11f34:	a0 a2 10 00 	and r2,r5,r2
   11f38:	44 40 00 0e 	be r2,r0,11f70 <__subdf3+0x5cc>
   11f3c:	35 8c 00 01 	addi r12,r12,1
   11f40:	34 02 07 ff 	mvi r2,2047
   11f44:	45 82 00 25 	be r12,r2,11fd8 <__subdf3+0x634>
   11f48:	78 04 00 01 	mvhi r4,0x1
   11f4c:	38 84 56 54 	ori r4,r4,0x5654
   11f50:	28 82 00 00 	lw r2,(r4+0)
   11f54:	01 63 00 01 	srui r3,r11,1
   11f58:	21 6b 00 01 	andi r11,r11,0x1
   11f5c:	a0 a2 28 00 	and r5,r5,r2
   11f60:	3c a2 00 1f 	sli r2,r5,31
   11f64:	b9 63 58 00 	or r11,r11,r3
   11f68:	00 a5 00 01 	srui r5,r5,1
   11f6c:	b9 62 58 00 	or r11,r11,r2
   11f70:	35 86 00 01 	addi r6,r12,1
   11f74:	b8 20 68 00 	mv r13,r1
   11f78:	e3 ff fe b2 	bi 11a40 <__subdf3+0x9c>
   11f7c:	34 03 07 ff 	mvi r3,2047
   11f80:	45 83 00 16 	be r12,r3,11fd8 <__subdf3+0x634>
   11f84:	b4 82 20 00 	add r4,r4,r2
   11f88:	f4 44 10 00 	cmpgu r2,r2,r4
   11f8c:	b5 09 28 00 	add r5,r8,r9
   11f90:	b4 a2 28 00 	add r5,r5,r2
   11f94:	3c a2 00 1f 	sli r2,r5,31
   11f98:	00 84 00 01 	srui r4,r4,1
   11f9c:	00 a5 00 01 	srui r5,r5,1
   11fa0:	b8 82 58 00 	or r11,r4,r2
   11fa4:	34 e6 00 02 	addi r6,r7,2
   11fa8:	b8 20 68 00 	mv r13,r1
   11fac:	e3 ff fe a5 	bi 11a40 <__subdf3+0x9c>
   11fb0:	b9 22 08 00 	or r1,r9,r2
   11fb4:	5c 27 00 36 	bne r1,r7,1208c <__subdf3+0x6e8>
   11fb8:	35 86 00 01 	addi r6,r12,1
   11fbc:	b9 00 28 00 	mv r5,r8
   11fc0:	b8 80 58 00 	mv r11,r4
   11fc4:	b8 60 68 00 	mv r13,r3
   11fc8:	e3 ff fe 9e 	bi 11a40 <__subdf3+0x9c>
   11fcc:	34 05 07 ff 	mvi r5,2047
   11fd0:	5c e5 ff 13 	bne r7,r5,11c1c <__subdf3+0x278>
   11fd4:	e3 ff ff 25 	bi 11c68 <__subdf3+0x2c4>
   11fd8:	b8 20 68 00 	mv r13,r1
   11fdc:	34 06 08 00 	mvi r6,2048
   11fe0:	34 05 00 00 	mvi r5,0
   11fe4:	34 04 00 04 	mvi r4,4
   11fe8:	e3 ff fe 9e 	bi 11a60 <__subdf3+0xbc>
   11fec:	34 0a 00 20 	mvi r10,32
   11ff0:	81 03 30 00 	sru r6,r8,r3
   11ff4:	34 05 00 00 	mvi r5,0
   11ff8:	44 6a 00 03 	be r3,r10,12004 <__subdf3+0x660>
   11ffc:	c8 03 18 00 	sub r3,r0,r3
   12000:	bd 03 28 00 	sl r5,r8,r3
   12004:	b8 a4 58 00 	or r11,r5,r4
   12008:	7d 6b 00 00 	cmpnei r11,r11,0
   1200c:	34 03 00 00 	mvi r3,0
   12010:	b9 66 58 00 	or r11,r11,r6
   12014:	e3 ff ff c2 	bi 11f1c <__subdf3+0x578>
   12018:	c8 03 18 00 	sub r3,r0,r3
   1201c:	5c e0 00 28 	bne r7,r0,120bc <__subdf3+0x718>
   12020:	b9 22 28 00 	or r5,r9,r2
   12024:	5c a7 00 99 	bne r5,r7,12288 <__subdf3+0x8e4>
   12028:	35 86 00 01 	addi r6,r12,1
   1202c:	b9 00 28 00 	mv r5,r8
   12030:	b8 80 58 00 	mv r11,r4
   12034:	b8 20 68 00 	mv r13,r1
   12038:	e3 ff fe 82 	bi 11a40 <__subdf3+0x9c>
   1203c:	b9 22 28 00 	or r5,r9,r2
   12040:	5c a0 00 35 	bne r5,r0,12114 <__subdf3+0x770>
   12044:	b9 04 08 00 	or r1,r8,r4
   12048:	5c 25 00 0b 	bne r1,r5,12074 <__subdf3+0x6d0>
   1204c:	78 01 00 01 	mvhi r1,0x1
   12050:	38 21 56 58 	ori r1,r1,0x5658
   12054:	34 0d 00 00 	mvi r13,0
   12058:	34 06 08 00 	mvi r6,2048
   1205c:	28 25 00 00 	lw r5,(r1+0)
   12060:	34 04 ff fc 	mvi r4,-4
   12064:	34 0c 07 ff 	mvi r12,2047
   12068:	e3 ff fe 7e 	bi 11a60 <__subdf3+0xbc>
   1206c:	34 01 07 ff 	mvi r1,2047
   12070:	5d 81 ff 8b 	bne r12,r1,11e9c <__subdf3+0x4f8>
   12074:	b9 00 28 00 	mv r5,r8
   12078:	b8 80 58 00 	mv r11,r4
   1207c:	b8 60 68 00 	mv r13,r3
   12080:	34 06 08 00 	mvi r6,2048
   12084:	34 0c 07 ff 	mvi r12,2047
   12088:	e3 ff fe 6e 	bi 11a40 <__subdf3+0x9c>
   1208c:	34 a5 ff ff 	addi r5,r5,-1
   12090:	5c a0 ff f7 	bne r5,r0,1206c <__subdf3+0x6c8>
   12094:	c8 82 58 00 	sub r11,r4,r2
   12098:	f5 64 20 00 	cmpgu r4,r11,r4
   1209c:	c9 09 28 00 	sub r5,r8,r9
   120a0:	c8 a4 28 00 	sub r5,r5,r4
   120a4:	b8 60 68 00 	mv r13,r3
   120a8:	e3 ff fe b2 	bi 11b70 <__subdf3+0x1cc>
   120ac:	b9 22 10 00 	or r2,r9,r2
   120b0:	7c 4b 00 00 	cmpnei r11,r2,0
   120b4:	34 09 00 00 	mvi r9,0
   120b8:	e3 ff ff 86 	bi 11ed0 <__subdf3+0x52c>
   120bc:	34 05 07 ff 	mvi r5,2047
   120c0:	45 85 00 5b 	be r12,r5,1222c <__subdf3+0x888>
   120c4:	78 05 00 80 	mvhi r5,0x80
   120c8:	b9 25 48 00 	or r9,r9,r5
   120cc:	34 05 00 38 	mvi r5,56
   120d0:	48 65 00 75 	bg r3,r5,122a4 <__subdf3+0x900>
   120d4:	34 05 00 1f 	mvi r5,31
   120d8:	48 65 00 84 	bg r3,r5,122e8 <__subdf3+0x944>
   120dc:	34 05 00 20 	mvi r5,32
   120e0:	c8 a3 28 00 	sub r5,r5,r3
   120e4:	bc 45 30 00 	sl r6,r2,r5
   120e8:	80 43 10 00 	sru r2,r2,r3
   120ec:	bd 25 28 00 	sl r5,r9,r5
   120f0:	7c c6 00 00 	cmpnei r6,r6,0
   120f4:	b8 a2 58 00 	or r11,r5,r2
   120f8:	81 23 18 00 	sru r3,r9,r3
   120fc:	b9 66 58 00 	or r11,r11,r6
   12100:	b5 64 58 00 	add r11,r11,r4
   12104:	f4 8b 20 00 	cmpgu r4,r4,r11
   12108:	b4 68 18 00 	add r3,r3,r8
   1210c:	b4 64 28 00 	add r5,r3,r4
   12110:	e3 ff ff 88 	bi 11f30 <__subdf3+0x58c>
   12114:	b9 04 28 00 	or r5,r8,r4
   12118:	44 a0 fe d4 	be r5,r0,11c68 <__subdf3+0x2c4>
   1211c:	01 25 00 03 	srui r5,r9,3
   12120:	00 42 00 03 	srui r2,r2,3
   12124:	3d 29 00 1d 	sli r9,r9,29
   12128:	78 06 00 08 	mvhi r6,0x8
   1212c:	a0 a6 38 00 	and r7,r5,r6
   12130:	b9 22 58 00 	or r11,r9,r2
   12134:	b8 20 68 00 	mv r13,r1
   12138:	44 e0 00 09 	be r7,r0,1215c <__subdf3+0x7b8>
   1213c:	01 01 00 03 	srui r1,r8,3
   12140:	a0 26 30 00 	and r6,r1,r6
   12144:	5c c0 00 06 	bne r6,r0,1215c <__subdf3+0x7b8>
   12148:	00 84 00 03 	srui r4,r4,3
   1214c:	3d 08 00 1d 	sli r8,r8,29
   12150:	b8 20 28 00 	mv r5,r1
   12154:	b9 04 58 00 	or r11,r8,r4
   12158:	b8 60 68 00 	mv r13,r3
   1215c:	01 61 00 1d 	srui r1,r11,29
   12160:	3c a5 00 03 	sli r5,r5,3
   12164:	3d 6b 00 03 	sli r11,r11,3
   12168:	b8 25 28 00 	or r5,r1,r5
   1216c:	34 06 08 00 	mvi r6,2048
   12170:	34 0c 07 ff 	mvi r12,2047
   12174:	e3 ff fe 33 	bi 11a40 <__subdf3+0x9c>
   12178:	b9 04 28 00 	or r5,r8,r4
   1217c:	44 a0 00 32 	be r5,r0,12244 <__subdf3+0x8a0>
   12180:	c8 44 58 00 	sub r11,r2,r4
   12184:	f5 62 28 00 	cmpgu r5,r11,r2
   12188:	c9 28 30 00 	sub r6,r9,r8
   1218c:	c8 c5 28 00 	sub r5,r6,r5
   12190:	78 06 00 80 	mvhi r6,0x80
   12194:	a0 a6 30 00 	and r6,r5,r6
   12198:	44 c0 00 51 	be r6,r0,122dc <__subdf3+0x938>
   1219c:	c8 82 58 00 	sub r11,r4,r2
   121a0:	f5 64 20 00 	cmpgu r4,r11,r4
   121a4:	c9 09 28 00 	sub r5,r8,r9
   121a8:	c8 a4 28 00 	sub r5,r5,r4
   121ac:	b8 60 68 00 	mv r13,r3
   121b0:	34 06 00 01 	mvi r6,1
   121b4:	34 0c 00 00 	mvi r12,0
   121b8:	e3 ff fe 22 	bi 11a40 <__subdf3+0x9c>
   121bc:	b9 22 18 00 	or r3,r9,r2
   121c0:	44 60 00 1b 	be r3,r0,1222c <__subdf3+0x888>
   121c4:	b9 04 18 00 	or r3,r8,r4
   121c8:	44 60 fe a8 	be r3,r0,11c68 <__subdf3+0x2c4>
   121cc:	01 23 00 03 	srui r3,r9,3
   121d0:	00 42 00 03 	srui r2,r2,3
   121d4:	3d 29 00 1d 	sli r9,r9,29
   121d8:	78 05 00 08 	mvhi r5,0x8
   121dc:	a0 65 30 00 	and r6,r3,r5
   121e0:	b9 22 58 00 	or r11,r9,r2
   121e4:	b8 20 68 00 	mv r13,r1
   121e8:	44 c0 00 08 	be r6,r0,12208 <__subdf3+0x864>
   121ec:	01 01 00 03 	srui r1,r8,3
   121f0:	a0 25 28 00 	and r5,r1,r5
   121f4:	5c a0 00 05 	bne r5,r0,12208 <__subdf3+0x864>
   121f8:	00 84 00 03 	srui r4,r4,3
   121fc:	3d 08 00 1d 	sli r8,r8,29
   12200:	b8 20 18 00 	mv r3,r1
   12204:	b9 04 58 00 	or r11,r8,r4
   12208:	01 65 00 1d 	srui r5,r11,29
   1220c:	3c 63 00 03 	sli r3,r3,3
   12210:	3d 6b 00 03 	sli r11,r11,3
   12214:	b8 a3 28 00 	or r5,r5,r3
   12218:	34 06 08 00 	mvi r6,2048
   1221c:	34 0c 07 ff 	mvi r12,2047
   12220:	e3 ff fe 08 	bi 11a40 <__subdf3+0x9c>
   12224:	34 05 07 ff 	mvi r5,2047
   12228:	5d 85 ff a9 	bne r12,r5,120cc <__subdf3+0x728>
   1222c:	b9 00 28 00 	mv r5,r8
   12230:	b8 80 58 00 	mv r11,r4
   12234:	b8 20 68 00 	mv r13,r1
   12238:	34 06 08 00 	mvi r6,2048
   1223c:	34 0c 07 ff 	mvi r12,2047
   12240:	e3 ff fe 00 	bi 11a40 <__subdf3+0x9c>
   12244:	b9 20 28 00 	mv r5,r9
   12248:	b8 40 58 00 	mv r11,r2
   1224c:	b8 20 68 00 	mv r13,r1
   12250:	34 06 00 01 	mvi r6,1
   12254:	34 0c 00 00 	mvi r12,0
   12258:	e3 ff fd fa 	bi 11a40 <__subdf3+0x9c>
   1225c:	34 07 00 20 	mvi r7,32
   12260:	81 25 30 00 	sru r6,r9,r5
   12264:	34 01 00 00 	mvi r1,0
   12268:	44 a7 00 03 	be r5,r7,12274 <__subdf3+0x8d0>
   1226c:	c8 05 08 00 	sub r1,r0,r5
   12270:	bd 21 08 00 	sl r1,r9,r1
   12274:	b8 22 08 00 	or r1,r1,r2
   12278:	7c 2b 00 00 	cmpnei r11,r1,0
   1227c:	34 09 00 00 	mvi r9,0
   12280:	b9 66 58 00 	or r11,r11,r6
   12284:	e3 ff ff 13 	bi 11ed0 <__subdf3+0x52c>
   12288:	34 63 ff ff 	addi r3,r3,-1
   1228c:	5c 60 ff e6 	bne r3,r0,12224 <__subdf3+0x880>
   12290:	b4 82 58 00 	add r11,r4,r2
   12294:	f4 8b 20 00 	cmpgu r4,r4,r11
   12298:	b5 09 28 00 	add r5,r8,r9
   1229c:	b4 a4 28 00 	add r5,r5,r4
   122a0:	e3 ff ff 24 	bi 11f30 <__subdf3+0x58c>
   122a4:	b9 22 10 00 	or r2,r9,r2
   122a8:	7c 4b 00 00 	cmpnei r11,r2,0
   122ac:	34 03 00 00 	mvi r3,0
   122b0:	e3 ff ff 94 	bi 12100 <__subdf3+0x75c>
   122b4:	b9 00 28 00 	mv r5,r8
   122b8:	b8 80 58 00 	mv r11,r4
   122bc:	b8 20 68 00 	mv r13,r1
   122c0:	34 06 00 01 	mvi r6,1
   122c4:	34 0c 00 00 	mvi r12,0
   122c8:	e3 ff fd de 	bi 11a40 <__subdf3+0x9c>
   122cc:	21 8c 07 ff 	andi r12,r12,0x7ff
   122d0:	34 03 00 00 	mvi r3,0
   122d4:	34 02 00 00 	mvi r2,0
   122d8:	e3 ff fd fc 	bi 11ac8 <__subdf3+0x124>
   122dc:	b8 ab 10 00 	or r2,r5,r11
   122e0:	44 40 ff 06 	be r2,r0,11ef8 <__subdf3+0x554>
   122e4:	e3 ff ff da 	bi 1224c <__subdf3+0x8a8>
   122e8:	34 07 00 20 	mvi r7,32
   122ec:	81 23 30 00 	sru r6,r9,r3
   122f0:	34 05 00 00 	mvi r5,0
   122f4:	44 67 00 03 	be r3,r7,12300 <__subdf3+0x95c>
   122f8:	c8 03 18 00 	sub r3,r0,r3
   122fc:	bd 23 28 00 	sl r5,r9,r3
   12300:	b8 a2 10 00 	or r2,r5,r2
   12304:	7c 4b 00 00 	cmpnei r11,r2,0
   12308:	34 03 00 00 	mvi r3,0
   1230c:	b9 66 58 00 	or r11,r11,r6
   12310:	e3 ff ff 7c 	bi 12100 <__subdf3+0x75c>
   12314:	b9 20 28 00 	mv r5,r9
   12318:	b8 40 58 00 	mv r11,r2
   1231c:	b8 20 68 00 	mv r13,r1
   12320:	34 06 00 01 	mvi r6,1
   12324:	34 0c 00 00 	mvi r12,0
   12328:	e3 ff fd c6 	bi 11a40 <__subdf3+0x9c>

0001232c <__fixdfsi>:
   1232c:	78 05 00 01 	mvhi r5,0x1
   12330:	38 a5 56 0c 	ori r5,r5,0x560c
   12334:	28 a4 00 00 	lw r4,(r5+0)
   12338:	00 23 00 14 	srui r3,r1,20
   1233c:	00 25 00 1f 	srui r5,r1,31
   12340:	a0 24 30 00 	and r6,r1,r4
   12344:	20 63 07 ff 	andi r3,r3,0x7ff
   12348:	34 04 03 fe 	mvi r4,1022
   1234c:	34 01 00 00 	mvi r1,0
   12350:	4c 83 00 18 	bge r4,r3,123b0 <__fixdfsi+0x84>
   12354:	34 01 04 1d 	mvi r1,1053
   12358:	4c 23 00 06 	bge r1,r3,12370 <__fixdfsi+0x44>
   1235c:	78 02 00 01 	mvhi r2,0x1
   12360:	38 42 2c a0 	ori r2,r2,0x2ca0
   12364:	28 41 00 00 	lw r1,(r2+0)
   12368:	b4 a1 08 00 	add r1,r5,r1
   1236c:	c3 a0 00 00 	ret
   12370:	78 04 00 10 	mvhi r4,0x10
   12374:	b8 c4 20 00 	or r4,r6,r4
   12378:	34 01 04 33 	mvi r1,1075
   1237c:	34 06 04 13 	mvi r6,1043
   12380:	c8 c3 30 00 	sub r6,r6,r3
   12384:	c8 23 08 00 	sub r1,r1,r3
   12388:	34 07 00 1f 	mvi r7,31
   1238c:	80 86 30 00 	sru r6,r4,r6
   12390:	48 27 00 05 	bg r1,r7,123a4 <__fixdfsi+0x78>
   12394:	34 63 fb ed 	addi r3,r3,-1043
   12398:	80 41 10 00 	sru r2,r2,r1
   1239c:	bc 83 20 00 	sl r4,r4,r3
   123a0:	b8 44 30 00 	or r6,r2,r4
   123a4:	c8 06 08 00 	sub r1,r0,r6
   123a8:	5c a0 00 02 	bne r5,r0,123b0 <__fixdfsi+0x84>
   123ac:	b8 c0 08 00 	mv r1,r6
   123b0:	c3 a0 00 00 	ret

000123b4 <__floatsidf>:
   123b4:	37 9c ff f4 	addi sp,sp,-12
   123b8:	5b 8b 00 0c 	sw (sp+12),r11
   123bc:	5b 8c 00 08 	sw (sp+8),r12
   123c0:	5b 9d 00 04 	sw (sp+4),ra
   123c4:	b8 20 58 00 	mv r11,r1
   123c8:	44 20 00 2d 	be r1,r0,1247c <__floatsidf+0xc8>
   123cc:	00 2c 00 1f 	srui r12,r1,31
   123d0:	45 80 00 02 	be r12,r0,123d8 <__floatsidf+0x24>
   123d4:	c8 01 58 00 	sub r11,r0,r1
   123d8:	b9 60 08 00 	mv r1,r11
   123dc:	f8 00 00 9a 	calli 12644 <__clzsi2>
   123e0:	34 02 04 1e 	mvi r2,1054
   123e4:	c8 41 08 00 	sub r1,r2,r1
   123e8:	34 02 04 33 	mvi r2,1075
   123ec:	c8 41 10 00 	sub r2,r2,r1
   123f0:	34 03 00 1f 	mvi r3,31
   123f4:	48 43 00 0b 	bg r2,r3,12420 <__floatsidf+0x6c>
   123f8:	78 05 00 01 	mvhi r5,0x1
   123fc:	38 a5 56 0c 	ori r5,r5,0x560c
   12400:	34 23 fb ed 	addi r3,r1,-1043
   12404:	28 a4 00 00 	lw r4,(r5+0)
   12408:	81 63 18 00 	sru r3,r11,r3
   1240c:	bd 62 10 00 	sl r2,r11,r2
   12410:	a0 64 18 00 	and r3,r3,r4
   12414:	20 21 07 ff 	andi r1,r1,0x7ff
   12418:	b9 80 20 00 	mv r4,r12
   1241c:	e0 00 00 0b 	bi 12448 <__floatsidf+0x94>
   12420:	78 06 00 01 	mvhi r6,0x1
   12424:	34 03 04 13 	mvi r3,1043
   12428:	38 c6 56 0c 	ori r6,r6,0x560c
   1242c:	c8 61 18 00 	sub r3,r3,r1
   12430:	28 c2 00 00 	lw r2,(r6+0)
   12434:	bd 63 18 00 	sl r3,r11,r3
   12438:	20 21 07 ff 	andi r1,r1,0x7ff
   1243c:	a0 62 18 00 	and r3,r3,r2
   12440:	b9 80 20 00 	mv r4,r12
   12444:	34 02 00 00 	mvi r2,0
   12448:	78 06 00 01 	mvhi r6,0x1
   1244c:	38 c6 56 0c 	ori r6,r6,0x560c
   12450:	28 c5 00 00 	lw r5,(r6+0)
   12454:	3c 21 00 14 	sli r1,r1,20
   12458:	3c 84 00 1f 	sli r4,r4,31
   1245c:	a0 65 18 00 	and r3,r3,r5
   12460:	b8 61 08 00 	or r1,r3,r1
   12464:	b8 24 08 00 	or r1,r1,r4
   12468:	2b 9d 00 04 	lw ra,(sp+4)
   1246c:	2b 8b 00 0c 	lw r11,(sp+12)
   12470:	2b 8c 00 08 	lw r12,(sp+8)
   12474:	37 9c 00 0c 	addi sp,sp,12
   12478:	c3 a0 00 00 	ret
   1247c:	34 04 00 00 	mvi r4,0
   12480:	34 01 00 00 	mvi r1,0
   12484:	34 03 00 00 	mvi r3,0
   12488:	34 02 00 00 	mvi r2,0
   1248c:	e3 ff ff ef 	bi 12448 <__floatsidf+0x94>

00012490 <__divsi3>:
   12490:	37 9c ff f8 	addi sp,sp,-8
   12494:	5b 8b 00 08 	sw (sp+8),r11
   12498:	5b 9d 00 04 	sw (sp+4),ra
   1249c:	44 40 00 22 	be r2,r0,12524 <__divsi3+0x94>
   124a0:	b8 41 20 00 	or r4,r2,r1
   124a4:	34 03 00 0f 	mvi r3,15
   124a8:	54 83 00 0b 	bgu r4,r3,124d4 <__divsi3+0x44>
   124ac:	78 03 00 01 	mvhi r3,0x1
   124b0:	38 63 56 5c 	ori r3,r3,0x565c
   124b4:	3c 21 00 04 	sli r1,r1,4
   124b8:	b4 62 10 00 	add r2,r3,r2
   124bc:	b4 41 08 00 	add r1,r2,r1
   124c0:	40 21 00 00 	lbu r1,(r1+0)
   124c4:	2b 9d 00 04 	lw ra,(sp+4)
   124c8:	2b 8b 00 08 	lw r11,(sp+8)
   124cc:	37 9c 00 08 	addi sp,sp,8
   124d0:	c3 a0 00 00 	ret
   124d4:	34 0b 00 00 	mvi r11,0
   124d8:	4c 20 00 03 	bge r1,r0,124e4 <__divsi3+0x54>
   124dc:	c8 01 08 00 	sub r1,r0,r1
   124e0:	34 0b 00 01 	mvi r11,1
   124e4:	4c 40 00 03 	bge r2,r0,124f0 <__divsi3+0x60>
   124e8:	c8 02 10 00 	sub r2,r0,r2
   124ec:	19 6b 00 01 	xori r11,r11,0x1
   124f0:	90 c0 18 00 	rcsr r3,CFG
   124f4:	20 63 00 02 	andi r3,r3,0x2
   124f8:	44 60 00 08 	be r3,r0,12518 <__divsi3+0x88>
   124fc:	8c 22 08 00 	divu r1,r1,r2
   12500:	45 60 00 02 	be r11,r0,12508 <__divsi3+0x78>
   12504:	c8 01 08 00 	sub r1,r0,r1
   12508:	2b 9d 00 04 	lw ra,(sp+4)
   1250c:	2b 8b 00 08 	lw r11,(sp+8)
   12510:	37 9c 00 08 	addi sp,sp,8
   12514:	c3 a0 00 00 	ret
   12518:	34 03 00 00 	mvi r3,0
   1251c:	f8 00 00 68 	calli 126bc <__udivmodsi4>
   12520:	e3 ff ff f8 	bi 12500 <__divsi3+0x70>
   12524:	90 00 08 00 	rcsr r1,IE
   12528:	20 21 00 01 	andi r1,r1,0x1
   1252c:	3c 21 00 01 	sli r1,r1,1
   12530:	d0 01 00 00 	wcsr IE,r1
   12534:	90 e0 08 00 	rcsr r1,EBA
   12538:	bb a0 f0 00 	mv ea,ra
   1253c:	34 21 00 a0 	addi r1,r1,160
   12540:	c0 20 00 00 	b r1

00012544 <__modsi3>:
   12544:	37 9c ff f8 	addi sp,sp,-8
   12548:	5b 8b 00 08 	sw (sp+8),r11
   1254c:	5b 9d 00 04 	sw (sp+4),ra
   12550:	44 40 00 15 	be r2,r0,125a4 <__modsi3+0x60>
   12554:	34 0b 00 00 	mvi r11,0
   12558:	4c 20 00 03 	bge r1,r0,12564 <__modsi3+0x20>
   1255c:	c8 01 08 00 	sub r1,r0,r1
   12560:	34 0b 00 01 	mvi r11,1
   12564:	14 43 00 1f 	sri r3,r2,31
   12568:	90 c0 20 00 	rcsr r4,CFG
   1256c:	98 62 10 00 	xor r2,r3,r2
   12570:	20 84 00 02 	andi r4,r4,0x2
   12574:	c8 43 10 00 	sub r2,r2,r3
   12578:	44 80 00 08 	be r4,r0,12598 <__modsi3+0x54>
   1257c:	c4 22 08 00 	modu r1,r1,r2
   12580:	45 60 00 02 	be r11,r0,12588 <__modsi3+0x44>
   12584:	c8 01 08 00 	sub r1,r0,r1
   12588:	2b 9d 00 04 	lw ra,(sp+4)
   1258c:	2b 8b 00 08 	lw r11,(sp+8)
   12590:	37 9c 00 08 	addi sp,sp,8
   12594:	c3 a0 00 00 	ret
   12598:	34 03 00 01 	mvi r3,1
   1259c:	f8 00 00 48 	calli 126bc <__udivmodsi4>
   125a0:	e3 ff ff f8 	bi 12580 <__modsi3+0x3c>
   125a4:	90 00 08 00 	rcsr r1,IE
   125a8:	20 21 00 01 	andi r1,r1,0x1
   125ac:	3c 21 00 01 	sli r1,r1,1
   125b0:	d0 01 00 00 	wcsr IE,r1
   125b4:	90 e0 08 00 	rcsr r1,EBA
   125b8:	bb a0 f0 00 	mv ea,ra
   125bc:	34 21 00 a0 	addi r1,r1,160
   125c0:	c0 20 00 00 	b r1

000125c4 <__udivsi3>:
   125c4:	37 9c ff fc 	addi sp,sp,-4
   125c8:	5b 9d 00 04 	sw (sp+4),ra
   125cc:	44 40 00 06 	be r2,r0,125e4 <__udivsi3+0x20>
   125d0:	34 03 00 00 	mvi r3,0
   125d4:	f8 00 00 3a 	calli 126bc <__udivmodsi4>
   125d8:	2b 9d 00 04 	lw ra,(sp+4)
   125dc:	37 9c 00 04 	addi sp,sp,4
   125e0:	c3 a0 00 00 	ret
   125e4:	90 00 08 00 	rcsr r1,IE
   125e8:	20 21 00 01 	andi r1,r1,0x1
   125ec:	3c 21 00 01 	sli r1,r1,1
   125f0:	d0 01 00 00 	wcsr IE,r1
   125f4:	90 e0 08 00 	rcsr r1,EBA
   125f8:	bb a0 f0 00 	mv ea,ra
   125fc:	34 21 00 a0 	addi r1,r1,160
   12600:	c0 20 00 00 	b r1

00012604 <__umodsi3>:
   12604:	37 9c ff fc 	addi sp,sp,-4
   12608:	5b 9d 00 04 	sw (sp+4),ra
   1260c:	44 40 00 06 	be r2,r0,12624 <__umodsi3+0x20>
   12610:	34 03 00 01 	mvi r3,1
   12614:	f8 00 00 2a 	calli 126bc <__udivmodsi4>
   12618:	2b 9d 00 04 	lw ra,(sp+4)
   1261c:	37 9c 00 04 	addi sp,sp,4
   12620:	c3 a0 00 00 	ret
   12624:	90 00 08 00 	rcsr r1,IE
   12628:	20 21 00 01 	andi r1,r1,0x1
   1262c:	3c 21 00 01 	sli r1,r1,1
   12630:	d0 01 00 00 	wcsr IE,r1
   12634:	90 e0 08 00 	rcsr r1,EBA
   12638:	bb a0 f0 00 	mv ea,ra
   1263c:	34 21 00 a0 	addi r1,r1,160
   12640:	c0 20 00 00 	b r1

00012644 <__clzsi2>:
   12644:	38 02 ff ff 	mvu r2,0xffff
   12648:	54 22 00 0e 	bgu r1,r2,12680 <__clzsi2+0x3c>
   1264c:	34 02 00 ff 	mvi r2,255
   12650:	34 03 00 18 	mvi r3,24
   12654:	34 04 00 08 	mvi r4,8
   12658:	54 22 00 03 	bgu r1,r2,12664 <__clzsi2+0x20>
   1265c:	34 03 00 20 	mvi r3,32
   12660:	34 04 00 00 	mvi r4,0
   12664:	80 24 08 00 	sru r1,r1,r4
   12668:	78 02 00 01 	mvhi r2,0x1
   1266c:	38 42 57 5c 	ori r2,r2,0x575c
   12670:	b4 41 10 00 	add r2,r2,r1
   12674:	40 41 00 00 	lbu r1,(r2+0)
   12678:	c8 61 08 00 	sub r1,r3,r1
   1267c:	c3 a0 00 00 	ret
   12680:	78 05 00 01 	mvhi r5,0x1
   12684:	38 a5 2c 68 	ori r5,r5,0x2c68
   12688:	28 a2 00 00 	lw r2,(r5+0)
   1268c:	34 03 00 08 	mvi r3,8
   12690:	34 04 00 18 	mvi r4,24
   12694:	54 22 ff f4 	bgu r1,r2,12664 <__clzsi2+0x20>
   12698:	34 04 00 10 	mvi r4,16
   1269c:	80 24 08 00 	sru r1,r1,r4
   126a0:	78 02 00 01 	mvhi r2,0x1
   126a4:	38 42 57 5c 	ori r2,r2,0x575c
   126a8:	b4 41 10 00 	add r2,r2,r1
   126ac:	40 41 00 00 	lbu r1,(r2+0)
   126b0:	34 03 00 10 	mvi r3,16
   126b4:	c8 61 08 00 	sub r1,r3,r1
   126b8:	c3 a0 00 00 	ret

000126bc <__udivmodsi4>:
   126bc:	f4 22 20 00 	cmpgu r4,r1,r2
   126c0:	44 80 00 18 	be r4,r0,12720 <__udivmodsi4+0x64>
   126c4:	34 04 00 01 	mvi r4,1
   126c8:	4c 40 00 0b 	bge r2,r0,126f4 <__udivmodsi4+0x38>
   126cc:	34 05 00 00 	mvi r5,0
   126d0:	54 41 00 03 	bgu r2,r1,126dc <__udivmodsi4+0x20>
   126d4:	c8 22 08 00 	sub r1,r1,r2
   126d8:	b8 a4 28 00 	or r5,r5,r4
   126dc:	00 84 00 01 	srui r4,r4,1
   126e0:	00 42 00 01 	srui r2,r2,1
   126e4:	5c 80 ff fb 	bne r4,r0,126d0 <__udivmodsi4+0x14>
   126e8:	5c 60 00 02 	bne r3,r0,126f0 <__udivmodsi4+0x34>
   126ec:	b8 a0 08 00 	mv r1,r5
   126f0:	c3 a0 00 00 	ret
   126f4:	3c 42 00 01 	sli r2,r2,1
   126f8:	3c 84 00 01 	sli r4,r4,1
   126fc:	f4 22 28 00 	cmpgu r5,r1,r2
   12700:	7c 86 00 00 	cmpnei r6,r4,0
   12704:	a0 c5 28 00 	and r5,r6,r5
   12708:	44 a0 00 02 	be r5,r0,12710 <__udivmodsi4+0x54>
   1270c:	4c 40 ff fa 	bge r2,r0,126f4 <__udivmodsi4+0x38>
   12710:	34 05 00 00 	mvi r5,0
   12714:	44 80 ff f5 	be r4,r0,126e8 <__udivmodsi4+0x2c>
   12718:	34 05 00 00 	mvi r5,0
   1271c:	e3 ff ff ed 	bi 126d0 <__udivmodsi4+0x14>
   12720:	34 04 00 01 	mvi r4,1
   12724:	34 05 00 00 	mvi r5,0
   12728:	e3 ff ff ea 	bi 126d0 <__udivmodsi4+0x14>

0001272c <abs>:
   1272c:	14 22 00 1f 	sri r2,r1,31
   12730:	98 41 08 00 	xor r1,r2,r1
   12734:	c8 22 08 00 	sub r1,r1,r2
   12738:	c3 a0 00 00 	ret

0001273c <memcmp>:
   1273c:	34 06 00 03 	mvi r6,3
   12740:	b8 20 20 00 	mv r4,r1
   12744:	b8 40 28 00 	mv r5,r2
   12748:	50 c3 00 0c 	bgeu r6,r3,12778 <memcmp+0x3c>
   1274c:	b8 41 30 00 	or r6,r2,r1
   12750:	20 c6 00 03 	andi r6,r6,0x3
   12754:	5c c0 00 0b 	bne r6,r0,12780 <memcmp+0x44>
   12758:	34 01 00 03 	mvi r1,3
   1275c:	28 86 00 00 	lw r6,(r4+0)
   12760:	28 a2 00 00 	lw r2,(r5+0)
   12764:	5c c2 00 05 	bne r6,r2,12778 <memcmp+0x3c>
   12768:	34 63 ff fc 	addi r3,r3,-4
   1276c:	34 84 00 04 	addi r4,r4,4
   12770:	34 a5 00 04 	addi r5,r5,4
   12774:	54 61 ff fa 	bgu r3,r1,1275c <memcmp+0x20>
   12778:	34 01 00 00 	mvi r1,0
   1277c:	44 60 00 0e 	be r3,r0,127b4 <memcmp+0x78>
   12780:	40 86 00 00 	lbu r6,(r4+0)
   12784:	40 a1 00 00 	lbu r1,(r5+0)
   12788:	34 62 ff ff 	addi r2,r3,-1
   1278c:	44 c1 00 06 	be r6,r1,127a4 <memcmp+0x68>
   12790:	e0 00 00 0a 	bi 127b8 <memcmp+0x7c>
   12794:	40 86 00 00 	lbu r6,(r4+0)
   12798:	40 a1 00 00 	lbu r1,(r5+0)
   1279c:	34 42 ff ff 	addi r2,r2,-1
   127a0:	5c c1 00 06 	bne r6,r1,127b8 <memcmp+0x7c>
   127a4:	34 84 00 01 	addi r4,r4,1
   127a8:	34 a5 00 01 	addi r5,r5,1
   127ac:	5c 40 ff fa 	bne r2,r0,12794 <memcmp+0x58>
   127b0:	34 01 00 00 	mvi r1,0
   127b4:	c3 a0 00 00 	ret
   127b8:	c8 c1 08 00 	sub r1,r6,r1
   127bc:	c3 a0 00 00 	ret

000127c0 <memcpy>:
   127c0:	34 04 00 0f 	mvi r4,15
   127c4:	b8 20 38 00 	mv r7,r1
   127c8:	b8 40 30 00 	mv r6,r2
   127cc:	50 83 00 2d 	bgeu r4,r3,12880 <memcpy+0xc0>
   127d0:	b8 41 20 00 	or r4,r2,r1
   127d4:	20 84 00 03 	andi r4,r4,0x3
   127d8:	5c 80 00 2b 	bne r4,r0,12884 <memcpy+0xc4>
   127dc:	b8 40 20 00 	mv r4,r2
   127e0:	b8 20 28 00 	mv r5,r1
   127e4:	b8 60 30 00 	mv r6,r3
   127e8:	34 07 00 0f 	mvi r7,15
   127ec:	28 88 00 00 	lw r8,(r4+0)
   127f0:	34 c6 ff f0 	addi r6,r6,-16
   127f4:	58 a8 00 00 	sw (r5+0),r8
   127f8:	28 88 00 04 	lw r8,(r4+4)
   127fc:	58 a8 00 04 	sw (r5+4),r8
   12800:	28 88 00 08 	lw r8,(r4+8)
   12804:	58 a8 00 08 	sw (r5+8),r8
   12808:	28 88 00 0c 	lw r8,(r4+12)
   1280c:	34 84 00 10 	addi r4,r4,16
   12810:	58 a8 00 0c 	sw (r5+12),r8
   12814:	34 a5 00 10 	addi r5,r5,16
   12818:	54 c7 ff f5 	bgu r6,r7,127ec <memcpy+0x2c>
   1281c:	34 63 ff f0 	addi r3,r3,-16
   12820:	00 66 00 04 	srui r6,r3,4
   12824:	20 63 00 0f 	andi r3,r3,0xf
   12828:	34 c6 00 01 	addi r6,r6,1
   1282c:	3c c6 00 04 	sli r6,r6,4
   12830:	b4 26 38 00 	add r7,r1,r6
   12834:	b4 46 30 00 	add r6,r2,r6
   12838:	34 02 00 03 	mvi r2,3
   1283c:	50 43 00 11 	bgeu r2,r3,12880 <memcpy+0xc0>
   12840:	34 02 00 00 	mvi r2,0
   12844:	34 08 00 03 	mvi r8,3
   12848:	b4 c2 20 00 	add r4,r6,r2
   1284c:	28 85 00 00 	lw r5,(r4+0)
   12850:	b4 e2 20 00 	add r4,r7,r2
   12854:	34 42 00 04 	addi r2,r2,4
   12858:	58 85 00 00 	sw (r4+0),r5
   1285c:	c8 62 20 00 	sub r4,r3,r2
   12860:	54 88 ff fa 	bgu r4,r8,12848 <memcpy+0x88>
   12864:	34 63 ff fc 	addi r3,r3,-4
   12868:	00 62 00 02 	srui r2,r3,2
   1286c:	20 63 00 03 	andi r3,r3,0x3
   12870:	34 42 00 01 	addi r2,r2,1
   12874:	3c 42 00 02 	sli r2,r2,2
   12878:	b4 e2 38 00 	add r7,r7,r2
   1287c:	b4 c2 30 00 	add r6,r6,r2
   12880:	44 60 00 08 	be r3,r0,128a0 <memcpy+0xe0>
   12884:	34 02 00 00 	mvi r2,0
   12888:	b4 c2 20 00 	add r4,r6,r2
   1288c:	40 85 00 00 	lbu r5,(r4+0)
   12890:	b4 e2 20 00 	add r4,r7,r2
   12894:	34 42 00 01 	addi r2,r2,1
   12898:	30 85 00 00 	sb (r4+0),r5
   1289c:	5c 43 ff fb 	bne r2,r3,12888 <memcpy+0xc8>
   128a0:	c3 a0 00 00 	ret

000128a4 <memset>:
   128a4:	20 25 00 03 	andi r5,r1,0x3
   128a8:	b8 20 20 00 	mv r4,r1
   128ac:	44 a0 00 0b 	be r5,r0,128d8 <memset+0x34>
   128b0:	44 60 00 2c 	be r3,r0,12960 <memset+0xbc>
   128b4:	34 63 ff ff 	addi r3,r3,-1
   128b8:	20 46 00 ff 	andi r6,r2,0xff
   128bc:	e0 00 00 03 	bi 128c8 <memset+0x24>
   128c0:	44 60 00 28 	be r3,r0,12960 <memset+0xbc>
   128c4:	34 63 ff ff 	addi r3,r3,-1
   128c8:	30 86 00 00 	sb (r4+0),r6
   128cc:	34 84 00 01 	addi r4,r4,1
   128d0:	20 85 00 03 	andi r5,r4,0x3
   128d4:	5c a0 ff fb 	bne r5,r0,128c0 <memset+0x1c>
   128d8:	34 05 00 03 	mvi r5,3
   128dc:	50 a3 00 1a 	bgeu r5,r3,12944 <memset+0xa0>
   128e0:	20 45 00 ff 	andi r5,r2,0xff
   128e4:	3c a6 00 08 	sli r6,r5,8
   128e8:	34 0a 00 0f 	mvi r10,15
   128ec:	b8 c5 28 00 	or r5,r6,r5
   128f0:	3c a6 00 10 	sli r6,r5,16
   128f4:	b8 80 40 00 	mv r8,r4
   128f8:	b8 c5 30 00 	or r6,r6,r5
   128fc:	b8 60 38 00 	mv r7,r3
   12900:	b8 80 28 00 	mv r5,r4
   12904:	34 09 00 0f 	mvi r9,15
   12908:	54 6a 00 17 	bgu r3,r10,12964 <memset+0xc0>
   1290c:	34 04 00 00 	mvi r4,0
   12910:	34 07 00 03 	mvi r7,3
   12914:	b5 04 28 00 	add r5,r8,r4
   12918:	34 84 00 04 	addi r4,r4,4
   1291c:	58 a6 00 00 	sw (r5+0),r6
   12920:	c8 64 28 00 	sub r5,r3,r4
   12924:	54 a7 ff fc 	bgu r5,r7,12914 <memset+0x70>
   12928:	34 63 ff fc 	addi r3,r3,-4
   1292c:	00 64 00 02 	srui r4,r3,2
   12930:	20 63 00 03 	andi r3,r3,0x3
   12934:	34 84 00 01 	addi r4,r4,1
   12938:	3c 84 00 02 	sli r4,r4,2
   1293c:	b5 04 40 00 	add r8,r8,r4
   12940:	b9 00 20 00 	mv r4,r8
   12944:	44 60 00 07 	be r3,r0,12960 <memset+0xbc>
   12948:	20 42 00 ff 	andi r2,r2,0xff
   1294c:	34 05 00 00 	mvi r5,0
   12950:	b4 85 30 00 	add r6,r4,r5
   12954:	30 c2 00 00 	sb (r6+0),r2
   12958:	34 a5 00 01 	addi r5,r5,1
   1295c:	5c 65 ff fd 	bne r3,r5,12950 <memset+0xac>
   12960:	c3 a0 00 00 	ret
   12964:	58 a6 00 00 	sw (r5+0),r6
   12968:	58 a6 00 04 	sw (r5+4),r6
   1296c:	58 a6 00 08 	sw (r5+8),r6
   12970:	58 a6 00 0c 	sw (r5+12),r6
   12974:	34 e7 ff f0 	addi r7,r7,-16
   12978:	34 a5 00 10 	addi r5,r5,16
   1297c:	54 e9 ff fa 	bgu r7,r9,12964 <memset+0xc0>
   12980:	34 63 ff f0 	addi r3,r3,-16
   12984:	00 68 00 04 	srui r8,r3,4
   12988:	20 63 00 0f 	andi r3,r3,0xf
   1298c:	35 08 00 01 	addi r8,r8,1
   12990:	3d 08 00 04 	sli r8,r8,4
   12994:	b4 88 40 00 	add r8,r4,r8
   12998:	34 04 00 03 	mvi r4,3
   1299c:	54 64 ff dc 	bgu r3,r4,1290c <memset+0x68>
   129a0:	b9 00 20 00 	mv r4,r8
   129a4:	e3 ff ff e8 	bi 12944 <memset+0xa0>

000129a8 <strcpy>:
   129a8:	b8 41 28 00 	or r5,r2,r1
   129ac:	20 a5 00 03 	andi r5,r5,0x3
   129b0:	b8 40 38 00 	mv r7,r2
   129b4:	b8 20 20 00 	mv r4,r1
   129b8:	5c a0 00 18 	bne r5,r0,12a18 <strcpy+0x70>
   129bc:	78 04 00 01 	mvhi r4,0x1
   129c0:	38 84 58 5c 	ori r4,r4,0x585c
   129c4:	28 43 00 00 	lw r3,(r2+0)
   129c8:	28 88 00 00 	lw r8,(r4+0)
   129cc:	78 04 00 01 	mvhi r4,0x1
   129d0:	38 84 58 60 	ori r4,r4,0x5860
   129d4:	28 87 00 00 	lw r7,(r4+0)
   129d8:	a4 60 30 00 	not r6,r3
   129dc:	b4 68 20 00 	add r4,r3,r8
   129e0:	a0 c4 30 00 	and r6,r6,r4
   129e4:	a0 c7 30 00 	and r6,r6,r7
   129e8:	b8 20 20 00 	mv r4,r1
   129ec:	5c c5 00 0a 	bne r6,r5,12a14 <strcpy+0x6c>
   129f0:	58 83 00 00 	sw (r4+0),r3
   129f4:	34 42 00 04 	addi r2,r2,4
   129f8:	28 43 00 00 	lw r3,(r2+0)
   129fc:	34 84 00 04 	addi r4,r4,4
   12a00:	a4 60 30 00 	not r6,r3
   12a04:	b4 68 28 00 	add r5,r3,r8
   12a08:	a0 c5 28 00 	and r5,r6,r5
   12a0c:	a0 a7 28 00 	and r5,r5,r7
   12a10:	44 a0 ff f8 	be r5,r0,129f0 <strcpy+0x48>
   12a14:	b8 40 38 00 	mv r7,r2
   12a18:	34 03 00 00 	mvi r3,0
   12a1c:	b4 e3 28 00 	add r5,r7,r3
   12a20:	40 a5 00 00 	lbu r5,(r5+0)
   12a24:	b4 83 30 00 	add r6,r4,r3
   12a28:	34 63 00 01 	addi r3,r3,1
   12a2c:	30 c5 00 00 	sb (r6+0),r5
   12a30:	5c a0 ff fb 	bne r5,r0,12a1c <strcpy+0x74>
   12a34:	c3 a0 00 00 	ret

00012a38 <strncpy>:
   12a38:	b8 41 20 00 	or r4,r2,r1
   12a3c:	20 84 00 03 	andi r4,r4,0x3
   12a40:	74 65 00 03 	cmpgui r5,r3,0x3
   12a44:	64 84 00 00 	cmpei r4,r4,0
   12a48:	b8 40 30 00 	mv r6,r2
   12a4c:	a0 85 20 00 	and r4,r4,r5
   12a50:	b8 20 28 00 	mv r5,r1
   12a54:	44 80 00 15 	be r4,r0,12aa8 <strncpy+0x70>
   12a58:	78 04 00 01 	mvhi r4,0x1
   12a5c:	38 84 58 5c 	ori r4,r4,0x585c
   12a60:	28 89 00 00 	lw r9,(r4+0)
   12a64:	78 04 00 01 	mvhi r4,0x1
   12a68:	38 84 58 60 	ori r4,r4,0x5860
   12a6c:	28 88 00 00 	lw r8,(r4+0)
   12a70:	34 0a 00 03 	mvi r10,3
   12a74:	e0 00 00 06 	bi 12a8c <strncpy+0x54>
   12a78:	58 a4 00 00 	sw (r5+0),r4
   12a7c:	34 63 ff fc 	addi r3,r3,-4
   12a80:	34 a5 00 04 	addi r5,r5,4
   12a84:	34 42 00 04 	addi r2,r2,4
   12a88:	51 43 00 07 	bgeu r10,r3,12aa4 <strncpy+0x6c>
   12a8c:	28 44 00 00 	lw r4,(r2+0)
   12a90:	a4 80 38 00 	not r7,r4
   12a94:	b4 89 30 00 	add r6,r4,r9
   12a98:	a0 e6 30 00 	and r6,r7,r6
   12a9c:	a0 c8 30 00 	and r6,r6,r8
   12aa0:	44 c0 ff f6 	be r6,r0,12a78 <strncpy+0x40>
   12aa4:	b8 40 30 00 	mv r6,r2
   12aa8:	44 60 00 14 	be r3,r0,12af8 <strncpy+0xc0>
   12aac:	40 c2 00 00 	lbu r2,(r6+0)
   12ab0:	34 63 ff ff 	addi r3,r3,-1
   12ab4:	34 a4 00 01 	addi r4,r5,1
   12ab8:	30 a2 00 00 	sb (r5+0),r2
   12abc:	44 40 00 09 	be r2,r0,12ae0 <strncpy+0xa8>
   12ac0:	34 c2 00 01 	addi r2,r6,1
   12ac4:	44 60 00 0e 	be r3,r0,12afc <strncpy+0xc4>
   12ac8:	40 45 00 00 	lbu r5,(r2+0)
   12acc:	34 63 ff ff 	addi r3,r3,-1
   12ad0:	34 42 00 01 	addi r2,r2,1
   12ad4:	30 85 00 00 	sb (r4+0),r5
   12ad8:	34 84 00 01 	addi r4,r4,1
   12adc:	5c a0 ff fa 	bne r5,r0,12ac4 <strncpy+0x8c>
   12ae0:	34 02 00 00 	mvi r2,0
   12ae4:	44 60 00 07 	be r3,r0,12b00 <strncpy+0xc8>
   12ae8:	b4 82 28 00 	add r5,r4,r2
   12aec:	30 a0 00 00 	sb (r5+0),r0
   12af0:	34 42 00 01 	addi r2,r2,1
   12af4:	5c 62 ff fd 	bne r3,r2,12ae8 <strncpy+0xb0>
   12af8:	c3 a0 00 00 	ret
   12afc:	c3 a0 00 00 	ret
   12b00:	c3 a0 00 00 	ret
