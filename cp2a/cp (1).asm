	.file	"cp.cc"
# GNU C++20 (Ubuntu 12.1.0-2ubuntu1~22.04) version 12.1.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.1.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=cascadelake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mavx512f -mbmi -mbmi2 -maes -mpclmul -mavx512vl -mavx512bw -mavx512dq -mavx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mavx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=19712 -mtune=cascadelake -O3 -std=c++20 -fno-tree-vectorize -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.p2align 4
	.globl	_Z9correlateiiPKfPf
	.type	_Z9correlateiiPKfPf, @function
_Z9correlateiiPKfPf:
.LFB1779:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# /box/cp.cc:16:     std::vector<double> X(nx * ny);
	movl	%edi, %eax	# ny, tmp158
	imull	%esi, %eax	# nx, tmp158
# /box/cp.cc:12: {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx	# tmp194, nx
# /box/cp.cc:16:     std::vector<double> X(nx * ny);
	movslq	%eax, %rsi	# tmp158, _168
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	movq	%rsi, %rax	# _168, tmp204
# /box/cp.cc:12: {
	subq	$88, %rsp	#,
	.cfi_def_cfa_offset 144
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	shrq	$60, %rax	#, tmp204
# /box/cp.cc:12: {
	movl	%edi, 20(%rsp)	# ny, %sfp
	movq	%rdx, 32(%rsp)	# tmp195, %sfp
	movq	%rcx, 24(%rsp)	# tmp196, %sfp
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	jne	.L45	#,
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	testq	%rsi, %rsi	# _168
	je	.L46	#,
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	leaq	0(,%rsi,8), %rbp	#, _112
	movq	%rbp, %rdi	# _112,
	movq	%rsi, 8(%rsp)	# _168, %sfp
	call	_Znwm@PLT	#
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	movq	8(%rsp), %rsi	# %sfp, _168
# /usr/include/c++/12/bits/stl_construct.h:119:       ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
	movq	$0x000000000, (%rax)	#, *_113
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r12	# tmp197, iftmp.1_165
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	cmpq	$1, %rsi	#, _168
	je	.L6	#,
# /usr/include/c++/12/bits/stl_uninitialized.h:662: 	      ++__first;
	leaq	8(%rax), %rdi	#, __first
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	(%rax,%rbp), %rax	#, tmp163
# /usr/include/c++/12/bits/stl_algobase.h:921:       for (; __first != __last; ++__first)
	cmpq	%rax, %rdi	# tmp163, __first
	je	.L43	#,
# /usr/include/c++/12/bits/stl_algobase.h:922: 	*__first = __tmp;
	leaq	-8(%rbp), %rdx	#, tmp164
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L43:
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	movl	20(%rsp), %edx	# %sfp,
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%rbp, %rsi	# _112, _168
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	testl	%edx, %edx	#
	jle	.L9	#,
.L4:
	vxorps	%xmm3, %xmm3, %xmm3	# tmp199
	vcvtsi2sdl	%ebx, %xmm3, %xmm4	# nx, tmp199, tmp200
	movslq	20(%rsp), %r13	# %sfp, ny
	movq	%rsi, 40(%rsp)	# _168, %sfp
	salq	$2, %r13	#, _240
# /box/cp.cc:43:         for (int x = 0; x <= y; x++)
	xorl	%r15d, %r15d	# ivtmp.102
	xorl	%eax, %eax	# ivtmp.101
	xorl	%r14d, %r14d	# ivtmp.98
	movslq	%ebx, %rbp	# nx, nx
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp192
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%r14d, %edx	# ivtmp.98, _171
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	testl	%ebx, %ebx	# nx
	jle	.L18	#,
	movq	32(%rsp), %rdi	# %sfp, data
	movslq	%eax, %r9	# ivtmp.101, _197
	leaq	(%rdi,%r9,4), %r8	#, _195
	leaq	0(%rbp,%r9), %rsi	#, tmp171
	leaq	(%rdi,%rsi,4), %rdi	#, _188
	movq	%r8, %rcx	# _195, ivtmp.90
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	movq	%r8, %rsi	# _195, ivtmp.95
# /box/cp.cc:20:         double ave = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# ave
	.p2align 4,,10
	.p2align 3
.L11:
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	vcvtss2sd	(%rsi), %xmm3, %xmm1	# MEM[(const float *)_194], tmp199, tmp201
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	addq	$4, %rsi	#, ivtmp.95
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	vaddsd	%xmm1, %xmm0, %xmm0	# tmp173, ave, ave
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	cmpq	%rsi, %rdi	# ivtmp.95, _188
	jne	.L11	#,
# /box/cp.cc:25:         ave = ave / nx;
	vdivsd	%xmm4, %xmm0, %xmm1	# _265, ave, ave
# /box/cp.cc:28:         double std = 0;
	vxorpd	%xmm2, %xmm2, %xmm2	# std
	.p2align 4,,10
	.p2align 3
.L12:
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vcvtss2sd	(%rcx), %xmm3, %xmm0	# MEM[(const float *)_211], tmp199, tmp202
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp174, _18
# /box/cp.cc:29:         for (int x = 0; x < nx; x++)
	addq	$4, %rcx	#, ivtmp.90
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vfmadd231sd	%xmm0, %xmm0, %xmm2	# _18, _18, std
# /box/cp.cc:29:         for (int x = 0; x < nx; x++)
	cmpq	%rcx, %rdi	# ivtmp.90, _188
	jne	.L12	#,
	vucomisd	%xmm2, %xmm5	# std, tmp192
	ja	.L37	#,
# /box/cp.cc:33:         std = sqrt(std);
	vsqrtsd	%xmm2, %xmm2, %xmm2	# std, std
.L15:
	leaq	(%r12,%r9,8), %rsi	#, _219
# /box/cp.cc:28:         double std = 0;
	xorl	%ecx, %ecx	# ivtmp.82
	.p2align 4,,10
	.p2align 3
.L16:
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vcvtss2sd	(%r8,%rcx,4), %xmm3, %xmm0	# MEM[(const float *)_195 + ivtmp.82_226 * 4], tmp199, tmp203
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp182, tmp183
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vdivsd	%xmm2, %xmm0, %xmm0	# std, tmp183, tmp184
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vmovsd	%xmm0, (%rsi,%rcx,8)	# tmp184, MEM[(value_type &)_219 + ivtmp.82_226 * 8]
# /box/cp.cc:36:         for (int x = 0; x < nx; x++)
	incq	%rcx	# ivtmp.82
	cmpq	%rcx, %rbp	# ivtmp.82, nx
	jne	.L16	#,
.L18:
	movq	24(%rsp), %rdi	# %sfp, result
	movslq	%r15d, %r9	# ivtmp.102, _259
	movq	%r12, 8(%rsp)	# iftmp.1_165, %sfp
	leaq	0(%rbp,%r9), %rcx	#, tmp180
	leaq	(%rdi,%r14,4), %r8	#, ivtmp.78
	leaq	(%r12,%r9,8), %r11	#, ivtmp.70
	leaq	(%r12,%rcx,8), %rcx	#, _244
# /box/cp.cc:46:             for (int k = 0; k < nx; k++)
	xorl	%edi, %edi	# ivtmp.80
# /box/cp.cc:43:         for (int x = 0; x <= y; x++)
	xorl	%esi, %esi	# x
	leal	1(%rdx), %r10d	#, tmp189
	.p2align 4,,10
	.p2align 3
.L17:
	movslq	%edi, %r12	# ivtmp.80, _34
# /box/cp.cc:48:                 temp += X[k + y * nx] * X[k + x * nx];
	movq	%r11, %rdx	# ivtmp.70, ivtmp.70
# /box/cp.cc:45:             double temp = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# temp
# /box/cp.cc:48:                 temp += X[k + y * nx] * X[k + x * nx];
	subq	%r9, %r12	# _259, tmp186
# /box/cp.cc:46:             for (int k = 0; k < nx; k++)
	testl	%ebx, %ebx	# nx
	jle	.L47	#,
	.p2align 4,,10
	.p2align 3
.L19:
# /box/cp.cc:48:                 temp += X[k + y * nx] * X[k + x * nx];
	vmovsd	(%rdx), %xmm6	# MEM[(value_type &)_256], tmp292
	vfmadd231sd	(%rdx,%r12,8), %xmm6, %xmm0	# MEM[(value_type &)_256 + _251 * 8], tmp292, temp
# /box/cp.cc:46:             for (int k = 0; k < nx; k++)
	addq	$8, %rdx	#, ivtmp.70
	cmpq	%rcx, %rdx	# _244, ivtmp.70
	jne	.L19	#,
# /box/cp.cc:50:             result[y + x * ny] = float(temp);
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# temp, _262
.L22:
# /box/cp.cc:43:         for (int x = 0; x <= y; x++)
	incl	%esi	# x
# /box/cp.cc:50:             result[y + x * ny] = float(temp);
	vmovss	%xmm0, (%r8)	# _262, MEM[(float *)_230]
# /box/cp.cc:43:         for (int x = 0; x <= y; x++)
	addl	%ebx, %edi	# nx, ivtmp.80
	addq	%r13, %r8	# _240, ivtmp.78
	cmpl	%r10d, %esi	# tmp189, x
	jne	.L17	#,
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	incq	%r14	# ivtmp.98
	movq	8(%rsp), %r12	# %sfp, iftmp.1_165
	addl	%ebx, %eax	# nx, ivtmp.101
	addl	%ebx, %r15d	# nx, ivtmp.102
	cmpl	%r14d, 20(%rsp)	# ivtmp.98, %sfp
	jg	.L10	#,
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	movq	40(%rsp), %rsi	# %sfp, _168
	testq	%r12, %r12	# iftmp.1_165
	je	.L39	#,
.L9:
# /box/cp.cc:53: }
	addq	$88, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r12, %rdi	# iftmp.1_165,
# /box/cp.cc:53: }
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	jmp	_ZdlPvm@PLT	#
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
# /box/cp.cc:46:             for (int k = 0; k < nx; k++)
	vxorps	%xmm0, %xmm0, %xmm0	# _262
	jmp	.L22	#
.L46:
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	movl	20(%rsp), %ecx	# %sfp,
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	xorl	%r12d, %r12d	# iftmp.1_165
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	testl	%ecx, %ecx	#
	jg	.L4	#,
.L39:
# /box/cp.cc:53: }
	addq	$88, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L6:
	.cfi_restore_state
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	movl	20(%rsp), %eax	# %sfp,
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movl	$8, %esi	#, _168
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	testl	%eax, %eax	#
	jg	.L4	#,
	jmp	.L9	#
.L37:
# /box/cp.cc:33:         std = sqrt(std);
	vmovsd	%xmm2, %xmm2, %xmm0	# std,
	movl	%eax, 76(%rsp)	# ivtmp.101, %sfp
	movq	%r9, 56(%rsp)	# _197, %sfp
	movq	%r8, 48(%rsp)	# _195, %sfp
	movl	%edx, 72(%rsp)	# _171, %sfp
	vmovsd	%xmm4, 64(%rsp)	# _265, %sfp
	vmovsd	%xmm1, 8(%rsp)	# ave, %sfp
	call	sqrt@PLT	#
	vmovsd	%xmm0, %xmm0, %xmm2	# tmp198, std
	movl	76(%rsp), %eax	# %sfp, ivtmp.101
	vmovsd	64(%rsp), %xmm4	# %sfp, _265
	movq	56(%rsp), %r9	# %sfp, _197
	movq	48(%rsp), %r8	# %sfp, _195
	movl	72(%rsp), %edx	# %sfp, _171
	vmovsd	8(%rsp), %xmm1	# %sfp, ave
	vxorps	%xmm3, %xmm3, %xmm3	# tmp199
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp192
	jmp	.L15	#
.L45:
# /usr/include/c++/12/bits/stl_vector.h:1905: 	  __throw_length_error(
	leaq	.LC2(%rip), %rdi	#, tmp160
	call	_ZSt20__throw_length_errorPKc@PLT	#
	.cfi_endproc
.LFE1779:
	.size	_Z9correlateiiPKfPf, .-_Z9correlateiiPKfPf
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
