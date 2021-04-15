	.text
	.globl	__init__					# start function : __init__
	.p2align	2
__init__:
#LBB24:
	li %0,80
	lui %1,%hi(N)
	sw %0,%lo(N)(%1)
LBB25:
	ret
# end function : __init__
	.globl	test					# start function : test
	.p2align	2
test:
#LBB42:
	mv %2,%3
	li %5,0
	mv %4,%5
	li %7,0
	mv %6,%7
	li %9,0
	mv %8,%9
	li %11,0
	mv %10,%11
	li %13,0
	mv %12,%13
LBB43:
	li %15,200
	slt %14,%12,%15
	bnez %14,LBB44
	j LBB56
LBB44:
LBB45:
LBB46:
LBB47:
LBB48:
LBB49:
LBB50:
LBB51:
	addi %16,%12,1
	addi %17,%10,1
LBB52:
	mv %18,%17
	mv %19,%16
LBB53:
	mv %20,%18
	mv %21,%19
LBB54:
	mv %22,%23
	li %25,2
	mv %24,%25
	li %27,1
	mv %26,%27
	mv %28,%20
	mv %29,%21
LBB55:
	addi %30,%21,1
	mv %4,%22
	mv %6,%24
	mv %8,%26
	mv %10,%28
	mv %12,%30
	j LBB43
LBB56:
	mv %31,%10
LBB57:
	mv a0,%31
	ret
# end function : test
	.globl	naivedce					# start function : naivedce
	.p2align	2
naivedce:
#LBB58:
LBB59:
	li %33,114514
	mv %32,%33
	mv %34,%35
	li %37,0
	mv %36,%37
	li %39,1
	mv %38,%39
LBB60:
	li %41,100
	slt %42,%41,%38
	xori %40,%42,1
	bnez %40,LBB61
	j LBB63
LBB61:
	add %43,%36,%38
LBB62:
	addi %44,%38,1
	mv %36,%43
	mv %38,%44
	j LBB60
LBB63:
	mv %45,%36
	mv %46,%38
LBB64:
	li %48,1
	slt %49,%46,%48
	xori %47,%49,1
	bnez %47,LBB65
	j LBB67
LBB65:
	add %50,%45,%46
LBB66:
	addi %51,%46,-1
	mv %45,%50
	mv %46,%51
	j LBB64
LBB67:
	addi %52,%46,1
	li %54,1
	mv %53,%54
	mv %55,%52
LBB68:
	li %57,10
	slt %58,%57,%55
	xori %56,%58,1
	bnez %56,LBB69
	j LBB71
LBB69:
	mul %59,%53,%55
LBB70:
	addi %60,%55,1
	mv %53,%59
	mv %55,%60
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
	li %62,10100
	xor %63,%45,%62
	seqz %61,%63
	bnez %61,LBB121
	j LBB120
LBB120:
	mv %64,%53
	mv %65,%66
	j LBB488
LBB121:
	li %68,10100
	xor %69,%45,%68
	seqz %67,%69
	bnez %67,LBB123
	j LBB122
LBB122:
	mv %70,%53
	mv %71,%66
	j LBB487
LBB123:
	li %73,10100
	xor %74,%45,%73
	seqz %72,%74
	bnez %72,LBB125
	j LBB124
LBB124:
	mv %75,%53
	mv %76,%66
	j LBB486
LBB125:
	li %78,10100
	xor %79,%45,%78
	seqz %77,%79
	bnez %77,LBB127
	j LBB126
LBB126:
	mv %80,%53
	mv %81,%66
	j LBB485
LBB127:
	li %83,10100
	xor %84,%45,%83
	seqz %82,%84
	bnez %82,LBB129
	j LBB128
LBB128:
	mv %85,%53
	mv %86,%66
	j LBB484
LBB129:
	li %88,10100
	xor %89,%45,%88
	seqz %87,%89
	bnez %87,LBB131
	j LBB130
LBB130:
	mv %90,%53
	mv %91,%66
	j LBB483
LBB131:
	li %93,10100
	xor %94,%45,%93
	seqz %92,%94
	bnez %92,LBB133
	j LBB132
LBB132:
	mv %95,%53
	mv %96,%66
	j LBB482
LBB133:
	li %98,10100
	xor %99,%45,%98
	seqz %97,%99
	bnez %97,LBB135
	j LBB134
LBB134:
	mv %100,%53
	mv %101,%66
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
	li %103,10100
	xor %104,%45,%103
	seqz %102,%104
	bnez %102,LBB161
	j LBB160
LBB160:
	mv %105,%53
	mv %106,%66
	j LBB456
LBB161:
	li %108,10100
	xor %109,%45,%108
	seqz %107,%109
	bnez %107,LBB163
	j LBB162
LBB162:
	mv %110,%53
	mv %111,%66
	j LBB455
LBB163:
	li %113,10100
	xor %114,%45,%113
	seqz %112,%114
	bnez %112,LBB165
	j LBB164
LBB164:
	mv %115,%53
	mv %116,%66
	j LBB454
LBB165:
	li %118,10100
	xor %119,%45,%118
	seqz %117,%119
	bnez %117,LBB167
	j LBB166
LBB166:
	mv %120,%53
	mv %121,%66
	j LBB453
LBB167:
	li %123,10100
	xor %124,%45,%123
	seqz %122,%124
	bnez %122,LBB169
	j LBB168
LBB168:
	mv %125,%53
	mv %126,%66
	j LBB452
LBB169:
	li %128,10100
	xor %129,%45,%128
	seqz %127,%129
	bnez %127,LBB171
	j LBB170
LBB170:
	mv %130,%53
	mv %131,%66
	j LBB451
LBB171:
	li %133,10100
	xor %134,%45,%133
	seqz %132,%134
	bnez %132,LBB173
	j LBB172
LBB172:
	mv %135,%53
	mv %136,%66
	j LBB450
LBB173:
	li %138,10100
	xor %139,%45,%138
	seqz %137,%139
	bnez %137,LBB175
	j LBB174
LBB174:
	mv %140,%53
	mv %141,%66
	j LBB449
LBB175:
	li %143,10100
	xor %144,%45,%143
	seqz %142,%144
	bnez %142,LBB177
	j LBB176
LBB176:
	mv %145,%53
	mv %146,%66
	j LBB448
LBB177:
	li %148,10100
	xor %149,%45,%148
	seqz %147,%149
	bnez %147,LBB179
	j LBB178
LBB178:
	mv %150,%53
	mv %151,%66
	j LBB447
LBB179:
	li %153,10100
	xor %154,%45,%153
	seqz %152,%154
	bnez %152,LBB181
	j LBB180
LBB180:
	mv %155,%53
	mv %156,%66
	j LBB446
LBB181:
	li %158,10100
	xor %159,%45,%158
	seqz %157,%159
	bnez %157,LBB183
	j LBB182
LBB182:
	mv %160,%53
	mv %161,%66
	j LBB445
LBB183:
	li %163,10100
	xor %164,%45,%163
	seqz %162,%164
	bnez %162,LBB185
	j LBB184
LBB184:
	mv %165,%53
	mv %166,%66
	j LBB444
LBB185:
	li %168,10100
	xor %169,%45,%168
	seqz %167,%169
	bnez %167,LBB187
	j LBB186
LBB186:
	mv %170,%53
	mv %171,%66
	j LBB443
LBB187:
	li %173,10100
	xor %174,%45,%173
	seqz %172,%174
	bnez %172,LBB189
	j LBB188
LBB188:
	mv %175,%53
	mv %176,%66
	j LBB442
LBB189:
	li %178,10100
	xor %179,%45,%178
	seqz %177,%179
	bnez %177,LBB191
	j LBB190
LBB190:
	mv %180,%53
	mv %181,%66
	j LBB441
LBB191:
	li %183,10100
	xor %184,%45,%183
	seqz %182,%184
	bnez %182,LBB193
	j LBB192
LBB192:
	mv %185,%53
	mv %186,%66
	j LBB440
LBB193:
	li %188,10100
	xor %189,%45,%188
	seqz %187,%189
	bnez %187,LBB195
	j LBB194
LBB194:
	mv %190,%53
	mv %191,%66
	j LBB439
LBB195:
	li %193,10100
	xor %194,%45,%193
	seqz %192,%194
	bnez %192,LBB197
	j LBB196
LBB196:
	mv %195,%53
	mv %196,%66
	j LBB438
LBB197:
	li %198,10100
	xor %199,%45,%198
	seqz %197,%199
	bnez %197,LBB199
	j LBB198
LBB198:
	mv %200,%53
	mv %201,%66
	j LBB437
LBB199:
	li %203,10100
	xor %204,%45,%203
	seqz %202,%204
	bnez %202,LBB201
	j LBB200
LBB200:
	mv %205,%53
	mv %206,%66
	j LBB436
LBB201:
	li %208,10100
	xor %209,%45,%208
	seqz %207,%209
	bnez %207,LBB203
	j LBB202
LBB202:
	mv %210,%53
	mv %211,%66
	j LBB435
LBB203:
	li %213,10100
	xor %214,%45,%213
	seqz %212,%214
	bnez %212,LBB205
	j LBB204
LBB204:
	mv %215,%53
	mv %216,%66
	j LBB434
LBB205:
	li %218,10100
	xor %219,%45,%218
	seqz %217,%219
	bnez %217,LBB207
	j LBB206
LBB206:
	mv %220,%53
	mv %221,%66
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
	li %223,3628800
	xor %224,%53,%223
	seqz %222,%224
	bnez %222,LBB245
	j LBB244
LBB244:
	mv %225,%53
	mv %226,%66
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
	li %228,10100
	xor %229,%45,%228
	seqz %227,%229
	bnez %227,LBB283
	j LBB282
LBB282:
	mv %230,%53
	mv %231,%66
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
	li %233,3628800
	xor %234,%53,%233
	seqz %232,%234
	bnez %232,LBB297
	j LBB296
LBB296:
	mv %235,%53
	mv %236,%66
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
	mv %237,%238
LBB323:
	mv %239,%237
LBB324:
	mv %240,%239
LBB325:
	mv %241,%240
LBB326:
	mv %242,%241
LBB327:
	mv %243,%242
LBB328:
	mv %244,%243
LBB329:
	mv %245,%244
LBB330:
	mv %246,%245
LBB331:
	mv %247,%246
LBB332:
	mv %248,%247
LBB333:
	mv %249,%248
LBB334:
	mv %250,%249
LBB335:
	mv %251,%250
LBB336:
	mv %252,%251
LBB337:
	mv %253,%252
LBB338:
	mv %254,%253
LBB339:
	mv %255,%254
LBB340:
	mv %256,%255
LBB341:
	mv %257,%256
LBB342:
	mv %258,%257
LBB343:
	mv %259,%258
LBB344:
	mv %260,%259
LBB345:
	mv %261,%260
	addi %262,%53,1
	mv %235,%262
	mv %236,%261
LBB346:
LBB347:
	mv %263,%235
	mv %264,%236
LBB348:
	mv %265,%263
	mv %266,%264
LBB349:
	mv %267,%265
	mv %268,%266
LBB350:
	mv %269,%267
	mv %270,%268
LBB351:
	mv %271,%269
	mv %272,%270
LBB352:
	mv %273,%271
	mv %274,%272
LBB353:
	mv %275,%273
	mv %276,%274
LBB354:
	mv %277,%275
	mv %278,%276
LBB355:
	mv %279,%277
	mv %280,%278
LBB356:
	mv %281,%279
	mv %282,%280
LBB357:
	mv %283,%281
	mv %284,%282
LBB358:
	mv %285,%283
	mv %286,%284
	mv %230,%285
	mv %231,%286
LBB359:
LBB360:
	mv %287,%230
	mv %288,%231
LBB361:
	mv %289,%287
	mv %290,%288
LBB362:
	mv %291,%289
	mv %292,%290
LBB363:
	mv %293,%291
	mv %294,%292
LBB364:
	mv %295,%293
	mv %296,%294
LBB365:
	mv %297,%295
	mv %298,%296
LBB366:
	mv %299,%297
	mv %300,%298
LBB367:
	mv %301,%299
	mv %302,%300
LBB368:
	mv %303,%301
	mv %304,%302
LBB369:
	mv %305,%303
	mv %306,%304
LBB370:
	mv %307,%305
	mv %308,%306
LBB371:
	mv %309,%307
	mv %310,%308
LBB372:
	mv %311,%309
	mv %312,%310
LBB373:
	mv %313,%311
	mv %314,%312
LBB374:
	mv %315,%313
	mv %316,%314
LBB375:
	mv %317,%315
	mv %318,%316
LBB376:
	mv %319,%317
	mv %320,%318
LBB377:
	mv %321,%319
	mv %322,%320
LBB378:
	mv %323,%321
	mv %324,%322
LBB379:
	mv %325,%323
	mv %326,%324
LBB380:
	mv %327,%325
	mv %328,%326
LBB381:
	mv %329,%327
	mv %330,%328
LBB382:
	mv %331,%329
	mv %332,%330
LBB383:
	mv %333,%331
	mv %334,%332
LBB384:
	mv %335,%333
	mv %336,%334
LBB385:
	mv %337,%335
	mv %338,%336
LBB386:
	mv %339,%337
	mv %340,%338
LBB387:
	mv %341,%339
	mv %342,%340
LBB388:
	mv %343,%341
	mv %344,%342
LBB389:
	mv %345,%343
	mv %346,%344
LBB390:
	mv %347,%345
	mv %348,%346
LBB391:
	mv %349,%347
	mv %350,%348
LBB392:
	mv %351,%349
	mv %352,%350
LBB393:
	mv %353,%351
	mv %354,%352
LBB394:
	mv %355,%353
	mv %356,%354
LBB395:
	mv %357,%355
	mv %358,%356
	mv %225,%357
	mv %226,%358
LBB396:
LBB397:
	mv %359,%225
	mv %360,%226
LBB398:
	mv %361,%359
	mv %362,%360
LBB399:
	mv %363,%361
	mv %364,%362
LBB400:
	mv %365,%363
	mv %366,%364
LBB401:
	mv %367,%365
	mv %368,%366
LBB402:
	mv %369,%367
	mv %370,%368
LBB403:
	mv %371,%369
	mv %372,%370
LBB404:
	mv %373,%371
	mv %374,%372
LBB405:
	mv %375,%373
	mv %376,%374
LBB406:
	mv %377,%375
	mv %378,%376
LBB407:
	mv %379,%377
	mv %380,%378
LBB408:
	mv %381,%379
	mv %382,%380
LBB409:
	mv %383,%381
	mv %384,%382
LBB410:
	mv %385,%383
	mv %386,%384
LBB411:
	mv %387,%385
	mv %388,%386
LBB412:
	mv %389,%387
	mv %390,%388
LBB413:
	mv %391,%389
	mv %392,%390
LBB414:
	mv %393,%391
	mv %394,%392
LBB415:
	mv %395,%393
	mv %396,%394
LBB416:
	mv %397,%395
	mv %398,%396
LBB417:
	mv %399,%397
	mv %400,%398
LBB418:
	mv %401,%399
	mv %402,%400
LBB419:
	mv %403,%401
	mv %404,%402
LBB420:
	mv %405,%403
	mv %406,%404
LBB421:
	mv %407,%405
	mv %408,%406
LBB422:
	mv %409,%407
	mv %410,%408
LBB423:
	mv %411,%409
	mv %412,%410
LBB424:
	mv %413,%411
	mv %414,%412
LBB425:
	mv %415,%413
	mv %416,%414
LBB426:
	mv %417,%415
	mv %418,%416
LBB427:
	mv %419,%417
	mv %420,%418
LBB428:
	mv %421,%419
	mv %422,%420
LBB429:
	mv %423,%421
	mv %424,%422
LBB430:
	mv %425,%423
	mv %426,%424
LBB431:
	mv %427,%425
	mv %428,%426
LBB432:
	mv %429,%427
	mv %430,%428
	mv %220,%429
	mv %221,%430
LBB433:
	mv %215,%220
	mv %216,%221
LBB434:
	mv %210,%215
	mv %211,%216
LBB435:
	mv %205,%210
	mv %206,%211
LBB436:
	mv %200,%205
	mv %201,%206
LBB437:
	mv %195,%200
	mv %196,%201
LBB438:
	mv %190,%195
	mv %191,%196
LBB439:
	mv %185,%190
	mv %186,%191
LBB440:
	mv %180,%185
	mv %181,%186
LBB441:
	mv %175,%180
	mv %176,%181
LBB442:
	mv %170,%175
	mv %171,%176
LBB443:
	mv %165,%170
	mv %166,%171
LBB444:
	mv %160,%165
	mv %161,%166
LBB445:
	mv %155,%160
	mv %156,%161
LBB446:
	mv %150,%155
	mv %151,%156
LBB447:
	mv %145,%150
	mv %146,%151
LBB448:
	mv %140,%145
	mv %141,%146
LBB449:
	mv %135,%140
	mv %136,%141
LBB450:
	mv %130,%135
	mv %131,%136
LBB451:
	mv %125,%130
	mv %126,%131
LBB452:
	mv %120,%125
	mv %121,%126
LBB453:
	mv %115,%120
	mv %116,%121
LBB454:
	mv %110,%115
	mv %111,%116
LBB455:
	mv %105,%110
	mv %106,%111
LBB456:
LBB457:
	mv %431,%105
	mv %432,%106
LBB458:
	mv %433,%431
	mv %434,%432
LBB459:
	mv %435,%433
	mv %436,%434
LBB460:
	mv %437,%435
	mv %438,%436
LBB461:
	mv %439,%437
	mv %440,%438
LBB462:
	mv %441,%439
	mv %442,%440
LBB463:
	mv %443,%441
	mv %444,%442
LBB464:
	mv %445,%443
	mv %446,%444
LBB465:
	mv %447,%445
	mv %448,%446
LBB466:
	mv %449,%447
	mv %450,%448
LBB467:
	mv %451,%449
	mv %452,%450
LBB468:
	mv %453,%451
	mv %454,%452
LBB469:
	mv %455,%453
	mv %456,%454
LBB470:
	mv %457,%455
	mv %458,%456
LBB471:
	mv %459,%457
	mv %460,%458
LBB472:
	mv %461,%459
	mv %462,%460
LBB473:
	mv %463,%461
	mv %464,%462
LBB474:
	mv %465,%463
	mv %466,%464
LBB475:
	mv %467,%465
	mv %468,%466
LBB476:
	mv %469,%467
	mv %470,%468
LBB477:
	mv %471,%469
	mv %472,%470
LBB478:
	mv %473,%471
	mv %474,%472
LBB479:
	mv %475,%473
	mv %476,%474
LBB480:
	mv %477,%475
	mv %478,%476
	mv %100,%477
	mv %101,%478
LBB481:
	mv %95,%100
	mv %96,%101
LBB482:
	mv %90,%95
	mv %91,%96
LBB483:
	mv %85,%90
	mv %86,%91
LBB484:
	mv %80,%85
	mv %81,%86
LBB485:
	mv %75,%80
	mv %76,%81
LBB486:
	mv %70,%75
	mv %71,%76
LBB487:
	mv %64,%70
	mv %65,%71
LBB488:
LBB489:
	mv %479,%64
	mv %480,%65
LBB490:
	mv %481,%479
	mv %482,%480
LBB491:
	mv %483,%481
	mv %484,%482
LBB492:
	mv %485,%483
	mv %486,%484
LBB493:
	mv %487,%485
	mv %488,%486
LBB494:
	mv %489,%487
	mv %490,%488
LBB495:
	mv %491,%489
	mv %492,%490
LBB496:
	mv %493,%491
	mv %494,%492
LBB497:
	mv %495,%493
	mv %496,%494
LBB498:
	mv %497,%495
	mv %498,%496
LBB499:
	mv %499,%497
	mv %500,%498
LBB500:
	mv %501,%499
	mv %502,%500
LBB501:
	mv %503,%501
	mv %504,%502
LBB502:
	mv %505,%503
	mv %506,%504
LBB503:
	mv %507,%505
	mv %508,%506
LBB504:
	mv %509,%507
	mv %510,%508
LBB505:
	mv %511,%509
	mv %512,%510
LBB506:
	mv %513,%511
	mv %514,%512
LBB507:
	mv %515,%513
	mv %516,%514
LBB508:
	mv %517,%515
	mv %518,%516
LBB509:
	mv %519,%517
	mv %520,%518
LBB510:
	mv %521,%519
	mv %522,%520
LBB511:
	mv %523,%521
	mv %524,%522
LBB512:
	mv %525,%523
	mv %526,%524
LBB513:
	mv %527,%525
	mv %528,%526
LBB514:
	mv %529,%527
	mv %530,%528
LBB515:
	mv %531,%529
	mv %532,%530
LBB516:
	mv %533,%531
	mv %534,%532
LBB517:
	mv %535,%533
	mv %536,%534
LBB518:
	mv %537,%535
	mv %538,%536
LBB519:
	mv %539,%537
	mv %540,%538
LBB520:
	mv %541,%539
	mv %542,%540
LBB521:
	mv %543,%541
	mv %544,%542
LBB522:
	mv %545,%543
	mv %546,%544
LBB523:
	mv %547,%545
	mv %548,%546
LBB524:
	mv %549,%547
	mv %550,%548
LBB525:
	mv %551,%549
	mv %552,%550
LBB526:
	mv %553,%551
	mv %554,%552
LBB527:
	mv %555,%553
	mv %556,%554
LBB528:
	mv %557,%555
	mv %558,%556
LBB529:
	mv %559,%557
	mv %560,%558
LBB530:
	mv %561,%559
	mv %562,%560
LBB531:
	mv %563,%561
	mv %564,%562
LBB532:
	mv %565,%563
	mv %566,%564
LBB533:
	mv %567,%565
	mv %568,%566
LBB534:
	mv %569,%567
	mv %570,%568
LBB535:
	mv %571,%569
	mv %572,%570
LBB536:
	mv %573,%571
	mv %574,%572
	li %576,1919
	mv %575,%576
LBB537:
	mv a0,%575
	ret
# end function : naivedce
	.globl	dceconst					# start function : dceconst
	.p2align	2
dceconst:
#LBB538:
	mv %577,%578
	li %580,0
	mv %579,%580
	li %582,0
	mv %581,%582
	li %584,0
	mv %583,%584
	li %586,0
	mv %585,%586
	li %588,0
	mv %587,%588
LBB539:
	lui %590,%hi(N)
	lw %589,%lo(N)(%590)
	slt %591,%587,%589
	bnez %591,LBB540
	j LBB546
LBB540:
	mv %592,%579
	mv %593,%581
	mv %594,%583
	li %596,0
	mv %595,%596
LBB541:
	lui %598,%hi(N)
	lw %597,%lo(N)(%598)
	slt %599,%595,%597
	bnez %599,LBB542
	j LBB544
LBB542:
	add %600,%587,%595
	sub %601,%587,%595
	add %602,%587,%595
	sub %603,%602,%587
	mul %604,%603,%603
	lui %606,%hi(N)
	lw %605,%lo(N)(%606)
	div %607,%604,%605
LBB543:
	addi %608,%595,1
	mv %592,%607
	mv %593,%601
	mv %594,%600
	mv %595,%608
	j LBB541
LBB544:
LBB545:
	addi %609,%587,1
	mv %579,%592
	mv %581,%593
	mv %583,%594
	mv %585,%595
	mv %587,%609
	j LBB539
LBB546:
	li %611,0
	mv %610,%611
	li %613,0
	mv %612,%613
LBB547:
	lui %615,%hi(N)
	lw %614,%lo(N)(%615)
	slt %616,%612,%614
	bnez %616,LBB548
	j LBB550
LBB548:
	lui %618,%hi(N)
	lw %617,%lo(N)(%618)
	li %620,508104
	add %619,%617,%620
	addi %621,%619,111
	addi %622,%621,0
	addi %623,%622,7
	addi %624,%623,0
	addi %625,%624,0
	addi %626,%625,7
	addi %627,%626,0
	addi %628,%627,0
	addi %629,%628,7
	addi %630,%629,0
	li %632,132
	xor %631,%632,%630
	li %634,12719578
	xor %633,%631,%634
	li %636,12719578
	xor %635,%633,%636
	li %638,12719578
	xor %637,%635,%638
	li %640,12719578
	xor %639,%637,%640
	li %642,12719578
	xor %641,%639,%642
	li %644,12719578
	xor %643,%641,%644
	li %646,12719578
	xor %645,%643,%646
	li %648,12719578
	xor %647,%645,%648
	li %650,12719578
	xor %649,%647,%650
	li %652,12719578
	xor %651,%649,%652
	li %654,12719578
	xor %653,%651,%654
	li %656,12719578
	xor %655,%653,%656
	li %658,12719578
	xor %657,%655,%658
	li %660,12719578
	xor %659,%657,%660
	li %662,12719578
	xor %661,%659,%662
	li %664,12719578
	xor %663,%661,%664
	li %666,12719578
	xor %665,%663,%666
	li %668,12719578
	xor %667,%665,%668
	li %670,12211342
	xor %669,%667,%670
	addi %671,%669,11
LBB549:
	addi %672,%612,1
	mv %610,%673
	mv %612,%672
	j LBB547
LBB550:
	li %675,114514
	mv %674,%675
LBB551:
	mv a0,%674
	ret
# end function : dceconst
	.globl	main					# start function : main
	.p2align	2
main:
#LBB552:
	call __init__
	call test
	mv %676,a0
	call naivedce
	mv %677,a0
	add %678,%676,%677
	call dceconst
	mv %679,a0
	add %680,%678,%679
	li %682,50997
	sub %681,%680,%682
	mv %683,%681
LBB553:
	mv a0,%683
	ret
# end function : main
.section	.sdata,"aw",@progbits
	.p2align	2
N:
	.word	80

