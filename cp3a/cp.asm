	.file	"cp.cc"
# GNU C++20 (Ubuntu 12.1.0-2ubuntu1~22.04) version 12.1.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.1.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=cascadelake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mavx512f -mbmi -mbmi2 -maes -mpclmul -mavx512vl -mavx512bw -mavx512dq -mavx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mavx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=19712 -mtune=cascadelake -O3 -std=c++20 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4
	.globl	_Z9correlateiiPKfPf
	.type	_Z9correlateiiPKfPf, @function
_Z9correlateiiPKfPf:
.LFB3794:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3794
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13	#,
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r13)	#
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12	#
	pushq	%rbx	#
	subq	$168, %rsp	#,
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
# /box/cp.cc:27: {
	movq	%rdx, -72(%rbp)	# tmp421, %sfp
	movq	%rcx, -152(%rbp)	# tmp422, %sfp
# /box/cp.cc:31:     int nv = (nx + 3) / 4;
	movl	%esi, %edx	# nx, tmp268
# /box/cp.cc:27: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp435
	movq	%rax, -56(%rbp)	# tmp435, D.84797
	xorl	%eax, %eax	# tmp435
# /box/cp.cc:31:     int nv = (nx + 3) / 4;
	addl	$3, %edx	#, tmp268
	leal	6(%rsi), %eax	#, tmp270
	cmovns	%edx, %eax	# tmp270,, tmp268, tmp269
	sarl	$2, %eax	#, tmp269
	movl	%eax, %r15d	# tmp269, tmp271
# /box/cp.cc:32:     int pad_index = nx % 4;
	movl	%esi, %eax	# nx, tmp272
	sarl	$31, %eax	#, tmp272
	shrl	$30, %eax	#, tmp273
	leal	(%rsi,%rax), %r12d	#, tmp274
	andl	$3, %r12d	#, tmp275
	subl	%eax, %r12d	# tmp273, tmp276
# /box/cp.cc:33:     std::vector<double> X(nx * ny);
	movl	%esi, %eax	# nx, tmp277
	imull	%edi, %eax	# ny, tmp277
# /box/cp.cc:33:     std::vector<double> X(nx * ny);
	cltq
	movq	%rax, -128(%rbp)	# _4, %sfp
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	shrq	$60, %rax	#, tmp436
	jne	.L73	#,
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	movq	-128(%rbp), %rax	# %sfp, _4
	movq	$0, -136(%rbp)	#, %sfp
	movl	%edi, %ebx	# tmp419, ny
	movl	%esi, %r13d	# tmp420, nx
	testq	%rax, %rax	# _4
	je	.L3	#,
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	leaq	0(,%rax,8), %r14	#, _220
	movq	%r14, %rdi	# _220,
.LEHB0:
	call	_Znwm@PLT	#
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	cmpq	$1, -128(%rbp)	#, %sfp
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, -136(%rbp)	# iftmp.10_193, %sfp
# /usr/include/c++/12/bits/stl_construct.h:119:       ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
	movq	$0x000000000, (%rax)	#, *_221
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	je	.L42	#,
# /usr/include/c++/12/bits/stl_uninitialized.h:662: 	      ++__first;
	leaq	8(%rax), %rdi	#, __first
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	addq	%r14, %rax	# _220, tmp282
# /usr/include/c++/12/bits/stl_algobase.h:921:       for (; __first != __last; ++__first)
	cmpq	%rax, %rdi	# tmp282, __first
	je	.L4	#,
# /usr/include/c++/12/bits/stl_algobase.h:922: 	*__first = __tmp;
	leaq	-8(%r14), %rdx	#, tmp283
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L4:
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%r14, -128(%rbp)	# _220, %sfp
.L3:
# /box/cp.cc:34:     double4_t *Xvec = double4_alloc(ny * nv);
	movl	%r15d, %edx	# tmp271, tmp288
	imull	%ebx, %edx	# ny, tmp288
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	leaq	-64(%rbp), %rdi	#, tmp291
	movl	$32, %esi	#,
# /box/cp.cc:34:     double4_t *Xvec = double4_alloc(ny * nv);
	movslq	%edx, %rdx	# tmp288, tmp289
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	salq	$5, %rdx	#, tmp290
# /box/cp.cc:18:     void *tmp = 0;
	movq	$0, -64(%rbp)	#, tmp
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	call	posix_memalign@PLT	#
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	testl	%eax, %eax	# tmp424
	jne	.L61	#,
# /box/cp.cc:23:     return (double4_t *)tmp;
	movq	-64(%rbp), %r14	# tmp, _207
# /box/cp.cc:36:     for (int y = 0; y < ny; y++)
	testl	%ebx, %ebx	# ny
	jle	.L7	#,
	movslq	%r15d, %rax	# tmp271, nv
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	leal	-1(%r15), %esi	#, row
	salq	$5, %rax	#, nv
	movslq	%esi, %rdx	# row, row
	movq	%rax, -104(%rbp)	# nv, %sfp
	movslq	%r12d, %rax	# tmp276, pad_index
	leaq	(%rax,%rdx,4), %rax	#, tmp339
	leaq	(%r14,%rax,8), %rax	#, ivtmp.141
	movq	%rax, -96(%rbp)	# ivtmp.141, %sfp
	vxorps	%xmm3, %xmm3, %xmm3	# tmp428
# /box/cp.cc:80:                     Xvec[row][pad_idx] = (double)0;
	movl	$4, %eax	#, tmp342
	subl	%r12d, %eax	# tmp276, tmp343
	vcvtsi2sdl	%r13d, %xmm3, %xmm0	# nx, tmp428, tmp434
	salq	$3, %rax	#, _362
	movq	%rax, -80(%rbp)	# _362, %sfp
# /box/cp.cc:36:     for (int y = 0; y < ny; y++)
	xorl	%r9d, %r9d	# y
# /box/cp.cc:80:                     Xvec[row][pad_idx] = (double)0;
	xorl	%r11d, %r11d	# ivtmp.172
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	movl	%esi, -84(%rbp)	# row, %sfp
	movl	%r15d, %ecx	# tmp271, tmp271
	movq	%r14, %rsi	# _207, _207
# /box/cp.cc:80:                     Xvec[row][pad_idx] = (double)0;
	xorl	%r12d, %r12d	# ivtmp.171
	vmovsd	%xmm0, -112(%rbp)	# tmp434, %sfp
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp418
	movl	%r11d, %r14d	# ivtmp.172, ivtmp.172
	movl	%ebx, %edx	# ny, ny
	movl	%r9d, %r15d	# y, y
.L23:
# /box/cp.cc:41:         for (int x = 0; x < nx; x += 2)
	testl	%r13d, %r13d	# nx
	jle	.L17	#,
	movq	-72(%rbp), %rdi	# %sfp, data
	movslq	%r12d, %rax	# ivtmp.171, ivtmp.171
# /box/cp.cc:40:         double ave2 = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# ave2
	leaq	(%rdi,%rax,4), %rbx	#, _140
# /box/cp.cc:39:         double ave1 = 0;
	vmovsd	%xmm0, %xmm0, %xmm1	#, ave1
# /box/cp.cc:43:             ave1 += (double)data[x + y * nx];
	xorl	%eax, %eax	# ivtmp.162
# /box/cp.cc:46:                 ave2 += (double)data[x + 1 + y * nx];
	leal	1(%r12), %r8d	#, tmp417
.L9:
# /box/cp.cc:44:             if (x + 1 < nx)
	leal	1(%rax), %edi	#, tmp300
# /box/cp.cc:43:             ave1 += (double)data[x + y * nx];
	vcvtss2sd	(%rbx,%rax,4), %xmm3, %xmm2	# MEM[(const float *)_140 + ivtmp.162_150 * 4], tmp428, tmp429
# /box/cp.cc:43:             ave1 += (double)data[x + y * nx];
	vaddsd	%xmm2, %xmm1, %xmm1	# tmp299, ave1, ave1
# /box/cp.cc:44:             if (x + 1 < nx)
	cmpl	%r13d, %edi	# nx, tmp300
	jge	.L8	#,
# /box/cp.cc:46:                 ave2 += (double)data[x + 1 + y * nx];
	movq	-72(%rbp), %r11	# %sfp, data
# /box/cp.cc:46:                 ave2 += (double)data[x + 1 + y * nx];
	leal	(%r8,%rax), %edi	#, tmp302
	movslq	%edi, %rdi	# tmp302, tmp303
# /box/cp.cc:46:                 ave2 += (double)data[x + 1 + y * nx];
	vcvtss2sd	(%r11,%rdi,4), %xmm3, %xmm2	# *_19, tmp428, tmp430
# /box/cp.cc:46:                 ave2 += (double)data[x + 1 + y * nx];
	vaddsd	%xmm2, %xmm0, %xmm0	# tmp304, ave2, ave2
.L8:
# /box/cp.cc:41:         for (int x = 0; x < nx; x += 2)
	addq	$2, %rax	#, ivtmp.162
	cmpl	%eax, %r13d	# ivtmp.162, nx
	jg	.L9	#,
# /box/cp.cc:49:         double ave = (ave1 + ave2) / nx;
	vaddsd	%xmm1, %xmm0, %xmm1	# ave1, ave2, tmp305
# /box/cp.cc:53:         double std2 = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# std2
# /box/cp.cc:49:         double ave = (ave1 + ave2) / nx;
	xorl	%eax, %eax	# ivtmp.150
# /box/cp.cc:52:         double std1 = 0;
	vmovsd	%xmm0, %xmm0, %xmm4	#, std1
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	leal	1(%r12), %r8d	#, tmp416
# /box/cp.cc:49:         double ave = (ave1 + ave2) / nx;
	vdivsd	-112(%rbp), %xmm1, %xmm1	# %sfp, tmp305, ave
.L11:
# /box/cp.cc:56:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vcvtss2sd	(%rbx,%rax,4), %xmm3, %xmm2	# MEM[(const float *)_140 + ivtmp.150_210 * 4], tmp428, tmp431
# /box/cp.cc:56:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm2, %xmm2	# ave, tmp306, _31
# /box/cp.cc:57:             if (x + 1 < nx)
	leal	1(%rax), %edi	#, tmp307
# /box/cp.cc:56:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vfmadd231sd	%xmm2, %xmm2, %xmm4	# _31, _31, std1
# /box/cp.cc:57:             if (x + 1 < nx)
	cmpl	%edi, %r13d	# tmp307, nx
	jle	.L10	#,
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	movq	-72(%rbp), %r11	# %sfp, data
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	leal	(%r8,%rax), %edi	#, tmp309
	movslq	%edi, %rdi	# tmp309, tmp310
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vcvtss2sd	(%r11,%rdi,4), %xmm3, %xmm2	# *_36, tmp428, tmp432
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm2, %xmm2	# ave, tmp311, _39
# /box/cp.cc:59:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vfmadd231sd	%xmm2, %xmm2, %xmm0	# _39, _39, std2
.L10:
# /box/cp.cc:54:         for (int x = 0; x < nx; x += 2)
	addq	$2, %rax	#, ivtmp.150
	cmpl	%eax, %r13d	# ivtmp.150, nx
	jg	.L11	#,
# /box/cp.cc:62:         double std = sqrt(std1 + std2);
	vaddsd	%xmm4, %xmm0, %xmm0	# std1, std2, _40
	vucomisd	%xmm0, %xmm5	# _40, tmp418
	ja	.L62	#,
	vsqrtsd	%xmm0, %xmm0, %xmm0	# _40, std
.L14:
	movslq	%r13d, %r8	# nx, _211
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	xorl	%edi, %edi	# ivtmp.144
.L15:
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vcvtss2sd	(%rbx,%rdi,4), %xmm3, %xmm2	# MEM[(const float *)_140 + ivtmp.144_239 * 4], tmp428, tmp433
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vsubsd	%xmm1, %xmm2, %xmm2	# ave, tmp321, tmp322
# /box/cp.cc:68:             int offset = x / 4;
	movl	%edi, %eax	# ivtmp.144, offset
	sarl	$2, %eax	#, offset
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vdivsd	%xmm0, %xmm2, %xmm2	# std, tmp322, tmp323
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	addl	%r14d, %eax	# ivtmp.172, tmp315
	cltq
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	movq	%rdi, %r9	# ivtmp.144, tmp320
	salq	$5, %rax	#, tmp317
	addq	%rsi, %rax	# _207, tmp318
	andl	$3, %r9d	#, tmp320
# /box/cp.cc:66:         for (int x = 0; x < nx; x++)
	incq	%rdi	# ivtmp.144
# /box/cp.cc:69:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vmovsd	%xmm2, (%rax,%r9,8)	# tmp323, VIEW_CONVERT_EXPR<double[4]>(*_53)[_54]
# /box/cp.cc:66:         for (int x = 0; x < nx; x++)
	cmpq	%rdi, %r8	# ivtmp.144, _211
	jne	.L15	#,
# /box/cp.cc:73:         if (pad_index > 0)
	testb	$3, %r13b	#, nx
	jne	.L74	#,
.L17:
# /box/cp.cc:36:     for (int y = 0; y < ny; y++)
	incl	%r15d	# y
# /box/cp.cc:36:     for (int y = 0; y < ny; y++)
	addl	%r13d, %r12d	# nx, ivtmp.171
	addl	%ecx, %r14d	# tmp271, ivtmp.172
	cmpl	%edx, %r15d	# ny, y
	jne	.L23	#,
	leal	(%rcx,%rcx,2), %eax	#, tmp380
	leal	(%rax,%rax), %r8d	#, tmp381
	leal	(%rdx,%rdx,2), %eax	#, tmp384
	leal	(%rax,%rax), %r12d	#, tmp385
	movl	$0, -144(%rbp)	#, %sfp
	movslq	%edx, %rax	# ny, ny
# /box/cp.cc:125:                         res += temp[m];
	movl	%r13d, -156(%rbp)	# nx, %sfp
	salq	$2, %rax	#, _417
	movq	%rsi, %r14	# _207, _207
# /box/cp.cc:36:     for (int y = 0; y < ny; y++)
	xorl	%esi, %esi	# ivtmp.133
	movq	%rax, -112(%rbp)	# _417, %sfp
	movl	%ecx, %r15d	# tmp271, tmp271
	movl	%edx, %ebx	# ny, ny
	xorl	%eax, %eax	# ivtmp.135
	xorl	%r10d, %r10d	# ivtmp.132
# /box/cp.cc:125:                         res += temp[m];
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp409
	movl	%esi, %ecx	# ivtmp.133, ivtmp.133
	movl	%r8d, %r9d	# tmp381, tmp381
.L33:
# /box/cp.cc:90:     for (int r = 0; r < ny; r += s)
	leal	6(%rax), %edx	#, tmp387
	cmpl	%ebx, %edx	# ny, tmp387
	movl	%edx, %esi	# tmp387, tmp387
	cmovg	%ebx, %esi	# tmp387,, ny, tmp387
	movslq	%ecx, %rdx	# ivtmp.133, ivtmp.133
	movl	%eax, -88(%rbp)	# ivtmp.135, %sfp
	movl	%eax, %r8d	# ivtmp.135, ivtmp.123
	leaq	(%rdx,%rax), %r13	#, ivtmp.126
	movl	%r10d, %edi	# ivtmp.132, ivtmp.124
	cmpl	%eax, %esi	# ivtmp.135, _244
	jle	.L35	#,
	movl	%r12d, -172(%rbp)	# tmp385, %sfp
	movq	%rax, -168(%rbp)	# ivtmp.135, %sfp
	movl	%r9d, %eax	# tmp381, tmp381
	movl	%ecx, -160(%rbp)	# ivtmp.133, %sfp
	movl	%r8d, %r9d	# ivtmp.123, ivtmp.123
	movl	%edi, %ecx	# ivtmp.124, ivtmp.124
	movl	%eax, %r8d	# tmp381, tmp381
.L32:
	movl	%r9d, %eax	# ivtmp.123, c
	addl	$6, %r9d	#, ivtmp.123
	cmpl	%ebx, %r9d	# ny, ivtmp.123
	movl	%ebx, %edx	# ny, _190
	cmovle	%r9d, %edx	# ivtmp.123,, _190
	cmpl	%edx, %eax	# _190, c
	jge	.L26	#,
	subl	%eax, %edx	# c, _422
	movq	-152(%rbp), %rdi	# %sfp, result
	leaq	0(%r13,%rdx), %rax	#, tmp346
	leaq	(%rdi,%rax,4), %r12	#, ivtmp.114
	movq	%rdx, %rax	# _422, _422
	negq	%rax	# _422
	leaq	0(,%rax,4), %rdi	#, tmp350
	movl	%esi, -96(%rbp)	# _244, %sfp
	movl	%r10d, -176(%rbp)	# ivtmp.132, %sfp
	movl	%r9d, -180(%rbp)	# ivtmp.123, %sfp
	movl	%ecx, -104(%rbp)	# ivtmp.124, %sfp
	movl	%ebx, -184(%rbp)	# ny, %sfp
	movq	%rdi, -120(%rbp)	# tmp350, %sfp
	movl	%r8d, -196(%rbp)	# tmp381, %sfp
	movq	%r13, -192(%rbp)	# ivtmp.126, %sfp
# /box/cp.cc:96:             int i_up = std::min(c + s, ny);
	movl	-144(%rbp), %eax	# %sfp, ivtmp.116
	movl	-88(%rbp), %edx	# %sfp, j
	movl	-156(%rbp), %r13d	# %sfp, nx
	.p2align 4,,10
	.p2align 3
.L27:
	movq	-120(%rbp), %rsi	# %sfp, tmp350
	movslq	%eax, %r8	# ivtmp.116, ivtmp.116
	salq	$5, %r8	#, _248
	movl	%edx, -84(%rbp)	# j, %sfp
	leaq	(%rsi,%r12), %r11	#, ivtmp.105
# /box/cp.cc:90:     for (int r = 0; r < ny; r += s)
	movl	-104(%rbp), %ebx	# %sfp, ivtmp.108
	leaq	(%r14,%r8), %rsi	#, ivtmp.91
	movq	%rsi, -80(%rbp)	# ivtmp.91, %sfp
# /box/cp.cc:115:                             int j_idx = j * nv + k + 1;
	leal	1(%rax), %r10d	#, tmp397
	movl	%eax, %esi	# ivtmp.116, ivtmp.116
	.p2align 4,,10
	.p2align 3
.L31:
# /box/cp.cc:106:                     for (int k = 0; k < nv; k += 2)
	testl	%r13d, %r13d	# nx
	jle	.L43	#,
# /box/cp.cc:114:                             int i_idx = i * nv + k + 1;
	movl	%ebx, -72(%rbp)	# ivtmp.108, %sfp
	movslq	%ebx, %rdi	# ivtmp.108, ivtmp.108
# /box/cp.cc:102:                     double4_t temp = {0, 0, 0, 0};
	vxorpd	%xmm0, %xmm0, %xmm0	# temp
# /box/cp.cc:108:                         int i_idx = i * nv + k;
	movq	-80(%rbp), %rdx	# %sfp, ivtmp.91
	salq	$5, %rdi	#, _373
# /box/cp.cc:106:                     for (int k = 0; k < nv; k += 2)
	xorl	%eax, %eax	# k
# /box/cp.cc:103:                     double4_t temp1 = {0, 0, 0, 0};
	vmovapd	%ymm0, %ymm1	#, temp1
# /box/cp.cc:114:                             int i_idx = i * nv + k + 1;
	leal	1(%rbx), %r9d	#, tmp395
	.p2align 4,,10
	.p2align 3
.L30:
# /box/cp.cc:110:                         temp += Xvec[j_idx] * Xvec[i_idx];
	vmovapd	(%rdx), %ymm6	# MEM[(double4_t *)_283], tmp600
# /box/cp.cc:110:                         temp += Xvec[j_idx] * Xvec[i_idx];
	movq	%rdx, %rcx	# ivtmp.91, tmp352
	subq	%r8, %rcx	# _248, tmp352
# /box/cp.cc:110:                         temp += Xvec[j_idx] * Xvec[i_idx];
	vfmadd231pd	(%rcx,%rdi), %ymm6, %ymm0	# MEM[(double4_t *)_377 + _373 * 1], tmp600, temp
# /box/cp.cc:112:                         if (k + 1 < nv)
	leal	1(%rax), %ecx	#, tmp353
	cmpl	%ecx, %r15d	# tmp353, tmp271
	jle	.L29	#,
# /box/cp.cc:115:                             int j_idx = j * nv + k + 1;
	leal	(%r10,%rax), %ebx	#, j_idx
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	movslq	%ebx, %rbx	# j_idx, j_idx
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	salq	$5, %rbx	#, tmp357
# /box/cp.cc:114:                             int i_idx = i * nv + k + 1;
	leal	(%r9,%rax), %ecx	#, i_idx
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	vmovapd	(%r14,%rbx), %ymm7	# *_78, tmp601
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	movslq	%ecx, %rcx	# i_idx, i_idx
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	salq	$5, %rcx	#, tmp362
# /box/cp.cc:116:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	vfmadd231pd	(%r14,%rcx), %ymm7, %ymm1	# *_82, tmp601, temp1
.L29:
# /box/cp.cc:106:                     for (int k = 0; k < nv; k += 2)
	addl	$2, %eax	#, k
# /box/cp.cc:106:                     for (int k = 0; k < nv; k += 2)
	addq	$64, %rdx	#, ivtmp.91
	cmpl	%eax, %r15d	# k, tmp271
	jg	.L30	#,
# /box/cp.cc:119:                     temp += temp1;
	vaddpd	%ymm1, %ymm0, %ymm0	# temp1, temp, _439
	movl	-72(%rbp), %ebx	# %sfp, ivtmp.108
# /box/cp.cc:125:                         res += temp[m];
	vaddsd	%xmm3, %xmm0, %xmm1	# tmp409, tmp364, tmp366
	vunpckhpd	%xmm0, %xmm0, %xmm2	# tmp365, tmp368
	vaddsd	%xmm2, %xmm1, %xmm1	# tmp368, tmp366, tmp370
	vextractf64x2	$1, %ymm0, %xmm2	#, _439, tmp371
	valignq	$3, %ymm0, %ymm0, %ymm0	#, _439, tmp374
	vaddsd	%xmm2, %xmm1, %xmm1	# tmp371, tmp370, tmp373
	vaddsd	%xmm0, %xmm1, %xmm0	# tmp374, tmp373, tmp376
# /box/cp.cc:127:                     result[j * ny + i] = float(res);
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp376, _457
.L28:
# /box/cp.cc:127:                     result[j * ny + i] = float(res);
	vmovss	%xmm0, (%r11)	# _457, MEM[(float *)_406]
# /box/cp.cc:100:                 for (int i = c; i < i_up; i++)
	addq	$4, %r11	#, ivtmp.105
	addl	%r15d, %ebx	# tmp271, ivtmp.108
	cmpq	%r12, %r11	# ivtmp.114, ivtmp.105
	jne	.L31	#,
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	movl	%esi, %eax	# ivtmp.116, ivtmp.116
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	movq	-112(%rbp), %rsi	# %sfp, _417
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	movl	-84(%rbp), %edx	# %sfp, j
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	addq	%rsi, %r12	# _417, ivtmp.114
	movl	-96(%rbp), %esi	# %sfp, _244
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	incl	%edx	# j
# /box/cp.cc:98:             for (int j = r; j < j_up; j++)
	addl	%r15d, %eax	# tmp271, ivtmp.116
	cmpl	%esi, %edx	# _244, j
	jne	.L27	#,
	movl	-176(%rbp), %r10d	# %sfp, ivtmp.132
	movl	-180(%rbp), %r9d	# %sfp, ivtmp.123
	movq	-192(%rbp), %r13	# %sfp, ivtmp.126
	movl	-104(%rbp), %ecx	# %sfp, ivtmp.124
	movl	-184(%rbp), %ebx	# %sfp, ny
	movl	-196(%rbp), %r8d	# %sfp, tmp381
.L26:
# /box/cp.cc:93:         for (int c = r; c < ny; c += s)
	addl	%r8d, %ecx	# tmp381, ivtmp.124
	addq	$6, %r13	#, ivtmp.126
	cmpl	%ebx, %r9d	# ny, ivtmp.123
	jl	.L32	#,
	movq	-168(%rbp), %rax	# %sfp, ivtmp.135
	movl	-160(%rbp), %ecx	# %sfp, ivtmp.133
	movl	-172(%rbp), %r12d	# %sfp, tmp385
	movl	%r8d, %r9d	# tmp381, tmp381
.L35:
# /box/cp.cc:90:     for (int r = 0; r < ny; r += s)
	addq	$6, %rax	#, ivtmp.135
	addl	%r9d, -144(%rbp)	# tmp381, %sfp
	addl	%r9d, %r10d	# tmp381, ivtmp.132
	addl	%r12d, %ecx	# tmp385, ivtmp.133
	cmpl	%eax, %ebx	# ivtmp.135, ny
	jg	.L33	#,
	vzeroupper
.L7:
# /box/cp.cc:132:     std::free(Xvec);
	movq	%r14, %rdi	# _207,
	call	free@PLT	#
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	cmpq	$0, -136(%rbp)	#, %sfp
	je	.L1	#,
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	-56(%rbp), %rax	# D.84797, tmp437
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp437
	jne	.L71	#,
	movq	-128(%rbp), %rsi	# %sfp,
	movq	-136(%rbp), %rdi	# %sfp,
# /box/cp.cc:133: }
	addq	$168, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-16(%r13), %rsp	#,
	.cfi_def_cfa 7, 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	jmp	_ZdlPvm@PLT	#
.L74:
	.cfi_restore_state
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	movl	-84(%rbp), %r9d	# %sfp, row
	cmpl	%edx, %r9d	# ny, row
	jge	.L17	#,
	movq	-96(%rbp), %rdi	# %sfp, ivtmp.141
	movl	-80(%rbp), %ebx	# %sfp, _362
# /box/cp.cc:80:                     Xvec[row][pad_idx] = (double)0;
	xorl	%r10d, %r10d	# tmp326
.L22:
	movq	$0, (%rdi)	#,* ivtmp.141
	movq	$0, -8(%rdi,%rbx)	#,
	leaq	8(%rdi), %r8	#, tmp330
	andq	$-8, %r8	#, tmp330
	movl	-80(%rbp), %r11d	# %sfp, tmp587
	movq	%rdi, %rax	# ivtmp.141, ivtmp.141
	subq	%r8, %rax	# tmp330, ivtmp.141
	addl	%r11d, %eax	# tmp587, _362
	andl	$-8, %eax	#, _362
	cmpl	$8, %eax	#, _362
	jb	.L19	#,
	andl	$-8, %eax	#, tmp332
	movl	%ecx, -120(%rbp)	# tmp271, %sfp
	xorl	%r11d, %r11d	# tmp331
	movl	%edx, %ecx	# ny, ny
	movl	%eax, %edx	# tmp332, tmp332
.L20:
	movl	%r11d, %eax	# tmp331, tmp333
	addl	$8, %r11d	#, tmp331
	movq	%r10, (%r8,%rax)	# tmp326,
	cmpl	%edx, %r11d	# tmp332, tmp331
	jb	.L20	#,
	movl	%ecx, %edx	# ny, ny
	movl	-120(%rbp), %ecx	# %sfp, tmp271
.L19:
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	movq	-104(%rbp), %rax	# %sfp, _276
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	addl	%ecx, %r9d	# tmp271, row
# /box/cp.cc:75:             for (int row = nv - 1; row < ny; row += nv)
	addq	%rax, %rdi	# _276, ivtmp.141
	cmpl	%edx, %r9d	# ny, row
	jl	.L22	#,
	jmp	.L17	#
	.p2align 4,,10
	.p2align 3
.L43:
# /box/cp.cc:106:                     for (int k = 0; k < nv; k += 2)
	vxorps	%xmm0, %xmm0, %xmm0	# _457
	jmp	.L28	#
.L1:
# /box/cp.cc:133: }
	movq	-56(%rbp), %rax	# D.84797, tmp438
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp438
	jne	.L71	#,
	addq	$168, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-16(%r13), %rsp	#,
	.cfi_def_cfa 7, 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L42:
	.cfi_restore_state
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	$8, -128(%rbp)	#, %sfp
	jmp	.L3	#
.L73:
# /usr/include/c++/12/bits/stl_vector.h:1905: 	  __throw_length_error(
	leaq	.LC2(%rip), %rdi	#, tmp279
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE0:
.L71:
# /box/cp.cc:133: }
	call	__stack_chk_fail@PLT	#
.L62:
	movl	%ecx, -156(%rbp)	# tmp271, %sfp
	movl	%edx, -88(%rbp)	# ny, %sfp
	movq	%rsi, -144(%rbp)	# _207, %sfp
	vmovsd	%xmm1, -120(%rbp)	# ave, %sfp
# /box/cp.cc:62:         double std = sqrt(std1 + std2);
	call	sqrt@PLT	#
	movl	-156(%rbp), %ecx	# %sfp, tmp271
	movl	-88(%rbp), %edx	# %sfp, ny
	movq	-144(%rbp), %rsi	# %sfp, _207
	vmovsd	-120(%rbp), %xmm1	# %sfp, ave
	vxorps	%xmm3, %xmm3, %xmm3	# tmp428
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp418
	jmp	.L14	#
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3794:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3794-.LLSDACSB3794
.LLSDACSB3794:
	.uleb128 .LEHB0-.LFB3794
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
.LLSDACSE3794:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3794
	.type	_Z9correlateiiPKfPf.cold, @function
_Z9correlateiiPKfPf.cold:
.LFSB3794:
.L61:
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_offset 13, -16
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
# /box/cp.cc:21:         throw std::bad_alloc();
	movl	$8, %edi	#,
	call	__cxa_allocate_exception@PLT	#
	movq	%rax, %rdi	# tmp425, tmp292
# /usr/include/c++/12/new:58:     bad_alloc() throw() { }
	leaq	16+_ZTVSt9bad_alloc(%rip), %rax	#, tmp578
	movq	%rax, (%rdi)	# tmp578, MEM[(struct bad_alloc *)_206].D.20645._vptr.exception
# /box/cp.cc:21:         throw std::bad_alloc();
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx	#,
	leaq	_ZTISt9bad_alloc(%rip), %rsi	#, tmp296
.LEHB1:
	call	__cxa_throw@PLT	#
.LEHE1:
.L44:
	endbr64	
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	cmpq	$0, -136(%rbp)	#, %sfp
	movq	%rax, %rbx	# tmp427, tmp389
	je	.L68	#,
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	-128(%rbp), %rsi	# %sfp,
	movq	-136(%rbp), %rdi	# %sfp,
	vzeroupper
	call	_ZdlPvm@PLT	#
.L39:
	movq	%rbx, %rdi	# tmp389,
.LEHB2:
	call	_Unwind_Resume@PLT	#
.LEHE2:
.L68:
	vzeroupper
	jmp	.L39	#
	.cfi_endproc
.LFE3794:
	.section	.gcc_except_table
.LLSDAC3794:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3794-.LLSDACSBC3794
.LLSDACSBC3794:
	.uleb128 .LEHB1-.LCOLDB3
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L44-.LCOLDB3
	.uleb128 0
	.uleb128 .LEHB2-.LCOLDB3
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSEC3794:
	.section	.text.unlikely
	.text
	.size	_Z9correlateiiPKfPf, .-_Z9correlateiiPKfPf
	.section	.text.unlikely
	.size	_Z9correlateiiPKfPf.cold, .-_Z9correlateiiPKfPf.cold
.LCOLDE3:
	.text
.LHOTE3:
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
