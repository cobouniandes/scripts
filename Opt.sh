#SBATCH --nodes=1

# queue in which to run the job
#SBATCH --partition=long

# set max wallclock time
#SBATCH --time=360:00:00

# set name of job
#SBATCH --job-name=MEc_Opix2

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=ma.martinez15@uniandes.edu.co

# set CPUs required
#SBATCH --cpus-per-task=8

#set memory required(MB)
#SBATCH --mem=32000

###--------------------------------------------------------

# run the application


module load gaussian/16

LOG=./"$SLURM_JOB_NAME".${SLURM_JOB_ID}.log
CHK=./"$SLURM_JOB_NAME".${SLURM_JOB_ID}.chk

g16 << EOF > $LOG

%chk=MEC.chk
%mem=26gb
%nproc=8
#p opt b3lyp/6-311g(d) geom=PrintInputOrient integral=grid=ultrafine scf=xqc

MEc_Opt

-1 1            # carga neta (-1) y multiplicidad (1)
C                1.77549337   -3.63519323   10.15975997
C                3.29059937   -3.63519323   10.15975997
C                3.84253037   -2.22411523   10.15975997
##átomos y coordenadas de la molécula que se está parametrizando

EOF
#Al final del documento debe haber exactamente una línea en blanco
