include struct
  open Libsail

  let files =
    [
      "sail-riscv/model/prelude.sail";
      "sail-riscv/model/riscv_xlen64.sail";
      "sail-riscv/model/riscv_flen_D.sail";
      "sail-riscv/model/riscv_vlen.sail";
      "sail-riscv/model/prelude_mem_metadata.sail";
      "sail-riscv/model/prelude_mem.sail";
      "sail-riscv/model/riscv_types_common.sail";
      "sail-riscv/model/riscv_types_ext.sail";
      "sail-riscv/model/riscv_types.sail";
      "sail-riscv/model/riscv_vmem_types.sail";
      "sail-riscv/model/riscv_reg_type.sail";
      "sail-riscv/model/riscv_freg_type.sail";
      "sail-riscv/model/riscv_regs.sail";
      "sail-riscv/model/riscv_pc_access.sail";
      "sail-riscv/model/riscv_sys_regs.sail";
      "sail-riscv/model/riscv_pmp_regs.sail";
      "sail-riscv/model/riscv_pmp_control.sail";
      "sail-riscv/model/riscv_ext_regs.sail";
      "sail-riscv/model/riscv_addr_checks_common.sail";
      "sail-riscv/model/riscv_addr_checks.sail";
      "sail-riscv/model/riscv_misa_ext.sail";
      "sail-riscv/model/riscv_vreg_type.sail";
      "sail-riscv/model/riscv_vext_regs.sail";
      "sail-riscv/model/riscv_csr_map.sail";
      "sail-riscv/model/riscv_vext_control.sail";
      "sail-riscv/model/riscv_next_regs.sail";
      "sail-riscv/model/riscv_sys_exceptions.sail";
      "sail-riscv/model/riscv_sync_exception.sail";
      "sail-riscv/model/riscv_next_control.sail";
      "sail-riscv/model/riscv_softfloat_interface.sail";
      "sail-riscv/model/riscv_fdext_regs.sail";
      "sail-riscv/model/riscv_fdext_control.sail";
      "sail-riscv/model/riscv_csr_ext.sail";
      "sail-riscv/model/riscv_sys_control.sail";
      "sail-riscv/model/riscv_platform.sail";
      "sail-riscv/model/riscv_mem.sail";
      "sail-riscv/model/riscv_vmem_common.sail";
      "sail-riscv/model/riscv_vmem_pte.sail";
      "sail-riscv/model/riscv_vmem_ptw.sail";
      "sail-riscv/model/riscv_vmem_tlb.sail";
      "sail-riscv/model/riscv_vmem.sail";
      "sail-riscv/model/riscv_types_kext.sail";
      "sail-riscv/model/riscv_insts_begin.sail";
      "sail-riscv/model/riscv_insts_base.sail";
      "sail-riscv/model/riscv_insts_aext.sail";
      "sail-riscv/model/riscv_insts_zca.sail";
      "sail-riscv/model/riscv_insts_mext.sail";
      "sail-riscv/model/riscv_insts_zicsr.sail";
      "sail-riscv/model/riscv_insts_next.sail";
      "sail-riscv/model/riscv_insts_hints.sail";
      "sail-riscv/model/riscv_insts_fext.sail";
      "sail-riscv/model/riscv_insts_zcf.sail";
      "sail-riscv/model/riscv_insts_dext.sail";
      "sail-riscv/model/riscv_insts_zcd.sail";
      "sail-riscv/model/riscv_insts_svinval.sail";
      "sail-riscv/model/riscv_insts_zba.sail";
      "sail-riscv/model/riscv_insts_zbb.sail";
      "sail-riscv/model/riscv_insts_zbc.sail";
      "sail-riscv/model/riscv_insts_zbs.sail";
      "sail-riscv/model/riscv_insts_zcb.sail";
      "sail-riscv/model/riscv_insts_zfh.sail";
      "sail-riscv/model/riscv_insts_zfa.sail";
      "sail-riscv/model/riscv_insts_zkn.sail";
      "sail-riscv/model/riscv_insts_zks.sail";
      "sail-riscv/model/riscv_insts_zbkb.sail";
      "sail-riscv/model/riscv_insts_zbkx.sail";
      "sail-riscv/model/riscv_insts_zicond.sail";
      "sail-riscv/model/riscv_insts_vext_utils.sail";
      "sail-riscv/model/riscv_insts_vext_fp_utils.sail";
      "sail-riscv/model/riscv_insts_vext_vset.sail";
      "sail-riscv/model/riscv_insts_vext_arith.sail";
      "sail-riscv/model/riscv_insts_vext_fp.sail";
      "sail-riscv/model/riscv_insts_vext_mem.sail";
      "sail-riscv/model/riscv_insts_vext_mask.sail";
      "sail-riscv/model/riscv_insts_vext_vm.sail";
      "sail-riscv/model/riscv_insts_vext_fp_vm.sail";
      "sail-riscv/model/riscv_insts_vext_red.sail";
      "sail-riscv/model/riscv_insts_vext_fp_red.sail";
      "sail-riscv/model/riscv_jalr_seq.sail";
      "sail-riscv/model/riscv_insts_end.sail";
      "sail-riscv/model/riscv_step_common.sail";
      "sail-riscv/model/riscv_step_ext.sail";
      "sail-riscv/model/riscv_decode_ext.sail";
      "sail-riscv/model/riscv_fetch.sail";
      "sail-riscv/model/riscv_step.sail";
    ]

  let test1 () =
    let _ =
      try Frontend.load_files "work" [] Type_check.initial_env files
      with Reporting.Fatal_error e ->
        Reporting.print_error e;
        exit 1
    in
    print_endline "OK"
end

let () =
  Arg.parse [ ("-test1", Arg.Unit test1, "") ] (fun _ -> assert false) "help"
