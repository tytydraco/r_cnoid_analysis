#' Calculates the effect values for the given cnoid profile.
#'
#' @param d9    D9 value.
#' @param thcv  THCV value.
#' @param cbd   CBD value.
#' @param cbn   CBN value.
#' @param cbg   CBG value.
#' @param cbc   CBC value.
#' @return      The effect values.
#' @examples
#' regress_cnoids_to_effects(
#'   d9 = 100,
#'   thcv = 0,
#'   cbd = 0,
#'   cbn = 0,
#'   cbg = 0,
#'   cbc = 0
#' )
#'
#' @export
regress_cnoids_to_effects <- function(
    d9 = 0,
    thcv = 0,
    cbd = 0,
    cbn = 0,
    cbg = 0,
    cbc = 0) {
  aroused <- d9 * 0.6092776818 +
    thcv * -0.216699913 +
    cbd * -0.2971006117 +
    cbn * -0.005360628788 +
    cbg * 0.1633606587 +
    cbc * -0.01236334781

  hungry <- d9 * 0.3406958573 +
    thcv * 0.01306537192 +
    cbd * 0.203353021 +
    cbn * -0.07881878539 +
    cbg * 0.3283337381 +
    cbc * -0.1561518267

  energetic <- d9 * -0.05906933515 +
    thcv * -0.1966059755 +
    cbd * 0.1705483757 +
    cbn * 0.2210273557 +
    cbg * -0.5823319978 +
    cbc * -0.004558903018

  happy <- d9 * 0.3856073855 +
    thcv * -0.4021405987 +
    cbd * -0.03800835073 +
    cbn * -0.09256212559 +
    cbg * -0.1823605046 +
    cbc * -0.2161536377

  creative <- d9 * 0.1644210256 +
    thcv * -0.4351200715 +
    cbd * -0.1175225573 +
    cbn * -0.09820745122 +
    cbg * -0.415425278 +
    cbc * -0.08623618225

  giggly <- d9 * 0.5003339342 +
    thcv * -0.2028258716 +
    cbd * 0.3226664564 +
    cbn * 0.08554577493 +
    cbg * 0.06355544682 +
    cbc * -0.4175329049

  uplifted <- d9 * 0.10164408 +
    thcv * -0.2940141305 +
    cbd * 0.06972306801 +
    cbn * 0.1147242309 +
    cbg * -0.4201516025 +
    cbc * 0.09027175748

  focused <- d9 * -0.08769244417 +
    thcv * -0.4441503179 +
    cbd * -0.306925184 +
    cbn * -0.07418491766 +
    cbg * -0.6576148096 +
    cbc * 0.09685947627

  talkative <- d9 * 0.1207486813 +
    thcv * -0.3675701531 +
    cbd * 0.1901880347 +
    cbn * 0.1570395925 +
    cbg * -0.4987140614 +
    cbc * -0.2127489811

  relaxed <- d9 * 0.3999369546 +
    thcv * -0.1799198019 +
    cbd * -0.2438912249 +
    cbn * -0.277338582 +
    cbg * 0.3671989894 +
    cbc * -0.09888192841

  tingly <- d9 * 0.7156934371 +
    thcv * -0.01555731291 +
    cbd * 0.005433032529 +
    cbn * -0.05574277585 +
    cbg * 0.426490667 +
    cbc * -0.1385055697

  euphoric <- d9 * 0.4062568501 +
    thcv * -0.4058658104 +
    cbd * -0.2005063101 +
    cbn * -0.1323783866 +
    cbg * 0.001776615532 +
    cbc * -0.1629166898

  sleepy <- d9 * 0.1349527074 +
    thcv * 0.1272152707 +
    cbd * -0.04037922658 +
    cbn * -0.2790748009 +
    cbg * 0.5197651304 +
    cbc * -0.1035490608

  values <- c(
    aroused,
    hungry,
    energetic,
    happy,
    creative,
    giggly,
    uplifted,
    focused,
    talkative,
    relaxed,
    tingly,
    euphoric,
    sleepy
  )

  values
}

#' Calculates the cnoid values for the given effect profile.
#'
#' @param aroused     Aroused value.
#' @param hungry      Hungry value.
#' @param energetic   Energetic value.
#' @param happy       Happy value.
#' @param creative    Creative value.
#' @param giggly      Giggly value.
#' @param uplifted    Uplifted value.
#' @param focused     Focused value.
#' @param talkative   Talkative value.
#' @param relaxed     Relaxed value.
#' @param tingly      Tingly value.
#' @param euphoric    Euphoric value.
#' @param sleepy      Sleepy value.
#' @return            The cnoid values.
#' @examples
#' regress_effects_to_cnoids(
#'   aroused = 100,
#'   hungry = 0,
#'   energetic = 0,
#'   happy = 0,
#'   creative = 0,
#'   giggly = 0,
#'   uplifted = 0,
#'   focused = 0,
#'   talkative = 0,
#'   relaxed = 0,
#'   tingly = 0,
#'   euphoric = 0,
#'   sleepy = 0
#' )
#'
#' @export
regress_effects_to_cnoids <- function(
    aroused = 0,
    hungry = 0,
    energetic = 0,
    happy = 0,
    creative = 0,
    giggly = 0,
    uplifted = 0,
    focused = 0,
    talkative = 0,
    relaxed = 0,
    tingly = 0,
    euphoric = 0,
    sleepy = 0) {
  d9 <- aroused * 0.6092776818 +
    hungry * 0.3406958573 +
    energetic * -0.05906933515 +
    happy * 0.3856073855 +
    creative * 0.1644210256 +
    giggly * 0.5003339342 +
    uplifted * 0.10164408 +
    focused * -0.08769244417 +
    talkative * 0.1207486813 +
    relaxed * 0.3999369546 +
    tingly * 0.7156934371 +
    euphoric * 0.4062568501 +
    sleepy * 0.1349527074

  thcv <- aroused * -0.216699913 +
    hungry * 0.01306537192 +
    energetic * -0.1966059755 +
    happy * -0.4021405987 +
    creative * -0.4351200715 +
    giggly * -0.2028258716 +
    uplifted * -0.2940141305 +
    focused * -0.4441503179 +
    talkative * -0.3675701531 +
    relaxed * -0.1799198019 +
    tingly * -0.01555731291 +
    euphoric * -0.4058658104 +
    sleepy * 0.1272152707

  cbd <- aroused * -0.2971006117 +
    hungry * 0.203353021 +
    energetic * 0.1705483757 +
    happy * -0.03800835073 +
    creative * -0.1175225573 +
    giggly * 0.3226664564 +
    uplifted * 0.06972306801 +
    focused * -0.306925184 +
    talkative * 0.1901880347 +
    relaxed * -0.2438912249 +
    tingly * 0.005433032529 +
    euphoric * -0.2005063101 +
    sleepy * -0.04037922658

  cbn <- aroused * -0.005360628788 +
    hungry * -0.07881878539 +
    energetic * 0.2210273557 +
    happy * -0.09256212559 +
    creative * -0.09820745122 +
    giggly * 0.08554577493 +
    uplifted * 0.1147242309 +
    focused * -0.07418491766 +
    talkative * 0.1570395925 +
    relaxed * -0.277338582 +
    tingly * -0.05574277585 +
    euphoric * -0.1323783866 +
    sleepy * -0.2790748009

  cbg <- aroused * 0.1633606587 +
    hungry * 0.3283337381 +
    energetic * -0.5823319978 +
    happy * --0.1823605046 +
    creative * -0.415425278 +
    giggly * 0.06355544682 +
    uplifted * -0.4201516025 +
    focused * -0.6576148096 +
    talkative * -0.4987140614 +
    relaxed * 0.3671989894 +
    tingly * 0.426490667 +
    euphoric * 0.001776615532 +
    sleepy * 0.5197651304

  cbc <- aroused * -0.01236334781 +
    hungry * -0.1561518267 +
    energetic * -0.004558903018 +
    happy * -0.2161536377 +
    creative * -0.08623618225 +
    giggly * -0.4175329049 +
    uplifted * 0.09027175748 +
    focused * 0.09685947627 +
    talkative * -0.2127489811 +
    relaxed * -0.09888192841 +
    tingly * -0.1385055697 +
    euphoric * -0.1629166898 +
    sleepy * -0.1035490608

  values <- c(
    d9,
    thcv,
    cbd,
    cbn,
    cbg,
    cbc
  )

  values
}
