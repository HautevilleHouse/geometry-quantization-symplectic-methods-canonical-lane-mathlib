import canonicalLaneMathlib.AdmissibleClass
import GeometryQuantizationSymplecticMethods.QuantumHilbertSpace

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethods

def ConstrainedGeometryQuantizationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geometry_quantization_endgame (A : AdmissibleClass) : ConstrainedGeometryQuantizationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometryQuantizationSymplecticMethods
end HautevilleHouse