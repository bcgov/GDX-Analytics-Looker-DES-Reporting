view: limesurvey_analytics {
  derived_table: {
    sql:
      SELECT ls.*,
        -- we aggregate by language and sid and calculate the daily deltas using a LAG window function
        survey_total - (LAG(survey_total,1) OVER (PARTITION BY sid,surveyls_language ORDER BY date)) AS survey_total_delta,
        survey_completed - (LAG(survey_completed,1) OVER (PARTITION BY sid,surveyls_language ORDER BY date)) AS survey_completed_delta,
        survey_uncompleted - (LAG(survey_uncompleted,1) OVER (PARTITION BY sid,surveyls_language ORDER BY date)) AS survey_uncompleted_delta
      FROM microservice.limesurvey AS ls
      ORDER BY date, sid, surveyls_language ;;
      #NOTE: still to do add caching -- should run once a day when the total number of rows has changed
  }

  dimension_group: report {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.date ;;
    label: "Reporting"
  }

  dimension: sid {
    type: number
    sql: ${TABLE}.sid ;;
    group_label: "Survey Info"
    value_format: "0"
  }
  dimension: survey_title {
    type: string
    sql: ${TABLE}.surveyls_title ;;
    group_label: "Survey Info"
  }
  dimension: survey_language {
    type: string
    sql: ${TABLE}.surveyls_language ;;
    group_label: "Survey Info"
  }


  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }


  dimension_group: expires {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.expires ;;
  }


  dimension_group: startdate {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.startdate ;;
    label: "Start"
  }


  dimension_group: datecreated {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.datecreated ;;
    label: "Created"
  }


  dimension: total_surveys {
    type: number
    sql: ${TABLE}.survey_total ;;
  }
  dimension: total_surveys_delta {
    type: number
    sql: ${TABLE}.survey_total_delta ;;
  }

  dimension: completed_surveys {
    type: number
    sql: ${TABLE}.survey_completed ;;
  }
  dimension: completed_surveys_delta {
    type: number
    sql: ${TABLE}.survey_completed_delta ;;
  }

  dimension: uncompleted_surveys {
    type: number
    sql: ${TABLE}.survey_uncompleted ;;
  }
  dimension: uncompleted_surveys_delta {
    type: number
    sql: ${TABLE}.survey_uncompleted_delta ;;
  }


  dimension_group: survey_first_complete_date {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.survey_first_complete_date ;;
  }


  dimension_group: survey_last_complete_date {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.survey_last_complete_date ;;
  }

  measure: count {
    type: count
  }

  measure: total_surveys_sum {
    type: sum
    sql: ${TABLE}.survey_total ;;
    group_label: "Total Surveys"
  }
  measure: completed_surveys_sum {
    type:  sum
    sql: ${TABLE}.survey_completed ;;
    group_label: "Completed Surveys"
  }
  measure: uncompleted_surveys_sum {
    type: sum
    sql:  ${TABLE}.survey_uncompleted ;;
    group_label: "Uncompleted Surveys"
  }

  measure: total_surveys_delta_sum {
    type: sum
    sql: ${TABLE}.survey_total_delta ;;
    group_label: "Total Surveys"
  }
  measure: completed_surveys_delta_sum {
    type:  sum
    sql: ${TABLE}.survey_completed_delta ;;
    group_label: "Completed Surveys"
  }
  measure: uncompleted_surveys_delta_sum {
    type: sum
    sql:  ${TABLE}.survey_uncompleted_delta ;;
    group_label: "Uncompleted Surveys"
  }

  measure: total_surveys_delta_average {
    type: average
    sql: ${TABLE}.survey_total_delta ;;
    group_label: "Total Surveys"
  }
  measure: completed_surveys_delta_average {
    type:  average
    sql: ${TABLE}.survey_completed_delta ;;
    group_label: "Completed Surveys"
  }
  measure: uncompleted_surveys_delta_average {
    type: average
    sql:  ${TABLE}.survey_uncompleted_delta ;;
    group_label: "Uncompleted Surveys"
  }

  measure: total_surveys_delta_max {
    type: max
    sql: ${TABLE}.survey_total_delta ;;
    group_label: "Total Surveys"
  }
  measure: completed_surveys_delta_max {
    type:  max
    sql: ${TABLE}.survey_completed_delta ;;
    group_label: "Completed Surveys"
  }
  measure: uncompleted_surveys_delta_max {
    type: max
    sql:  ${TABLE}.survey_uncompleted_delta ;;
    group_label: "Uncompleted Surveys"
  }

}
