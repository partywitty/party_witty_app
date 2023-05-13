
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Api_link{
  static const imageUrl ='https://partywitty.com/';
  static const baseUrl ='https://partywitty.com/api/';
  static  const signup= '${baseUrl}singup';
  static  const bookArtistUrl = '${baseUrl}BookArtist';
  static  const login= '${baseUrl}login';
  static  const googleUrl = '${baseUrl}AuthUser';
  static  const forgetOtp = '${baseUrl}ForgotPassword';
  static  const otp_api= '${baseUrl}verify_otp';
  static  const serviceVerifyOtp = '${baseUrl}AgreementVerify';
  static  const agreementOtp = '${baseUrl}ArtistAgreement';
  static  const changePass = '${baseUrl}PasswordUpdate';
  static  const setRole= '${baseUrl}set_role';
  static  const Referral = '${baseUrl}referral_code';
  static  const artistList = '${baseUrl}list_of_artist';
  static  const sendRequest = '${baseUrl}send_request';
  static  const artistType = '${baseUrl}type_of_artist';
  static  const selectedLanguageUrl = '${baseUrl}GetSelectedLanguage';
  static  const artistTypeSubmit = '${baseUrl}TypeOfArtistSubmit';
  static  const artistSubtype = '${baseUrl}type_of_artist_subcategory';
  static  const artistSubtypeSubmit = '${baseUrl}submitSubCategoryArtist';
  static  const editAddSubCategory = '${baseUrl}AddSubCategory';
  static  const venue = '${baseUrl}GetVenue';
  static  const addNewVenueUrl = '${baseUrl}AddNewVenue';
  static  const newVenueSelected = '${baseUrl}NewVenueSelected';
  static  const newSubCategorySelected = '${baseUrl}NewSubCategoryselected';
  static  const genres = '${baseUrl}GetGenres';
  static  const getStreamingUrl = '${baseUrl}GetStreamingPlatform';
  static  const priceSummary = '${baseUrl}SummaryOfBudget';
  static  const venueSubmit = '${baseUrl}SubmitVenue';
  static  const profilePercentage = '${baseUrl}vocalistprofile';
  static  const editVenueSubmit = '${baseUrl}AddNewVenue';
  static  const genreSubmit = '${baseUrl}SubmitGenres';
  static  const languageSubmit = '${baseUrl}SubmitLanguage';
  static  const introSubmit = '${baseUrl}SubmitIntro';
  static  const imageList = '${baseUrl}GetMediaList';
  static  const uploadfile = '${baseUrl}SaveMedia';
  static  const profileImage = '${baseUrl}ProfileImages';
  static  const imageProgress = '${baseUrl}media_upload';
  static  const getArtistDetails = '${baseUrl}SubcategoryPage';
  static  const getArtistDetailsUrl = '${baseUrl}ArtistDetail';
  static  const getBookArtistUrl = '${baseUrl}GetBookArtist';
  static  const getFloor = '${baseUrl}GetFloor';
  static  const getStreaming = '${baseUrl}Streaming_platform';
  static  const instaLink = '${baseUrl}submitintagram';
  static  const facebookLink = '${baseUrl}PostSocial';
  static  const addressSubmit = '${baseUrl}SubmitAddress';
  static  const bankSubmit = '${baseUrl}SubmitBankDetail';
  static  const getBankDetails = '${baseUrl}GetBankDetail';
  static  const getManagerDetailsUrl = '${baseUrl}GetManagerDetail';
  static  const getStreamingData = '${baseUrl}GetStreamingPlatform';
  static  const getInstaData = '${baseUrl}GetSocial';
  static  const getIntroUrl = '${baseUrl}GetIntro';
  static  const addressDetails = '${baseUrl}GetAddress';
  static  const searchArtist = '${baseUrl}TypeOfArtistSearch';
  static  const acceptRequest = '${baseUrl}accept_reject_request';
  static  const bankNames = '${baseUrl}getBanks';
  static  const getInstrument = '${baseUrl}SubcategoryPage';
  static  const instrumentSubmit = '${baseUrl}SubmitSubcategoryPage';
  static  const serviceAgreeArtist = '${baseUrl}getServiceAgreement/1';
  static  const serviceAgreeClub = '${baseUrl}getServiceAgreement/2';
  static  const instrumentList = '${baseUrl}SubcategoryBudgut';
  static  const addBudget = '${baseUrl}AddBudget';
  static  const getCity = '${baseUrl}getCity';
  static  const getClub = '${baseUrl}ClubList';
  static  const cityPrice = '${baseUrl}SetCityBudgut';
  static  const bookingRequest = '${baseUrl}RequestBooking';
  static  const managerDetails = '${baseUrl}SubmitManagerDetail';
  static  const updateManagerDetails = '${baseUrl}PutManagerDetail';
  static  const getLanguage = '${baseUrl}GetLanguages';
  static  const deleteMedia = '${baseUrl}DeleteMedia';
  static  const updateLanguage = '${baseUrl}UpdateSelectedLanguage';
  static  const deleteLanguage = '${baseUrl}DeleteSelectedLanguage';
  static  const deleteCityPrice = '${baseUrl}deleteCityBudgut';
  static  const submitClubAddress = '${baseUrl}submitClubProfileInfo';
  static  const SubmitClubeDetail = '${baseUrl}SubmitClubeDetail';
  static  const SubmitFloorDetail = '${baseUrl}SubmitFloorDetail';
  static  const filterArtist = '${baseUrl}FilterArtist';
  static  const logStatus = '${baseUrl}GetUser';
  static  const filterInstrument = '${baseUrl}getInstruments';
  static  const primary = '${baseUrl}EditProfile';
  static  const viewPrimary = '${baseUrl}GetProfile';
  static  const cityPrimary = '${baseUrl}city_price';
  static  const allArtistUrl = '${baseUrl}AllArtist';
  static  const getBookListUrl = '${baseUrl}GetBookList';


  static  const AddEvent = '${baseUrl}AddEvent';
  static  const AddProducts = '${baseUrl}AddProducts';
  static  const GetProduct = '${baseUrl}GetProduct';
  static  const UpdateProduct = '${baseUrl}UpdateProduct';
  static  const RemoveProduct = '${baseUrl}RemoveProduct';
  static  const GetEventType = '${baseUrl}GetEventType';
  static  const GetEvents = '${baseUrl}GetEvents';
  static  const SubmitOffer = '${baseUrl}SubmitOffer';
  static  const Offers = '${baseUrl}Offers';
  static  const SingleOffer = '${baseUrl}SingleOffer';
  static  const OffersList = '${baseUrl}OffersList';
  static  const googleSiging = '${baseUrl}UserProfileUpdate';
  static  const requestLink = '${baseUrl}RequestList';

}



CommonToast({required context ,required title ,required bool alignCenter}){
  showToast(title,
    backgroundColor:  const Color(0xFFFD2F71),
    textStyle: const TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 12 , fontFamily: 'appbarstyle'),
    context: context,
    alignment: alignCenter ? Alignment.center:Alignment.topCenter,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    borderRadius:const BorderRadius.all(Radius.circular(12)),
    textPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
    position:alignCenter? StyledToastPosition.center : StyledToastPosition.top,
    animDuration:const Duration(seconds: 1),
    duration:const Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}