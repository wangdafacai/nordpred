% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/nordpred.estimate.R
\name{nordpred.estimate}
\alias{is.nordpred.estimate}
\alias{nordpred.estimate}
\title{Fit power5 and poisson Age-Period-Cohort models for prediction of cancer incidence}
\usage{
nordpred.estimate(cases, pyr, noperiod, startestage, linkfunc = "power5",
  find_best_model = FALSE)

is.nordpred.estimate(x)
}
\arguments{
\item{cases}{A \code{data.frame} with number of cases}

\item{pyr}{A \code{data.frame} with observed and forecasted person years.}

\item{noperiod}{The number of periods to be used in prediction base.}

\item{startestage}{Youngest age group to include in the regression model}

\item{linkfunc}{Link function to use in the model.
Default is special version used in the Nordpred project ('power5'),
where the link is \eqn{g(x) = x^0.2}, while the alternative is the poisson function
('poisson'), where the link is \eqn{g(x) = log(x)}}

\item{find_best_model}{Logical}

\item{x}{an object to test for class \code{nordpred}}
}
\value{
\code{nordpred.estimate} returns an object of class \code{nordpred.estimate}
(see \code{\link{nordpred.estimate.object}}).

\code{is.nordpred.estimate} returns \code{TRUE} if input object is of class
\code{nordpred.estimate}, \code{FALSE} otherwise.
}
\description{
\code{nordpred.estimate} estimates parameters in the power5 or poisson
Age-Period-Cohort (APC) model
}
\details{
For details of the choice of prediction base, significance test for using
recent slope, and for the power5 model, see Moller B., Fekjaer H. et al. (2002),
see references.
}
\section{Note for S-plus}{

Powerlink is made via a special modification in S-PLUS. This works fine
for the point estimates, but the variance estimates found via the glm-objects
are wrong. For variance estimates, we would rather recommend using R.
}
\examples{
# data (Colon cancer for Norwegian males)
indata

# Create dataset with observed and predicted population
inpop <- cbind(inpop1, inpop2)

# Fit model using powerlink (default):
est <- nordpred.estimate(cases = indata, pyr = inpop, noperiod = 4, startestage = 5)

# Fit model using poisson link:
est2 <- nordpred.estimate(indata, inpop, 4, 5, linkfunc = 'poisson')

# Print results:
print(est)
print(est$glm)

#' # Use estimat object to make predictions:
res <- nordpred.prediction(est, startuseage = 6, cuttrend = c(0, .25, .5, .75, .75), recent = TRUE)
}
\author{
Harald Fekjaer and Bjorn Moller (Cancer Registry of Norway)
}
\references{
\itemize{
\item A website for nordpred is available at:
\url{http://www.kreftregisteret.no/software/nordpred/}
\item Background for the methods can be found in: Moller B., Fekjaer H., Hakulinen T.,
Sigvaldason H, Storm H. H., Talback M. and Haldorsen T 'Prediction of cancer
incidence in the Nordic countries: Empirical comparison of different approaches'
Statistics in Medicine 2003; 22:2751-2766
\item An application of the function, using all the default settings, can be
found in: Moller B, Fekjaer H, Hakulinen T, Tryggvadottir L, Storm HH, Talback M,
Haldorsen T. Prediction of cancer incidence in the Nordic countries up to the
year 2020. Eur J Cancer Prev Suppl 2002; 11: S1-S96
}
}
\seealso{
Other nordpred: \code{\link{is.nordpred}},
  \code{\link{nordpred}};
  \code{\link{nordpred.estimate.object}};
  \code{\link{nordpred.getpred}};
  \code{\link{nordpred.object}};
  \code{\link{nordpred.prediction}};
  \code{\link{plot.nordpred}};
  \code{\link{print.nordpred.estimate}};
  \code{\link{print.nordpred}};
  \code{\link{summary.nordpred}}
}

