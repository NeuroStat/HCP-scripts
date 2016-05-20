# Harvest HCP data via AWS

For certain projects, we need from the HCP data the (nifti) copes and varcopes for all task data.  These scripts can be used both locally and on HPC-environments for this.

### Workflow
- 01_clone_and_configure.sh

    For the harvesting, we use a little program called s3cmd, of which the code can be found [in this github repository](https://github.com/pcorliss/s3cmd-modification).
    The script shows how I cloned and configured the code.

- 02_find_subs_with_all_copes.sh

    We use the HCP data mainly to validate statistical methods.  To avoid that any bias or effect arises because a certain subject is included or not, we want to make sure all subjects have copes for all tasks.  This script identifies subjects who have all copes for all subjects.  The result of the script can be found in Ids.txt but the script is added as background information.

- 03_copy_copes_varcopes.sh

    This script finally copies the copes and varcopes to a directory $OutDir.  Be sure to adjust the folder locally with your folder.  The code runs in parallel with the program 'parallel' (can be installed with `brew install parallel`).  The number of cores is  a variable defined in the script.

### Computational load

On my Macbook Pro, with 7 cores running in parallel, it takes about 6 minutes per subject to download all task results.
