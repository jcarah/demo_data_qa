  view: state_mapping {
    derived_table: {
      sql: select 'Alabama' as state, 'Ala.' as abbrev, 'AL' as code
              union all select 'Alaska', 'Alaska', 'AK'
              union all select 'Arizona', 'Ariz.', 'AZ'
              union all select 'Arkansas', 'Ark.', 'AR'
              union all select 'California', 'Calif.', 'CA'
              union all select 'Colorado', 'Colo.', 'CO'
              union all select 'Connecticut', 'Conn.', 'CT'
              union all select 'Delaware', 'Del.', 'DE'
              union all select 'District of Columbia', 'D.C.', 'DC'
              union all select 'Florida', 'Fla.', 'FL'
              union all select 'Georgia', 'Ga.', 'GA'
              union all select 'Hawaii', 'Hawaii', 'HI'
              union all select 'Idaho', 'Idaho', 'ID'
              union all select 'Illinois', 'Ill.', 'IL'
              union all select 'Indiana', 'Ind.', 'IN'
              union all select 'Iowa', 'Iowa', 'IA'
              union all select 'Kansas', 'Kans.', 'KS'
              union all select 'Kentucky', 'Ky.', 'KY'
              union all select 'Louisiana', 'La.', 'LA'
              union all select 'Maine', 'Maine', 'ME'
              union all select 'Maryland', 'Md.', 'MD'
              union all select 'Massachusetts', 'Mass.', 'MA'
              union all select 'Michigan', 'Mich.', 'MI'
              union all select 'Minnesota', 'Minn.', 'MN'
              union all select 'Mississippi', 'Miss.', 'MS'
              union all select 'Missouri', 'Mo.', 'MO'
              union all select 'Montana', 'Mont.', 'MT'
              union all select 'Nebraska', 'Nebr.', 'NE'
              union all select 'Nevada', 'Nev.', 'NV'
              union all select 'New Hampshire', 'N.H.', 'NH'
              union all select 'New Jersey', 'N.J.', 'NJ'
              union all select 'New Mexico', 'N.M.', 'NM'
              union all select 'New York', 'N.Y.', 'NY'
              union all select 'North Carolina', 'N.C.', 'NC'
              union all select 'North Dakota', 'N.D.', 'ND'
              union all select 'Ohio', 'Ohio', 'OH'
              union all select 'Oklahoma', 'Okla.', 'OK'
              union all select 'Oregon', 'Ore.', 'OR'
              union all select 'Pennsylvania', 'Pa.', 'PA'
              union all select 'Rhode Island', 'R.I.', 'RI'
              union all select 'South Carolina', 'S.C.', 'SC'
              union all select 'South Dakota', 'S.D.', 'SD'
              union all select 'Tennessee', 'Tenn.', 'TN'
              union all select 'Texas', 'Tex.', 'TX'
              union all select 'Utah', 'Utah', 'UT'
              union all select 'Vermont', 'Vt.', 'VT'
              union all select 'Virginia', 'Va.', 'VA'
              union all select 'Washington', 'Wash.', 'WA'
              union all select 'West Virginia', 'W.Va.', 'WV'
              union all select 'Wisconsin', 'Wis.', 'WI'
              union all select 'Wyoming', 'Wyo.', 'WY'
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: state {
      primary_key: yes
      type: string
      sql: ${TABLE}.state ;;
    }

    dimension: abbrev {
      type: string
      sql: ${TABLE}.abbrev ;;
    }

    dimension: code {
      type: string
      sql: ${TABLE}.code ;;
    }

    set: detail {
      fields: [state, abbrev, code]
    }
  }
