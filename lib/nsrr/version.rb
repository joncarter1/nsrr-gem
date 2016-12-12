# frozen_string_literal: true

module Nsrr
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 4
    TINY = 0
    BUILD = 'beta1' # 'pre', 'beta1', 'beta2', 'rc', 'rc2', nil

    STRING = [MAJOR, MINOR, TINY, BUILD].compact.join('.')
  end
end
