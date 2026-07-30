import MartingalesDiscreteParameterLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MartingaleSpace where
  Ω : Type
  measurableSpace : MeasurableSpace Ω
  ℱ : Filtration ℕ (MeasurableSpace Ω)

structure MartingaleAdmittedObject where
  space : MartingaleSpace
  targetNorm : Type
  integrable : Prop
  adapted : Prop
  martingaleProperty : Prop
  conclusion : Adapted ∧ Integrable ∧ MartingaleProperty

def MartingaleWitnessClosed (O : MartingaleAdmittedObject) : Prop :=
  O.conclusion

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse