import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SymplecticVectorSpaceClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
