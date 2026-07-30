import Mathlib.Data.Fintype.Basic

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingaleIndexSet where
  time : Type u
  preorder : Preorder time
  finiteInitial : Fintype time
  directed : Directed (· ≤ ·) (fun i => i)

structure MartingaleAdmittedObject where
  index : MartingaleIndexSet
  filtration : Type v
  adaptedProcess : filtration → index.time → Type w
  integrability : Prop
  martingaleProperty : Prop
  conclusion : martingaleProperty

def MartingaleWitnessClosed (O : MartingaleAdmittedObject) : Prop :=
  O.martingaleProperty

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse