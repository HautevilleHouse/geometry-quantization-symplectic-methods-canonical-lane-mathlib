import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure AdmissibleClass where
  object : GeometricQuantizationObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeometricQuantizationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse