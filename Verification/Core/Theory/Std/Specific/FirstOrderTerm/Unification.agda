
module Verification.Core.Theory.Std.Specific.FirstOrderTerm.Unification where

open import Verification.Conventions hiding (_⊔_)

open import Verification.Core.Set.Discrete

open import Verification.Core.Algebra.Monoid.Definition

open import Verification.Core.Category.Std.Category.Subcategory.Full
open import Verification.Core.Computation.Unification.Definition

open import Verification.Core.Data.Universe.Definition
open import Verification.Core.Data.Universe.Instance.Category
open import Verification.Core.Data.Substitution.Variant.Base.Definition

open import Verification.Core.Data.List.Variant.Binary.Definition
open import Verification.Core.Data.List.Variant.Binary.Element.Definition
open import Verification.Core.Data.List.VariantTranslation.Definition
open import Verification.Core.Data.List.Dependent.Variant.Binary.Definition

open import Verification.Core.Theory.Std.Specific.FirstOrderTerm.Signature
open import Verification.Core.Theory.Std.Specific.FirstOrderTerm.Definition
open import Verification.Core.Theory.Std.Specific.FirstOrderTerm.Instance.RelativeMonad


module _ {𝓅 : 𝒯FOSignature 𝑖} where

  postulate
    instance
      hasUnification:𝒯⊔term : hasUnification (⧜𝐒𝐮𝐛𝐬𝐭 (𝒯⊔term 𝓅))

