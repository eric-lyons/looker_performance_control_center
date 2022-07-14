- dashboard: performance_control_center_dashboard
  title: Performance Control Center Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Query Runtime By Day
    name: Query Runtime By Day
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.created_date, history.average_runtime]
    fill_fields: [history.created_date]
    filters:
      history.created_date: 7 days
    sorts: [history.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 2
    col: 8
    width: 8
    height: 6
  - title: Query Count by Day
    name: Query Count by Day
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.created_date, history.count]
    fill_fields: [history.created_date]
    filters:
      history.created_date: 7 days
    sorts: [history.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 2
    col: 0
    width: 8
    height: 6
  - title: Failed Queries By Day
    name: Failed Queries By Day
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.created_date, history.average_runtime]
    fill_fields: [history.created_date]
    filters:
      history.created_date: 7 days
      history.status: error
    sorts: [history.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 2
    col: 16
    width: 8
    height: 6
  - title: Cache Utilization
    name: Cache Utilization
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.cache_result_query_count, history.created_date]
    fill_fields: [history.created_date]
    filters:
      history.is_single_query: 'Yes'
      history.created_date: 60 days
    sorts: [history.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: from_cache_last_30, label: "% From Cache\
          \ last 30", expression: 'sum(if(row() < 30, ${history.cache_result_query_count},
          0)) / sum(if(row() < 30, ${history.query_run_count}, 0))', value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: prior_30, label: "% Prior 30", expression: 'sum(if(row()
          > 30 AND row() <= 60, ${history.cache_result_query_count}, 0)) / sum(if(row()
          > 30 AND row() <= 60, ${history.query_run_count}, 0))', value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: from_last_period, label: From Last Period, expression: "${from_cache_last_30}\
          \ - ${prior_30}", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    series_types: {}
    hidden_fields: [history.query_run_count, history.created_date, history.cache_result_query_count,
      prior_30]
    note_state: collapsed
    note_display: hover
    note_text: Percentage of total queries returned from Looker cache.
    defaults_version: 1
    listen: {}
    row: 8
    col: 0
    width: 8
    height: 6
  - title: Dashboard Tile Performance
    name: Dashboard Tile Performance
    model: system__activity
    explore: history
    type: looker_grid
    fields: [dashboard.title, query.count]
    filters:
      history.is_single_query: 'Yes'
      history.real_dash_id: "-NULL"
      history.created_date: 7 days
      history.status: complete
      history.runtime: ">30"
    sorts: [query.count desc]
    limit: 50
    column_limit: 50
    dynamic_fields: [{table_calculation: total_runtime, label: Total Runtime, expression: "${history.total_runtime}",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      query.count: Distinct Queries Over 30s
      dashboard.title: Dashboard Title
    series_cell_visualizations:
      query.count:
        is_active: true
        palette:
          palette_id: 73d1ef93-b985-1b44-34cd-fbfdcb055c8c
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - Yellow
          - Orange
          - Red
    conditional_formatting: []
    truncate_column_names: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 16
    col: 8
    width: 8
    height: 6
  - title: Dashboard Size
    name: Dashboard Size
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.title, dashboard.link, dashboard_element.count_look, dashboard_element.count_lookless,
      dashboard_element.count_text, dashboard_element.count_merge_query, dashboard_element.count,
      query.count]
    filters:
      dashboard_element.count: ">25"
      dashboard.deleted_date: 'NULL'
      dashboard.moved_to_trash: 'No'
    sorts: [query.count desc]
    limit: 100
    dynamic_fields: [{table_calculation: total_query_tiles, label: Total Query Tiles,
        expression: "${dashboard_element.count}-${dashboard_element.count_text}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    show_sql_query_menu_options: false
    column_order: [dashboard.title, dashboard.link, total_query_tiles, query.count,
      dashboard_element.count, dashboard_element.count_look, dashboard_element.count_lookless,
      dashboard_element.count_text, dashboard_element.count_merge_query]
    show_totals: true
    show_row_totals: true
    series_labels:
      query.count: Total Queries Generated
      dashboard_element.count_look: Look Tiles
      dashboard_element.count_lookless: Lookless Tiles
      dashboard_element.count_text: Text Tiles
      dashboard_element.count: Total Tiles
      dashboard_element.count_merge_query: Merge Query Tiles
    series_column_widths:
      total_query_tiles: 130
      dashboard_element.count: 89
      dashboard.title: 142
      dashboard.link: 88
      dashboard_element.count_look: 89
      query.count: 194
      dashboard_element.count_text: 89
      dashboard_element.count_lookless: 117
      dashboard_element.count_merge_query: 137
    series_cell_visualizations:
      dashboard_element.count_look:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1D98D3",
        font_color: !!null '', color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50,
          palette_id: 721299c7-f114-43fc-926f-5bf0462bbfca, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 22}, max: {type: number,
                value: 25}}, mirror: false, reverse: true, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: [total_query_tiles]}]
    truncate_column_names: true
    series_types: {}
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: Load times and general instance health may be impacted on dashboards
      with more than 25 tiles.
    defaults_version: 1
    listen: {}
    row: 16
    col: 16
    width: 8
    height: 6
  - title: Dashboard Refresh
    name: Dashboard Refresh
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.title, dashboard.refresh_interval_ordered, user.name, dashboard.link,
      dashboard.id, dashboard_element.count, dashboard_element.count_text]
    filters:
      dashboard.refresh_interval_ordered: NOT NULL
      dashboard.deleted_date: 'NULL'
      dashboard.moved_to_trash: 'No'
    sorts: [dashboard.refresh_interval_ordered]
    limit: 100
    dynamic_fields: [{table_calculation: non_text_tiles, label: Non-Text Tiles, expression: "${dashboard_element.count}-${dashboard_element.count_text}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      dashboard_element.count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1D98D3",
        font_color: !!null '', color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50,
          custom: {id: e73dc266-945c-2a12-887f-a7f608e56229, label: Custom, type: continuous,
            stops: [{color: "#F36254", offset: 0}, {color: "#FCF758", offset: 50},
              {color: "#4FBC89", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: number, value: 3200}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [dashboard.refresh_interval_ordered]}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50, palette_id: 721299c7-f114-43fc-926f-5bf0462bbfca,
          options: {steps: 5, reverse: true, constraints: {max: {type: number, value: 24}},
            stepped: false}}, bold: false, italic: false, strikethrough: false, fields: [
          non_text_tiles]}]
    series_value_format:
      dashboard.id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields: [dashboard_element.count, dashboard_element.count_text]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Frequent dashboard updates, especially on large dashboards, can place a significant strain on some database systems.

      At minimum, avoid setting a refresh interval that is shorter than your database update interval, because there is no new data to refresh and it creates unnecessary queries.
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 8
    height: 6
  - title: Schedules
    name: Schedules
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job_stage.started_hour_of_day, scheduled_job_stage.started_day_of_week,
      scheduled_job_stage.avg_runtime, scheduled_job.count]
    pivots: [scheduled_job_stage.started_day_of_week]
    fill_fields: [scheduled_job_stage.started_hour_of_day, scheduled_job_stage.started_day_of_week]
    filters:
      scheduled_job_stage.stage: '"enqueue_for_execute"'
      scheduled_job.created_date: 7 days ago for 7 days
    sorts: [scheduled_job_stage.started_day_of_week 0, scheduled_job_stage.started_hour_of_day]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    series_labels:
      scheduled_job_stage.avg_runtime: Average Time in Queue
    series_cell_visualizations:
      scheduled_job_stage.avg_runtime:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#7d218f",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: maximum}}, mirror: true,
            reverse: true, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [scheduled_job_stage.avg_runtime]}, {type: along a scale..., value: !!null '',
        background_color: "#3EB0D5", font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: c092bb30-8fdb-9ce9-1a95-deab2cb82f73, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#d10a1b", offset: 100}]},
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [scheduled_job.count]}]
    truncate_column_names: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 24
    col: 0
    width: 24
    height: 6
  - name: Dashboards
    type: text
    title_text: Dashboards
    subtitle_text: ''
    body_text: ''
    row: 14
    col: 0
    width: 24
    height: 2
  - name: Queries
    type: text
    title_text: Queries
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Schedules (2)
    type: text
    title_text: Schedules
    subtitle_text: ''
    body_text: ''
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Broken Schedules
    name: Broken Schedules
    model: system__activity
    explore: scheduled_plan
    type: table
    fields: [scheduled_job.finalized_date, scheduled_job.name, scheduled_job.status_detail,
      scheduled_plan.content_link, scheduled_plan.space_link, scheduled_job.user_id,
      user.name]
    filters:
      scheduled_job.status: failure
    sorts: [scheduled_job.finalized_date desc]
    limit: 100
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    column_order: [scheduled_job.name, scheduled_job.status_detail, user.name, scheduled_job.finalized_date,
      scheduled_plan.content_link, scheduled_plan.space_link]
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      user.name: Creator
      scheduled_job.finalized_date: Job Date
    series_column_widths:
      scheduled_job.finalized_date: 100
      user.name: 200
      scheduled_job.status_detail: 550
      scheduled_plan.content_link: 150
      scheduled_job.name: 275
      scheduled_plan.space_link: 213
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    hidden_fields: [scheduled_job.user_id]
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 24
    height: 6
  - title: Broken PDTS
    name: Broken PDTS
    model: system__activity
    explore: pdt_event_log
    type: table
    fields: [pdt_event_log.view_name, pdt_event_log.model_name, pdt_event_log.action,
      pdt_event_log.action_data, pdt_event_log.connection, pdt_event_log.pdt_create_failures,
      pdt_event_log.pdt_trigger_failures]
    filters:
      pdt_event_log.pdt_create_failures: ">0"
    sorts: [pdt_event_log.pdt_create_failures desc]
    limit: 100
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    column_order: [pdt_event_log.view_name, pdt_event_log.model_name, pdt_event_log.action,
      pdt_event_log.action_data, pdt_event_log.pdt_create_failures, pdt_event_log.connection,
      pdt_event_log.pdt_trigger_failures]
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      pdt_event_log.extract_view_from_table: View Name
    series_column_widths:
      pdt_event_log.model_name: 200
      pdt_event_log.view_name: 275
      pdt_event_log.pdt_create_failures: 300
      pdt_event_log.pdt_trigger_failures: 210
      pdt_event_log.action: 200
      pdt_event_log.action_data: 150
      pdt_event_log.connection: 150
    series_cell_visualizations:
      pdt_event_log.pdt_create_failures:
        is_active: true
      pdt_event_log.pdt_trigger_failures:
        is_active: false
    series_text_format:
      pdt_event_log.pdt_trigger_failures:
        align: left
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: true, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 8
    col: 8
    width: 16
    height: 6
  - title: New Schedules
    name: New Schedules
    model: system__activity
    explore: scheduled_plan
    type: looker_line
    fields: [scheduled_plan.created_date, scheduled_plan.count]
    fill_fields: [scheduled_plan.created_date]
    filters:
      scheduled_plan.created_date: 7 days
    sorts: [scheduled_plan.created_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 36
    col: 0
    width: 24
    height: 6
