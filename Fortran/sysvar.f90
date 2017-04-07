MODULE sysvar

IMPLICIT NONE

INTEGER                                   :: Ndof        ! Number of degrees of freedom
INTEGER                                   :: Nsys        ! Order of system
INTEGER                                   :: Nsteps      ! Number of simulation time steps
INTEGER                                   :: k1          ! Count variable for DO construct
INTEGER                                   :: i           ! Counter

REAL                                      :: dt          ! Time step [s]
REAL                                      :: ti, tf      ! Initial and final time [s]
REAL, DIMENSION(:), ALLOCATABLE           :: Time        ! Time array [s]
REAL, DIMENSION(:), ALLOCATABLE           :: eta0        ! Initial positions [m;rad]
REAL, DIMENSION(:), ALLOCATABLE           :: nu0         ! Initial velocities [m/s;rad/s]

REAL, DIMENSION, ALLOCATABLE              :: Mrb         ! Rigid-body inertia matrix
REAL, DIMENSION, ALLOCATABLE              :: Add         ! Constant-frequency added mass matrix
REAL, DIMENSION, ALLOCATABLE              :: Dl          ! Linear viscous damping matrix
REAL, DIMENSION, ALLOCATABLE              :: Dq          ! Quadratic viscous damping matrix
REAL, DIMENSION, ALLOCATABLE              :: Chs         ! Hydrostatic stiffness matrix
REAL, DIMENSION, ALLOCATABLE              :: Cmr         ! Mooring stiffness matrix

CONTAINS 

END MODULE sysvar
