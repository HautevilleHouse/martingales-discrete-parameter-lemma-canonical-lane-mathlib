import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingaleAdmittedObject where
  space : Type u
  filtration : Type v
  adaptedProcess : Type w
  integrability : Prop
  adaptedness : Prop
  martingaleProperty : Prop
  conclusion : martingaleProperty

def MartingaleWitnessClosed (O : MartingaleAdmittedObject) : Prop :=
  O.martingaleProperty

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse