
main.exe:     file format pei-x86-64


Disassembly of section .text:

0000000000401000 <__mingw_invalidParameterHandler>:
  401000:	c3                   	retq   
  401001:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401006:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40100d:	00 00 00 

0000000000401010 <pre_c_init>:
  401010:	48 83 ec 28          	sub    $0x28,%rsp
  401014:	48 8b 05 65 34 00 00 	mov    0x3465(%rip),%rax        # 404480 <.refptr.mingw_initltsdrot_force>
  40101b:	31 d2                	xor    %edx,%edx
  40101d:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  401023:	48 8b 05 66 34 00 00 	mov    0x3466(%rip),%rax        # 404490 <.refptr.mingw_initltsdyn_force>
  40102a:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  401030:	48 8b 05 69 34 00 00 	mov    0x3469(%rip),%rax        # 4044a0 <.refptr.mingw_initltssuo_force>
  401037:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  40103d:	48 8b 05 2c 34 00 00 	mov    0x342c(%rip),%rax        # 404470 <.refptr.mingw_initcharmax>
  401044:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  40104a:	48 8b 05 0f 33 00 00 	mov    0x330f(%rip),%rax        # 404360 <.refptr.__image_base__>
  401051:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%rax)
  401056:	74 58                	je     4010b0 <pre_c_init+0xa0>
  401058:	48 8b 05 01 34 00 00 	mov    0x3401(%rip),%rax        # 404460 <.refptr.mingw_app_type>
  40105f:	89 15 a3 5f 00 00    	mov    %edx,0x5fa3(%rip)        # 407008 <managedapp>
  401065:	8b 00                	mov    (%rax),%eax
  401067:	85 c0                	test   %eax,%eax
  401069:	74 35                	je     4010a0 <pre_c_init+0x90>
  40106b:	b9 02 00 00 00       	mov    $0x2,%ecx
  401070:	e8 43 1a 00 00       	callq  402ab8 <__set_app_type>
  401075:	e8 b6 1a 00 00       	callq  402b30 <__p__fmode>
  40107a:	48 8b 15 9f 33 00 00 	mov    0x339f(%rip),%rdx        # 404420 <.refptr._fmode>
  401081:	8b 12                	mov    (%rdx),%edx
  401083:	89 10                	mov    %edx,(%rax)
  401085:	e8 b6 05 00 00       	callq  401640 <_setargv>
  40108a:	48 8b 05 7f 32 00 00 	mov    0x327f(%rip),%rax        # 404310 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
  401091:	83 38 01             	cmpl   $0x1,(%rax)
  401094:	74 5a                	je     4010f0 <pre_c_init+0xe0>
  401096:	31 c0                	xor    %eax,%eax
  401098:	48 83 c4 28          	add    $0x28,%rsp
  40109c:	c3                   	retq   
  40109d:	0f 1f 00             	nopl   (%rax)
  4010a0:	b9 01 00 00 00       	mov    $0x1,%ecx
  4010a5:	e8 0e 1a 00 00       	callq  402ab8 <__set_app_type>
  4010aa:	eb c9                	jmp    401075 <pre_c_init+0x65>
  4010ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4010b0:	48 63 48 3c          	movslq 0x3c(%rax),%rcx
  4010b4:	48 01 c8             	add    %rcx,%rax
  4010b7:	81 38 50 45 00 00    	cmpl   $0x4550,(%rax)
  4010bd:	75 99                	jne    401058 <pre_c_init+0x48>
  4010bf:	0f b7 48 18          	movzwl 0x18(%rax),%ecx
  4010c3:	66 81 f9 0b 01       	cmp    $0x10b,%cx
  4010c8:	74 39                	je     401103 <pre_c_init+0xf3>
  4010ca:	66 81 f9 0b 02       	cmp    $0x20b,%cx
  4010cf:	75 87                	jne    401058 <pre_c_init+0x48>
  4010d1:	83 b8 84 00 00 00 0e 	cmpl   $0xe,0x84(%rax)
  4010d8:	0f 86 7a ff ff ff    	jbe    401058 <pre_c_init+0x48>
  4010de:	8b 88 f8 00 00 00    	mov    0xf8(%rax),%ecx
  4010e4:	31 d2                	xor    %edx,%edx
  4010e6:	85 c9                	test   %ecx,%ecx
  4010e8:	0f 95 c2             	setne  %dl
  4010eb:	e9 68 ff ff ff       	jmpq   401058 <pre_c_init+0x48>
  4010f0:	48 8d 0d 59 08 00 00 	lea    0x859(%rip),%rcx        # 401950 <_matherr>
  4010f7:	e8 44 08 00 00       	callq  401940 <__mingw_setusermatherr>
  4010fc:	31 c0                	xor    %eax,%eax
  4010fe:	48 83 c4 28          	add    $0x28,%rsp
  401102:	c3                   	retq   
  401103:	83 78 74 0e          	cmpl   $0xe,0x74(%rax)
  401107:	0f 86 4b ff ff ff    	jbe    401058 <pre_c_init+0x48>
  40110d:	44 8b 80 e8 00 00 00 	mov    0xe8(%rax),%r8d
  401114:	31 d2                	xor    %edx,%edx
  401116:	45 85 c0             	test   %r8d,%r8d
  401119:	0f 95 c2             	setne  %dl
  40111c:	e9 37 ff ff ff       	jmpq   401058 <pre_c_init+0x48>
  401121:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401126:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40112d:	00 00 00 

0000000000401130 <pre_cpp_init>:
  401130:	48 83 ec 38          	sub    $0x38,%rsp
  401134:	48 8b 05 15 33 00 00 	mov    0x3315(%rip),%rax        # 404450 <.refptr._newmode>
  40113b:	4c 8d 05 ce 5e 00 00 	lea    0x5ece(%rip),%r8        # 407010 <envp>
  401142:	48 8d 15 cf 5e 00 00 	lea    0x5ecf(%rip),%rdx        # 407018 <argv>
  401149:	48 8d 0d d0 5e 00 00 	lea    0x5ed0(%rip),%rcx        # 407020 <argc>
  401150:	8b 00                	mov    (%rax),%eax
  401152:	89 05 a8 5e 00 00    	mov    %eax,0x5ea8(%rip)        # 407000 <__bss_start__>
  401158:	48 8d 05 a1 5e 00 00 	lea    0x5ea1(%rip),%rax        # 407000 <__bss_start__>
  40115f:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  401164:	48 8b 05 a5 32 00 00 	mov    0x32a5(%rip),%rax        # 404410 <.refptr._dowildcard>
  40116b:	44 8b 08             	mov    (%rax),%r9d
  40116e:	e8 55 19 00 00       	callq  402ac8 <__getmainargs>
  401173:	90                   	nop
  401174:	48 83 c4 38          	add    $0x38,%rsp
  401178:	c3                   	retq   
  401179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401180 <__tmainCRTStartup>:
  401180:	41 55                	push   %r13
  401182:	41 54                	push   %r12
  401184:	55                   	push   %rbp
  401185:	57                   	push   %rdi
  401186:	56                   	push   %rsi
  401187:	53                   	push   %rbx
  401188:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  40118f:	31 c0                	xor    %eax,%eax
  401191:	b9 0d 00 00 00       	mov    $0xd,%ecx
  401196:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  40119b:	48 89 d7             	mov    %rdx,%rdi
  40119e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4011a1:	48 8b 3d b8 32 00 00 	mov    0x32b8(%rip),%rdi        # 404460 <.refptr.mingw_app_type>
  4011a8:	44 8b 0f             	mov    (%rdi),%r9d
  4011ab:	45 85 c9             	test   %r9d,%r9d
  4011ae:	0f 85 bc 02 00 00    	jne    401470 <__tmainCRTStartup+0x2f0>
  4011b4:	65 48 8b 04 25 30 00 	mov    %gs:0x30,%rax
  4011bb:	00 00 
  4011bd:	48 8b 1d ec 31 00 00 	mov    0x31ec(%rip),%rbx        # 4043b0 <.refptr.__native_startup_lock>
  4011c4:	31 ed                	xor    %ebp,%ebp
  4011c6:	48 8b 70 08          	mov    0x8(%rax),%rsi
  4011ca:	4c 8b 25 93 70 00 00 	mov    0x7093(%rip),%r12        # 408264 <__imp_Sleep>
  4011d1:	eb 11                	jmp    4011e4 <__tmainCRTStartup+0x64>
  4011d3:	48 39 c6             	cmp    %rax,%rsi
  4011d6:	0f 84 34 02 00 00    	je     401410 <__tmainCRTStartup+0x290>
  4011dc:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  4011e1:	41 ff d4             	callq  *%r12
  4011e4:	48 89 e8             	mov    %rbp,%rax
  4011e7:	f0 48 0f b1 33       	lock cmpxchg %rsi,(%rbx)
  4011ec:	48 85 c0             	test   %rax,%rax
  4011ef:	75 e2                	jne    4011d3 <__tmainCRTStartup+0x53>
  4011f1:	48 8b 35 c8 31 00 00 	mov    0x31c8(%rip),%rsi        # 4043c0 <.refptr.__native_startup_state>
  4011f8:	31 ed                	xor    %ebp,%ebp
  4011fa:	8b 06                	mov    (%rsi),%eax
  4011fc:	83 f8 01             	cmp    $0x1,%eax
  4011ff:	0f 84 22 02 00 00    	je     401427 <__tmainCRTStartup+0x2a7>
  401205:	8b 06                	mov    (%rsi),%eax
  401207:	85 c0                	test   %eax,%eax
  401209:	0f 84 71 02 00 00    	je     401480 <__tmainCRTStartup+0x300>
  40120f:	c7 05 eb 5d 00 00 01 	movl   $0x1,0x5deb(%rip)        # 407004 <has_cctor>
  401216:	00 00 00 
  401219:	8b 06                	mov    (%rsi),%eax
  40121b:	83 f8 01             	cmp    $0x1,%eax
  40121e:	0f 84 18 02 00 00    	je     40143c <__tmainCRTStartup+0x2bc>
  401224:	85 ed                	test   %ebp,%ebp
  401226:	0f 84 31 02 00 00    	je     40145d <__tmainCRTStartup+0x2dd>
  40122c:	48 8b 05 1d 31 00 00 	mov    0x311d(%rip),%rax        # 404350 <.refptr.__dyn_tls_init_callback>
  401233:	48 8b 00             	mov    (%rax),%rax
  401236:	48 85 c0             	test   %rax,%rax
  401239:	74 0c                	je     401247 <__tmainCRTStartup+0xc7>
  40123b:	45 31 c0             	xor    %r8d,%r8d
  40123e:	ba 02 00 00 00       	mov    $0x2,%edx
  401243:	31 c9                	xor    %ecx,%ecx
  401245:	ff d0                	callq  *%rax
  401247:	e8 04 0a 00 00       	callq  401c50 <_pei386_runtime_relocator>
  40124c:	48 8d 0d 4d 0f 00 00 	lea    0xf4d(%rip),%rcx        # 4021a0 <_gnu_exception_handler>
  401253:	ff 15 03 70 00 00    	callq  *0x7003(%rip)        # 40825c <__imp_SetUnhandledExceptionFilter>
  401259:	48 8b 15 40 31 00 00 	mov    0x3140(%rip),%rdx        # 4043a0 <.refptr.__mingw_oldexcpt_handler>
  401260:	48 89 02             	mov    %rax,(%rdx)
  401263:	e8 48 0e 00 00       	callq  4020b0 <__mingw_init_ehandler>
  401268:	48 8d 0d 91 fd ff ff 	lea    -0x26f(%rip),%rcx        # 401000 <__mingw_invalidParameterHandler>
  40126f:	e8 9c 18 00 00       	callq  402b10 <_set_invalid_parameter_handler>
  401274:	e8 d7 07 00 00       	callq  401a50 <_fpreset>
  401279:	48 8b 05 e0 30 00 00 	mov    0x30e0(%rip),%rax        # 404360 <.refptr.__image_base__>
  401280:	48 89 05 e1 66 00 00 	mov    %rax,0x66e1(%rip)        # 407968 <__mingw_winmain_hInstance>
  401287:	e8 94 18 00 00       	callq  402b20 <__p__acmdln>
  40128c:	31 c9                	xor    %ecx,%ecx
  40128e:	48 8b 00             	mov    (%rax),%rax
  401291:	48 85 c0             	test   %rax,%rax
  401294:	75 1c                	jne    4012b2 <__tmainCRTStartup+0x132>
  401296:	eb 5f                	jmp    4012f7 <__tmainCRTStartup+0x177>
  401298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40129f:	00 
  4012a0:	84 d2                	test   %dl,%dl
  4012a2:	74 2c                	je     4012d0 <__tmainCRTStartup+0x150>
  4012a4:	83 e1 01             	and    $0x1,%ecx
  4012a7:	74 27                	je     4012d0 <__tmainCRTStartup+0x150>
  4012a9:	b9 01 00 00 00       	mov    $0x1,%ecx
  4012ae:	48 83 c0 01          	add    $0x1,%rax
  4012b2:	0f b6 10             	movzbl (%rax),%edx
  4012b5:	80 fa 20             	cmp    $0x20,%dl
  4012b8:	7e e6                	jle    4012a0 <__tmainCRTStartup+0x120>
  4012ba:	41 89 c8             	mov    %ecx,%r8d
  4012bd:	41 83 f0 01          	xor    $0x1,%r8d
  4012c1:	80 fa 22             	cmp    $0x22,%dl
  4012c4:	41 0f 44 c8          	cmove  %r8d,%ecx
  4012c8:	eb e4                	jmp    4012ae <__tmainCRTStartup+0x12e>
  4012ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4012d0:	84 d2                	test   %dl,%dl
  4012d2:	75 11                	jne    4012e5 <__tmainCRTStartup+0x165>
  4012d4:	eb 1a                	jmp    4012f0 <__tmainCRTStartup+0x170>
  4012d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4012dd:	00 00 00 
  4012e0:	80 fa 20             	cmp    $0x20,%dl
  4012e3:	7f 0b                	jg     4012f0 <__tmainCRTStartup+0x170>
  4012e5:	48 83 c0 01          	add    $0x1,%rax
  4012e9:	0f b6 10             	movzbl (%rax),%edx
  4012ec:	84 d2                	test   %dl,%dl
  4012ee:	75 f0                	jne    4012e0 <__tmainCRTStartup+0x160>
  4012f0:	48 89 05 69 66 00 00 	mov    %rax,0x6669(%rip)        # 407960 <__mingw_winmain_lpCmdLine>
  4012f7:	44 8b 07             	mov    (%rdi),%r8d
  4012fa:	45 85 c0             	test   %r8d,%r8d
  4012fd:	74 16                	je     401315 <__tmainCRTStartup+0x195>
  4012ff:	f6 44 24 5c 01       	testb  $0x1,0x5c(%rsp)
  401304:	b8 0a 00 00 00       	mov    $0xa,%eax
  401309:	0f 85 f1 00 00 00    	jne    401400 <__tmainCRTStartup+0x280>
  40130f:	89 05 eb 1c 00 00    	mov    %eax,0x1ceb(%rip)        # 403000 <__data_start__>
  401315:	8b 1d 05 5d 00 00    	mov    0x5d05(%rip),%ebx        # 407020 <argc>
  40131b:	44 8d 63 01          	lea    0x1(%rbx),%r12d
  40131f:	4d 63 e4             	movslq %r12d,%r12
  401322:	49 c1 e4 03          	shl    $0x3,%r12
  401326:	4c 89 e1             	mov    %r12,%rcx
  401329:	e8 2a 17 00 00       	callq  402a58 <malloc>
  40132e:	85 db                	test   %ebx,%ebx
  401330:	48 8b 3d e1 5c 00 00 	mov    0x5ce1(%rip),%rdi        # 407018 <argv>
  401337:	48 89 c5             	mov    %rax,%rbp
  40133a:	7e 4b                	jle    401387 <__tmainCRTStartup+0x207>
  40133c:	8d 43 ff             	lea    -0x1(%rbx),%eax
  40133f:	31 db                	xor    %ebx,%ebx
  401341:	4c 8d 2c c5 08 00 00 	lea    0x8(,%rax,8),%r13
  401348:	00 
  401349:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401350:	48 8b 0c 1f          	mov    (%rdi,%rbx,1),%rcx
  401354:	e8 d7 16 00 00       	callq  402a30 <strlen>
  401359:	48 8d 70 01          	lea    0x1(%rax),%rsi
  40135d:	48 89 f1             	mov    %rsi,%rcx
  401360:	e8 f3 16 00 00       	callq  402a58 <malloc>
  401365:	49 89 f0             	mov    %rsi,%r8
  401368:	48 89 44 1d 00       	mov    %rax,0x0(%rbp,%rbx,1)
  40136d:	48 8b 14 1f          	mov    (%rdi,%rbx,1),%rdx
  401371:	48 89 c1             	mov    %rax,%rcx
  401374:	48 83 c3 08          	add    $0x8,%rbx
  401378:	e8 d3 16 00 00       	callq  402a50 <memcpy>
  40137d:	49 39 dd             	cmp    %rbx,%r13
  401380:	75 ce                	jne    401350 <__tmainCRTStartup+0x1d0>
  401382:	4a 8d 44 25 f8       	lea    -0x8(%rbp,%r12,1),%rax
  401387:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  40138e:	48 89 2d 83 5c 00 00 	mov    %rbp,0x5c83(%rip)        # 407018 <argv>
  401395:	e8 76 02 00 00       	callq  401610 <__main>
  40139a:	48 8b 05 cf 2f 00 00 	mov    0x2fcf(%rip),%rax        # 404370 <.refptr.__imp___initenv>
  4013a1:	48 8b 15 68 5c 00 00 	mov    0x5c68(%rip),%rdx        # 407010 <envp>
  4013a8:	8b 0d 72 5c 00 00    	mov    0x5c72(%rip),%ecx        # 407020 <argc>
  4013ae:	48 8b 00             	mov    (%rax),%rax
  4013b1:	48 89 10             	mov    %rdx,(%rax)
  4013b4:	4c 8b 05 55 5c 00 00 	mov    0x5c55(%rip),%r8        # 407010 <envp>
  4013bb:	48 8b 15 56 5c 00 00 	mov    0x5c56(%rip),%rdx        # 407018 <argv>
  4013c2:	e8 49 18 00 00       	callq  402c10 <main>
  4013c7:	8b 0d 3b 5c 00 00    	mov    0x5c3b(%rip),%ecx        # 407008 <managedapp>
  4013cd:	89 05 39 5c 00 00    	mov    %eax,0x5c39(%rip)        # 40700c <mainret>
  4013d3:	85 c9                	test   %ecx,%ecx
  4013d5:	0f 84 c3 00 00 00    	je     40149e <__tmainCRTStartup+0x31e>
  4013db:	8b 15 23 5c 00 00    	mov    0x5c23(%rip),%edx        # 407004 <has_cctor>
  4013e1:	85 d2                	test   %edx,%edx
  4013e3:	75 0b                	jne    4013f0 <__tmainCRTStartup+0x270>
  4013e5:	e8 b6 16 00 00       	callq  402aa0 <_cexit>
  4013ea:	8b 05 1c 5c 00 00    	mov    0x5c1c(%rip),%eax        # 40700c <mainret>
  4013f0:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
  4013f7:	5b                   	pop    %rbx
  4013f8:	5e                   	pop    %rsi
  4013f9:	5f                   	pop    %rdi
  4013fa:	5d                   	pop    %rbp
  4013fb:	41 5c                	pop    %r12
  4013fd:	41 5d                	pop    %r13
  4013ff:	c3                   	retq   
  401400:	0f b7 44 24 60       	movzwl 0x60(%rsp),%eax
  401405:	e9 05 ff ff ff       	jmpq   40130f <__tmainCRTStartup+0x18f>
  40140a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401410:	48 8b 35 a9 2f 00 00 	mov    0x2fa9(%rip),%rsi        # 4043c0 <.refptr.__native_startup_state>
  401417:	bd 01 00 00 00       	mov    $0x1,%ebp
  40141c:	8b 06                	mov    (%rsi),%eax
  40141e:	83 f8 01             	cmp    $0x1,%eax
  401421:	0f 85 de fd ff ff    	jne    401205 <__tmainCRTStartup+0x85>
  401427:	b9 1f 00 00 00       	mov    $0x1f,%ecx
  40142c:	e8 77 16 00 00       	callq  402aa8 <_amsg_exit>
  401431:	8b 06                	mov    (%rsi),%eax
  401433:	83 f8 01             	cmp    $0x1,%eax
  401436:	0f 85 e8 fd ff ff    	jne    401224 <__tmainCRTStartup+0xa4>
  40143c:	48 8b 15 9d 2f 00 00 	mov    0x2f9d(%rip),%rdx        # 4043e0 <.refptr.__xc_z>
  401443:	48 8b 0d 86 2f 00 00 	mov    0x2f86(%rip),%rcx        # 4043d0 <.refptr.__xc_a>
  40144a:	e8 49 16 00 00       	callq  402a98 <_initterm>
  40144f:	85 ed                	test   %ebp,%ebp
  401451:	c7 06 02 00 00 00    	movl   $0x2,(%rsi)
  401457:	0f 85 cf fd ff ff    	jne    40122c <__tmainCRTStartup+0xac>
  40145d:	31 c0                	xor    %eax,%eax
  40145f:	48 87 03             	xchg   %rax,(%rbx)
  401462:	e9 c5 fd ff ff       	jmpq   40122c <__tmainCRTStartup+0xac>
  401467:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40146e:	00 00 
  401470:	48 89 d1             	mov    %rdx,%rcx
  401473:	ff 15 93 6d 00 00    	callq  *0x6d93(%rip)        # 40820c <__imp_GetStartupInfoA>
  401479:	e9 36 fd ff ff       	jmpq   4011b4 <__tmainCRTStartup+0x34>
  40147e:	66 90                	xchg   %ax,%ax
  401480:	48 8b 15 79 2f 00 00 	mov    0x2f79(%rip),%rdx        # 404400 <.refptr.__xi_z>
  401487:	c7 06 01 00 00 00    	movl   $0x1,(%rsi)
  40148d:	48 8b 0d 5c 2f 00 00 	mov    0x2f5c(%rip),%rcx        # 4043f0 <.refptr.__xi_a>
  401494:	e8 ff 15 00 00       	callq  402a98 <_initterm>
  401499:	e9 7b fd ff ff       	jmpq   401219 <__tmainCRTStartup+0x99>
  40149e:	89 c1                	mov    %eax,%ecx
  4014a0:	e8 d3 15 00 00       	callq  402a78 <exit>
  4014a5:	90                   	nop
  4014a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4014ad:	00 00 00 

00000000004014b0 <WinMainCRTStartup>:
  4014b0:	48 83 ec 28          	sub    $0x28,%rsp

00000000004014b4 <.l_startw>:
  4014b4:	48 8b 05 a5 2f 00 00 	mov    0x2fa5(%rip),%rax        # 404460 <.refptr.mingw_app_type>
  4014bb:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  4014c1:	e8 8a 01 00 00       	callq  401650 <__security_init_cookie>
  4014c6:	e8 b5 fc ff ff       	callq  401180 <__tmainCRTStartup>
  4014cb:	90                   	nop

00000000004014cc <.l_endw>:
  4014cc:	90                   	nop
  4014cd:	48 83 c4 28          	add    $0x28,%rsp
  4014d1:	c3                   	retq   
  4014d2:	0f 1f 40 00          	nopl   0x0(%rax)
  4014d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4014dd:	00 00 00 

00000000004014e0 <mainCRTStartup>:
  4014e0:	48 83 ec 28          	sub    $0x28,%rsp

00000000004014e4 <.l_start>:
  4014e4:	48 8b 05 75 2f 00 00 	mov    0x2f75(%rip),%rax        # 404460 <.refptr.mingw_app_type>
  4014eb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  4014f1:	e8 5a 01 00 00       	callq  401650 <__security_init_cookie>
  4014f6:	e8 85 fc ff ff       	callq  401180 <__tmainCRTStartup>
  4014fb:	90                   	nop

00000000004014fc <.l_end>:
  4014fc:	90                   	nop
  4014fd:	48 83 c4 28          	add    $0x28,%rsp
  401501:	c3                   	retq   
  401502:	0f 1f 40 00          	nopl   0x0(%rax)
  401506:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40150d:	00 00 00 

0000000000401510 <atexit>:
  401510:	48 83 ec 28          	sub    $0x28,%rsp
  401514:	e8 77 15 00 00       	callq  402a90 <_onexit>
  401519:	48 85 c0             	test   %rax,%rax
  40151c:	0f 94 c0             	sete   %al
  40151f:	0f b6 c0             	movzbl %al,%eax
  401522:	f7 d8                	neg    %eax
  401524:	48 83 c4 28          	add    $0x28,%rsp
  401528:	c3                   	retq   
  401529:	90                   	nop
  40152a:	90                   	nop
  40152b:	90                   	nop
  40152c:	90                   	nop
  40152d:	90                   	nop
  40152e:	90                   	nop
  40152f:	90                   	nop

0000000000401530 <__gcc_register_frame>:
  401530:	48 8d 0d 09 00 00 00 	lea    0x9(%rip),%rcx        # 401540 <__gcc_deregister_frame>
  401537:	e9 d4 ff ff ff       	jmpq   401510 <atexit>
  40153c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401540 <__gcc_deregister_frame>:
  401540:	c3                   	retq   
  401541:	90                   	nop
  401542:	90                   	nop
  401543:	90                   	nop
  401544:	90                   	nop
  401545:	90                   	nop
  401546:	90                   	nop
  401547:	90                   	nop
  401548:	90                   	nop
  401549:	90                   	nop
  40154a:	90                   	nop
  40154b:	90                   	nop
  40154c:	90                   	nop
  40154d:	90                   	nop
  40154e:	90                   	nop
  40154f:	90                   	nop

0000000000401550 <adc_eoc_check>:
  401550:	b8 01 00 00 00       	mov    $0x1,%eax
  401555:	c3                   	retq   
  401556:	90                   	nop
  401557:	90                   	nop
  401558:	90                   	nop
  401559:	90                   	nop
  40155a:	90                   	nop
  40155b:	90                   	nop
  40155c:	90                   	nop
  40155d:	90                   	nop
  40155e:	90                   	nop
  40155f:	90                   	nop

0000000000401560 <__do_global_dtors>:
  401560:	48 83 ec 28          	sub    $0x28,%rsp
  401564:	48 8b 05 a5 1a 00 00 	mov    0x1aa5(%rip),%rax        # 403010 <p.93846>
  40156b:	48 8b 00             	mov    (%rax),%rax
  40156e:	48 85 c0             	test   %rax,%rax
  401571:	74 1d                	je     401590 <__do_global_dtors+0x30>
  401573:	ff d0                	callq  *%rax
  401575:	48 8b 05 94 1a 00 00 	mov    0x1a94(%rip),%rax        # 403010 <p.93846>
  40157c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  401580:	48 8b 40 08          	mov    0x8(%rax),%rax
  401584:	48 89 15 85 1a 00 00 	mov    %rdx,0x1a85(%rip)        # 403010 <p.93846>
  40158b:	48 85 c0             	test   %rax,%rax
  40158e:	75 e3                	jne    401573 <__do_global_dtors+0x13>
  401590:	48 83 c4 28          	add    $0x28,%rsp
  401594:	c3                   	retq   
  401595:	90                   	nop
  401596:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40159d:	00 00 00 

00000000004015a0 <__do_global_ctors>:
  4015a0:	56                   	push   %rsi
  4015a1:	53                   	push   %rbx
  4015a2:	48 83 ec 28          	sub    $0x28,%rsp
  4015a6:	48 8b 0d 73 2d 00 00 	mov    0x2d73(%rip),%rcx        # 404320 <.refptr.__CTOR_LIST__>
  4015ad:	48 8b 11             	mov    (%rcx),%rdx
  4015b0:	83 fa ff             	cmp    $0xffffffff,%edx
  4015b3:	89 d0                	mov    %edx,%eax
  4015b5:	74 39                	je     4015f0 <__do_global_ctors+0x50>
  4015b7:	85 c0                	test   %eax,%eax
  4015b9:	74 20                	je     4015db <__do_global_ctors+0x3b>
  4015bb:	89 c2                	mov    %eax,%edx
  4015bd:	83 e8 01             	sub    $0x1,%eax
  4015c0:	48 8d 1c d1          	lea    (%rcx,%rdx,8),%rbx
  4015c4:	48 29 c2             	sub    %rax,%rdx
  4015c7:	48 8d 74 d1 f8       	lea    -0x8(%rcx,%rdx,8),%rsi
  4015cc:	0f 1f 40 00          	nopl   0x0(%rax)
  4015d0:	ff 13                	callq  *(%rbx)
  4015d2:	48 83 eb 08          	sub    $0x8,%rbx
  4015d6:	48 39 f3             	cmp    %rsi,%rbx
  4015d9:	75 f5                	jne    4015d0 <__do_global_ctors+0x30>
  4015db:	48 8d 0d 7e ff ff ff 	lea    -0x82(%rip),%rcx        # 401560 <__do_global_dtors>
  4015e2:	48 83 c4 28          	add    $0x28,%rsp
  4015e6:	5b                   	pop    %rbx
  4015e7:	5e                   	pop    %rsi
  4015e8:	e9 23 ff ff ff       	jmpq   401510 <atexit>
  4015ed:	0f 1f 00             	nopl   (%rax)
  4015f0:	31 c0                	xor    %eax,%eax
  4015f2:	eb 02                	jmp    4015f6 <__do_global_ctors+0x56>
  4015f4:	89 d0                	mov    %edx,%eax
  4015f6:	44 8d 40 01          	lea    0x1(%rax),%r8d
  4015fa:	4a 83 3c c1 00       	cmpq   $0x0,(%rcx,%r8,8)
  4015ff:	4c 89 c2             	mov    %r8,%rdx
  401602:	75 f0                	jne    4015f4 <__do_global_ctors+0x54>
  401604:	eb b1                	jmp    4015b7 <__do_global_ctors+0x17>
  401606:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40160d:	00 00 00 

0000000000401610 <__main>:
  401610:	8b 05 1a 5a 00 00    	mov    0x5a1a(%rip),%eax        # 407030 <initialized>
  401616:	85 c0                	test   %eax,%eax
  401618:	74 06                	je     401620 <__main+0x10>
  40161a:	c3                   	retq   
  40161b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401620:	c7 05 06 5a 00 00 01 	movl   $0x1,0x5a06(%rip)        # 407030 <initialized>
  401627:	00 00 00 
  40162a:	e9 71 ff ff ff       	jmpq   4015a0 <__do_global_ctors>
  40162f:	90                   	nop

0000000000401630 <my_lconv_init>:
  401630:	48 ff 25 85 6c 00 00 	rex.W jmpq *0x6c85(%rip)        # 4082bc <__imp___lconv_init>
  401637:	90                   	nop
  401638:	90                   	nop
  401639:	90                   	nop
  40163a:	90                   	nop
  40163b:	90                   	nop
  40163c:	90                   	nop
  40163d:	90                   	nop
  40163e:	90                   	nop
  40163f:	90                   	nop

0000000000401640 <_setargv>:
  401640:	31 c0                	xor    %eax,%eax
  401642:	c3                   	retq   
  401643:	90                   	nop
  401644:	90                   	nop
  401645:	90                   	nop
  401646:	90                   	nop
  401647:	90                   	nop
  401648:	90                   	nop
  401649:	90                   	nop
  40164a:	90                   	nop
  40164b:	90                   	nop
  40164c:	90                   	nop
  40164d:	90                   	nop
  40164e:	90                   	nop
  40164f:	90                   	nop

0000000000401650 <__security_init_cookie>:
  401650:	41 54                	push   %r12
  401652:	55                   	push   %rbp
  401653:	57                   	push   %rdi
  401654:	56                   	push   %rsi
  401655:	53                   	push   %rbx
  401656:	48 83 ec 30          	sub    $0x30,%rsp
  40165a:	48 8b 1d 4f 1a 00 00 	mov    0x1a4f(%rip),%rbx        # 4030b0 <__security_cookie>
  401661:	48 b8 32 a2 df 2d 99 	movabs $0x2b992ddfa232,%rax
  401668:	2b 00 00 
  40166b:	48 39 c3             	cmp    %rax,%rbx
  40166e:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  401675:	00 00 
  401677:	74 17                	je     401690 <__security_init_cookie+0x40>
  401679:	48 f7 d3             	not    %rbx
  40167c:	48 89 1d 3d 1a 00 00 	mov    %rbx,0x1a3d(%rip)        # 4030c0 <__security_cookie_complement>
  401683:	48 83 c4 30          	add    $0x30,%rsp
  401687:	5b                   	pop    %rbx
  401688:	5e                   	pop    %rsi
  401689:	5f                   	pop    %rdi
  40168a:	5d                   	pop    %rbp
  40168b:	41 5c                	pop    %r12
  40168d:	c3                   	retq   
  40168e:	66 90                	xchg   %ax,%ax
  401690:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401695:	ff 15 79 6b 00 00    	callq  *0x6b79(%rip)        # 408214 <__imp_GetSystemTimeAsFileTime>
  40169b:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  4016a0:	ff 15 4e 6b 00 00    	callq  *0x6b4e(%rip)        # 4081f4 <__imp_GetCurrentProcessId>
  4016a6:	41 89 c4             	mov    %eax,%r12d
  4016a9:	ff 15 4d 6b 00 00    	callq  *0x6b4d(%rip)        # 4081fc <__imp_GetCurrentThreadId>
  4016af:	89 c5                	mov    %eax,%ebp
  4016b1:	ff 15 65 6b 00 00    	callq  *0x6b65(%rip)        # 40821c <__imp_GetTickCount>
  4016b7:	48 8d 4c 24 28       	lea    0x28(%rsp),%rcx
  4016bc:	89 c7                	mov    %eax,%edi
  4016be:	ff 15 70 6b 00 00    	callq  *0x6b70(%rip)        # 408234 <__imp_QueryPerformanceCounter>
  4016c4:	48 33 74 24 28       	xor    0x28(%rsp),%rsi
  4016c9:	44 89 e0             	mov    %r12d,%eax
  4016cc:	48 ba ff ff ff ff ff 	movabs $0xffffffffffff,%rdx
  4016d3:	ff 00 00 
  4016d6:	48 31 f0             	xor    %rsi,%rax
  4016d9:	89 ee                	mov    %ebp,%esi
  4016db:	48 31 c6             	xor    %rax,%rsi
  4016de:	89 f8                	mov    %edi,%eax
  4016e0:	48 31 f0             	xor    %rsi,%rax
  4016e3:	48 21 d0             	and    %rdx,%rax
  4016e6:	48 39 d8             	cmp    %rbx,%rax
  4016e9:	74 25                	je     401710 <__security_init_cookie+0xc0>
  4016eb:	48 89 c2             	mov    %rax,%rdx
  4016ee:	48 f7 d2             	not    %rdx
  4016f1:	48 89 05 b8 19 00 00 	mov    %rax,0x19b8(%rip)        # 4030b0 <__security_cookie>
  4016f8:	48 89 15 c1 19 00 00 	mov    %rdx,0x19c1(%rip)        # 4030c0 <__security_cookie_complement>
  4016ff:	48 83 c4 30          	add    $0x30,%rsp
  401703:	5b                   	pop    %rbx
  401704:	5e                   	pop    %rsi
  401705:	5f                   	pop    %rdi
  401706:	5d                   	pop    %rbp
  401707:	41 5c                	pop    %r12
  401709:	c3                   	retq   
  40170a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401710:	48 ba cc 5d 20 d2 66 	movabs $0xffffd466d2205dcc,%rdx
  401717:	d4 ff ff 
  40171a:	48 b8 33 a2 df 2d 99 	movabs $0x2b992ddfa233,%rax
  401721:	2b 00 00 
  401724:	eb cb                	jmp    4016f1 <__security_init_cookie+0xa1>
  401726:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40172d:	00 00 00 

0000000000401730 <__report_gsfailure>:
  401730:	55                   	push   %rbp
  401731:	56                   	push   %rsi
  401732:	53                   	push   %rbx
  401733:	48 89 e5             	mov    %rsp,%rbp
  401736:	48 83 ec 70          	sub    $0x70,%rsp
  40173a:	48 89 ce             	mov    %rcx,%rsi
  40173d:	48 8d 0d 1c 59 00 00 	lea    0x591c(%rip),%rcx        # 407060 <GS_ContextRecord>
  401744:	ff 15 fa 6a 00 00    	callq  *0x6afa(%rip)        # 408244 <__imp_RtlCaptureContext>
  40174a:	48 8b 1d 07 5a 00 00 	mov    0x5a07(%rip),%rbx        # 407158 <GS_ContextRecord+0xf8>
  401751:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  401755:	45 31 c0             	xor    %r8d,%r8d
  401758:	48 89 d9             	mov    %rbx,%rcx
  40175b:	ff 15 eb 6a 00 00    	callq  *0x6aeb(%rip)        # 40824c <__imp_RtlLookupFunctionEntry>
  401761:	48 85 c0             	test   %rax,%rax
  401764:	0f 84 a3 00 00 00    	je     40180d <__report_gsfailure+0xdd>
  40176a:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  40176e:	49 89 c1             	mov    %rax,%r9
  401771:	49 89 d8             	mov    %rbx,%r8
  401774:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  40177b:	00 00 
  40177d:	48 8d 0d dc 58 00 00 	lea    0x58dc(%rip),%rcx        # 407060 <GS_ContextRecord>
  401784:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  401789:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  40178d:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  401792:	31 c9                	xor    %ecx,%ecx
  401794:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  401799:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  40179d:	ff 15 b1 6a 00 00    	callq  *0x6ab1(%rip)        # 408254 <__imp_RtlVirtualUnwind>
  4017a3:	48 8b 05 ae 59 00 00 	mov    0x59ae(%rip),%rax        # 407158 <GS_ContextRecord+0xf8>
  4017aa:	31 c9                	xor    %ecx,%ecx
  4017ac:	48 89 35 2d 59 00 00 	mov    %rsi,0x592d(%rip)        # 4070e0 <GS_ContextRecord+0x80>
  4017b3:	48 89 05 96 5d 00 00 	mov    %rax,0x5d96(%rip)        # 407550 <GS_ExceptionRecord+0x10>
  4017ba:	48 b8 09 04 00 c0 01 	movabs $0x1c0000409,%rax
  4017c1:	00 00 00 
  4017c4:	48 89 05 75 5d 00 00 	mov    %rax,0x5d75(%rip)        # 407540 <GS_ExceptionRecord>
  4017cb:	48 8b 05 de 18 00 00 	mov    0x18de(%rip),%rax        # 4030b0 <__security_cookie>
  4017d2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4017d6:	48 8b 05 e3 18 00 00 	mov    0x18e3(%rip),%rax        # 4030c0 <__security_cookie_complement>
  4017dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4017e1:	ff 15 75 6a 00 00    	callq  *0x6a75(%rip)        # 40825c <__imp_SetUnhandledExceptionFilter>
  4017e7:	48 8d 0d 32 28 00 00 	lea    0x2832(%rip),%rcx        # 404020 <GS_ExceptionPointers>
  4017ee:	ff 15 88 6a 00 00    	callq  *0x6a88(%rip)        # 40827c <__imp_UnhandledExceptionFilter>
  4017f4:	ff 15 f2 69 00 00    	callq  *0x69f2(%rip)        # 4081ec <__imp_GetCurrentProcess>
  4017fa:	ba 09 04 00 c0       	mov    $0xc0000409,%edx
  4017ff:	48 89 c1             	mov    %rax,%rcx
  401802:	ff 15 64 6a 00 00    	callq  *0x6a64(%rip)        # 40826c <__imp_TerminateProcess>
  401808:	e8 7b 12 00 00       	callq  402a88 <abort>
  40180d:	48 8b 45 18          	mov    0x18(%rbp),%rax
  401811:	48 89 05 40 59 00 00 	mov    %rax,0x5940(%rip)        # 407158 <GS_ContextRecord+0xf8>
  401818:	48 8d 45 08          	lea    0x8(%rbp),%rax
  40181c:	48 89 05 d5 58 00 00 	mov    %rax,0x58d5(%rip)        # 4070f8 <GS_ContextRecord+0x98>
  401823:	e9 7b ff ff ff       	jmpq   4017a3 <__report_gsfailure+0x73>
  401828:	90                   	nop
  401829:	90                   	nop
  40182a:	90                   	nop
  40182b:	90                   	nop
  40182c:	90                   	nop
  40182d:	90                   	nop
  40182e:	90                   	nop
  40182f:	90                   	nop

0000000000401830 <__dyn_tls_dtor>:
  401830:	48 83 ec 28          	sub    $0x28,%rsp
  401834:	83 fa 03             	cmp    $0x3,%edx
  401837:	74 17                	je     401850 <__dyn_tls_dtor+0x20>
  401839:	85 d2                	test   %edx,%edx
  40183b:	74 13                	je     401850 <__dyn_tls_dtor+0x20>
  40183d:	b8 01 00 00 00       	mov    $0x1,%eax
  401842:	48 83 c4 28          	add    $0x28,%rsp
  401846:	c3                   	retq   
  401847:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40184e:	00 00 
  401850:	e8 cb 0c 00 00       	callq  402520 <__mingw_TLScallback>
  401855:	b8 01 00 00 00       	mov    $0x1,%eax
  40185a:	48 83 c4 28          	add    $0x28,%rsp
  40185e:	c3                   	retq   
  40185f:	90                   	nop

0000000000401860 <__dyn_tls_init>:
  401860:	56                   	push   %rsi
  401861:	53                   	push   %rbx
  401862:	48 83 ec 28          	sub    $0x28,%rsp
  401866:	48 8b 05 93 2a 00 00 	mov    0x2a93(%rip),%rax        # 404300 <.refptr._CRT_MT>
  40186d:	83 38 02             	cmpl   $0x2,(%rax)
  401870:	74 06                	je     401878 <__dyn_tls_init+0x18>
  401872:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
  401878:	83 fa 02             	cmp    $0x2,%edx
  40187b:	74 13                	je     401890 <__dyn_tls_init+0x30>
  40187d:	83 fa 01             	cmp    $0x1,%edx
  401880:	74 40                	je     4018c2 <__dyn_tls_init+0x62>
  401882:	b8 01 00 00 00       	mov    $0x1,%eax
  401887:	48 83 c4 28          	add    $0x28,%rsp
  40188b:	5b                   	pop    %rbx
  40188c:	5e                   	pop    %rsi
  40188d:	c3                   	retq   
  40188e:	66 90                	xchg   %ax,%ax
  401890:	48 8d 1d c9 77 00 00 	lea    0x77c9(%rip),%rbx        # 409060 <__xd_z>
  401897:	48 8d 35 c2 77 00 00 	lea    0x77c2(%rip),%rsi        # 409060 <__xd_z>
  40189e:	48 39 de             	cmp    %rbx,%rsi
  4018a1:	74 df                	je     401882 <__dyn_tls_init+0x22>
  4018a3:	48 8b 03             	mov    (%rbx),%rax
  4018a6:	48 85 c0             	test   %rax,%rax
  4018a9:	74 02                	je     4018ad <__dyn_tls_init+0x4d>
  4018ab:	ff d0                	callq  *%rax
  4018ad:	48 83 c3 08          	add    $0x8,%rbx
  4018b1:	48 39 de             	cmp    %rbx,%rsi
  4018b4:	75 ed                	jne    4018a3 <__dyn_tls_init+0x43>
  4018b6:	b8 01 00 00 00       	mov    $0x1,%eax
  4018bb:	48 83 c4 28          	add    $0x28,%rsp
  4018bf:	5b                   	pop    %rbx
  4018c0:	5e                   	pop    %rsi
  4018c1:	c3                   	retq   
  4018c2:	e8 59 0c 00 00       	callq  402520 <__mingw_TLScallback>
  4018c7:	b8 01 00 00 00       	mov    $0x1,%eax
  4018cc:	48 83 c4 28          	add    $0x28,%rsp
  4018d0:	5b                   	pop    %rbx
  4018d1:	5e                   	pop    %rsi
  4018d2:	c3                   	retq   
  4018d3:	0f 1f 00             	nopl   (%rax)
  4018d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4018dd:	00 00 00 

00000000004018e0 <__tlregdtor>:
  4018e0:	31 c0                	xor    %eax,%eax
  4018e2:	c3                   	retq   
  4018e3:	90                   	nop
  4018e4:	90                   	nop
  4018e5:	90                   	nop
  4018e6:	90                   	nop
  4018e7:	90                   	nop
  4018e8:	90                   	nop
  4018e9:	90                   	nop
  4018ea:	90                   	nop
  4018eb:	90                   	nop
  4018ec:	90                   	nop
  4018ed:	90                   	nop
  4018ee:	90                   	nop
  4018ef:	90                   	nop

00000000004018f0 <__mingw_raise_matherr>:
  4018f0:	48 83 ec 58          	sub    $0x58,%rsp
  4018f4:	48 8b 05 05 5d 00 00 	mov    0x5d05(%rip),%rax        # 407600 <stUserMathErr>
  4018fb:	48 85 c0             	test   %rax,%rax
  4018fe:	74 2c                	je     40192c <__mingw_raise_matherr+0x3c>
  401900:	f2 0f 10 84 24 80 00 	movsd  0x80(%rsp),%xmm0
  401907:	00 00 
  401909:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
  40190d:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401912:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  401917:	f2 0f 11 54 24 30    	movsd  %xmm2,0x30(%rsp)
  40191d:	f2 0f 11 5c 24 38    	movsd  %xmm3,0x38(%rsp)
  401923:	f2 0f 11 44 24 40    	movsd  %xmm0,0x40(%rsp)
  401929:	ff d0                	callq  *%rax
  40192b:	90                   	nop
  40192c:	48 83 c4 58          	add    $0x58,%rsp
  401930:	c3                   	retq   
  401931:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40193d:	00 00 00 

0000000000401940 <__mingw_setusermatherr>:
  401940:	48 89 0d b9 5c 00 00 	mov    %rcx,0x5cb9(%rip)        # 407600 <stUserMathErr>
  401947:	e9 64 11 00 00       	jmpq   402ab0 <__setusermatherr>
  40194c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401950 <_matherr>:
  401950:	56                   	push   %rsi
  401951:	53                   	push   %rbx
  401952:	48 83 ec 78          	sub    $0x78,%rsp
  401956:	0f 29 74 24 40       	movaps %xmm6,0x40(%rsp)
  40195b:	0f 29 7c 24 50       	movaps %xmm7,0x50(%rsp)
  401960:	44 0f 29 44 24 60    	movaps %xmm8,0x60(%rsp)
  401966:	83 39 06             	cmpl   $0x6,(%rcx)
  401969:	0f 87 d1 00 00 00    	ja     401a40 <_matherr+0xf0>
  40196f:	8b 01                	mov    (%rcx),%eax
  401971:	48 8d 15 4c 28 00 00 	lea    0x284c(%rip),%rdx        # 4041c4 <.rdata+0x124>
  401978:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  40197c:	48 01 d0             	add    %rdx,%rax
  40197f:	ff e0                	jmpq   *%rax
  401981:	48 8d 1d 18 27 00 00 	lea    0x2718(%rip),%rbx        # 4040a0 <.rdata>
  401988:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  40198c:	f2 44 0f 10 41 20    	movsd  0x20(%rcx),%xmm8
  401992:	f2 0f 10 79 18       	movsd  0x18(%rcx),%xmm7
  401997:	f2 0f 10 71 10       	movsd  0x10(%rcx),%xmm6
  40199c:	b9 02 00 00 00       	mov    $0x2,%ecx
  4019a1:	e8 3a 11 00 00       	callq  402ae0 <__acrt_iob_func>
  4019a6:	f2 44 0f 11 44 24 30 	movsd  %xmm8,0x30(%rsp)
  4019ad:	49 89 f1             	mov    %rsi,%r9
  4019b0:	49 89 d8             	mov    %rbx,%r8
  4019b3:	f2 0f 11 7c 24 28    	movsd  %xmm7,0x28(%rsp)
  4019b9:	48 8d 15 d8 27 00 00 	lea    0x27d8(%rip),%rdx        # 404198 <.rdata+0xf8>
  4019c0:	48 89 c1             	mov    %rax,%rcx
  4019c3:	f2 0f 11 74 24 20    	movsd  %xmm6,0x20(%rsp)
  4019c9:	e8 a2 10 00 00       	callq  402a70 <fprintf>
  4019ce:	90                   	nop
  4019cf:	0f 28 74 24 40       	movaps 0x40(%rsp),%xmm6
  4019d4:	31 c0                	xor    %eax,%eax
  4019d6:	0f 28 7c 24 50       	movaps 0x50(%rsp),%xmm7
  4019db:	44 0f 28 44 24 60    	movaps 0x60(%rsp),%xmm8
  4019e1:	48 83 c4 78          	add    $0x78,%rsp
  4019e5:	5b                   	pop    %rbx
  4019e6:	5e                   	pop    %rsi
  4019e7:	c3                   	retq   
  4019e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4019ef:	00 
  4019f0:	48 8d 1d c8 26 00 00 	lea    0x26c8(%rip),%rbx        # 4040bf <.rdata+0x1f>
  4019f7:	eb 8f                	jmp    401988 <_matherr+0x38>
  4019f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401a00:	48 8d 1d d9 26 00 00 	lea    0x26d9(%rip),%rbx        # 4040e0 <.rdata+0x40>
  401a07:	e9 7c ff ff ff       	jmpq   401988 <_matherr+0x38>
  401a0c:	0f 1f 40 00          	nopl   0x0(%rax)
  401a10:	48 8d 1d 39 27 00 00 	lea    0x2739(%rip),%rbx        # 404150 <.rdata+0xb0>
  401a17:	e9 6c ff ff ff       	jmpq   401988 <_matherr+0x38>
  401a1c:	0f 1f 40 00          	nopl   0x0(%rax)
  401a20:	48 8d 1d 01 27 00 00 	lea    0x2701(%rip),%rbx        # 404128 <.rdata+0x88>
  401a27:	e9 5c ff ff ff       	jmpq   401988 <_matherr+0x38>
  401a2c:	0f 1f 40 00          	nopl   0x0(%rax)
  401a30:	48 8d 1d c9 26 00 00 	lea    0x26c9(%rip),%rbx        # 404100 <.rdata+0x60>
  401a37:	e9 4c ff ff ff       	jmpq   401988 <_matherr+0x38>
  401a3c:	0f 1f 40 00          	nopl   0x0(%rax)
  401a40:	48 8d 1d 3f 27 00 00 	lea    0x273f(%rip),%rbx        # 404186 <.rdata+0xe6>
  401a47:	e9 3c ff ff ff       	jmpq   401988 <_matherr+0x38>
  401a4c:	90                   	nop
  401a4d:	90                   	nop
  401a4e:	90                   	nop
  401a4f:	90                   	nop

0000000000401a50 <_fpreset>:
  401a50:	db e3                	fninit 
  401a52:	c3                   	retq   
  401a53:	90                   	nop
  401a54:	90                   	nop
  401a55:	90                   	nop
  401a56:	90                   	nop
  401a57:	90                   	nop
  401a58:	90                   	nop
  401a59:	90                   	nop
  401a5a:	90                   	nop
  401a5b:	90                   	nop
  401a5c:	90                   	nop
  401a5d:	90                   	nop
  401a5e:	90                   	nop
  401a5f:	90                   	nop

0000000000401a60 <_decode_pointer>:
  401a60:	48 89 c8             	mov    %rcx,%rax
  401a63:	c3                   	retq   
  401a64:	66 90                	xchg   %ax,%ax
  401a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401a6d:	00 00 00 

0000000000401a70 <_encode_pointer>:
  401a70:	48 89 c8             	mov    %rcx,%rax
  401a73:	c3                   	retq   
  401a74:	90                   	nop
  401a75:	90                   	nop
  401a76:	90                   	nop
  401a77:	90                   	nop
  401a78:	90                   	nop
  401a79:	90                   	nop
  401a7a:	90                   	nop
  401a7b:	90                   	nop
  401a7c:	90                   	nop
  401a7d:	90                   	nop
  401a7e:	90                   	nop
  401a7f:	90                   	nop

0000000000401a80 <__write_memory.part.0>:
  401a80:	41 54                	push   %r12
  401a82:	55                   	push   %rbp
  401a83:	57                   	push   %rdi
  401a84:	56                   	push   %rsi
  401a85:	53                   	push   %rbx
  401a86:	48 83 ec 50          	sub    $0x50,%rsp
  401a8a:	48 63 35 93 5b 00 00 	movslq 0x5b93(%rip),%rsi        # 407624 <maxSections>
  401a91:	85 f6                	test   %esi,%esi
  401a93:	48 89 cb             	mov    %rcx,%rbx
  401a96:	48 89 d5             	mov    %rdx,%rbp
  401a99:	4c 89 c7             	mov    %r8,%rdi
  401a9c:	0f 8e 66 01 00 00    	jle    401c08 <__write_memory.part.0+0x188>
  401aa2:	48 8b 05 7f 5b 00 00 	mov    0x5b7f(%rip),%rax        # 407628 <the_secs>
  401aa9:	31 c9                	xor    %ecx,%ecx
  401aab:	48 83 c0 18          	add    $0x18,%rax
  401aaf:	90                   	nop
  401ab0:	48 8b 10             	mov    (%rax),%rdx
  401ab3:	48 39 d3             	cmp    %rdx,%rbx
  401ab6:	72 14                	jb     401acc <__write_memory.part.0+0x4c>
  401ab8:	4c 8b 40 08          	mov    0x8(%rax),%r8
  401abc:	45 8b 40 08          	mov    0x8(%r8),%r8d
  401ac0:	4c 01 c2             	add    %r8,%rdx
  401ac3:	48 39 d3             	cmp    %rdx,%rbx
  401ac6:	0f 82 89 00 00 00    	jb     401b55 <__write_memory.part.0+0xd5>
  401acc:	83 c1 01             	add    $0x1,%ecx
  401acf:	48 83 c0 28          	add    $0x28,%rax
  401ad3:	39 f1                	cmp    %esi,%ecx
  401ad5:	75 d9                	jne    401ab0 <__write_memory.part.0+0x30>
  401ad7:	48 89 d9             	mov    %rbx,%rcx
  401ada:	e8 41 0c 00 00       	callq  402720 <__mingw_GetSectionForAddress>
  401adf:	48 85 c0             	test   %rax,%rax
  401ae2:	49 89 c4             	mov    %rax,%r12
  401ae5:	0f 84 52 01 00 00    	je     401c3d <__write_memory.part.0+0x1bd>
  401aeb:	48 8b 05 36 5b 00 00 	mov    0x5b36(%rip),%rax        # 407628 <the_secs>
  401af2:	48 8d 34 b6          	lea    (%rsi,%rsi,4),%rsi
  401af6:	48 c1 e6 03          	shl    $0x3,%rsi
  401afa:	48 01 f0             	add    %rsi,%rax
  401afd:	4c 89 60 20          	mov    %r12,0x20(%rax)
  401b01:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  401b07:	e8 44 0d 00 00       	callq  402850 <_GetPEImageBase>
  401b0c:	41 8b 4c 24 0c       	mov    0xc(%r12),%ecx
  401b11:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  401b16:	41 b8 30 00 00 00    	mov    $0x30,%r8d
  401b1c:	48 01 c1             	add    %rax,%rcx
  401b1f:	48 8b 05 02 5b 00 00 	mov    0x5b02(%rip),%rax        # 407628 <the_secs>
  401b26:	48 89 4c 30 18       	mov    %rcx,0x18(%rax,%rsi,1)
  401b2b:	ff 15 5b 67 00 00    	callq  *0x675b(%rip)        # 40828c <__imp_VirtualQuery>
  401b31:	48 85 c0             	test   %rax,%rax
  401b34:	0f 84 e6 00 00 00    	je     401c20 <__write_memory.part.0+0x1a0>
  401b3a:	8b 44 24 44          	mov    0x44(%rsp),%eax
  401b3e:	8d 50 fc             	lea    -0x4(%rax),%edx
  401b41:	83 e2 fb             	and    $0xfffffffb,%edx
  401b44:	74 08                	je     401b4e <__write_memory.part.0+0xce>
  401b46:	83 e8 40             	sub    $0x40,%eax
  401b49:	83 e0 bf             	and    $0xffffffbf,%eax
  401b4c:	75 62                	jne    401bb0 <__write_memory.part.0+0x130>
  401b4e:	83 05 cf 5a 00 00 01 	addl   $0x1,0x5acf(%rip)        # 407624 <maxSections>
  401b55:	83 ff 08             	cmp    $0x8,%edi
  401b58:	73 29                	jae    401b83 <__write_memory.part.0+0x103>
  401b5a:	40 f6 c7 04          	test   $0x4,%dil
  401b5e:	0f 85 90 00 00 00    	jne    401bf4 <__write_memory.part.0+0x174>
  401b64:	85 ff                	test   %edi,%edi
  401b66:	74 10                	je     401b78 <__write_memory.part.0+0xf8>
  401b68:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401b6c:	40 f6 c7 02          	test   $0x2,%dil
  401b70:	88 03                	mov    %al,(%rbx)
  401b72:	0f 85 97 00 00 00    	jne    401c0f <__write_memory.part.0+0x18f>
  401b78:	48 83 c4 50          	add    $0x50,%rsp
  401b7c:	5b                   	pop    %rbx
  401b7d:	5e                   	pop    %rsi
  401b7e:	5f                   	pop    %rdi
  401b7f:	5d                   	pop    %rbp
  401b80:	41 5c                	pop    %r12
  401b82:	c3                   	retq   
  401b83:	89 f8                	mov    %edi,%eax
  401b85:	83 ef 01             	sub    $0x1,%edi
  401b88:	48 8b 54 05 f8       	mov    -0x8(%rbp,%rax,1),%rdx
  401b8d:	83 ff 08             	cmp    $0x8,%edi
  401b90:	48 89 54 03 f8       	mov    %rdx,-0x8(%rbx,%rax,1)
  401b95:	72 e1                	jb     401b78 <__write_memory.part.0+0xf8>
  401b97:	83 e7 f8             	and    $0xfffffff8,%edi
  401b9a:	31 c0                	xor    %eax,%eax
  401b9c:	89 c2                	mov    %eax,%edx
  401b9e:	83 c0 08             	add    $0x8,%eax
  401ba1:	48 8b 4c 15 00       	mov    0x0(%rbp,%rdx,1),%rcx
  401ba6:	39 f8                	cmp    %edi,%eax
  401ba8:	48 89 0c 13          	mov    %rcx,(%rbx,%rdx,1)
  401bac:	72 ee                	jb     401b9c <__write_memory.part.0+0x11c>
  401bae:	eb c8                	jmp    401b78 <__write_memory.part.0+0xf8>
  401bb0:	48 03 35 71 5a 00 00 	add    0x5a71(%rip),%rsi        # 407628 <the_secs>
  401bb7:	41 b8 40 00 00 00    	mov    $0x40,%r8d
  401bbd:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  401bc2:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  401bc7:	49 89 f1             	mov    %rsi,%r9
  401bca:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
  401bce:	48 89 56 10          	mov    %rdx,0x10(%rsi)
  401bd2:	ff 15 ac 66 00 00    	callq  *0x66ac(%rip)        # 408284 <__imp_VirtualProtect>
  401bd8:	85 c0                	test   %eax,%eax
  401bda:	0f 85 6e ff ff ff    	jne    401b4e <__write_memory.part.0+0xce>
  401be0:	ff 15 1e 66 00 00    	callq  *0x661e(%rip)        # 408204 <__imp_GetLastError>
  401be6:	48 8d 0d 6b 26 00 00 	lea    0x266b(%rip),%rcx        # 404258 <.rdata+0x78>
  401bed:	89 c2                	mov    %eax,%edx
  401bef:	e8 5c 10 00 00       	callq  402c50 <__report_error>
  401bf4:	8b 45 00             	mov    0x0(%rbp),%eax
  401bf7:	89 ff                	mov    %edi,%edi
  401bf9:	89 03                	mov    %eax,(%rbx)
  401bfb:	8b 44 3d fc          	mov    -0x4(%rbp,%rdi,1),%eax
  401bff:	89 44 3b fc          	mov    %eax,-0x4(%rbx,%rdi,1)
  401c03:	e9 70 ff ff ff       	jmpq   401b78 <__write_memory.part.0+0xf8>
  401c08:	31 f6                	xor    %esi,%esi
  401c0a:	e9 c8 fe ff ff       	jmpq   401ad7 <__write_memory.part.0+0x57>
  401c0f:	89 ff                	mov    %edi,%edi
  401c11:	0f b7 44 3d fe       	movzwl -0x2(%rbp,%rdi,1),%eax
  401c16:	66 89 44 3b fe       	mov    %ax,-0x2(%rbx,%rdi,1)
  401c1b:	e9 58 ff ff ff       	jmpq   401b78 <__write_memory.part.0+0xf8>
  401c20:	48 8b 05 01 5a 00 00 	mov    0x5a01(%rip),%rax        # 407628 <the_secs>
  401c27:	48 8d 0d f2 25 00 00 	lea    0x25f2(%rip),%rcx        # 404220 <.rdata+0x40>
  401c2e:	41 8b 54 24 08       	mov    0x8(%r12),%edx
  401c33:	4c 8b 44 30 18       	mov    0x18(%rax,%rsi,1),%r8
  401c38:	e8 13 10 00 00       	callq  402c50 <__report_error>
  401c3d:	48 8d 0d bc 25 00 00 	lea    0x25bc(%rip),%rcx        # 404200 <.rdata+0x20>
  401c44:	48 89 da             	mov    %rbx,%rdx
  401c47:	e8 04 10 00 00       	callq  402c50 <__report_error>
  401c4c:	90                   	nop
  401c4d:	0f 1f 00             	nopl   (%rax)

0000000000401c50 <_pei386_runtime_relocator>:
  401c50:	55                   	push   %rbp
  401c51:	41 57                	push   %r15
  401c53:	41 56                	push   %r14
  401c55:	41 55                	push   %r13
  401c57:	41 54                	push   %r12
  401c59:	57                   	push   %rdi
  401c5a:	56                   	push   %rsi
  401c5b:	53                   	push   %rbx
  401c5c:	48 83 ec 38          	sub    $0x38,%rsp
  401c60:	48 8d ac 24 80 00 00 	lea    0x80(%rsp),%rbp
  401c67:	00 
  401c68:	8b 1d b2 59 00 00    	mov    0x59b2(%rip),%ebx        # 407620 <was_init.95174>
  401c6e:	85 db                	test   %ebx,%ebx
  401c70:	74 11                	je     401c83 <_pei386_runtime_relocator+0x33>
  401c72:	48 8d 65 b8          	lea    -0x48(%rbp),%rsp
  401c76:	5b                   	pop    %rbx
  401c77:	5e                   	pop    %rsi
  401c78:	5f                   	pop    %rdi
  401c79:	41 5c                	pop    %r12
  401c7b:	41 5d                	pop    %r13
  401c7d:	41 5e                	pop    %r14
  401c7f:	41 5f                	pop    %r15
  401c81:	5d                   	pop    %rbp
  401c82:	c3                   	retq   
  401c83:	c7 05 93 59 00 00 01 	movl   $0x1,0x5993(%rip)        # 407620 <was_init.95174>
  401c8a:	00 00 00 
  401c8d:	e8 0e 0b 00 00       	callq  4027a0 <__mingw_GetSectionCount>
  401c92:	48 98                	cltq   
  401c94:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401c98:	48 8d 04 c5 1e 00 00 	lea    0x1e(,%rax,8),%rax
  401c9f:	00 
  401ca0:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401ca4:	e8 37 0d 00 00       	callq  4029e0 <___chkstk_ms>
  401ca9:	4c 8b 25 80 26 00 00 	mov    0x2680(%rip),%r12        # 404330 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
  401cb0:	c7 05 6a 59 00 00 00 	movl   $0x0,0x596a(%rip)        # 407624 <maxSections>
  401cb7:	00 00 00 
  401cba:	48 8b 35 7f 26 00 00 	mov    0x267f(%rip),%rsi        # 404340 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
  401cc1:	48 29 c4             	sub    %rax,%rsp
  401cc4:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  401cc9:	48 89 05 58 59 00 00 	mov    %rax,0x5958(%rip)        # 407628 <the_secs>
  401cd0:	4c 89 e0             	mov    %r12,%rax
  401cd3:	48 29 f0             	sub    %rsi,%rax
  401cd6:	48 83 f8 07          	cmp    $0x7,%rax
  401cda:	7e 96                	jle    401c72 <_pei386_runtime_relocator+0x22>
  401cdc:	48 83 f8 0b          	cmp    $0xb,%rax
  401ce0:	8b 16                	mov    (%rsi),%edx
  401ce2:	0f 8e c8 00 00 00    	jle    401db0 <_pei386_runtime_relocator+0x160>
  401ce8:	85 d2                	test   %edx,%edx
  401cea:	0f 84 a4 00 00 00    	je     401d94 <_pei386_runtime_relocator+0x144>
  401cf0:	4c 39 e6             	cmp    %r12,%rsi
  401cf3:	0f 83 79 ff ff ff    	jae    401c72 <_pei386_runtime_relocator+0x22>
  401cf9:	4c 8d 76 08          	lea    0x8(%rsi),%r14
  401cfd:	49 83 c4 07          	add    $0x7,%r12
  401d01:	4c 8b 2d 58 26 00 00 	mov    0x2658(%rip),%r13        # 404360 <.refptr.__image_base__>
  401d08:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
  401d0c:	4d 29 f4             	sub    %r14,%r12
  401d0f:	49 c1 ec 03          	shr    $0x3,%r12
  401d13:	4e 8d 64 e6 08       	lea    0x8(%rsi,%r12,8),%r12
  401d18:	eb 0a                	jmp    401d24 <_pei386_runtime_relocator+0xd4>
  401d1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401d20:	49 83 c6 08          	add    $0x8,%r14
  401d24:	8b 4e 04             	mov    0x4(%rsi),%ecx
  401d27:	41 b8 04 00 00 00    	mov    $0x4,%r8d
  401d2d:	48 89 fa             	mov    %rdi,%rdx
  401d30:	8b 06                	mov    (%rsi),%eax
  401d32:	4c 89 f6             	mov    %r14,%rsi
  401d35:	4c 01 e9             	add    %r13,%rcx
  401d38:	03 01                	add    (%rcx),%eax
  401d3a:	89 45 a8             	mov    %eax,-0x58(%rbp)
  401d3d:	e8 3e fd ff ff       	callq  401a80 <__write_memory.part.0>
  401d42:	4d 39 e6             	cmp    %r12,%r14
  401d45:	75 d9                	jne    401d20 <_pei386_runtime_relocator+0xd0>
  401d47:	8b 05 d7 58 00 00    	mov    0x58d7(%rip),%eax        # 407624 <maxSections>
  401d4d:	31 f6                	xor    %esi,%esi
  401d4f:	4c 8b 25 2e 65 00 00 	mov    0x652e(%rip),%r12        # 408284 <__imp_VirtualProtect>
  401d56:	85 c0                	test   %eax,%eax
  401d58:	0f 8e 14 ff ff ff    	jle    401c72 <_pei386_runtime_relocator+0x22>
  401d5e:	66 90                	xchg   %ax,%ax
  401d60:	48 8b 05 c1 58 00 00 	mov    0x58c1(%rip),%rax        # 407628 <the_secs>
  401d67:	48 01 f0             	add    %rsi,%rax
  401d6a:	44 8b 00             	mov    (%rax),%r8d
  401d6d:	45 85 c0             	test   %r8d,%r8d
  401d70:	74 0e                	je     401d80 <_pei386_runtime_relocator+0x130>
  401d72:	48 8b 50 10          	mov    0x10(%rax),%rdx
  401d76:	49 89 f9             	mov    %rdi,%r9
  401d79:	48 8b 48 08          	mov    0x8(%rax),%rcx
  401d7d:	41 ff d4             	callq  *%r12
  401d80:	83 c3 01             	add    $0x1,%ebx
  401d83:	48 83 c6 28          	add    $0x28,%rsi
  401d87:	3b 1d 97 58 00 00    	cmp    0x5897(%rip),%ebx        # 407624 <maxSections>
  401d8d:	7c d1                	jl     401d60 <_pei386_runtime_relocator+0x110>
  401d8f:	e9 de fe ff ff       	jmpq   401c72 <_pei386_runtime_relocator+0x22>
  401d94:	8b 4e 04             	mov    0x4(%rsi),%ecx
  401d97:	85 c9                	test   %ecx,%ecx
  401d99:	0f 85 51 ff ff ff    	jne    401cf0 <_pei386_runtime_relocator+0xa0>
  401d9f:	8b 56 08             	mov    0x8(%rsi),%edx
  401da2:	85 d2                	test   %edx,%edx
  401da4:	75 1d                	jne    401dc3 <_pei386_runtime_relocator+0x173>
  401da6:	8b 56 0c             	mov    0xc(%rsi),%edx
  401da9:	48 83 c6 0c          	add    $0xc,%rsi
  401dad:	0f 1f 00             	nopl   (%rax)
  401db0:	85 d2                	test   %edx,%edx
  401db2:	0f 85 38 ff ff ff    	jne    401cf0 <_pei386_runtime_relocator+0xa0>
  401db8:	8b 46 04             	mov    0x4(%rsi),%eax
  401dbb:	85 c0                	test   %eax,%eax
  401dbd:	0f 85 2d ff ff ff    	jne    401cf0 <_pei386_runtime_relocator+0xa0>
  401dc3:	8b 56 08             	mov    0x8(%rsi),%edx
  401dc6:	83 fa 01             	cmp    $0x1,%edx
  401dc9:	0f 85 2f 01 00 00    	jne    401efe <_pei386_runtime_relocator+0x2ae>
  401dcf:	4c 8b 2d 8a 25 00 00 	mov    0x258a(%rip),%r13        # 404360 <.refptr.__image_base__>
  401dd6:	48 83 c6 0c          	add    $0xc,%rsi
  401dda:	49 bf 00 00 00 00 ff 	movabs $0xffffffff00000000,%r15
  401de1:	ff ff ff 
  401de4:	4c 8d 75 a8          	lea    -0x58(%rbp),%r14
  401de8:	4c 39 e6             	cmp    %r12,%rsi
  401deb:	72 48                	jb     401e35 <_pei386_runtime_relocator+0x1e5>
  401ded:	e9 80 fe ff ff       	jmpq   401c72 <_pei386_runtime_relocator+0x22>
  401df2:	0f 86 b8 00 00 00    	jbe    401eb0 <_pei386_runtime_relocator+0x260>
  401df8:	83 fa 20             	cmp    $0x20,%edx
  401dfb:	0f 84 7f 00 00 00    	je     401e80 <_pei386_runtime_relocator+0x230>
  401e01:	83 fa 40             	cmp    $0x40,%edx
  401e04:	0f 85 e0 00 00 00    	jne    401eea <_pei386_runtime_relocator+0x29a>
  401e0a:	48 8b 11             	mov    (%rcx),%rdx
  401e0d:	41 b8 08 00 00 00    	mov    $0x8,%r8d
  401e13:	4c 89 f7             	mov    %r14,%rdi
  401e16:	48 29 c2             	sub    %rax,%rdx
  401e19:	4c 01 ca             	add    %r9,%rdx
  401e1c:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  401e20:	4c 89 f2             	mov    %r14,%rdx
  401e23:	e8 58 fc ff ff       	callq  401a80 <__write_memory.part.0>
  401e28:	48 83 c6 0c          	add    $0xc,%rsi
  401e2c:	4c 39 e6             	cmp    %r12,%rsi
  401e2f:	0f 83 12 ff ff ff    	jae    401d47 <_pei386_runtime_relocator+0xf7>
  401e35:	8b 4e 04             	mov    0x4(%rsi),%ecx
  401e38:	8b 06                	mov    (%rsi),%eax
  401e3a:	0f b6 56 08          	movzbl 0x8(%rsi),%edx
  401e3e:	4c 01 e9             	add    %r13,%rcx
  401e41:	4c 01 e8             	add    %r13,%rax
  401e44:	83 fa 10             	cmp    $0x10,%edx
  401e47:	4c 8b 08             	mov    (%rax),%r9
  401e4a:	75 a6                	jne    401df2 <_pei386_runtime_relocator+0x1a2>
  401e4c:	44 0f b7 01          	movzwl (%rcx),%r8d
  401e50:	4c 89 f2             	mov    %r14,%rdx
  401e53:	4c 89 f7             	mov    %r14,%rdi
  401e56:	4d 89 c2             	mov    %r8,%r10
  401e59:	49 81 ca 00 00 ff ff 	or     $0xffffffffffff0000,%r10
  401e60:	66 45 85 c0          	test   %r8w,%r8w
  401e64:	4d 0f 48 c2          	cmovs  %r10,%r8
  401e68:	49 29 c0             	sub    %rax,%r8
  401e6b:	4d 01 c8             	add    %r9,%r8
  401e6e:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
  401e72:	41 b8 02 00 00 00    	mov    $0x2,%r8d
  401e78:	e8 03 fc ff ff       	callq  401a80 <__write_memory.part.0>
  401e7d:	eb a9                	jmp    401e28 <_pei386_runtime_relocator+0x1d8>
  401e7f:	90                   	nop
  401e80:	8b 11                	mov    (%rcx),%edx
  401e82:	4c 89 f7             	mov    %r14,%rdi
  401e85:	49 89 d0             	mov    %rdx,%r8
  401e88:	4c 09 fa             	or     %r15,%rdx
  401e8b:	45 85 c0             	test   %r8d,%r8d
  401e8e:	49 0f 49 d0          	cmovns %r8,%rdx
  401e92:	41 b8 04 00 00 00    	mov    $0x4,%r8d
  401e98:	48 29 c2             	sub    %rax,%rdx
  401e9b:	4c 01 ca             	add    %r9,%rdx
  401e9e:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  401ea2:	4c 89 f2             	mov    %r14,%rdx
  401ea5:	e8 d6 fb ff ff       	callq  401a80 <__write_memory.part.0>
  401eaa:	e9 79 ff ff ff       	jmpq   401e28 <_pei386_runtime_relocator+0x1d8>
  401eaf:	90                   	nop
  401eb0:	83 fa 08             	cmp    $0x8,%edx
  401eb3:	75 35                	jne    401eea <_pei386_runtime_relocator+0x29a>
  401eb5:	44 0f b6 01          	movzbl (%rcx),%r8d
  401eb9:	4c 89 f2             	mov    %r14,%rdx
  401ebc:	4c 89 f7             	mov    %r14,%rdi
  401ebf:	4d 89 c2             	mov    %r8,%r10
  401ec2:	49 81 ca 00 ff ff ff 	or     $0xffffffffffffff00,%r10
  401ec9:	45 84 c0             	test   %r8b,%r8b
  401ecc:	4d 0f 48 c2          	cmovs  %r10,%r8
  401ed0:	49 29 c0             	sub    %rax,%r8
  401ed3:	4d 01 c8             	add    %r9,%r8
  401ed6:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
  401eda:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  401ee0:	e8 9b fb ff ff       	callq  401a80 <__write_memory.part.0>
  401ee5:	e9 3e ff ff ff       	jmpq   401e28 <_pei386_runtime_relocator+0x1d8>
  401eea:	48 8d 0d c7 23 00 00 	lea    0x23c7(%rip),%rcx        # 4042b8 <.rdata+0xd8>
  401ef1:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
  401ef8:	00 
  401ef9:	e8 52 0d 00 00       	callq  402c50 <__report_error>
  401efe:	48 8d 0d 7b 23 00 00 	lea    0x237b(%rip),%rcx        # 404280 <.rdata+0xa0>
  401f05:	e8 46 0d 00 00       	callq  402c50 <__report_error>
  401f0a:	90                   	nop
  401f0b:	90                   	nop
  401f0c:	90                   	nop
  401f0d:	90                   	nop
  401f0e:	90                   	nop
  401f0f:	90                   	nop

0000000000401f10 <__mingw_SEH_error_handler>:
  401f10:	48 83 ec 28          	sub    $0x28,%rsp
  401f14:	8b 01                	mov    (%rcx),%eax
  401f16:	3d 91 00 00 c0       	cmp    $0xc0000091,%eax
  401f1b:	77 63                	ja     401f80 <__mingw_SEH_error_handler+0x70>
  401f1d:	3d 8d 00 00 c0       	cmp    $0xc000008d,%eax
  401f22:	73 7b                	jae    401f9f <__mingw_SEH_error_handler+0x8f>
  401f24:	3d 08 00 00 c0       	cmp    $0xc0000008,%eax
  401f29:	0f 84 05 01 00 00    	je     402034 <__mingw_SEH_error_handler+0x124>
  401f2f:	0f 87 cb 00 00 00    	ja     402000 <__mingw_SEH_error_handler+0xf0>
  401f35:	3d 02 00 00 80       	cmp    $0x80000002,%eax
  401f3a:	0f 84 f4 00 00 00    	je     402034 <__mingw_SEH_error_handler+0x124>
  401f40:	3d 05 00 00 c0       	cmp    $0xc0000005,%eax
  401f45:	0f 85 c3 00 00 00    	jne    40200e <__mingw_SEH_error_handler+0xfe>
  401f4b:	31 d2                	xor    %edx,%edx
  401f4d:	b9 0b 00 00 00       	mov    $0xb,%ecx
  401f52:	e8 e1 0a 00 00       	callq  402a38 <signal>
  401f57:	48 83 f8 01          	cmp    $0x1,%rax
  401f5b:	0f 84 2f 01 00 00    	je     402090 <__mingw_SEH_error_handler+0x180>
  401f61:	48 85 c0             	test   %rax,%rax
  401f64:	0f 84 3c 01 00 00    	je     4020a6 <__mingw_SEH_error_handler+0x196>
  401f6a:	b9 0b 00 00 00       	mov    $0xb,%ecx
  401f6f:	ff d0                	callq  *%rax
  401f71:	31 c0                	xor    %eax,%eax
  401f73:	48 83 c4 28          	add    $0x28,%rsp
  401f77:	c3                   	retq   
  401f78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401f7f:	00 
  401f80:	3d 94 00 00 c0       	cmp    $0xc0000094,%eax
  401f85:	0f 84 b5 00 00 00    	je     402040 <__mingw_SEH_error_handler+0x130>
  401f8b:	77 37                	ja     401fc4 <__mingw_SEH_error_handler+0xb4>
  401f8d:	3d 92 00 00 c0       	cmp    $0xc0000092,%eax
  401f92:	0f 84 9c 00 00 00    	je     402034 <__mingw_SEH_error_handler+0x124>
  401f98:	3d 93 00 00 c0       	cmp    $0xc0000093,%eax
  401f9d:	75 6f                	jne    40200e <__mingw_SEH_error_handler+0xfe>
  401f9f:	31 d2                	xor    %edx,%edx
  401fa1:	b9 08 00 00 00       	mov    $0x8,%ecx
  401fa6:	e8 8d 0a 00 00       	callq  402a38 <signal>
  401fab:	48 83 f8 01          	cmp    $0x1,%rax
  401faf:	74 6f                	je     402020 <__mingw_SEH_error_handler+0x110>
  401fb1:	48 85 c0             	test   %rax,%rax
  401fb4:	74 58                	je     40200e <__mingw_SEH_error_handler+0xfe>
  401fb6:	b9 08 00 00 00       	mov    $0x8,%ecx
  401fbb:	ff d0                	callq  *%rax
  401fbd:	31 c0                	xor    %eax,%eax
  401fbf:	48 83 c4 28          	add    $0x28,%rsp
  401fc3:	c3                   	retq   
  401fc4:	3d 95 00 00 c0       	cmp    $0xc0000095,%eax
  401fc9:	74 69                	je     402034 <__mingw_SEH_error_handler+0x124>
  401fcb:	3d 96 00 00 c0       	cmp    $0xc0000096,%eax
  401fd0:	75 3c                	jne    40200e <__mingw_SEH_error_handler+0xfe>
  401fd2:	31 d2                	xor    %edx,%edx
  401fd4:	b9 04 00 00 00       	mov    $0x4,%ecx
  401fd9:	e8 5a 0a 00 00       	callq  402a38 <signal>
  401fde:	48 83 f8 01          	cmp    $0x1,%rax
  401fe2:	0f 84 88 00 00 00    	je     402070 <__mingw_SEH_error_handler+0x160>
  401fe8:	48 85 c0             	test   %rax,%rax
  401feb:	0f 84 b5 00 00 00    	je     4020a6 <__mingw_SEH_error_handler+0x196>
  401ff1:	b9 04 00 00 00       	mov    $0x4,%ecx
  401ff6:	ff d0                	callq  *%rax
  401ff8:	31 c0                	xor    %eax,%eax
  401ffa:	48 83 c4 28          	add    $0x28,%rsp
  401ffe:	c3                   	retq   
  401fff:	90                   	nop
  402000:	3d 1d 00 00 c0       	cmp    $0xc000001d,%eax
  402005:	74 cb                	je     401fd2 <__mingw_SEH_error_handler+0xc2>
  402007:	3d 8c 00 00 c0       	cmp    $0xc000008c,%eax
  40200c:	74 26                	je     402034 <__mingw_SEH_error_handler+0x124>
  40200e:	b8 01 00 00 00       	mov    $0x1,%eax
  402013:	48 83 c4 28          	add    $0x28,%rsp
  402017:	c3                   	retq   
  402018:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40201f:	00 
  402020:	ba 01 00 00 00       	mov    $0x1,%edx
  402025:	b9 08 00 00 00       	mov    $0x8,%ecx
  40202a:	e8 09 0a 00 00       	callq  402a38 <signal>
  40202f:	e8 1c fa ff ff       	callq  401a50 <_fpreset>
  402034:	31 c0                	xor    %eax,%eax
  402036:	48 83 c4 28          	add    $0x28,%rsp
  40203a:	c3                   	retq   
  40203b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402040:	31 d2                	xor    %edx,%edx
  402042:	b9 08 00 00 00       	mov    $0x8,%ecx
  402047:	e8 ec 09 00 00       	callq  402a38 <signal>
  40204c:	48 83 f8 01          	cmp    $0x1,%rax
  402050:	0f 85 5b ff ff ff    	jne    401fb1 <__mingw_SEH_error_handler+0xa1>
  402056:	ba 01 00 00 00       	mov    $0x1,%edx
  40205b:	b9 08 00 00 00       	mov    $0x8,%ecx
  402060:	e8 d3 09 00 00       	callq  402a38 <signal>
  402065:	31 c0                	xor    %eax,%eax
  402067:	e9 07 ff ff ff       	jmpq   401f73 <__mingw_SEH_error_handler+0x63>
  40206c:	0f 1f 40 00          	nopl   0x0(%rax)
  402070:	ba 01 00 00 00       	mov    $0x1,%edx
  402075:	b9 04 00 00 00       	mov    $0x4,%ecx
  40207a:	e8 b9 09 00 00       	callq  402a38 <signal>
  40207f:	31 c0                	xor    %eax,%eax
  402081:	e9 ed fe ff ff       	jmpq   401f73 <__mingw_SEH_error_handler+0x63>
  402086:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40208d:	00 00 00 
  402090:	ba 01 00 00 00       	mov    $0x1,%edx
  402095:	b9 0b 00 00 00       	mov    $0xb,%ecx
  40209a:	e8 99 09 00 00       	callq  402a38 <signal>
  40209f:	31 c0                	xor    %eax,%eax
  4020a1:	e9 cd fe ff ff       	jmpq   401f73 <__mingw_SEH_error_handler+0x63>
  4020a6:	b8 04 00 00 00       	mov    $0x4,%eax
  4020ab:	e9 c3 fe ff ff       	jmpq   401f73 <__mingw_SEH_error_handler+0x63>

00000000004020b0 <__mingw_init_ehandler>:
  4020b0:	41 54                	push   %r12
  4020b2:	55                   	push   %rbp
  4020b3:	57                   	push   %rdi
  4020b4:	56                   	push   %rsi
  4020b5:	53                   	push   %rbx
  4020b6:	48 83 ec 20          	sub    $0x20,%rsp
  4020ba:	e8 91 07 00 00       	callq  402850 <_GetPEImageBase>
  4020bf:	48 89 c5             	mov    %rax,%rbp
  4020c2:	8b 05 80 55 00 00    	mov    0x5580(%rip),%eax        # 407648 <was_here.95013>
  4020c8:	85 c0                	test   %eax,%eax
  4020ca:	75 25                	jne    4020f1 <__mingw_init_ehandler+0x41>
  4020cc:	48 85 ed             	test   %rbp,%rbp
  4020cf:	74 20                	je     4020f1 <__mingw_init_ehandler+0x41>
  4020d1:	48 8d 0d 18 22 00 00 	lea    0x2218(%rip),%rcx        # 4042f0 <.rdata>
  4020d8:	c7 05 66 55 00 00 01 	movl   $0x1,0x5566(%rip)        # 407648 <was_here.95013>
  4020df:	00 00 00 
  4020e2:	e8 a9 05 00 00       	callq  402690 <_FindPESectionByName>
  4020e7:	48 85 c0             	test   %rax,%rax
  4020ea:	74 14                	je     402100 <__mingw_init_ehandler+0x50>
  4020ec:	b8 01 00 00 00       	mov    $0x1,%eax
  4020f1:	48 83 c4 20          	add    $0x20,%rsp
  4020f5:	5b                   	pop    %rbx
  4020f6:	5e                   	pop    %rsi
  4020f7:	5f                   	pop    %rdi
  4020f8:	5d                   	pop    %rbp
  4020f9:	41 5c                	pop    %r12
  4020fb:	c3                   	retq   
  4020fc:	0f 1f 40 00          	nopl   0x0(%rax)
  402100:	48 8d 1d 59 56 00 00 	lea    0x5659(%rip),%rbx        # 407760 <emu_pdata>
  402107:	b9 30 00 00 00       	mov    $0x30,%ecx
  40210c:	31 f6                	xor    %esi,%esi
  40210e:	48 8d 15 4b 55 00 00 	lea    0x554b(%rip),%rdx        # 407660 <emu_xdata>
  402115:	48 89 df             	mov    %rbx,%rdi
  402118:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40211b:	4c 8d 25 ee fd ff ff 	lea    -0x212(%rip),%r12        # 401f10 <__mingw_SEH_error_handler>
  402122:	b9 20 00 00 00       	mov    $0x20,%ecx
  402127:	48 89 d7             	mov    %rdx,%rdi
  40212a:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40212d:	49 29 ec             	sub    %rbp,%r12
  402130:	48 89 d7             	mov    %rdx,%rdi
  402133:	eb 2e                	jmp    402163 <__mingw_init_ehandler+0xb3>
  402135:	c6 07 09             	movb   $0x9,(%rdi)
  402138:	48 83 c6 01          	add    $0x1,%rsi
  40213c:	48 83 c3 0c          	add    $0xc,%rbx
  402140:	44 89 67 04          	mov    %r12d,0x4(%rdi)
  402144:	8b 48 0c             	mov    0xc(%rax),%ecx
  402147:	89 4b f4             	mov    %ecx,-0xc(%rbx)
  40214a:	03 48 08             	add    0x8(%rax),%ecx
  40214d:	48 89 f8             	mov    %rdi,%rax
  402150:	48 83 c7 08          	add    $0x8,%rdi
  402154:	48 29 e8             	sub    %rbp,%rax
  402157:	89 43 fc             	mov    %eax,-0x4(%rbx)
  40215a:	89 4b f8             	mov    %ecx,-0x8(%rbx)
  40215d:	48 83 fe 20          	cmp    $0x20,%rsi
  402161:	74 32                	je     402195 <__mingw_init_ehandler+0xe5>
  402163:	48 89 f1             	mov    %rsi,%rcx
  402166:	e8 75 06 00 00       	callq  4027e0 <_FindPESectionExec>
  40216b:	48 85 c0             	test   %rax,%rax
  40216e:	75 c5                	jne    402135 <__mingw_init_ehandler+0x85>
  402170:	48 85 f6             	test   %rsi,%rsi
  402173:	89 f2                	mov    %esi,%edx
  402175:	0f 84 71 ff ff ff    	je     4020ec <__mingw_init_ehandler+0x3c>
  40217b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402180:	48 8d 0d d9 55 00 00 	lea    0x55d9(%rip),%rcx        # 407760 <emu_pdata>
  402187:	49 89 e8             	mov    %rbp,%r8
  40218a:	ff 15 ac 60 00 00    	callq  *0x60ac(%rip)        # 40823c <__imp_RtlAddFunctionTable>
  402190:	e9 57 ff ff ff       	jmpq   4020ec <__mingw_init_ehandler+0x3c>
  402195:	ba 20 00 00 00       	mov    $0x20,%edx
  40219a:	eb e4                	jmp    402180 <__mingw_init_ehandler+0xd0>
  40219c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004021a0 <_gnu_exception_handler>:
  4021a0:	53                   	push   %rbx
  4021a1:	48 83 ec 20          	sub    $0x20,%rsp
  4021a5:	48 8b 11             	mov    (%rcx),%rdx
  4021a8:	8b 02                	mov    (%rdx),%eax
  4021aa:	48 89 cb             	mov    %rcx,%rbx
  4021ad:	89 c1                	mov    %eax,%ecx
  4021af:	81 e1 ff ff ff 20    	and    $0x20ffffff,%ecx
  4021b5:	81 f9 43 43 47 20    	cmp    $0x20474343,%ecx
  4021bb:	0f 84 bf 00 00 00    	je     402280 <_gnu_exception_handler+0xe0>
  4021c1:	3d 91 00 00 c0       	cmp    $0xc0000091,%eax
  4021c6:	77 68                	ja     402230 <_gnu_exception_handler+0x90>
  4021c8:	3d 8d 00 00 c0       	cmp    $0xc000008d,%eax
  4021cd:	73 7c                	jae    40224b <_gnu_exception_handler+0xab>
  4021cf:	3d 08 00 00 c0       	cmp    $0xc0000008,%eax
  4021d4:	0f 84 b0 00 00 00    	je     40228a <_gnu_exception_handler+0xea>
  4021da:	0f 87 f4 00 00 00    	ja     4022d4 <_gnu_exception_handler+0x134>
  4021e0:	3d 02 00 00 80       	cmp    $0x80000002,%eax
  4021e5:	0f 84 9f 00 00 00    	je     40228a <_gnu_exception_handler+0xea>
  4021eb:	3d 05 00 00 c0       	cmp    $0xc0000005,%eax
  4021f0:	75 1f                	jne    402211 <_gnu_exception_handler+0x71>
  4021f2:	31 d2                	xor    %edx,%edx
  4021f4:	b9 0b 00 00 00       	mov    $0xb,%ecx
  4021f9:	e8 3a 08 00 00       	callq  402a38 <signal>
  4021fe:	48 83 f8 01          	cmp    $0x1,%rax
  402202:	0f 84 51 01 00 00    	je     402359 <_gnu_exception_handler+0x1b9>
  402208:	48 85 c0             	test   %rax,%rax
  40220b:	0f 85 0f 01 00 00    	jne    402320 <_gnu_exception_handler+0x180>
  402211:	48 8b 05 28 54 00 00 	mov    0x5428(%rip),%rax        # 407640 <__mingw_oldexcpt_handler>
  402218:	48 85 c0             	test   %rax,%rax
  40221b:	0f 84 10 01 00 00    	je     402331 <_gnu_exception_handler+0x191>
  402221:	48 89 d9             	mov    %rbx,%rcx
  402224:	48 83 c4 20          	add    $0x20,%rsp
  402228:	5b                   	pop    %rbx
  402229:	48 ff e0             	rex.W jmpq *%rax
  40222c:	0f 1f 40 00          	nopl   0x0(%rax)
  402230:	3d 94 00 00 c0       	cmp    $0xc0000094,%eax
  402235:	0f 84 b5 00 00 00    	je     4022f0 <_gnu_exception_handler+0x150>
  40223b:	77 58                	ja     402295 <_gnu_exception_handler+0xf5>
  40223d:	3d 92 00 00 c0       	cmp    $0xc0000092,%eax
  402242:	74 46                	je     40228a <_gnu_exception_handler+0xea>
  402244:	3d 93 00 00 c0       	cmp    $0xc0000093,%eax
  402249:	75 c6                	jne    402211 <_gnu_exception_handler+0x71>
  40224b:	31 d2                	xor    %edx,%edx
  40224d:	b9 08 00 00 00       	mov    $0x8,%ecx
  402252:	e8 e1 07 00 00       	callq  402a38 <signal>
  402257:	48 83 f8 01          	cmp    $0x1,%rax
  40225b:	0f 84 df 00 00 00    	je     402340 <_gnu_exception_handler+0x1a0>
  402261:	48 85 c0             	test   %rax,%rax
  402264:	74 ab                	je     402211 <_gnu_exception_handler+0x71>
  402266:	b9 08 00 00 00       	mov    $0x8,%ecx
  40226b:	ff d0                	callq  *%rax
  40226d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402272:	48 83 c4 20          	add    $0x20,%rsp
  402276:	5b                   	pop    %rbx
  402277:	c3                   	retq   
  402278:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40227f:	00 
  402280:	f6 42 04 01          	testb  $0x1,0x4(%rdx)
  402284:	0f 85 37 ff ff ff    	jne    4021c1 <_gnu_exception_handler+0x21>
  40228a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40228f:	48 83 c4 20          	add    $0x20,%rsp
  402293:	5b                   	pop    %rbx
  402294:	c3                   	retq   
  402295:	3d 95 00 00 c0       	cmp    $0xc0000095,%eax
  40229a:	74 ee                	je     40228a <_gnu_exception_handler+0xea>
  40229c:	3d 96 00 00 c0       	cmp    $0xc0000096,%eax
  4022a1:	0f 85 6a ff ff ff    	jne    402211 <_gnu_exception_handler+0x71>
  4022a7:	31 d2                	xor    %edx,%edx
  4022a9:	b9 04 00 00 00       	mov    $0x4,%ecx
  4022ae:	e8 85 07 00 00       	callq  402a38 <signal>
  4022b3:	48 83 f8 01          	cmp    $0x1,%rax
  4022b7:	0f 84 b3 00 00 00    	je     402370 <_gnu_exception_handler+0x1d0>
  4022bd:	48 85 c0             	test   %rax,%rax
  4022c0:	0f 84 4b ff ff ff    	je     402211 <_gnu_exception_handler+0x71>
  4022c6:	b9 04 00 00 00       	mov    $0x4,%ecx
  4022cb:	ff d0                	callq  *%rax
  4022cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022d2:	eb 9e                	jmp    402272 <_gnu_exception_handler+0xd2>
  4022d4:	3d 1d 00 00 c0       	cmp    $0xc000001d,%eax
  4022d9:	74 cc                	je     4022a7 <_gnu_exception_handler+0x107>
  4022db:	3d 8c 00 00 c0       	cmp    $0xc000008c,%eax
  4022e0:	0f 85 2b ff ff ff    	jne    402211 <_gnu_exception_handler+0x71>
  4022e6:	eb a2                	jmp    40228a <_gnu_exception_handler+0xea>
  4022e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4022ef:	00 
  4022f0:	31 d2                	xor    %edx,%edx
  4022f2:	b9 08 00 00 00       	mov    $0x8,%ecx
  4022f7:	e8 3c 07 00 00       	callq  402a38 <signal>
  4022fc:	48 83 f8 01          	cmp    $0x1,%rax
  402300:	0f 85 5b ff ff ff    	jne    402261 <_gnu_exception_handler+0xc1>
  402306:	ba 01 00 00 00       	mov    $0x1,%edx
  40230b:	b9 08 00 00 00       	mov    $0x8,%ecx
  402310:	e8 23 07 00 00       	callq  402a38 <signal>
  402315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40231a:	e9 53 ff ff ff       	jmpq   402272 <_gnu_exception_handler+0xd2>
  40231f:	90                   	nop
  402320:	b9 0b 00 00 00       	mov    $0xb,%ecx
  402325:	ff d0                	callq  *%rax
  402327:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40232c:	e9 41 ff ff ff       	jmpq   402272 <_gnu_exception_handler+0xd2>
  402331:	31 c0                	xor    %eax,%eax
  402333:	e9 3a ff ff ff       	jmpq   402272 <_gnu_exception_handler+0xd2>
  402338:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40233f:	00 
  402340:	ba 01 00 00 00       	mov    $0x1,%edx
  402345:	b9 08 00 00 00       	mov    $0x8,%ecx
  40234a:	e8 e9 06 00 00       	callq  402a38 <signal>
  40234f:	e8 fc f6 ff ff       	callq  401a50 <_fpreset>
  402354:	e9 31 ff ff ff       	jmpq   40228a <_gnu_exception_handler+0xea>
  402359:	ba 01 00 00 00       	mov    $0x1,%edx
  40235e:	b9 0b 00 00 00       	mov    $0xb,%ecx
  402363:	e8 d0 06 00 00       	callq  402a38 <signal>
  402368:	83 c8 ff             	or     $0xffffffff,%eax
  40236b:	e9 02 ff ff ff       	jmpq   402272 <_gnu_exception_handler+0xd2>
  402370:	ba 01 00 00 00       	mov    $0x1,%edx
  402375:	b9 04 00 00 00       	mov    $0x4,%ecx
  40237a:	e8 b9 06 00 00       	callq  402a38 <signal>
  40237f:	83 c8 ff             	or     $0xffffffff,%eax
  402382:	e9 eb fe ff ff       	jmpq   402272 <_gnu_exception_handler+0xd2>
  402387:	90                   	nop
  402388:	90                   	nop
  402389:	90                   	nop
  40238a:	90                   	nop
  40238b:	90                   	nop
  40238c:	90                   	nop
  40238d:	90                   	nop
  40238e:	90                   	nop
  40238f:	90                   	nop

0000000000402390 <__mingwthr_run_key_dtors.part.0>:
  402390:	55                   	push   %rbp
  402391:	57                   	push   %rdi
  402392:	56                   	push   %rsi
  402393:	53                   	push   %rbx
  402394:	48 83 ec 28          	sub    $0x28,%rsp
  402398:	48 8d 0d 61 55 00 00 	lea    0x5561(%rip),%rcx        # 407900 <__mingwthr_cs>
  40239f:	ff 15 3f 5e 00 00    	callq  *0x5e3f(%rip)        # 4081e4 <__imp_EnterCriticalSection>
  4023a5:	48 8b 1d 34 55 00 00 	mov    0x5534(%rip),%rbx        # 4078e0 <key_dtor_list>
  4023ac:	48 85 db             	test   %rbx,%rbx
  4023af:	74 33                	je     4023e4 <__mingwthr_run_key_dtors.part.0+0x54>
  4023b1:	48 8b 2d bc 5e 00 00 	mov    0x5ebc(%rip),%rbp        # 408274 <__imp_TlsGetValue>
  4023b8:	48 8b 3d 45 5e 00 00 	mov    0x5e45(%rip),%rdi        # 408204 <__imp_GetLastError>
  4023bf:	90                   	nop
  4023c0:	8b 0b                	mov    (%rbx),%ecx
  4023c2:	ff d5                	callq  *%rbp
  4023c4:	48 89 c6             	mov    %rax,%rsi
  4023c7:	ff d7                	callq  *%rdi
  4023c9:	85 c0                	test   %eax,%eax
  4023cb:	75 0e                	jne    4023db <__mingwthr_run_key_dtors.part.0+0x4b>
  4023cd:	48 85 f6             	test   %rsi,%rsi
  4023d0:	74 09                	je     4023db <__mingwthr_run_key_dtors.part.0+0x4b>
  4023d2:	48 8b 43 08          	mov    0x8(%rbx),%rax
  4023d6:	48 89 f1             	mov    %rsi,%rcx
  4023d9:	ff d0                	callq  *%rax
  4023db:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
  4023df:	48 85 db             	test   %rbx,%rbx
  4023e2:	75 dc                	jne    4023c0 <__mingwthr_run_key_dtors.part.0+0x30>
  4023e4:	48 8d 0d 15 55 00 00 	lea    0x5515(%rip),%rcx        # 407900 <__mingwthr_cs>
  4023eb:	48 83 c4 28          	add    $0x28,%rsp
  4023ef:	5b                   	pop    %rbx
  4023f0:	5e                   	pop    %rsi
  4023f1:	5f                   	pop    %rdi
  4023f2:	5d                   	pop    %rbp
  4023f3:	48 ff 25 32 5e 00 00 	rex.W jmpq *0x5e32(%rip)        # 40822c <__imp_LeaveCriticalSection>
  4023fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000402400 <___w64_mingwthr_add_key_dtor>:
  402400:	55                   	push   %rbp
  402401:	57                   	push   %rdi
  402402:	56                   	push   %rsi
  402403:	53                   	push   %rbx
  402404:	48 83 ec 28          	sub    $0x28,%rsp
  402408:	8b 05 da 54 00 00    	mov    0x54da(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  40240e:	31 f6                	xor    %esi,%esi
  402410:	85 c0                	test   %eax,%eax
  402412:	89 cd                	mov    %ecx,%ebp
  402414:	48 89 d7             	mov    %rdx,%rdi
  402417:	75 0b                	jne    402424 <___w64_mingwthr_add_key_dtor+0x24>
  402419:	89 f0                	mov    %esi,%eax
  40241b:	48 83 c4 28          	add    $0x28,%rsp
  40241f:	5b                   	pop    %rbx
  402420:	5e                   	pop    %rsi
  402421:	5f                   	pop    %rdi
  402422:	5d                   	pop    %rbp
  402423:	c3                   	retq   
  402424:	ba 18 00 00 00       	mov    $0x18,%edx
  402429:	b9 01 00 00 00       	mov    $0x1,%ecx
  40242e:	e8 4d 06 00 00       	callq  402a80 <calloc>
  402433:	48 85 c0             	test   %rax,%rax
  402436:	48 89 c3             	mov    %rax,%rbx
  402439:	74 3d                	je     402478 <___w64_mingwthr_add_key_dtor+0x78>
  40243b:	89 28                	mov    %ebp,(%rax)
  40243d:	48 8d 0d bc 54 00 00 	lea    0x54bc(%rip),%rcx        # 407900 <__mingwthr_cs>
  402444:	48 89 78 08          	mov    %rdi,0x8(%rax)
  402448:	ff 15 96 5d 00 00    	callq  *0x5d96(%rip)        # 4081e4 <__imp_EnterCriticalSection>
  40244e:	48 8b 05 8b 54 00 00 	mov    0x548b(%rip),%rax        # 4078e0 <key_dtor_list>
  402455:	48 8d 0d a4 54 00 00 	lea    0x54a4(%rip),%rcx        # 407900 <__mingwthr_cs>
  40245c:	48 89 1d 7d 54 00 00 	mov    %rbx,0x547d(%rip)        # 4078e0 <key_dtor_list>
  402463:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402467:	ff 15 bf 5d 00 00    	callq  *0x5dbf(%rip)        # 40822c <__imp_LeaveCriticalSection>
  40246d:	89 f0                	mov    %esi,%eax
  40246f:	48 83 c4 28          	add    $0x28,%rsp
  402473:	5b                   	pop    %rbx
  402474:	5e                   	pop    %rsi
  402475:	5f                   	pop    %rdi
  402476:	5d                   	pop    %rbp
  402477:	c3                   	retq   
  402478:	be ff ff ff ff       	mov    $0xffffffff,%esi
  40247d:	eb 9a                	jmp    402419 <___w64_mingwthr_add_key_dtor+0x19>
  40247f:	90                   	nop

0000000000402480 <___w64_mingwthr_remove_key_dtor>:
  402480:	53                   	push   %rbx
  402481:	48 83 ec 20          	sub    $0x20,%rsp
  402485:	8b 05 5d 54 00 00    	mov    0x545d(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  40248b:	85 c0                	test   %eax,%eax
  40248d:	89 cb                	mov    %ecx,%ebx
  40248f:	75 0f                	jne    4024a0 <___w64_mingwthr_remove_key_dtor+0x20>
  402491:	31 c0                	xor    %eax,%eax
  402493:	48 83 c4 20          	add    $0x20,%rsp
  402497:	5b                   	pop    %rbx
  402498:	c3                   	retq   
  402499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4024a0:	48 8d 0d 59 54 00 00 	lea    0x5459(%rip),%rcx        # 407900 <__mingwthr_cs>
  4024a7:	ff 15 37 5d 00 00    	callq  *0x5d37(%rip)        # 4081e4 <__imp_EnterCriticalSection>
  4024ad:	48 8b 05 2c 54 00 00 	mov    0x542c(%rip),%rax        # 4078e0 <key_dtor_list>
  4024b4:	48 85 c0             	test   %rax,%rax
  4024b7:	74 1a                	je     4024d3 <___w64_mingwthr_remove_key_dtor+0x53>
  4024b9:	8b 10                	mov    (%rax),%edx
  4024bb:	39 d3                	cmp    %edx,%ebx
  4024bd:	75 0b                	jne    4024ca <___w64_mingwthr_remove_key_dtor+0x4a>
  4024bf:	eb 4f                	jmp    402510 <___w64_mingwthr_remove_key_dtor+0x90>
  4024c1:	8b 11                	mov    (%rcx),%edx
  4024c3:	39 da                	cmp    %ebx,%edx
  4024c5:	74 29                	je     4024f0 <___w64_mingwthr_remove_key_dtor+0x70>
  4024c7:	48 89 c8             	mov    %rcx,%rax
  4024ca:	48 8b 48 10          	mov    0x10(%rax),%rcx
  4024ce:	48 85 c9             	test   %rcx,%rcx
  4024d1:	75 ee                	jne    4024c1 <___w64_mingwthr_remove_key_dtor+0x41>
  4024d3:	48 8d 0d 26 54 00 00 	lea    0x5426(%rip),%rcx        # 407900 <__mingwthr_cs>
  4024da:	ff 15 4c 5d 00 00    	callq  *0x5d4c(%rip)        # 40822c <__imp_LeaveCriticalSection>
  4024e0:	31 c0                	xor    %eax,%eax
  4024e2:	48 83 c4 20          	add    $0x20,%rsp
  4024e6:	5b                   	pop    %rbx
  4024e7:	c3                   	retq   
  4024e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4024ef:	00 
  4024f0:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  4024f4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  4024f8:	e8 6b 05 00 00       	callq  402a68 <free>
  4024fd:	48 8d 0d fc 53 00 00 	lea    0x53fc(%rip),%rcx        # 407900 <__mingwthr_cs>
  402504:	ff 15 22 5d 00 00    	callq  *0x5d22(%rip)        # 40822c <__imp_LeaveCriticalSection>
  40250a:	eb d4                	jmp    4024e0 <___w64_mingwthr_remove_key_dtor+0x60>
  40250c:	0f 1f 40 00          	nopl   0x0(%rax)
  402510:	48 8b 50 10          	mov    0x10(%rax),%rdx
  402514:	48 89 c1             	mov    %rax,%rcx
  402517:	48 89 15 c2 53 00 00 	mov    %rdx,0x53c2(%rip)        # 4078e0 <key_dtor_list>
  40251e:	eb d8                	jmp    4024f8 <___w64_mingwthr_remove_key_dtor+0x78>

0000000000402520 <__mingw_TLScallback>:
  402520:	53                   	push   %rbx
  402521:	48 83 ec 20          	sub    $0x20,%rsp
  402525:	83 fa 01             	cmp    $0x1,%edx
  402528:	0f 84 92 00 00 00    	je     4025c0 <__mingw_TLScallback+0xa0>
  40252e:	72 30                	jb     402560 <__mingw_TLScallback+0x40>
  402530:	83 fa 02             	cmp    $0x2,%edx
  402533:	74 1b                	je     402550 <__mingw_TLScallback+0x30>
  402535:	83 fa 03             	cmp    $0x3,%edx
  402538:	75 1b                	jne    402555 <__mingw_TLScallback+0x35>
  40253a:	8b 05 a8 53 00 00    	mov    0x53a8(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  402540:	85 c0                	test   %eax,%eax
  402542:	74 11                	je     402555 <__mingw_TLScallback+0x35>
  402544:	e8 47 fe ff ff       	callq  402390 <__mingwthr_run_key_dtors.part.0>
  402549:	eb 0a                	jmp    402555 <__mingw_TLScallback+0x35>
  40254b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402550:	e8 fb f4 ff ff       	callq  401a50 <_fpreset>
  402555:	b8 01 00 00 00       	mov    $0x1,%eax
  40255a:	48 83 c4 20          	add    $0x20,%rsp
  40255e:	5b                   	pop    %rbx
  40255f:	c3                   	retq   
  402560:	8b 05 82 53 00 00    	mov    0x5382(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  402566:	85 c0                	test   %eax,%eax
  402568:	0f 85 82 00 00 00    	jne    4025f0 <__mingw_TLScallback+0xd0>
  40256e:	8b 05 74 53 00 00    	mov    0x5374(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  402574:	83 f8 01             	cmp    $0x1,%eax
  402577:	75 dc                	jne    402555 <__mingw_TLScallback+0x35>
  402579:	48 8b 0d 60 53 00 00 	mov    0x5360(%rip),%rcx        # 4078e0 <key_dtor_list>
  402580:	48 85 c9             	test   %rcx,%rcx
  402583:	74 11                	je     402596 <__mingw_TLScallback+0x76>
  402585:	48 8b 59 10          	mov    0x10(%rcx),%rbx
  402589:	e8 da 04 00 00       	callq  402a68 <free>
  40258e:	48 85 db             	test   %rbx,%rbx
  402591:	48 89 d9             	mov    %rbx,%rcx
  402594:	75 ef                	jne    402585 <__mingw_TLScallback+0x65>
  402596:	48 8d 0d 63 53 00 00 	lea    0x5363(%rip),%rcx        # 407900 <__mingwthr_cs>
  40259d:	48 c7 05 38 53 00 00 	movq   $0x0,0x5338(%rip)        # 4078e0 <key_dtor_list>
  4025a4:	00 00 00 00 
  4025a8:	c7 05 36 53 00 00 00 	movl   $0x0,0x5336(%rip)        # 4078e8 <__mingwthr_cs_init>
  4025af:	00 00 00 
  4025b2:	ff 15 24 5c 00 00    	callq  *0x5c24(%rip)        # 4081dc <__IAT_start__>
  4025b8:	eb 9b                	jmp    402555 <__mingw_TLScallback+0x35>
  4025ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4025c0:	8b 05 22 53 00 00    	mov    0x5322(%rip),%eax        # 4078e8 <__mingwthr_cs_init>
  4025c6:	85 c0                	test   %eax,%eax
  4025c8:	74 16                	je     4025e0 <__mingw_TLScallback+0xc0>
  4025ca:	c7 05 14 53 00 00 01 	movl   $0x1,0x5314(%rip)        # 4078e8 <__mingwthr_cs_init>
  4025d1:	00 00 00 
  4025d4:	b8 01 00 00 00       	mov    $0x1,%eax
  4025d9:	48 83 c4 20          	add    $0x20,%rsp
  4025dd:	5b                   	pop    %rbx
  4025de:	c3                   	retq   
  4025df:	90                   	nop
  4025e0:	48 8d 0d 19 53 00 00 	lea    0x5319(%rip),%rcx        # 407900 <__mingwthr_cs>
  4025e7:	ff 15 37 5c 00 00    	callq  *0x5c37(%rip)        # 408224 <__imp_InitializeCriticalSection>
  4025ed:	eb db                	jmp    4025ca <__mingw_TLScallback+0xaa>
  4025ef:	90                   	nop
  4025f0:	e8 9b fd ff ff       	callq  402390 <__mingwthr_run_key_dtors.part.0>
  4025f5:	e9 74 ff ff ff       	jmpq   40256e <__mingw_TLScallback+0x4e>
  4025fa:	90                   	nop
  4025fb:	90                   	nop
  4025fc:	90                   	nop
  4025fd:	90                   	nop
  4025fe:	90                   	nop
  4025ff:	90                   	nop

0000000000402600 <_ValidateImageBase.part.0>:
  402600:	48 63 41 3c          	movslq 0x3c(%rcx),%rax
  402604:	48 01 c1             	add    %rax,%rcx
  402607:	31 c0                	xor    %eax,%eax
  402609:	81 39 50 45 00 00    	cmpl   $0x4550,(%rcx)
  40260f:	74 01                	je     402612 <_ValidateImageBase.part.0+0x12>
  402611:	c3                   	retq   
  402612:	31 c0                	xor    %eax,%eax
  402614:	66 81 79 18 0b 02    	cmpw   $0x20b,0x18(%rcx)
  40261a:	0f 94 c0             	sete   %al
  40261d:	c3                   	retq   
  40261e:	66 90                	xchg   %ax,%ax

0000000000402620 <_ValidateImageBase>:
  402620:	66 81 39 4d 5a       	cmpw   $0x5a4d,(%rcx)
  402625:	74 09                	je     402630 <_ValidateImageBase+0x10>
  402627:	31 c0                	xor    %eax,%eax
  402629:	c3                   	retq   
  40262a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402630:	eb ce                	jmp    402600 <_ValidateImageBase.part.0>
  402632:	0f 1f 40 00          	nopl   0x0(%rax)
  402636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40263d:	00 00 00 

0000000000402640 <_FindPESection>:
  402640:	48 63 41 3c          	movslq 0x3c(%rcx),%rax
  402644:	48 01 c1             	add    %rax,%rcx
  402647:	0f b7 41 14          	movzwl 0x14(%rcx),%eax
  40264b:	48 8d 44 01 18       	lea    0x18(%rcx,%rax,1),%rax
  402650:	0f b7 49 06          	movzwl 0x6(%rcx),%ecx
  402654:	85 c9                	test   %ecx,%ecx
  402656:	74 29                	je     402681 <_FindPESection+0x41>
  402658:	83 e9 01             	sub    $0x1,%ecx
  40265b:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
  40265f:	4c 8d 4c c8 28       	lea    0x28(%rax,%rcx,8),%r9
  402664:	44 8b 40 0c          	mov    0xc(%rax),%r8d
  402668:	49 39 d0             	cmp    %rdx,%r8
  40266b:	4c 89 c1             	mov    %r8,%rcx
  40266e:	77 08                	ja     402678 <_FindPESection+0x38>
  402670:	03 48 08             	add    0x8(%rax),%ecx
  402673:	48 39 d1             	cmp    %rdx,%rcx
  402676:	77 0b                	ja     402683 <_FindPESection+0x43>
  402678:	48 83 c0 28          	add    $0x28,%rax
  40267c:	4c 39 c8             	cmp    %r9,%rax
  40267f:	75 e3                	jne    402664 <_FindPESection+0x24>
  402681:	31 c0                	xor    %eax,%eax
  402683:	c3                   	retq   
  402684:	66 90                	xchg   %ax,%ax
  402686:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40268d:	00 00 00 

0000000000402690 <_FindPESectionByName>:
  402690:	57                   	push   %rdi
  402691:	56                   	push   %rsi
  402692:	53                   	push   %rbx
  402693:	48 83 ec 20          	sub    $0x20,%rsp
  402697:	48 89 ce             	mov    %rcx,%rsi
  40269a:	e8 91 03 00 00       	callq  402a30 <strlen>
  40269f:	48 83 f8 08          	cmp    $0x8,%rax
  4026a3:	77 6b                	ja     402710 <_FindPESectionByName+0x80>
  4026a5:	48 8b 15 b4 1c 00 00 	mov    0x1cb4(%rip),%rdx        # 404360 <.refptr.__image_base__>
  4026ac:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
  4026b1:	75 5d                	jne    402710 <_FindPESectionByName+0x80>
  4026b3:	48 89 d1             	mov    %rdx,%rcx
  4026b6:	e8 45 ff ff ff       	callq  402600 <_ValidateImageBase.part.0>
  4026bb:	85 c0                	test   %eax,%eax
  4026bd:	74 51                	je     402710 <_FindPESectionByName+0x80>
  4026bf:	48 63 4a 3c          	movslq 0x3c(%rdx),%rcx
  4026c3:	48 01 d1             	add    %rdx,%rcx
  4026c6:	0f b7 41 14          	movzwl 0x14(%rcx),%eax
  4026ca:	48 8d 5c 01 18       	lea    0x18(%rcx,%rax,1),%rbx
  4026cf:	0f b7 41 06          	movzwl 0x6(%rcx),%eax
  4026d3:	85 c0                	test   %eax,%eax
  4026d5:	74 39                	je     402710 <_FindPESectionByName+0x80>
  4026d7:	83 e8 01             	sub    $0x1,%eax
  4026da:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4026de:	48 8d 7c c3 28       	lea    0x28(%rbx,%rax,8),%rdi
  4026e3:	eb 09                	jmp    4026ee <_FindPESectionByName+0x5e>
  4026e5:	48 83 c3 28          	add    $0x28,%rbx
  4026e9:	48 39 fb             	cmp    %rdi,%rbx
  4026ec:	74 22                	je     402710 <_FindPESectionByName+0x80>
  4026ee:	41 b8 08 00 00 00    	mov    $0x8,%r8d
  4026f4:	48 89 f2             	mov    %rsi,%rdx
  4026f7:	48 89 d9             	mov    %rbx,%rcx
  4026fa:	e8 29 03 00 00       	callq  402a28 <strncmp>
  4026ff:	85 c0                	test   %eax,%eax
  402701:	75 e2                	jne    4026e5 <_FindPESectionByName+0x55>
  402703:	48 89 d8             	mov    %rbx,%rax
  402706:	48 83 c4 20          	add    $0x20,%rsp
  40270a:	5b                   	pop    %rbx
  40270b:	5e                   	pop    %rsi
  40270c:	5f                   	pop    %rdi
  40270d:	c3                   	retq   
  40270e:	66 90                	xchg   %ax,%ax
  402710:	31 db                	xor    %ebx,%ebx
  402712:	48 89 d8             	mov    %rbx,%rax
  402715:	48 83 c4 20          	add    $0x20,%rsp
  402719:	5b                   	pop    %rbx
  40271a:	5e                   	pop    %rsi
  40271b:	5f                   	pop    %rdi
  40271c:	c3                   	retq   
  40271d:	0f 1f 00             	nopl   (%rax)

0000000000402720 <__mingw_GetSectionForAddress>:
  402720:	48 83 ec 28          	sub    $0x28,%rsp
  402724:	4c 8b 05 35 1c 00 00 	mov    0x1c35(%rip),%r8        # 404360 <.refptr.__image_base__>
  40272b:	66 41 81 38 4d 5a    	cmpw   $0x5a4d,(%r8)
  402731:	48 89 ca             	mov    %rcx,%rdx
  402734:	75 57                	jne    40278d <__mingw_GetSectionForAddress+0x6d>
  402736:	4c 89 c1             	mov    %r8,%rcx
  402739:	e8 c2 fe ff ff       	callq  402600 <_ValidateImageBase.part.0>
  40273e:	85 c0                	test   %eax,%eax
  402740:	74 4b                	je     40278d <__mingw_GetSectionForAddress+0x6d>
  402742:	49 63 40 3c          	movslq 0x3c(%r8),%rax
  402746:	48 89 d1             	mov    %rdx,%rcx
  402749:	4c 29 c1             	sub    %r8,%rcx
  40274c:	49 01 c0             	add    %rax,%r8
  40274f:	41 0f b7 50 06       	movzwl 0x6(%r8),%edx
  402754:	41 0f b7 40 14       	movzwl 0x14(%r8),%eax
  402759:	85 d2                	test   %edx,%edx
  40275b:	49 8d 44 00 18       	lea    0x18(%r8,%rax,1),%rax
  402760:	74 2b                	je     40278d <__mingw_GetSectionForAddress+0x6d>
  402762:	83 ea 01             	sub    $0x1,%edx
  402765:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  402769:	4c 8d 4c d0 28       	lea    0x28(%rax,%rdx,8),%r9
  40276e:	66 90                	xchg   %ax,%ax
  402770:	44 8b 40 0c          	mov    0xc(%rax),%r8d
  402774:	4c 39 c1             	cmp    %r8,%rcx
  402777:	4c 89 c2             	mov    %r8,%rdx
  40277a:	72 08                	jb     402784 <__mingw_GetSectionForAddress+0x64>
  40277c:	03 50 08             	add    0x8(%rax),%edx
  40277f:	48 39 d1             	cmp    %rdx,%rcx
  402782:	72 0b                	jb     40278f <__mingw_GetSectionForAddress+0x6f>
  402784:	48 83 c0 28          	add    $0x28,%rax
  402788:	4c 39 c8             	cmp    %r9,%rax
  40278b:	75 e3                	jne    402770 <__mingw_GetSectionForAddress+0x50>
  40278d:	31 c0                	xor    %eax,%eax
  40278f:	48 83 c4 28          	add    $0x28,%rsp
  402793:	c3                   	retq   
  402794:	66 90                	xchg   %ax,%ax
  402796:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40279d:	00 00 00 

00000000004027a0 <__mingw_GetSectionCount>:
  4027a0:	48 83 ec 28          	sub    $0x28,%rsp
  4027a4:	48 8b 15 b5 1b 00 00 	mov    0x1bb5(%rip),%rdx        # 404360 <.refptr.__image_base__>
  4027ab:	45 31 c0             	xor    %r8d,%r8d
  4027ae:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
  4027b3:	74 0b                	je     4027c0 <__mingw_GetSectionCount+0x20>
  4027b5:	44 89 c0             	mov    %r8d,%eax
  4027b8:	48 83 c4 28          	add    $0x28,%rsp
  4027bc:	c3                   	retq   
  4027bd:	0f 1f 00             	nopl   (%rax)
  4027c0:	48 89 d1             	mov    %rdx,%rcx
  4027c3:	e8 38 fe ff ff       	callq  402600 <_ValidateImageBase.part.0>
  4027c8:	85 c0                	test   %eax,%eax
  4027ca:	74 e9                	je     4027b5 <__mingw_GetSectionCount+0x15>
  4027cc:	48 63 42 3c          	movslq 0x3c(%rdx),%rax
  4027d0:	44 0f b7 44 10 06    	movzwl 0x6(%rax,%rdx,1),%r8d
  4027d6:	44 89 c0             	mov    %r8d,%eax
  4027d9:	48 83 c4 28          	add    $0x28,%rsp
  4027dd:	c3                   	retq   
  4027de:	66 90                	xchg   %ax,%ax

00000000004027e0 <_FindPESectionExec>:
  4027e0:	48 83 ec 28          	sub    $0x28,%rsp
  4027e4:	4c 8b 05 75 1b 00 00 	mov    0x1b75(%rip),%r8        # 404360 <.refptr.__image_base__>
  4027eb:	66 41 81 38 4d 5a    	cmpw   $0x5a4d,(%r8)
  4027f1:	48 89 ca             	mov    %rcx,%rdx
  4027f4:	75 52                	jne    402848 <_FindPESectionExec+0x68>
  4027f6:	4c 89 c1             	mov    %r8,%rcx
  4027f9:	e8 02 fe ff ff       	callq  402600 <_ValidateImageBase.part.0>
  4027fe:	85 c0                	test   %eax,%eax
  402800:	74 46                	je     402848 <_FindPESectionExec+0x68>
  402802:	49 63 48 3c          	movslq 0x3c(%r8),%rcx
  402806:	4c 01 c1             	add    %r8,%rcx
  402809:	0f b7 41 14          	movzwl 0x14(%rcx),%eax
  40280d:	48 8d 44 01 18       	lea    0x18(%rcx,%rax,1),%rax
  402812:	0f b7 49 06          	movzwl 0x6(%rcx),%ecx
  402816:	85 c9                	test   %ecx,%ecx
  402818:	74 2e                	je     402848 <_FindPESectionExec+0x68>
  40281a:	83 e9 01             	sub    $0x1,%ecx
  40281d:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
  402821:	48 8d 4c c8 28       	lea    0x28(%rax,%rcx,8),%rcx
  402826:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40282d:	00 00 00 
  402830:	f6 40 27 20          	testb  $0x20,0x27(%rax)
  402834:	74 09                	je     40283f <_FindPESectionExec+0x5f>
  402836:	48 85 d2             	test   %rdx,%rdx
  402839:	74 0f                	je     40284a <_FindPESectionExec+0x6a>
  40283b:	48 83 ea 01          	sub    $0x1,%rdx
  40283f:	48 83 c0 28          	add    $0x28,%rax
  402843:	48 39 c8             	cmp    %rcx,%rax
  402846:	75 e8                	jne    402830 <_FindPESectionExec+0x50>
  402848:	31 c0                	xor    %eax,%eax
  40284a:	48 83 c4 28          	add    $0x28,%rsp
  40284e:	c3                   	retq   
  40284f:	90                   	nop

0000000000402850 <_GetPEImageBase>:
  402850:	48 83 ec 28          	sub    $0x28,%rsp
  402854:	48 8b 15 05 1b 00 00 	mov    0x1b05(%rip),%rdx        # 404360 <.refptr.__image_base__>
  40285b:	66 81 3a 4d 5a       	cmpw   $0x5a4d,(%rdx)
  402860:	75 1e                	jne    402880 <_GetPEImageBase+0x30>
  402862:	48 89 d1             	mov    %rdx,%rcx
  402865:	e8 96 fd ff ff       	callq  402600 <_ValidateImageBase.part.0>
  40286a:	85 c0                	test   %eax,%eax
  40286c:	b8 00 00 00 00       	mov    $0x0,%eax
  402871:	48 0f 45 c2          	cmovne %rdx,%rax
  402875:	48 83 c4 28          	add    $0x28,%rsp
  402879:	c3                   	retq   
  40287a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402880:	31 c0                	xor    %eax,%eax
  402882:	48 83 c4 28          	add    $0x28,%rsp
  402886:	c3                   	retq   
  402887:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40288e:	00 00 

0000000000402890 <_IsNonwritableInCurrentImage>:
  402890:	48 83 ec 28          	sub    $0x28,%rsp
  402894:	4c 8b 05 c5 1a 00 00 	mov    0x1ac5(%rip),%r8        # 404360 <.refptr.__image_base__>
  40289b:	31 c0                	xor    %eax,%eax
  40289d:	66 41 81 38 4d 5a    	cmpw   $0x5a4d,(%r8)
  4028a3:	48 89 ca             	mov    %rcx,%rdx
  4028a6:	74 08                	je     4028b0 <_IsNonwritableInCurrentImage+0x20>
  4028a8:	48 83 c4 28          	add    $0x28,%rsp
  4028ac:	c3                   	retq   
  4028ad:	0f 1f 00             	nopl   (%rax)
  4028b0:	4c 89 c1             	mov    %r8,%rcx
  4028b3:	e8 48 fd ff ff       	callq  402600 <_ValidateImageBase.part.0>
  4028b8:	85 c0                	test   %eax,%eax
  4028ba:	74 ec                	je     4028a8 <_IsNonwritableInCurrentImage+0x18>
  4028bc:	49 63 40 3c          	movslq 0x3c(%r8),%rax
  4028c0:	48 89 d1             	mov    %rdx,%rcx
  4028c3:	4c 29 c1             	sub    %r8,%rcx
  4028c6:	49 01 c0             	add    %rax,%r8
  4028c9:	41 0f b7 50 06       	movzwl 0x6(%r8),%edx
  4028ce:	41 0f b7 40 14       	movzwl 0x14(%r8),%eax
  4028d3:	85 d2                	test   %edx,%edx
  4028d5:	49 8d 44 00 18       	lea    0x18(%r8,%rax,1),%rax
  4028da:	74 31                	je     40290d <_IsNonwritableInCurrentImage+0x7d>
  4028dc:	83 ea 01             	sub    $0x1,%edx
  4028df:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  4028e3:	4c 8d 4c d0 28       	lea    0x28(%rax,%rdx,8),%r9
  4028e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4028ef:	00 
  4028f0:	44 8b 40 0c          	mov    0xc(%rax),%r8d
  4028f4:	4c 39 c1             	cmp    %r8,%rcx
  4028f7:	4c 89 c2             	mov    %r8,%rdx
  4028fa:	72 08                	jb     402904 <_IsNonwritableInCurrentImage+0x74>
  4028fc:	03 50 08             	add    0x8(%rax),%edx
  4028ff:	48 39 d1             	cmp    %rdx,%rcx
  402902:	72 10                	jb     402914 <_IsNonwritableInCurrentImage+0x84>
  402904:	48 83 c0 28          	add    $0x28,%rax
  402908:	4c 39 c8             	cmp    %r9,%rax
  40290b:	75 e3                	jne    4028f0 <_IsNonwritableInCurrentImage+0x60>
  40290d:	31 c0                	xor    %eax,%eax
  40290f:	48 83 c4 28          	add    $0x28,%rsp
  402913:	c3                   	retq   
  402914:	8b 40 24             	mov    0x24(%rax),%eax
  402917:	f7 d0                	not    %eax
  402919:	c1 e8 1f             	shr    $0x1f,%eax
  40291c:	48 83 c4 28          	add    $0x28,%rsp
  402920:	c3                   	retq   
  402921:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402926:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40292d:	00 00 00 

0000000000402930 <__mingw_enum_import_library_names>:
  402930:	48 83 ec 28          	sub    $0x28,%rsp
  402934:	4c 8b 1d 25 1a 00 00 	mov    0x1a25(%rip),%r11        # 404360 <.refptr.__image_base__>
  40293b:	66 41 81 3b 4d 5a    	cmpw   $0x5a4d,(%r11)
  402941:	41 89 c9             	mov    %ecx,%r9d
  402944:	75 58                	jne    40299e <__mingw_enum_import_library_names+0x6e>
  402946:	4c 89 d9             	mov    %r11,%rcx
  402949:	e8 b2 fc ff ff       	callq  402600 <_ValidateImageBase.part.0>
  40294e:	85 c0                	test   %eax,%eax
  402950:	74 4c                	je     40299e <__mingw_enum_import_library_names+0x6e>
  402952:	49 63 43 3c          	movslq 0x3c(%r11),%rax
  402956:	4c 01 d8             	add    %r11,%rax
  402959:	8b 90 90 00 00 00    	mov    0x90(%rax),%edx
  40295f:	85 d2                	test   %edx,%edx
  402961:	74 3b                	je     40299e <__mingw_enum_import_library_names+0x6e>
  402963:	0f b7 48 14          	movzwl 0x14(%rax),%ecx
  402967:	48 8d 4c 08 18       	lea    0x18(%rax,%rcx,1),%rcx
  40296c:	0f b7 40 06          	movzwl 0x6(%rax),%eax
  402970:	85 c0                	test   %eax,%eax
  402972:	74 2a                	je     40299e <__mingw_enum_import_library_names+0x6e>
  402974:	83 e8 01             	sub    $0x1,%eax
  402977:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40297b:	48 8d 44 c1 28       	lea    0x28(%rcx,%rax,8),%rax
  402980:	44 8b 51 0c          	mov    0xc(%rcx),%r10d
  402984:	4c 39 d2             	cmp    %r10,%rdx
  402987:	4d 89 d0             	mov    %r10,%r8
  40298a:	72 09                	jb     402995 <__mingw_enum_import_library_names+0x65>
  40298c:	44 03 41 08          	add    0x8(%rcx),%r8d
  402990:	4c 39 c2             	cmp    %r8,%rdx
  402993:	72 10                	jb     4029a5 <__mingw_enum_import_library_names+0x75>
  402995:	48 83 c1 28          	add    $0x28,%rcx
  402999:	48 39 c1             	cmp    %rax,%rcx
  40299c:	75 e2                	jne    402980 <__mingw_enum_import_library_names+0x50>
  40299e:	31 c0                	xor    %eax,%eax
  4029a0:	48 83 c4 28          	add    $0x28,%rsp
  4029a4:	c3                   	retq   
  4029a5:	4c 01 da             	add    %r11,%rdx
  4029a8:	75 0e                	jne    4029b8 <__mingw_enum_import_library_names+0x88>
  4029aa:	eb f2                	jmp    40299e <__mingw_enum_import_library_names+0x6e>
  4029ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4029b0:	41 83 e9 01          	sub    $0x1,%r9d
  4029b4:	48 83 c2 14          	add    $0x14,%rdx
  4029b8:	8b 4a 04             	mov    0x4(%rdx),%ecx
  4029bb:	85 c9                	test   %ecx,%ecx
  4029bd:	75 07                	jne    4029c6 <__mingw_enum_import_library_names+0x96>
  4029bf:	8b 42 0c             	mov    0xc(%rdx),%eax
  4029c2:	85 c0                	test   %eax,%eax
  4029c4:	74 d8                	je     40299e <__mingw_enum_import_library_names+0x6e>
  4029c6:	45 85 c9             	test   %r9d,%r9d
  4029c9:	7f e5                	jg     4029b0 <__mingw_enum_import_library_names+0x80>
  4029cb:	8b 42 0c             	mov    0xc(%rdx),%eax
  4029ce:	4c 01 d8             	add    %r11,%rax
  4029d1:	48 83 c4 28          	add    $0x28,%rsp
  4029d5:	c3                   	retq   
  4029d6:	90                   	nop
  4029d7:	90                   	nop
  4029d8:	90                   	nop
  4029d9:	90                   	nop
  4029da:	90                   	nop
  4029db:	90                   	nop
  4029dc:	90                   	nop
  4029dd:	90                   	nop
  4029de:	90                   	nop
  4029df:	90                   	nop

00000000004029e0 <___chkstk_ms>:
  4029e0:	51                   	push   %rcx
  4029e1:	50                   	push   %rax
  4029e2:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
  4029e8:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
  4029ed:	72 19                	jb     402a08 <___chkstk_ms+0x28>
  4029ef:	48 81 e9 00 10 00 00 	sub    $0x1000,%rcx
  4029f6:	48 83 09 00          	orq    $0x0,(%rcx)
  4029fa:	48 2d 00 10 00 00    	sub    $0x1000,%rax
  402a00:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
  402a06:	77 e7                	ja     4029ef <___chkstk_ms+0xf>
  402a08:	48 29 c1             	sub    %rax,%rcx
  402a0b:	48 83 09 00          	orq    $0x0,(%rcx)
  402a0f:	58                   	pop    %rax
  402a10:	59                   	pop    %rcx
  402a11:	c3                   	retq   
  402a12:	90                   	nop
  402a13:	90                   	nop
  402a14:	90                   	nop
  402a15:	90                   	nop
  402a16:	90                   	nop
  402a17:	90                   	nop
  402a18:	90                   	nop
  402a19:	90                   	nop
  402a1a:	90                   	nop
  402a1b:	90                   	nop
  402a1c:	90                   	nop
  402a1d:	90                   	nop
  402a1e:	90                   	nop
  402a1f:	90                   	nop

0000000000402a20 <vfprintf>:
  402a20:	ff 25 46 59 00 00    	jmpq   *0x5946(%rip)        # 40836c <__imp_vfprintf>
  402a26:	90                   	nop
  402a27:	90                   	nop

0000000000402a28 <strncmp>:
  402a28:	ff 25 36 59 00 00    	jmpq   *0x5936(%rip)        # 408364 <__imp_strncmp>
  402a2e:	90                   	nop
  402a2f:	90                   	nop

0000000000402a30 <strlen>:
  402a30:	ff 25 26 59 00 00    	jmpq   *0x5926(%rip)        # 40835c <__imp_strlen>
  402a36:	90                   	nop
  402a37:	90                   	nop

0000000000402a38 <signal>:
  402a38:	ff 25 16 59 00 00    	jmpq   *0x5916(%rip)        # 408354 <__imp_signal>
  402a3e:	90                   	nop
  402a3f:	90                   	nop

0000000000402a40 <puts>:
  402a40:	ff 25 06 59 00 00    	jmpq   *0x5906(%rip)        # 40834c <__imp_puts>
  402a46:	90                   	nop
  402a47:	90                   	nop

0000000000402a48 <printf>:
  402a48:	ff 25 f6 58 00 00    	jmpq   *0x58f6(%rip)        # 408344 <__imp_printf>
  402a4e:	90                   	nop
  402a4f:	90                   	nop

0000000000402a50 <memcpy>:
  402a50:	ff 25 e6 58 00 00    	jmpq   *0x58e6(%rip)        # 40833c <__imp_memcpy>
  402a56:	90                   	nop
  402a57:	90                   	nop

0000000000402a58 <malloc>:
  402a58:	ff 25 d6 58 00 00    	jmpq   *0x58d6(%rip)        # 408334 <__imp_malloc>
  402a5e:	90                   	nop
  402a5f:	90                   	nop

0000000000402a60 <fwrite>:
  402a60:	ff 25 c6 58 00 00    	jmpq   *0x58c6(%rip)        # 40832c <__imp_fwrite>
  402a66:	90                   	nop
  402a67:	90                   	nop

0000000000402a68 <free>:
  402a68:	ff 25 b6 58 00 00    	jmpq   *0x58b6(%rip)        # 408324 <__imp_free>
  402a6e:	90                   	nop
  402a6f:	90                   	nop

0000000000402a70 <fprintf>:
  402a70:	ff 25 a6 58 00 00    	jmpq   *0x58a6(%rip)        # 40831c <__imp_fprintf>
  402a76:	90                   	nop
  402a77:	90                   	nop

0000000000402a78 <exit>:
  402a78:	ff 25 96 58 00 00    	jmpq   *0x5896(%rip)        # 408314 <__imp_exit>
  402a7e:	90                   	nop
  402a7f:	90                   	nop

0000000000402a80 <calloc>:
  402a80:	ff 25 86 58 00 00    	jmpq   *0x5886(%rip)        # 40830c <__imp_calloc>
  402a86:	90                   	nop
  402a87:	90                   	nop

0000000000402a88 <abort>:
  402a88:	ff 25 76 58 00 00    	jmpq   *0x5876(%rip)        # 408304 <__imp_abort>
  402a8e:	90                   	nop
  402a8f:	90                   	nop

0000000000402a90 <_onexit>:
  402a90:	ff 25 66 58 00 00    	jmpq   *0x5866(%rip)        # 4082fc <__imp__onexit>
  402a96:	90                   	nop
  402a97:	90                   	nop

0000000000402a98 <_initterm>:
  402a98:	ff 25 56 58 00 00    	jmpq   *0x5856(%rip)        # 4082f4 <__imp__initterm>
  402a9e:	90                   	nop
  402a9f:	90                   	nop

0000000000402aa0 <_cexit>:
  402aa0:	ff 25 3e 58 00 00    	jmpq   *0x583e(%rip)        # 4082e4 <__imp__cexit>
  402aa6:	90                   	nop
  402aa7:	90                   	nop

0000000000402aa8 <_amsg_exit>:
  402aa8:	ff 25 2e 58 00 00    	jmpq   *0x582e(%rip)        # 4082dc <__imp__amsg_exit>
  402aae:	90                   	nop
  402aaf:	90                   	nop

0000000000402ab0 <__setusermatherr>:
  402ab0:	ff 25 16 58 00 00    	jmpq   *0x5816(%rip)        # 4082cc <__imp___setusermatherr>
  402ab6:	90                   	nop
  402ab7:	90                   	nop

0000000000402ab8 <__set_app_type>:
  402ab8:	ff 25 06 58 00 00    	jmpq   *0x5806(%rip)        # 4082c4 <__imp___set_app_type>
  402abe:	90                   	nop
  402abf:	90                   	nop

0000000000402ac0 <__lconv_init>:
  402ac0:	ff 25 f6 57 00 00    	jmpq   *0x57f6(%rip)        # 4082bc <__imp___lconv_init>
  402ac6:	90                   	nop
  402ac7:	90                   	nop

0000000000402ac8 <__getmainargs>:
  402ac8:	ff 25 d6 57 00 00    	jmpq   *0x57d6(%rip)        # 4082a4 <__imp___getmainargs>
  402ace:	90                   	nop
  402acf:	90                   	nop

0000000000402ad0 <__C_specific_handler>:
  402ad0:	ff 25 c6 57 00 00    	jmpq   *0x57c6(%rip)        # 40829c <__imp___C_specific_handler>
  402ad6:	90                   	nop
  402ad7:	90                   	nop
  402ad8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402adf:	00 

0000000000402ae0 <__acrt_iob_func>:
  402ae0:	53                   	push   %rbx
  402ae1:	48 83 ec 20          	sub    $0x20,%rsp
  402ae5:	89 cb                	mov    %ecx,%ebx
  402ae7:	e8 54 00 00 00       	callq  402b40 <__iob_func>
  402aec:	89 d9                	mov    %ebx,%ecx
  402aee:	48 8d 14 49          	lea    (%rcx,%rcx,2),%rdx
  402af2:	48 c1 e2 04          	shl    $0x4,%rdx
  402af6:	48 01 d0             	add    %rdx,%rax
  402af9:	48 83 c4 20          	add    $0x20,%rsp
  402afd:	5b                   	pop    %rbx
  402afe:	c3                   	retq   
  402aff:	90                   	nop

0000000000402b00 <_get_invalid_parameter_handler>:
  402b00:	48 8b 05 49 4e 00 00 	mov    0x4e49(%rip),%rax        # 407950 <handler>
  402b07:	c3                   	retq   
  402b08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402b0f:	00 

0000000000402b10 <_set_invalid_parameter_handler>:
  402b10:	48 89 c8             	mov    %rcx,%rax
  402b13:	48 87 05 36 4e 00 00 	xchg   %rax,0x4e36(%rip)        # 407950 <handler>
  402b1a:	c3                   	retq   
  402b1b:	90                   	nop
  402b1c:	90                   	nop
  402b1d:	90                   	nop
  402b1e:	90                   	nop
  402b1f:	90                   	nop

0000000000402b20 <__p__acmdln>:
  402b20:	48 8b 05 59 18 00 00 	mov    0x1859(%rip),%rax        # 404380 <.refptr.__imp__acmdln>
  402b27:	48 8b 00             	mov    (%rax),%rax
  402b2a:	c3                   	retq   
  402b2b:	90                   	nop
  402b2c:	90                   	nop
  402b2d:	90                   	nop
  402b2e:	90                   	nop
  402b2f:	90                   	nop

0000000000402b30 <__p__fmode>:
  402b30:	48 8b 05 59 18 00 00 	mov    0x1859(%rip),%rax        # 404390 <.refptr.__imp__fmode>
  402b37:	48 8b 00             	mov    (%rax),%rax
  402b3a:	c3                   	retq   
  402b3b:	90                   	nop
  402b3c:	90                   	nop
  402b3d:	90                   	nop
  402b3e:	90                   	nop
  402b3f:	90                   	nop

0000000000402b40 <__iob_func>:
  402b40:	ff 25 6e 57 00 00    	jmpq   *0x576e(%rip)        # 4082b4 <__imp___iob_func>
  402b46:	90                   	nop
  402b47:	90                   	nop
  402b48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402b4f:	00 

0000000000402b50 <VirtualQuery>:
  402b50:	ff 25 36 57 00 00    	jmpq   *0x5736(%rip)        # 40828c <__imp_VirtualQuery>
  402b56:	90                   	nop
  402b57:	90                   	nop

0000000000402b58 <VirtualProtect>:
  402b58:	ff 25 26 57 00 00    	jmpq   *0x5726(%rip)        # 408284 <__imp_VirtualProtect>
  402b5e:	90                   	nop
  402b5f:	90                   	nop

0000000000402b60 <UnhandledExceptionFilter>:
  402b60:	ff 25 16 57 00 00    	jmpq   *0x5716(%rip)        # 40827c <__imp_UnhandledExceptionFilter>
  402b66:	90                   	nop
  402b67:	90                   	nop

0000000000402b68 <TlsGetValue>:
  402b68:	ff 25 06 57 00 00    	jmpq   *0x5706(%rip)        # 408274 <__imp_TlsGetValue>
  402b6e:	90                   	nop
  402b6f:	90                   	nop

0000000000402b70 <TerminateProcess>:
  402b70:	ff 25 f6 56 00 00    	jmpq   *0x56f6(%rip)        # 40826c <__imp_TerminateProcess>
  402b76:	90                   	nop
  402b77:	90                   	nop

0000000000402b78 <Sleep>:
  402b78:	ff 25 e6 56 00 00    	jmpq   *0x56e6(%rip)        # 408264 <__imp_Sleep>
  402b7e:	90                   	nop
  402b7f:	90                   	nop

0000000000402b80 <SetUnhandledExceptionFilter>:
  402b80:	ff 25 d6 56 00 00    	jmpq   *0x56d6(%rip)        # 40825c <__imp_SetUnhandledExceptionFilter>
  402b86:	90                   	nop
  402b87:	90                   	nop

0000000000402b88 <RtlVirtualUnwind>:
  402b88:	ff 25 c6 56 00 00    	jmpq   *0x56c6(%rip)        # 408254 <__imp_RtlVirtualUnwind>
  402b8e:	90                   	nop
  402b8f:	90                   	nop

0000000000402b90 <RtlLookupFunctionEntry>:
  402b90:	ff 25 b6 56 00 00    	jmpq   *0x56b6(%rip)        # 40824c <__imp_RtlLookupFunctionEntry>
  402b96:	90                   	nop
  402b97:	90                   	nop

0000000000402b98 <RtlCaptureContext>:
  402b98:	ff 25 a6 56 00 00    	jmpq   *0x56a6(%rip)        # 408244 <__imp_RtlCaptureContext>
  402b9e:	90                   	nop
  402b9f:	90                   	nop

0000000000402ba0 <RtlAddFunctionTable>:
  402ba0:	ff 25 96 56 00 00    	jmpq   *0x5696(%rip)        # 40823c <__imp_RtlAddFunctionTable>
  402ba6:	90                   	nop
  402ba7:	90                   	nop

0000000000402ba8 <QueryPerformanceCounter>:
  402ba8:	ff 25 86 56 00 00    	jmpq   *0x5686(%rip)        # 408234 <__imp_QueryPerformanceCounter>
  402bae:	90                   	nop
  402baf:	90                   	nop

0000000000402bb0 <LeaveCriticalSection>:
  402bb0:	ff 25 76 56 00 00    	jmpq   *0x5676(%rip)        # 40822c <__imp_LeaveCriticalSection>
  402bb6:	90                   	nop
  402bb7:	90                   	nop

0000000000402bb8 <InitializeCriticalSection>:
  402bb8:	ff 25 66 56 00 00    	jmpq   *0x5666(%rip)        # 408224 <__imp_InitializeCriticalSection>
  402bbe:	90                   	nop
  402bbf:	90                   	nop

0000000000402bc0 <GetTickCount>:
  402bc0:	ff 25 56 56 00 00    	jmpq   *0x5656(%rip)        # 40821c <__imp_GetTickCount>
  402bc6:	90                   	nop
  402bc7:	90                   	nop

0000000000402bc8 <GetSystemTimeAsFileTime>:
  402bc8:	ff 25 46 56 00 00    	jmpq   *0x5646(%rip)        # 408214 <__imp_GetSystemTimeAsFileTime>
  402bce:	90                   	nop
  402bcf:	90                   	nop

0000000000402bd0 <GetStartupInfoA>:
  402bd0:	ff 25 36 56 00 00    	jmpq   *0x5636(%rip)        # 40820c <__imp_GetStartupInfoA>
  402bd6:	90                   	nop
  402bd7:	90                   	nop

0000000000402bd8 <GetLastError>:
  402bd8:	ff 25 26 56 00 00    	jmpq   *0x5626(%rip)        # 408204 <__imp_GetLastError>
  402bde:	90                   	nop
  402bdf:	90                   	nop

0000000000402be0 <GetCurrentThreadId>:
  402be0:	ff 25 16 56 00 00    	jmpq   *0x5616(%rip)        # 4081fc <__imp_GetCurrentThreadId>
  402be6:	90                   	nop
  402be7:	90                   	nop

0000000000402be8 <GetCurrentProcessId>:
  402be8:	ff 25 06 56 00 00    	jmpq   *0x5606(%rip)        # 4081f4 <__imp_GetCurrentProcessId>
  402bee:	90                   	nop
  402bef:	90                   	nop

0000000000402bf0 <GetCurrentProcess>:
  402bf0:	ff 25 f6 55 00 00    	jmpq   *0x55f6(%rip)        # 4081ec <__imp_GetCurrentProcess>
  402bf6:	90                   	nop
  402bf7:	90                   	nop

0000000000402bf8 <EnterCriticalSection>:
  402bf8:	ff 25 e6 55 00 00    	jmpq   *0x55e6(%rip)        # 4081e4 <__imp_EnterCriticalSection>
  402bfe:	90                   	nop
  402bff:	90                   	nop

0000000000402c00 <DeleteCriticalSection>:
  402c00:	ff 25 d6 55 00 00    	jmpq   *0x55d6(%rip)        # 4081dc <__IAT_start__>
  402c06:	90                   	nop
  402c07:	90                   	nop
  402c08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402c0f:	00 

0000000000402c10 <main>:
  402c10:	48 83 ec 38          	sub    $0x38,%rsp
  402c14:	e8 f7 e9 ff ff       	callq  401610 <__main>
  402c19:	48 8d 0d e0 13 00 00 	lea    0x13e0(%rip),%rcx        # 404000 <.rdata>
  402c20:	e8 1b fe ff ff       	callq  402a40 <puts>
  402c25:	c7 44 24 2c 03 00 00 	movl   $0x3,0x2c(%rsp)
  402c2c:	00 
  402c2d:	8b 54 24 2c          	mov    0x2c(%rsp),%edx
  402c31:	48 8d 0d d4 13 00 00 	lea    0x13d4(%rip),%rcx        # 40400c <.rdata+0xc>
  402c38:	83 c2 07             	add    $0x7,%edx
  402c3b:	e8 08 fe ff ff       	callq  402a48 <printf>
  402c40:	31 c0                	xor    %eax,%eax
  402c42:	48 83 c4 38          	add    $0x38,%rsp
  402c46:	c3                   	retq   
  402c47:	90                   	nop
  402c48:	90                   	nop
  402c49:	90                   	nop
  402c4a:	90                   	nop
  402c4b:	90                   	nop
  402c4c:	90                   	nop
  402c4d:	90                   	nop
  402c4e:	90                   	nop
  402c4f:	90                   	nop

0000000000402c50 <__report_error>:
  402c50:	56                   	push   %rsi
  402c51:	53                   	push   %rbx
  402c52:	48 83 ec 38          	sub    $0x38,%rsp
  402c56:	48 8d 44 24 58       	lea    0x58(%rsp),%rax
  402c5b:	48 89 cb             	mov    %rcx,%rbx
  402c5e:	b9 02 00 00 00       	mov    $0x2,%ecx
  402c63:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
  402c68:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
  402c6d:	4c 89 4c 24 68       	mov    %r9,0x68(%rsp)
  402c72:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  402c77:	e8 64 fe ff ff       	callq  402ae0 <__acrt_iob_func>
  402c7c:	41 b8 1b 00 00 00    	mov    $0x1b,%r8d
  402c82:	ba 01 00 00 00       	mov    $0x1,%edx
  402c87:	48 8d 0d 52 15 00 00 	lea    0x1552(%rip),%rcx        # 4041e0 <.rdata>
  402c8e:	49 89 c1             	mov    %rax,%r9
  402c91:	e8 ca fd ff ff       	callq  402a60 <fwrite>
  402c96:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  402c9b:	b9 02 00 00 00       	mov    $0x2,%ecx
  402ca0:	e8 3b fe ff ff       	callq  402ae0 <__acrt_iob_func>
  402ca5:	48 89 da             	mov    %rbx,%rdx
  402ca8:	48 89 c1             	mov    %rax,%rcx
  402cab:	49 89 f0             	mov    %rsi,%r8
  402cae:	e8 6d fd ff ff       	callq  402a20 <vfprintf>
  402cb3:	e8 d0 fd ff ff       	callq  402a88 <abort>
  402cb8:	90                   	nop
  402cb9:	90                   	nop
  402cba:	90                   	nop
  402cbb:	90                   	nop
  402cbc:	90                   	nop
  402cbd:	90                   	nop
  402cbe:	90                   	nop
  402cbf:	90                   	nop

0000000000402cc0 <register_frame_ctor>:
  402cc0:	e9 6b e8 ff ff       	jmpq   401530 <__gcc_register_frame>
  402cc5:	90                   	nop
  402cc6:	90                   	nop
  402cc7:	90                   	nop
  402cc8:	90                   	nop
  402cc9:	90                   	nop
  402cca:	90                   	nop
  402ccb:	90                   	nop
  402ccc:	90                   	nop
  402ccd:	90                   	nop
  402cce:	90                   	nop
  402ccf:	90                   	nop

0000000000402cd0 <__CTOR_LIST__>:
  402cd0:	ff                   	(bad)  
  402cd1:	ff                   	(bad)  
  402cd2:	ff                   	(bad)  
  402cd3:	ff                   	(bad)  
  402cd4:	ff                   	(bad)  
  402cd5:	ff                   	(bad)  
  402cd6:	ff                   	(bad)  
  402cd7:	ff                   	.byte 0xff

0000000000402cd8 <.ctors.65535>:
  402cd8:	c0 2c 40 00          	shrb   $0x0,(%rax,%rax,2)
	...

0000000000402ce8 <__DTOR_LIST__>:
  402ce8:	ff                   	(bad)  
  402ce9:	ff                   	(bad)  
  402cea:	ff                   	(bad)  
  402ceb:	ff                   	(bad)  
  402cec:	ff                   	(bad)  
  402ced:	ff                   	(bad)  
  402cee:	ff                   	(bad)  
  402cef:	ff 00                	incl   (%rax)
  402cf1:	00 00                	add    %al,(%rax)
  402cf3:	00 00                	add    %al,(%rax)
  402cf5:	00 00                	add    %al,(%rax)
	...
