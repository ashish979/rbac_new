module AmountSplitter
  def professional_charges(amount)
    ( ( 3 * amount.to_f ) / ( 4 + ( 3 * ( TAX.to_f / 100 ) ) ) ).round(2)
  end

  def study_material_charges(amount)
    ( amount.to_f / ( 4 + ( 3 * (TAX.to_f / 100 ) ) ) ).round(2)
  end

  def tax(amount)
    ( professional_charges(amount).to_f * ( TAX.to_f / 100 ) ).round(2)
  end
end