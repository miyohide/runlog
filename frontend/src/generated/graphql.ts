import gql from 'graphql-tag';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  ISO8601Date: { input: any; output: any; }
  ISO8601DateTime: { input: any; output: any; }
};

export type Mutation = {
  __typename?: 'Mutation';
  /** An example field added by the generator */
  testField: Scalars['String']['output'];
};

export type Query = {
  __typename?: 'Query';
  runlogs: Array<Runlog>;
  /** An example field added by the generator */
  testField: Scalars['String']['output'];
};

export type Runlog = {
  __typename?: 'Runlog';
  aerobicTe?: Maybe<Scalars['String']['output']>;
  averageContactTime?: Maybe<Scalars['Int']['output']>;
  averageGctBalance?: Maybe<Scalars['String']['output']>;
  averageHeartBeat?: Maybe<Scalars['Int']['output']>;
  averagePace?: Maybe<Scalars['Int']['output']>;
  averagePitch?: Maybe<Scalars['Int']['output']>;
  averagePower?: Maybe<Scalars['Int']['output']>;
  averageStalkRate?: Maybe<Scalars['Int']['output']>;
  averageStrideLength?: Maybe<Scalars['Float']['output']>;
  averageSwolf?: Maybe<Scalars['Int']['output']>;
  averageVertical?: Maybe<Scalars['Float']['output']>;
  averageVerticalRatio?: Maybe<Scalars['Float']['output']>;
  bestLapTime?: Maybe<Scalars['String']['output']>;
  createdAt: Scalars['ISO8601DateTime']['output'];
  decompression?: Maybe<Scalars['String']['output']>;
  distance?: Maybe<Scalars['Float']['output']>;
  diveTime?: Maybe<Scalars['String']['output']>;
  elapsedTime?: Maybe<Scalars['Int']['output']>;
  flow?: Maybe<Scalars['Float']['output']>;
  grid?: Maybe<Scalars['Float']['output']>;
  highPace?: Maybe<Scalars['Int']['output']>;
  highPitch?: Maybe<Scalars['Int']['output']>;
  highestTemp?: Maybe<Scalars['Float']['output']>;
  id: Scalars['ID']['output'];
  kcal?: Maybe<Scalars['Int']['output']>;
  lapCount?: Maybe<Scalars['Int']['output']>;
  lowestTemp?: Maybe<Scalars['Float']['output']>;
  maxHeartBeat?: Maybe<Scalars['Int']['output']>;
  maxPower?: Maybe<Scalars['Int']['output']>;
  maximumAltitude?: Maybe<Scalars['Int']['output']>;
  minimumAltitude?: Maybe<Scalars['Int']['output']>;
  numberOfReps?: Maybe<Scalars['Int']['output']>;
  place?: Maybe<Scalars['String']['output']>;
  runningDate?: Maybe<Scalars['ISO8601Date']['output']>;
  startTime?: Maybe<Scalars['String']['output']>;
  surfaceRest?: Maybe<Scalars['String']['output']>;
  time?: Maybe<Scalars['Int']['output']>;
  totalDescent?: Maybe<Scalars['Int']['output']>;
  totalLift?: Maybe<Scalars['Int']['output']>;
  travelTime?: Maybe<Scalars['Int']['output']>;
  updatedAt: Scalars['ISO8601DateTime']['output'];
};
