!mod$ v1 sum:982d73886ae1cb99
!need$ f1768b83d01573f2 i __fortran_builtins
!need$ 8f3c0cd7c2f4184a i __cuda_builtins
!need$ b3394a34bdb8f77e i cudadevice
module cooperative_groups
use,intrinsic::__fortran_builtins,only:c_devptr=>__builtin_c_devptr
type::cluster_group
type(c_devptr),private::handle
integer(4)::size
integer(4)::rank
end type
type::grid_group
type(c_devptr),private::handle
integer(4)::size
integer(4)::rank
end type
type::coalesced_group
type(c_devptr),private::handle
integer(4)::size
integer(4)::rank
end type
type::thread_group
type(c_devptr),private::handle
integer(4)::size
integer(4)::rank
end type
interface
attributes(device) function cluster_block_index()
use,intrinsic::cudadevice,only:dim3
type(dim3)::cluster_block_index
end
end interface
interface
attributes(device) function cluster_dim_blocks()
use,intrinsic::cudadevice,only:dim3
type(dim3)::cluster_dim_blocks
end
end interface
interface
attributes(device) function this_cluster()
import::cluster_group
type(cluster_group)::this_cluster
end
end interface
interface
attributes(device) function this_grid()
import::grid_group
type(grid_group)::this_grid
end
end interface
interface
attributes(device) function this_thread_block()
import::thread_group
type(thread_group)::this_thread_block
end
end interface
interface
attributes(device) function this_warp()
import::coalesced_group
type(coalesced_group)::this_warp
end
end interface
interface this_warp
procedure::this_warp
end interface
end
