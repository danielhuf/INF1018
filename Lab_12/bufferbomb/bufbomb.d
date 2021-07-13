
bufbomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmpq *0x2fe3(%rip)        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nopl   (%rax)
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	pushq  $0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmpq 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	pushq  $0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmpq 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	pushq  $0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmpq 401020 <.plt>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	pushq  $0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmpq 401020 <.plt>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	pushq  $0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmpq 401020 <.plt>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	pushq  $0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmpq 401020 <.plt>
  40108f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401090 <puts@plt>:
  401090:	f3 0f 1e fa          	endbr64 
  401094:	f2 ff 25 7d 2f 00 00 	bnd jmpq *0x2f7d(%rip)        # 404018 <puts@GLIBC_2.2.5>
  40109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010a0 <printf@plt>:
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	f2 ff 25 75 2f 00 00 	bnd jmpq *0x2f75(%rip)        # 404020 <printf@GLIBC_2.2.5>
  4010ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010b0 <strcmp@plt>:
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	f2 ff 25 6d 2f 00 00 	bnd jmpq *0x2f6d(%rip)        # 404028 <strcmp@GLIBC_2.2.5>
  4010bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010c0 <signal@plt>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	f2 ff 25 65 2f 00 00 	bnd jmpq *0x2f65(%rip)        # 404030 <signal@GLIBC_2.2.5>
  4010cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010d0 <exit@plt>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	f2 ff 25 5d 2f 00 00 	bnd jmpq *0x2f5d(%rip)        # 404038 <exit@GLIBC_2.2.5>
  4010db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010e0 <getc@plt>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	f2 ff 25 55 2f 00 00 	bnd jmpq *0x2f55(%rip)        # 404040 <getc@GLIBC_2.2.5>
  4010eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000004010f0 <_start>:
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	31 ed                	xor    %ebp,%ebp
  4010f6:	49 89 d1             	mov    %rdx,%r9
  4010f9:	5e                   	pop    %rsi
  4010fa:	48 89 e2             	mov    %rsp,%rdx
  4010fd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401101:	50                   	push   %rax
  401102:	54                   	push   %rsp
  401103:	49 c7 c0 e0 14 40 00 	mov    $0x4014e0,%r8
  40110a:	48 c7 c1 70 14 40 00 	mov    $0x401470,%rcx
  401111:	48 c7 c7 bd 13 40 00 	mov    $0x4013bd,%rdi
  401118:	ff 15 d2 2e 00 00    	callq  *0x2ed2(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40111e:	f4                   	hlt    
  40111f:	90                   	nop

0000000000401120 <_dl_relocate_static_pie>:
  401120:	f3 0f 1e fa          	endbr64 
  401124:	c3                   	retq   
  401125:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40112c:	00 00 00 
  40112f:	90                   	nop

0000000000401130 <deregister_tm_clones>:
  401130:	b8 58 40 40 00       	mov    $0x404058,%eax
  401135:	48 3d 58 40 40 00    	cmp    $0x404058,%rax
  40113b:	74 13                	je     401150 <deregister_tm_clones+0x20>
  40113d:	b8 00 00 00 00       	mov    $0x0,%eax
  401142:	48 85 c0             	test   %rax,%rax
  401145:	74 09                	je     401150 <deregister_tm_clones+0x20>
  401147:	bf 58 40 40 00       	mov    $0x404058,%edi
  40114c:	ff e0                	jmpq   *%rax
  40114e:	66 90                	xchg   %ax,%ax
  401150:	c3                   	retq   
  401151:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401158:	00 00 00 00 
  40115c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401160 <register_tm_clones>:
  401160:	be 58 40 40 00       	mov    $0x404058,%esi
  401165:	48 81 ee 58 40 40 00 	sub    $0x404058,%rsi
  40116c:	48 89 f0             	mov    %rsi,%rax
  40116f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401173:	48 c1 f8 03          	sar    $0x3,%rax
  401177:	48 01 c6             	add    %rax,%rsi
  40117a:	48 d1 fe             	sar    %rsi
  40117d:	74 11                	je     401190 <register_tm_clones+0x30>
  40117f:	b8 00 00 00 00       	mov    $0x0,%eax
  401184:	48 85 c0             	test   %rax,%rax
  401187:	74 07                	je     401190 <register_tm_clones+0x30>
  401189:	bf 58 40 40 00       	mov    $0x404058,%edi
  40118e:	ff e0                	jmpq   *%rax
  401190:	c3                   	retq   
  401191:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401198:	00 00 00 00 
  40119c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011a0 <__do_global_dtors_aux>:
  4011a0:	f3 0f 1e fa          	endbr64 
  4011a4:	80 3d bd 2e 00 00 00 	cmpb   $0x0,0x2ebd(%rip)        # 404068 <completed.8060>
  4011ab:	75 13                	jne    4011c0 <__do_global_dtors_aux+0x20>
  4011ad:	55                   	push   %rbp
  4011ae:	48 89 e5             	mov    %rsp,%rbp
  4011b1:	e8 7a ff ff ff       	callq  401130 <deregister_tm_clones>
  4011b6:	c6 05 ab 2e 00 00 01 	movb   $0x1,0x2eab(%rip)        # 404068 <completed.8060>
  4011bd:	5d                   	pop    %rbp
  4011be:	c3                   	retq   
  4011bf:	90                   	nop
  4011c0:	c3                   	retq   
  4011c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4011c8:	00 00 00 00 
  4011cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011d0 <frame_dummy>:
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	eb 8a                	jmp    401160 <register_tm_clones>

00000000004011d6 <valid>:
  4011d6:	f3 0f 1e fa          	endbr64 
  4011da:	55                   	push   %rbp
  4011db:	48 89 e5             	mov    %rsp,%rbp
  4011de:	48 83 ec 10          	sub    $0x10,%rsp
  4011e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4011e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011ea:	48 8d 35 17 0e 00 00 	lea    0xe17(%rip),%rsi        # 402008 <_IO_stdin_used+0x8>
  4011f1:	48 89 c7             	mov    %rax,%rdi
  4011f4:	e8 b7 fe ff ff       	callq  4010b0 <strcmp@plt>
  4011f9:	85 c0                	test   %eax,%eax
  4011fb:	0f 94 c0             	sete   %al
  4011fe:	0f b6 c0             	movzbl %al,%eax
  401201:	c9                   	leaveq 
  401202:	c3                   	retq   

0000000000401203 <danger>:
  401203:	f3 0f 1e fa          	endbr64 
  401207:	55                   	push   %rbp
  401208:	48 89 e5             	mov    %rsp,%rbp
  40120b:	48 8d 3d 00 0e 00 00 	lea    0xe00(%rip),%rdi        # 402012 <_IO_stdin_used+0x12>
  401212:	e8 79 fe ff ff       	callq  401090 <puts@plt>
  401217:	48 8d 3d 12 0e 00 00 	lea    0xe12(%rip),%rdi        # 402030 <_IO_stdin_used+0x30>
  40121e:	e8 6d fe ff ff       	callq  401090 <puts@plt>
  401223:	90                   	nop
  401224:	5d                   	pop    %rbp
  401225:	c3                   	retq   

0000000000401226 <protect>:
  401226:	f3 0f 1e fa          	endbr64 
  40122a:	55                   	push   %rbp
  40122b:	48 89 e5             	mov    %rsp,%rbp
  40122e:	48 83 ec 10          	sub    $0x10,%rsp
  401232:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401236:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  40123a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40123e:	48 89 c7             	mov    %rax,%rdi
  401241:	e8 90 ff ff ff       	callq  4011d6 <valid>
  401246:	85 c0                	test   %eax,%eax
  401248:	74 11                	je     40125b <protect+0x35>
  40124a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40124e:	48 89 c7             	mov    %rax,%rdi
  401251:	b8 00 00 00 00       	mov    $0x0,%eax
  401256:	e8 a8 ff ff ff       	callq  401203 <danger>
  40125b:	90                   	nop
  40125c:	c9                   	leaveq 
  40125d:	c3                   	retq   

000000000040125e <smoke>:
  40125e:	f3 0f 1e fa          	endbr64 
  401262:	55                   	push   %rbp
  401263:	48 89 e5             	mov    %rsp,%rbp
  401266:	48 8d 3d ec 0d 00 00 	lea    0xdec(%rip),%rdi        # 402059 <_IO_stdin_used+0x59>
  40126d:	e8 1e fe ff ff       	callq  401090 <puts@plt>
  401272:	bf 00 00 00 00       	mov    $0x0,%edi
  401277:	e8 54 fe ff ff       	callq  4010d0 <exit@plt>

000000000040127c <fizz>:
  40127c:	f3 0f 1e fa          	endbr64 
  401280:	55                   	push   %rbp
  401281:	48 89 e5             	mov    %rsp,%rbp
  401284:	48 83 ec 10          	sub    $0x10,%rsp
  401288:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40128b:	81 7d fc 04 03 02 01 	cmpl   $0x1020304,-0x4(%rbp)
  401292:	75 18                	jne    4012ac <fizz+0x30>
  401294:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401297:	89 c6                	mov    %eax,%esi
  401299:	48 8d 3d d4 0d 00 00 	lea    0xdd4(%rip),%rdi        # 402074 <_IO_stdin_used+0x74>
  4012a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a5:	e8 f6 fd ff ff       	callq  4010a0 <printf@plt>
  4012aa:	eb 16                	jmp    4012c2 <fizz+0x46>
  4012ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4012af:	89 c6                	mov    %eax,%esi
  4012b1:	48 8d 3d e0 0d 00 00 	lea    0xde0(%rip),%rdi        # 402098 <_IO_stdin_used+0x98>
  4012b8:	b8 00 00 00 00       	mov    $0x0,%eax
  4012bd:	e8 de fd ff ff       	callq  4010a0 <printf@plt>
  4012c2:	bf 00 00 00 00       	mov    $0x0,%edi
  4012c7:	e8 04 fe ff ff       	callq  4010d0 <exit@plt>

00000000004012cc <Gets>:
  4012cc:	f3 0f 1e fa          	endbr64 
  4012d0:	55                   	push   %rbp
  4012d1:	48 89 e5             	mov    %rsp,%rbp
  4012d4:	48 83 ec 20          	sub    $0x20,%rsp
  4012d8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4012dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4012e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4012e4:	eb 11                	jmp    4012f7 <Gets+0x2b>
  4012e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4012ea:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4012ee:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  4012f2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  4012f5:	88 10                	mov    %dl,(%rax)
  4012f7:	48 8b 05 72 2d 00 00 	mov    0x2d72(%rip),%rax        # 404070 <infile>
  4012fe:	48 89 c7             	mov    %rax,%rdi
  401301:	e8 da fd ff ff       	callq  4010e0 <getc@plt>
  401306:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401309:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
  40130d:	74 06                	je     401315 <Gets+0x49>
  40130f:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  401313:	75 d1                	jne    4012e6 <Gets+0x1a>
  401315:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401319:	48 8d 50 01          	lea    0x1(%rax),%rdx
  40131d:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  401321:	c6 00 00             	movb   $0x0,(%rax)
  401324:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401328:	c9                   	leaveq 
  401329:	c3                   	retq   

000000000040132a <bushandler>:
  40132a:	f3 0f 1e fa          	endbr64 
  40132e:	55                   	push   %rbp
  40132f:	48 89 e5             	mov    %rsp,%rbp
  401332:	48 83 ec 10          	sub    $0x10,%rsp
  401336:	89 7d fc             	mov    %edi,-0x4(%rbp)
  401339:	48 8d 3d 78 0d 00 00 	lea    0xd78(%rip),%rdi        # 4020b8 <_IO_stdin_used+0xb8>
  401340:	e8 4b fd ff ff       	callq  401090 <puts@plt>
  401345:	48 8d 3d 8c 0d 00 00 	lea    0xd8c(%rip),%rdi        # 4020d8 <_IO_stdin_used+0xd8>
  40134c:	e8 3f fd ff ff       	callq  401090 <puts@plt>
  401351:	bf 00 00 00 00       	mov    $0x0,%edi
  401356:	e8 75 fd ff ff       	callq  4010d0 <exit@plt>

000000000040135b <seghandler>:
  40135b:	f3 0f 1e fa          	endbr64 
  40135f:	55                   	push   %rbp
  401360:	48 89 e5             	mov    %rsp,%rbp
  401363:	48 83 ec 10          	sub    $0x10,%rsp
  401367:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40136a:	48 8d 3d 7f 0d 00 00 	lea    0xd7f(%rip),%rdi        # 4020f0 <_IO_stdin_used+0xf0>
  401371:	e8 1a fd ff ff       	callq  401090 <puts@plt>
  401376:	48 8d 3d 5b 0d 00 00 	lea    0xd5b(%rip),%rdi        # 4020d8 <_IO_stdin_used+0xd8>
  40137d:	e8 0e fd ff ff       	callq  401090 <puts@plt>
  401382:	bf 00 00 00 00       	mov    $0x0,%edi
  401387:	e8 44 fd ff ff       	callq  4010d0 <exit@plt>

000000000040138c <illegalhandler>:
  40138c:	f3 0f 1e fa          	endbr64 
  401390:	55                   	push   %rbp
  401391:	48 89 e5             	mov    %rsp,%rbp
  401394:	48 83 ec 10          	sub    $0x10,%rsp
  401398:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40139b:	48 8d 3d 76 0d 00 00 	lea    0xd76(%rip),%rdi        # 402118 <_IO_stdin_used+0x118>
  4013a2:	e8 e9 fc ff ff       	callq  401090 <puts@plt>
  4013a7:	48 8d 3d 2a 0d 00 00 	lea    0xd2a(%rip),%rdi        # 4020d8 <_IO_stdin_used+0xd8>
  4013ae:	e8 dd fc ff ff       	callq  401090 <puts@plt>
  4013b3:	bf 00 00 00 00       	mov    $0x0,%edi
  4013b8:	e8 13 fd ff ff       	callq  4010d0 <exit@plt>

00000000004013bd <main>:
  4013bd:	f3 0f 1e fa          	endbr64 
  4013c1:	55                   	push   %rbp
  4013c2:	48 89 e5             	mov    %rsp,%rbp
  4013c5:	48 83 ec 10          	sub    $0x10,%rsp
  4013c9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4013cc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  4013d0:	48 8d 35 84 ff ff ff 	lea    -0x7c(%rip),%rsi        # 40135b <seghandler>
  4013d7:	bf 0b 00 00 00       	mov    $0xb,%edi
  4013dc:	e8 df fc ff ff       	callq  4010c0 <signal@plt>
  4013e1:	48 8d 35 42 ff ff ff 	lea    -0xbe(%rip),%rsi        # 40132a <bushandler>
  4013e8:	bf 07 00 00 00       	mov    $0x7,%edi
  4013ed:	e8 ce fc ff ff       	callq  4010c0 <signal@plt>
  4013f2:	48 8d 35 93 ff ff ff 	lea    -0x6d(%rip),%rsi        # 40138c <illegalhandler>
  4013f9:	bf 04 00 00 00       	mov    $0x4,%edi
  4013fe:	e8 bd fc ff ff       	callq  4010c0 <signal@plt>
  401403:	48 8b 05 56 2c 00 00 	mov    0x2c56(%rip),%rax        # 404060 <stdin@@GLIBC_2.2.5>
  40140a:	48 89 05 5f 2c 00 00 	mov    %rax,0x2c5f(%rip)        # 404070 <infile>
  401411:	b8 00 00 00 00       	mov    $0x0,%eax
  401416:	e8 13 00 00 00       	callq  40142e <getbuf>
  40141b:	48 8d 3d 26 0d 00 00 	lea    0xd26(%rip),%rdi        # 402148 <_IO_stdin_used+0x148>
  401422:	e8 69 fc ff ff       	callq  401090 <puts@plt>
  401427:	b8 00 00 00 00       	mov    $0x0,%eax
  40142c:	c9                   	leaveq 
  40142d:	c3                   	retq   

000000000040142e <getbuf>:
  40142e:	f3 0f 1e fa          	endbr64 
  401432:	55                   	push   %rbp
  401433:	48 89 e5             	mov    %rsp,%rbp
  401436:	48 83 ec 20          	sub    $0x20,%rsp
  40143a:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  40143e:	48 89 c6             	mov    %rax,%rsi
  401441:	48 8d 3d 24 0d 00 00 	lea    0xd24(%rip),%rdi        # 40216c <_IO_stdin_used+0x16c>
  401448:	b8 00 00 00 00       	mov    $0x0,%eax
  40144d:	e8 4e fc ff ff       	callq  4010a0 <printf@plt>
  401452:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401456:	48 89 c7             	mov    %rax,%rdi
  401459:	e8 6e fe ff ff       	callq  4012cc <Gets>
  40145e:	b8 01 00 00 00       	mov    $0x1,%eax
  401463:	c9                   	leaveq 
  401464:	c3                   	retq   
  401465:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40146c:	00 00 00 
  40146f:	90                   	nop

0000000000401470 <__libc_csu_init>:
  401470:	f3 0f 1e fa          	endbr64 
  401474:	41 57                	push   %r15
  401476:	4c 8d 3d 93 29 00 00 	lea    0x2993(%rip),%r15        # 403e10 <__frame_dummy_init_array_entry>
  40147d:	41 56                	push   %r14
  40147f:	49 89 d6             	mov    %rdx,%r14
  401482:	41 55                	push   %r13
  401484:	49 89 f5             	mov    %rsi,%r13
  401487:	41 54                	push   %r12
  401489:	41 89 fc             	mov    %edi,%r12d
  40148c:	55                   	push   %rbp
  40148d:	48 8d 2d 84 29 00 00 	lea    0x2984(%rip),%rbp        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401494:	53                   	push   %rbx
  401495:	4c 29 fd             	sub    %r15,%rbp
  401498:	48 83 ec 08          	sub    $0x8,%rsp
  40149c:	e8 5f fb ff ff       	callq  401000 <_init>
  4014a1:	48 c1 fd 03          	sar    $0x3,%rbp
  4014a5:	74 1f                	je     4014c6 <__libc_csu_init+0x56>
  4014a7:	31 db                	xor    %ebx,%ebx
  4014a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4014b0:	4c 89 f2             	mov    %r14,%rdx
  4014b3:	4c 89 ee             	mov    %r13,%rsi
  4014b6:	44 89 e7             	mov    %r12d,%edi
  4014b9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4014bd:	48 83 c3 01          	add    $0x1,%rbx
  4014c1:	48 39 dd             	cmp    %rbx,%rbp
  4014c4:	75 ea                	jne    4014b0 <__libc_csu_init+0x40>
  4014c6:	48 83 c4 08          	add    $0x8,%rsp
  4014ca:	5b                   	pop    %rbx
  4014cb:	5d                   	pop    %rbp
  4014cc:	41 5c                	pop    %r12
  4014ce:	41 5d                	pop    %r13
  4014d0:	41 5e                	pop    %r14
  4014d2:	41 5f                	pop    %r15
  4014d4:	c3                   	retq   
  4014d5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4014dc:	00 00 00 00 

00000000004014e0 <__libc_csu_fini>:
  4014e0:	f3 0f 1e fa          	endbr64 
  4014e4:	c3                   	retq   

Disassembly of section .fini:

00000000004014e8 <_fini>:
  4014e8:	f3 0f 1e fa          	endbr64 
  4014ec:	48 83 ec 08          	sub    $0x8,%rsp
  4014f0:	48 83 c4 08          	add    $0x8,%rsp
  4014f4:	c3                   	retq   
