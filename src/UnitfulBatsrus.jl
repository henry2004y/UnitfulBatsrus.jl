__precompile__(true)
module UnitfulBatsrus

import Unitful
import Unitful: q, c, μ0, ϵ0, k, me, mp
using Unitful: @unit
export @bu_str


# lengths
@unit R_bu  "Rₑ"     Radii             (6378)*Unitful.km        false

# masses
@unit me_bu "mₑ"     ElectronMass      me                       false
@unit mp_bu "mₚ"     ProtonMass        mp                       false
@unit u_bu  "u"      AMU               1*Unitful.u              false

# charges
@unit q_bu  "q"      ElementaryCharge  q                        false
@unit k_bu  "k"      BoltzmannConstant k                        false

# densities
@unit amucc_bu "amu/cc" AtomicDensity  1*Unitful.u/Unitful.cm^3 false

# velocities
@unit V_bu  "V"      Speed             1*Unitful.km/Unitful.s   false

# current densities
@unit ampm2_bu  "μA/m²" CurrentDensity  1*Unitful.μA/Unitful.m^2 false

# Others
@unit tm2_bu "nT/m²" MagneticFieldDivergence 1*Unitful.nT/Unitful.m^2 false
@unit vm2_bu "V/m²"  ElectricFieldDivergence 1*Unitful.V/Unitful.m^2  false

include("batsrusmacro.jl")

# Some gymnastics required here because if we precompile, we cannot add to
# Unitful.basefactors at compile time and expect the changes to persist to runtime.
const localunits = Unitful.basefactors
function __init__()
    merge!(Unitful.basefactors, localunits)
    Unitful.register(UnitfulBatsrus)
end

end # module