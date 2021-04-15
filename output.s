	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,80
	lui a0,%hi(N)
	sw a1,%lo(N)(a0)
LBB25:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : __init__
	.globl	test					# start function : test
	.p2align	2
test:
#LBB42:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a2,0
	li a3,0
	li a4,0
	li a0,0
	li a5,0
LBB43:
	li a2,200
	slt a2,a5,a2
	bnez a2,LBB44
	j LBB56
LBB44:
LBB45:
LBB46:
LBB47:
LBB48:
LBB49:
LBB50:
LBB51:
	addi a2,a5,1
	addi a0,a0,1
LBB52:
LBB53:
LBB54:
	li a3,2
	li a4,1
LBB55:
	addi a5,a2,1
	mv a2,a1
	j LBB43
LBB56:
LBB57:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : test
	.globl	naivedce					# start function : naivedce
	.p2align	2
naivedce:
#LBB58:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
LBB59:
	li a0,114514
	li a3,0
	li a0,1
LBB60:
	li a2,100
	slt a2,a2,a0
	xori a2,a2,1
	bnez a2,LBB61
	j LBB63
LBB61:
	add a3,a3,a0
LBB62:
	addi a0,a0,1
	j LBB60
LBB63:
LBB64:
	li a2,1
	slt a2,a0,a2
	xori a2,a2,1
	bnez a2,LBB65
	j LBB67
LBB65:
	add a3,a3,a0
LBB66:
	addi a0,a0,-1
	j LBB64
LBB67:
	addi a2,a0,1
	li a0,1
LBB68:
	li a4,10
	slt a4,a4,a2
	xori a4,a4,1
	bnez a4,LBB69
	j LBB71
LBB69:
	mul a0,a0,a2
LBB70:
	addi a2,a2,1
	j LBB68
LBB71:
LBB72:
LBB73:
LBB74:
LBB75:
LBB76:
LBB77:
LBB78:
LBB79:
LBB80:
LBB81:
LBB82:
LBB83:
LBB84:
LBB85:
LBB86:
LBB87:
LBB88:
LBB89:
LBB90:
LBB91:
LBB92:
LBB93:
LBB94:
LBB95:
LBB96:
LBB97:
LBB98:
LBB99:
LBB100:
LBB101:
LBB102:
LBB103:
LBB104:
LBB105:
LBB106:
LBB107:
LBB108:
LBB109:
LBB110:
LBB111:
LBB112:
LBB113:
LBB114:
LBB115:
LBB116:
LBB117:
LBB118:
LBB119:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB121
	j LBB120
LBB120:
	j LBB488
LBB121:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB123
	j LBB122
LBB122:
	j LBB487
LBB123:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB125
	j LBB124
LBB124:
	j LBB486
LBB125:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB127
	j LBB126
LBB126:
	j LBB485
LBB127:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB129
	j LBB128
LBB128:
	j LBB484
LBB129:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB131
	j LBB130
LBB130:
	j LBB483
LBB131:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB133
	j LBB132
LBB132:
	j LBB482
LBB133:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB135
	j LBB134
LBB134:
	j LBB481
LBB135:
LBB136:
LBB137:
LBB138:
LBB139:
LBB140:
LBB141:
LBB142:
LBB143:
LBB144:
LBB145:
LBB146:
LBB147:
LBB148:
LBB149:
LBB150:
LBB151:
LBB152:
LBB153:
LBB154:
LBB155:
LBB156:
LBB157:
LBB158:
LBB159:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB161
	j LBB160
LBB160:
	j LBB456
LBB161:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB163
	j LBB162
LBB162:
	j LBB455
LBB163:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB165
	j LBB164
LBB164:
	j LBB454
LBB165:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB167
	j LBB166
LBB166:
	j LBB453
LBB167:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB169
	j LBB168
LBB168:
	j LBB452
LBB169:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB171
	j LBB170
LBB170:
	j LBB451
LBB171:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB173
	j LBB172
LBB172:
	j LBB450
LBB173:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB175
	j LBB174
LBB174:
	j LBB449
LBB175:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB177
	j LBB176
LBB176:
	j LBB448
LBB177:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB179
	j LBB178
LBB178:
	j LBB447
LBB179:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB181
	j LBB180
LBB180:
	j LBB446
LBB181:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB183
	j LBB182
LBB182:
	j LBB445
LBB183:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB185
	j LBB184
LBB184:
	j LBB444
LBB185:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB187
	j LBB186
LBB186:
	j LBB443
LBB187:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB189
	j LBB188
LBB188:
	j LBB442
LBB189:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB191
	j LBB190
LBB190:
	j LBB441
LBB191:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB193
	j LBB192
LBB192:
	j LBB440
LBB193:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB195
	j LBB194
LBB194:
	j LBB439
LBB195:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB197
	j LBB196
LBB196:
	j LBB438
LBB197:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB199
	j LBB198
LBB198:
	j LBB437
LBB199:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB201
	j LBB200
LBB200:
	j LBB436
LBB201:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB203
	j LBB202
LBB202:
	j LBB435
LBB203:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB205
	j LBB204
LBB204:
	j LBB434
LBB205:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB207
	j LBB206
LBB206:
	j LBB433
LBB207:
LBB208:
LBB209:
LBB210:
LBB211:
LBB212:
LBB213:
LBB214:
LBB215:
LBB216:
LBB217:
LBB218:
LBB219:
LBB220:
LBB221:
LBB222:
LBB223:
LBB224:
LBB225:
LBB226:
LBB227:
LBB228:
LBB229:
LBB230:
LBB231:
LBB232:
LBB233:
LBB234:
LBB235:
LBB236:
LBB237:
LBB238:
LBB239:
LBB240:
LBB241:
LBB242:
LBB243:
	li a2,3628800
	xor a2,a0,a2
	seqz a2,a2
	bnez a2,LBB245
	j LBB244
LBB244:
	j LBB396
LBB245:
LBB246:
LBB247:
LBB248:
LBB249:
LBB250:
LBB251:
LBB252:
LBB253:
LBB254:
LBB255:
LBB256:
LBB257:
LBB258:
LBB259:
LBB260:
LBB261:
LBB262:
LBB263:
LBB264:
LBB265:
LBB266:
LBB267:
LBB268:
LBB269:
LBB270:
LBB271:
LBB272:
LBB273:
LBB274:
LBB275:
LBB276:
LBB277:
LBB278:
LBB279:
LBB280:
LBB281:
	li a2,10100
	xor a2,a3,a2
	seqz a2,a2
	bnez a2,LBB283
	j LBB282
LBB282:
	j LBB359
LBB283:
LBB284:
LBB285:
LBB286:
LBB287:
LBB288:
LBB289:
LBB290:
LBB291:
LBB292:
LBB293:
LBB294:
LBB295:
	li a2,3628800
	xor a2,a0,a2
	seqz a2,a2
	bnez a2,LBB297
	j LBB296
LBB296:
	j LBB346
LBB297:
LBB298:
LBB299:
LBB300:
LBB301:
LBB302:
LBB303:
LBB304:
LBB305:
LBB306:
LBB307:
LBB308:
LBB309:
LBB310:
LBB311:
LBB312:
LBB313:
LBB314:
LBB315:
LBB316:
LBB317:
LBB318:
LBB319:
LBB320:
LBB321:
LBB322:
LBB323:
LBB324:
LBB325:
LBB326:
LBB327:
LBB328:
LBB329:
LBB330:
LBB331:
LBB332:
LBB333:
LBB334:
LBB335:
LBB336:
LBB337:
LBB338:
LBB339:
LBB340:
LBB341:
LBB342:
LBB343:
LBB344:
LBB345:
	addi a0,a0,1
LBB346:
LBB347:
LBB348:
LBB349:
LBB350:
LBB351:
LBB352:
LBB353:
LBB354:
LBB355:
LBB356:
LBB357:
LBB358:
LBB359:
LBB360:
LBB361:
LBB362:
LBB363:
LBB364:
LBB365:
LBB366:
LBB367:
LBB368:
LBB369:
LBB370:
LBB371:
LBB372:
LBB373:
LBB374:
LBB375:
LBB376:
LBB377:
LBB378:
LBB379:
LBB380:
LBB381:
LBB382:
LBB383:
LBB384:
LBB385:
LBB386:
LBB387:
LBB388:
LBB389:
LBB390:
LBB391:
LBB392:
LBB393:
LBB394:
LBB395:
LBB396:
LBB397:
LBB398:
LBB399:
LBB400:
LBB401:
LBB402:
LBB403:
LBB404:
LBB405:
LBB406:
LBB407:
LBB408:
LBB409:
LBB410:
LBB411:
LBB412:
LBB413:
LBB414:
LBB415:
LBB416:
LBB417:
LBB418:
LBB419:
LBB420:
LBB421:
LBB422:
LBB423:
LBB424:
LBB425:
LBB426:
LBB427:
LBB428:
LBB429:
LBB430:
LBB431:
LBB432:
LBB433:
LBB434:
LBB435:
LBB436:
LBB437:
LBB438:
LBB439:
LBB440:
LBB441:
LBB442:
LBB443:
LBB444:
LBB445:
LBB446:
LBB447:
LBB448:
LBB449:
LBB450:
LBB451:
LBB452:
LBB453:
LBB454:
LBB455:
LBB456:
LBB457:
LBB458:
LBB459:
LBB460:
LBB461:
LBB462:
LBB463:
LBB464:
LBB465:
LBB466:
LBB467:
LBB468:
LBB469:
LBB470:
LBB471:
LBB472:
LBB473:
LBB474:
LBB475:
LBB476:
LBB477:
LBB478:
LBB479:
LBB480:
LBB481:
LBB482:
LBB483:
LBB484:
LBB485:
LBB486:
LBB487:
LBB488:
LBB489:
LBB490:
LBB491:
LBB492:
LBB493:
LBB494:
LBB495:
LBB496:
LBB497:
LBB498:
LBB499:
LBB500:
LBB501:
LBB502:
LBB503:
LBB504:
LBB505:
LBB506:
LBB507:
LBB508:
LBB509:
LBB510:
LBB511:
LBB512:
LBB513:
LBB514:
LBB515:
LBB516:
LBB517:
LBB518:
LBB519:
LBB520:
LBB521:
LBB522:
LBB523:
LBB524:
LBB525:
LBB526:
LBB527:
LBB528:
LBB529:
LBB530:
LBB531:
LBB532:
LBB533:
LBB534:
LBB535:
LBB536:
	li a0,1919
LBB537:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : naivedce
	.globl	dceconst					# start function : dceconst
	.p2align	2
dceconst:
#LBB538:
	sw ra,-4(sp)
	mv s0,sp
	addi sp,sp,-80
	li a1,0
	li a2,0
	li a3,0
	li a4,0
	li a5,0
LBB539:
	lui a4,%hi(N)
	lw a4,%lo(N)(a4)
	slt a4,a5,a4
	bnez a4,LBB540
	j LBB546
LBB540:
	li a4,0
LBB541:
	lui a6,%hi(N)
	lw a6,%lo(N)(a6)
	slt a6,a4,a6
	bnez a6,LBB542
	j LBB544
LBB542:
	add a3,a5,a4
	sub a2,a5,a4
	add a1,a5,a4
	sub a1,a1,a5
	mul a6,a1,a1
	lui a1,%hi(N)
	lw a1,%lo(N)(a1)
	div a1,a6,a1
LBB543:
	addi a4,a4,1
	j LBB541
LBB544:
LBB545:
	addi a5,a5,1
	j LBB539
LBB546:
	li a1,0
	li a2,0
LBB547:
	lui a1,%hi(N)
	lw a1,%lo(N)(a1)
	slt a1,a2,a1
	bnez a1,LBB548
	j LBB550
LBB548:
	lui a1,%hi(N)
	lw a3,%lo(N)(a1)
	li a1,508104
	add a1,a3,a1
	addi a1,a1,111
	addi a1,a1,0
	addi a1,a1,7
	addi a1,a1,0
	addi a1,a1,0
	addi a1,a1,7
	addi a1,a1,0
	addi a1,a1,0
	addi a1,a1,7
	addi a3,a1,0
	li a1,132
	xor a3,a1,a3
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12719578
	xor a3,a3,a1
	li a1,12211342
	xor a1,a3,a1
	addi a1,a1,11
LBB549:
	addi a2,a2,1
	mv a1,a0
	j LBB547
LBB550:
	li a0,114514
LBB551:
	addi sp,sp,80
	lw ra,-4(sp)
	ret
# end function : dceconst
	.globl	main					# start function : main
	.p2align	2
main:
#LBB552:
	sw ra,-4(sp)
	sw s1,-12(sp)
	mv s0,sp
	addi sp,sp,-80
	call __init__
	call test
	mv s1,a0
	call naivedce
	add s1,s1,a0
	call dceconst
	add a1,s1,a0
	li a0,50997
	sub a0,a1,a0
LBB553:
	addi sp,sp,80
	lw s1,-12(sp)
	lw ra,-4(sp)
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

