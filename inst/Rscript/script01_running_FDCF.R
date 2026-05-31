library("devtools")
devtools::load_all()

library("legionGOES.config")
# library("legionGOES.downloader")

legionGOES.FDCF::fn_my_folder_package()

######################################
# CONFIG
######################################
cfg <- legionGOES.config::legion_config_bootstrap()
str_folder_path_data_raw  <- cfg$paths$data_raw_dir
str_folder_path_data_proc <- cfg$paths$data_proc_dir

python_exe  <- cfg$paths$python_exe
python_code <- cfg$paths$python_code



str_folder_package <- fn_my_folder_package()
str_fdcf_nc <- file.path(str_folder_package, "test_files", "OR_ABI-L2-FDCF-M6_G19_s20260031200230_e20260031209539_c20260031210078.nc")
str_output_folder <- file.path(str_folder_package, "test_files", "output_folder")



res <- legionGOES.config::fn_fdcf_run_local_python_file(
  nc_file = str_fdcf_nc,
  data_proc_dir = str_output_folder, #str_folder_path_data_proc,
  python_exe = python_exe,
  python_code = python_code,
  overwrite = FALSE,
  status_fun = message
)


