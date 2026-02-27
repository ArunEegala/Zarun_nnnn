CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS setTraveld FOR DETERMINE ON SAVE
      IMPORTING keys FOR Travel~setTraveld.
    METHODS setOverallstatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setOverallstatus.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setTraveld.

    "read travel entity using EML language
    READ ENTITIES OF zarun_travel_i IN LOCAL MODE
    ENTITY Travel
    FIELDS ( TravelId )
    WITH CORRESPONDING #( Keys )
    RESULT DATA(lt_travel).


    DELETE lt_travel WHERE travelid IS NOT INITIAL.

    SELECT SINGLE FROM zarun_travel FIELDS MAX( travel_id ) INTO @DATA(lv_travelid_max).

    MODIFY ENTITIES OF zarun_travel_i IN LOCAL MODE
    ENTITY travel
    UPDATE FIELDS ( Travelid )
    WITH VALUE #( FOR ls_travel_id IN lt_travel INDEX INTO lv_index
                   ( %tky = ls_travel_id-%tky
                    travelid = lv_travelid_max + lv_index
                   )
    ).


  ENDMETHOD.

  METHOD setOverallstatus.

    READ ENTITIES OF zarun_travel_i IN LOCAL MODE
    ENTITY Travel
    FIELDS ( OverallStatus )
    WITH CORRESPONDING #( Keys )
    RESULT DATA(lt_status).

    DELETE lt_status WHERE OverallStatus IS NOT INITIAL.

 " SELECT SINGLE FROM zarun_travel FIELDS MAX( travel_id ) INTO @DATA(lv_travelid_max).

    MODIFY ENTITIES OF zarun_travel_i IN LOCAL MODE
    ENTITY travel
    UPDATE FIELDS ( OverallStatus )
    WITH VALUE #( FOR ls_status_id IN lt_status
                   ( %tky = ls_status_id-%tky
                    OverallStatus = 'O'
                   )
    ).
  ENDMETHOD.

ENDCLASS.
