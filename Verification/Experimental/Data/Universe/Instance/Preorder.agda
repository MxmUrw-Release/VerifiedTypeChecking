
module Verification.Experimental.Data.Universe.Instance.Preorder where

open import Verification.Conventions

open import Verification.Experimental.Set.Setoid.Definition
open import Verification.Experimental.Order.Preorder
open import Verification.Experimental.Data.Universe.Definition
open import Verification.Experimental.Data.Universe.Instance.Setoid

instance
  isPreorder:𝒰 : isPreorder _ ′ 𝒰 𝑖 ′
  isPreorder._≤'_      isPreorder:𝒰 A B = A -> B
  isPreorder.reflexive isPreorder:𝒰 = incl id-𝒰
  isPreorder._⟡_       isPreorder:𝒰 (incl f) (incl g) = incl (f ◆-𝒰 g)
  isPreorder.transp-≤  isPreorder:𝒰 p q f = incl $ ⟨ sym p ⟩ ◆-𝒰 ⟨ f ⟩ ◆-𝒰 ⟨ q ⟩


