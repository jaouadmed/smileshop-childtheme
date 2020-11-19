{extends file='parent:checkout/_partials/header.tpl'}


{block name='header_top'}
<div class="tvcmsdesktop-top-header-wrapper ">

		<div class='container-fluid tvcmsdesktop-top-header'>
			<div class="container tvcmsdesktop-top-wrapper">
					<div class='tvheader-offer-wrapper col-xl-6 col-lg-6 col-md-6 col-sm-12'>
						{hook h='displayTopOfferText'}
					</div>
					<div class='tvheader-language-currency-wrapper col-xl-6 col-lg-6 col-md-6 col-sm-12'>
						<div class="tvheader-language">{hook h='displayNavLanguageBlock'}</div>
						<div class="tvheader-currency">{hook h='displayNavCurrencyBlock'}</div>
					</div>
			</div>	
		</div>

		<div class='container-fluid tvcmsdesktop-top-second hidden-md-down'>
			<div class="container">	
				<div class="row tvcmsdesktop-top-header-box">
					<div class='col-md-4 col-xl-4 col-sm-12 col-xs-2 tvcms-header-logo-wrapper'>
						<div class="hidden-sm-down tvcms-header-logo" id="tvcmsdesktop-logo">
							<div class="tv-header-logo">
								<a href="{$urls.base_url}">
									<img class="logo img-responsive" style="display: none;" src="{$shop.logo}" alt="{$shop.name}" height="34" width="200">
									<img class="logo img-responsive" style="display: none; max-height: 3.2em" src="{$shop.logo_mobile}" alt="{$shop.name}">
								</a>
							</div>
						</div>
					</div>

					<div class="col-sm-12 col-lg-6 col-md-6 col-xl-4 col-xs-10 tvcmsheader-search">
						<div class='tvcmssearch-wrapper' id="_desktop_search">
							{hook h='displayNavSearchBlock'}
						</div>
					</div>

					<div class="col-sm-12 col-lg-6 col-md-6 col-xl-4 tvcmsheader-nav-right">
						<div class="tv-contact-account-cart-wrapper">
							<div id='tvcmsdesktop-account-button'>
								<div  class="tvcms-header-myaccount">
									<div class="tv-header-account">
										<div class="tv-account-wrapper">
											<button class="btn-unstyle tv-myaccount-btn">
                                                <i class='material-icons'>&#xe7ff;</i>
                                                {if $customer.is_logged }
                                                    <span class="tvcms_customer_name">{$customer.gender.name[$customer.gender.id]} {$customer.firstname} {$customer.lastname}</span>
                                                {else}
                                                    <span>{l s='My Account' d='Shop.Theme.Catalog'}</span>
                                                {/if}
                                            </button>
											{*<button class="btn-unstyle tv-myaccount-btn">
												<i class='material-icons'>&#xe7ff;</i>
												<span>{l s='Sign In' d='Shop.Theme.Catalog'}</span>
											</button>*}
											<ul class="dropdown-menu tv-account-dropdown tv-dropdown">
												
												<li>{hook h='displayNavWishlistBlock'}</li>
												<li>{hook h='displayNavProductCompareBlock'}</li>
												<li>{hook h='displayNavCustomerSignInBlock'}</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							{hook h='displayNavShoppingCartBlock'}
						</div>
					</div>
				</div>
			</div>
		</div>			
		<div class="tvcms-header-menu-offer-wrapper tvcmsheader-sticky">
			<div class="position-static tvcms-header-menu">
				<div class='tvcmsmain-menu-wrapper container'>
					<div id='tvdesktop-megamenu'>
						{hook h='displayMegamenu'}
					</div>
				</div>
			</div>
		</div>
		{* <div id="mobile_top_menu_wrapper" class="row hidden-md-up">
			<div class="js-top-menu mobile" id="_mobile_top_menu"></div>
			<div class="js-top-menu-bottom">
				<div id="_mobile_currency_selector"></div>
				<div id="_mobile_language_selector"></div>
				<div id="_mobile_contact_link"></div>
			</div> 
		</div> *}
	
</div>
{hook h='displayNavFullWidth'}
{/block}