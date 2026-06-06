project('dvdbackup-modernized', 'c',
  version: '0.5',
  default_options: ['c_std=c99', 'warning_level=2']
)

# Core dependency lookup
cc = meson.get_compiler('c')
dvdread_dep = dependency('libdvdread', required: false)

if not dvdread_dep.found()
  dvdread_dep = cc.find_library('dvdread', required: true)
endif

# Safely inject the missing macros and pointer conversions using single quotes
add_project_arguments('-DPATH_MAX=4096', language: 'c')
add_project_arguments('-Wno-error=incompatible-pointer-types', language: 'c')

# Configuration header setups
conf_data = configuration_data()
conf_data.set_quoted('PACKAGE', meson.project_name())
conf_data.set_quoted('PACKAGE_STRING', '@0@ @1@'.format(meson.project_name(), meson.project_version()))
conf_data.set_quoted('VERSION', meson.project_version())
conf_data.set_quoted('LOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))
configure_file(output: 'config.h', configuration: conf_data)

# Source files array
src_files = files(
  'src/main.c',
  'src/dvdbackup.c'
)

# Include paths
inc_dirs = include_directories('.', 'src')

# Executable targets
executable('dvdbackup',
  src_files,
  include_directories: inc_dirs,
  dependencies: dvdread_dep,
  install: true
)
